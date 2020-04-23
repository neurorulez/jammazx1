; SD card interface
; Accepts only SDHC cards

.186
public sdinit_
public sdread_

assume cs:_TEXT
_TEXT   SEGMENT BYTE PUBLIC USE16 'CODE'


;---------------------  read/write byte ----------------------
sdrb:   mov al,0ffh
sdsb:               ; in AL=byte, DX = 03dah, out AX=result
        mov ah,1
sdsb1:
        out dx,al
        add ax,ax
        jnc sdsb1
        in ax,dx
        ret

;---------------------  write block ----------------------
sdwblk:              ; in SI=data ptr, DX=03dah, CX=size
        lodsb
        call sdsb
        loop sdwblk
        ret

;---------------------  read block ----------------------
sdrblk:              ; in DI=data ptr, DX=03dah, CX=size
        call sdrb
        mov [di],ah
        inc di
        loop sdrblk
        ret

;---------------------  write command ----------------------
sdcmd8T:
        call sdrb
sdcmd:              ; in SI=6 bytes cmd buffer, DX=03dah, out AH = 0ffh on error
        mov cx,6
        call sdwblk
sdresp:
        xor si,si
sdresp1:
        call sdrb
        inc si
        jz sdcmd1
        cmp ah,0ffh
        je sdresp1
sdcmd1: ret         

;---------------------  read ----------------------
sdread_ proc near   ; AX:DX sector, BX buffer, CX=sectors, returns AX=read sectors
        push si
        push di
        
        push ax
        mov al,dl
        push ax
        mov dl,51h  ; CMD17
        push dx
        mov si,sp 

        mov dx,3dah
        mov ah,1
        out dx,ax       ; CS on
        call sdcmd
        add sp,6
        or ah,ah
        jnz sdr1        ; error (cx=0)
        call sdresp     ; wait for 0feh token
        cmp ah,0feh
        jne sdr1        ; read token error (cx=0)
        mov ch,2        ; 512 bytes
        mov di,bx
        call sdrblk
        call sdrb       ; ignore CRC
        call sdrb       ; ignore CRC
        inc cx          ; 1 block
 sdr1:       
        xor ax,ax
        out dx,ax
        call sdrb       ; 8T
        mov ax,cx    
        pop di
        pop si   
        ret     
sdread_ endp
        
;---------------------  init SD ----------------------
sdinit_ proc near       ; returns AX = num kilosectors
        push cx
        push dx
        push si
        push di
        mov dx,3dah
        mov cx,10
sdinit1:                   ; send 80T
        call sdrb
        loop sdinit1

        mov ah,1
        out dx,ax       ; select SD

        mov si, offset SD_CMD0
        call sdcmd
        dec ah
        jnz sdexit      ; error
        
        mov si, offset SD_CMD8
        call sdcmd8T
        dec ah
        jnz sdexit      ; error
        mov cl,4
        sub sp,cx
        mov di,sp
        call sdrblk
        pop ax
        pop ax
        cmp ah,0aah
        jne sdexit      ; CMD8 error
repinit:        
        mov si, offset SD_CMD55
        call sdcmd8T
        call sdrb
        mov si, offset SD_CMD41
        call sdcmd
        dec ah
        jz  repinit
        
        mov si, offset SD_CMD58
        call sdcmd8T
        mov cl,4
        sub sp,cx
        mov di,sp
        call sdrblk
        pop ax
        test al,40h     ; test OCR bit 30 (CCS)
        pop ax
        jz sdexit       ; no SDHC

        mov si, offset SD_CMD9 ; get size info
        call sdcmd8T
        or ah,ah
        jnz sdexit
        call sdresp     ; wait for 0feh token
        cmp ah,0feh
        jne sdexit
        mov cl, 18      ; 16bytes + 2bytes CRC
        sub sp,cx
        mov di,sp
        call sdrblk
        mov cx,[di-10]
        rol cx,8
        inc cx
        mov sp,di
sdexit: 
        xor ax,ax       ; raise CS
        out dx,ax
        call sdrb
        pop di
        pop si
        pop dx
        mov ax,cx       
        pop cx
        ret
sdinit_ endp
    
_TEXT ends


_DATA   segment word public 'DATA'

SD_CMD0     db  40h, 0, 0, 0, 0, 95h
SD_CMD8     db  48h, 0, 0, 1, 0aah, 087h
SD_CMD9     db  49h, 0, 0, 0, 0, 0ffh
SD_CMD41    db  69h, 40h, 0, 0, 0, 0ffh
SD_CMD55    db  77h, 0, 0, 0, 0, 0ffh
SD_CMD58    db  7ah, 0, 0, 0, 0, 0ffh

_DATA   ends

end
