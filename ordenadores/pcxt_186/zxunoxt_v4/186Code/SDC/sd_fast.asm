; SD card interface
; Accepts only SDHC cards

.186
public sdinit_
public sdread_
public sdwrite_
public sdsb_


assume cs:_TEXT, ds:_TEXT
_TEXT   SEGMENT BYTE PUBLIC USE16 'CODE'


sdsb_ proc near
    push dx
    mov dx, 3dah
    call sdsb
    pop dx
    shr ax,8
    ret
sdsb_ endp


sdread_ proc near   ; AX:DX sector, CX:BX buffer, sp1=sectors, returns AX=read sectors
        push bp
        mov bp,sp
        push ds       
        push si
        push di
        mov es,cx
        mov cx,[bp+4]
        call sdread
        pop di
        pop si
        pop ds
        pop bp
        ret 2
sdread_ endp


sdwrite_ proc near   ; AX:DX sector, CX:BX buffer, sp1=sectors, returns AX=read sectors
        push bp
        mov bp,sp
        push ds       
        push si
        push di
        mov es,cx
        mov cx,[bp+4]
        call sdwrite
        pop di
        pop si
        pop ds
        pop bp
        ret 2
sdwrite_ endp

;---------------------  read/write byte ----------------------
sdrb:   mov al,0ffh
sdsb:               ; in AL=byte, DX = 03dah, out AX=result
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        in ax,dx
        ret

;---------------------  write block ----------------------
sdwblk:              ; in SI=data ptr, DX=03dah, CX=size
        shr cx,1
sdwblk1:
        lodsb
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        lodsb
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        add ax,ax
        out dx,al
        loop sdwblk1
        ret

;---------------------  read block ----------------------
sdrblk:              ; in DI=data ptr, DX=03dah, CX=size
        mov al,0ffh
        out dx,al
        shr cx,1
        out dx,al
        jmp sdrblk2 
sdrblk1:
        out dx,al
        mov [di],ah
        out dx,al
        inc di
sdrblk2:
        out dx,al
        nop
        out dx,al
        nop
        out dx,al
        nop
        out dx,al
        nop
        out dx,al
        nop
        out dx,al
        in ax,dx
        out dx,al
        mov [di],ah
        out dx,al
        inc di
        out dx,al
        nop
        out dx,al
        nop
        out dx,al
        nop
        out dx,al
        nop
        out dx,al
        nop
        out dx,al
        in ax,dx
        loop sdrblk1
        mov [di],ah
        inc di
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
sdread proc near   ; AX:DX sector, ES:BX buffer, CX=sectors, returns AX=read sectors
        push ax
        mov al,dl
        push ax
        mov dl,51h  ; CMD17
        cmp cx,1
        je sdr1s
        inc dx      ; CMD18 - multiple sectors
sdr1s:
        push dx
        mov si,sp

        mov dx,3dah
        mov ah,1
        out dx,ax       ; CS on
        mov di,bx
        mov bx,cx
        mov bp,cx       ; save sectors number
        push ss
        pop ds
        mov byte ptr [si+5], 0ffh 
        call sdcmd
        add sp,6
        or ah,ah
        jnz sdr1        ; error
        push es
        pop ds
sdrms:
        mov ax,di
        shr ax,4
        mov si,ds
        add ax,si
        mov ds,ax
        and di,15
        call sdresp     ; wait for 0feh token
        cmp ah,0feh
        jne sdr1        ; read token error 
        mov ch,2        ; 512 byte sector
        call sdrblk
        call sdrb       ; ignore CRC
        call sdrb       ; ignore CRC
        dec bx
        jnz sdrms       ; multiple sectors
        cmp bp,1
        je sdr1         ; single sector
        mov si, offset SD_CMD12 ; stop transfer
        push cs
        pop ds
        call sdcmd
sdr2:
        shr ah,1
        jnc sdr1
        call sdrb
        jmp sdr2
sdr1:       
        xor ax,ax
        out dx,ax
        call sdrb       ; 8T
        mov ax,bp
        sub ax,bx
        ret     
sdread endp


;---------------------  write ----------------------
sdwrite proc near   ; AX:DX sector, ES:BX buffer, CX=sectors, returns AX=read sectors
        push ax
        mov al,dl
        push ax
        mov dl,58h  ; CMD24
        cmp cx,1
        je sdw1s
        inc dx      ; CMD25 - multiple sectors
sdw1s:
        push dx
        mov si,sp 

        mov dx,3dah
        mov ah,1
        out dx,ax       ; CS on
        mov bp,cx       ; save sectors number
        push ss
        pop ds
        mov byte ptr [si+5], 0ffh
        call sdcmd
        add sp,6
        mov si,bx
        mov bx,bp
        or ah,ah
        jnz sdr1        ; error
        push es
        pop ds
sdwms:
        mov ax,si
        shr ax,4
        mov di,ds
        add ax,di
        mov ds,ax
        and si,15
        mov al,0feh       ; start token
        cmp bp,1
        je sdw1s1
        mov al,0fch     ; multiple sectors
sdw1s1:        
        call sdsb     
        mov ch,2        ; 512 byte sector
        call sdwblk
        call sdrb       ; ignore CRC
        call sdrb       ; ignore CRC
        call sdrb       ; read response byte xxx00101
        and ah,0eh
        cmp ah,4
        jne sdr1        ; write error
sdwwait:
        call sdrb
        shr ah,1
        jnc sdwwait     ; wait write completion
        dec bx
        jnz sdwms       ; multiple sectors

        cmp bp,1
        je sdr1
        mov al,0fdh     ; multiple end transfer
        call sdsb
        call sdrb      
sdwwait1:
        call sdrb
        shr ah,1
        jnc sdwwait1      ; wait write completion
        jmp sdr1
sdwrite endp
        
;---------------------  init SD ----------------------
sdinit_ proc near       ; returns AX = num kilosectors
        push ds
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
        push cs
        pop ds
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
        push ss
        pop ds
        call sdrblk
        pop ax
        pop ax
        cmp ah,0aah
        jne sdexit      ; CMD8 error
repinit:        
        mov si, offset SD_CMD55
        push cs
        pop ds
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
        push ss
        pop ds
        call sdrblk
        pop ax
        test al,40h     ; test OCR bit 30 (CCS)
        pop ax
        jz sdexit       ; no SDHC

        mov si, offset SD_CMD9 ; get size info
        push cs
        pop ds
        call sdcmd8T
        or ah,ah
        jnz sdexit
        call sdresp     ; wait for 0feh token
        cmp ah,0feh
        jne sdexit
        mov cl,18       ; 16bytes + 2bytes CRC
        sub sp,cx
        mov di,sp
        push ss
        pop ds
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
        pop ds
        ret
sdinit_ endp
    
SD_CMD0     db  40h, 0, 0, 0, 0, 95h
SD_CMD8     db  48h, 0, 0, 1, 0aah, 087h
SD_CMD9     db  49h, 0, 0, 0, 0, 0ffh
SD_CMD12    db  4ch, 0, 0, 0, 0, 0ffh
SD_CMD41    db  69h, 40h, 0, 0, 0, 0ffh
SD_CMD55    db  77h, 0, 0, 0, 0, 0ffh
SD_CMD58    db  7ah, 0, 0, 0, 0, 0ffh

_TEXT ends

end
