.186
extrn   main_: proc near
public cls_
public flush_
public defpal_
public setpal_
public getpal_
public putpixel_
public cputpixel_
public LEDdisplay_
public muldiv8_
public muldiv_
public vscroll_
public hrzline_
public delline_
public dispchr_
public int21hanlder_
public setcursor_
public showcursor_
public getcursor_

public _small_code_
public __compiled_under_generic
public ___wcpp_4_data_init_fs_root_
public __ppfltused_
public _cstart_
extrn   __no87                  : byte
extrn __FInitRtns: proc near
public    _Not_Enough_Memory_
public    __GETDS
public    ___begtext
public    __do_exit_with_msg__
public    __exit_
public    __nullarea


DGROUP          GROUP   CONST,_DATA,_BSS
assume cs:_TEXT, ds:DGROUP, ss:DGROUP
_TEXT           SEGMENT BYTE PUBLIC USE16 'CODE'
    org 100h
_cstart_ proc near
    cli
    cld
    mov ax, cs
    add ax, DGROUP + 10h
    mov ds, ax
    mov ss, ax
    mov sp, offset endstack 
    mov __no87, 1
    xor di,di
    xor si,si
    mov es,si
    mov ax, offset fpex
    stosw
    mov ax,cs
    stosw
    mov cx, 200h - 2
    rep movs word ptr es:[di], word ptr es:[si]
    mov dx,3c0h
    mov al,10h
    out dx,al
    mov al,8h
    out dx,al   ; // text mode, flash enabled
        
    call near ptr main_
    cli
    db 0eah
    dw 0,-1
_cstart_ endp


fpex proc near
    iret
fpex endp

muldiv8_ proc near
    imul dx
    mov al,ah
    mov ah,dl
    ret
muldiv8_ endp

muldiv_ proc near
    imul dx
    idiv bx
    ret
muldiv_ endp


int21hanlder_ proc near
    mov int21hproc,ax
    xor ax,ax
    mov es,ax
    mov word ptr es:[21h*4], offset int21h_
    ret
int21hanlder_ endp

int21h_ proc near
    pusha
    call int21hproc
    popa
    iret
int21h_ endp


;------------------------------ showcursor ---------
showcursor_ proc near ; ax = on
    push dx
    mov dx,3d4h
    shr al,1
    mov al,0ah
    out dx,al
    cmc
    rcl al,6
    inc dx
    out dx, al
    pop dx
    ret
showcursor_ endp


;------------------------------ getcursor ---------
getcursor_ proc near ; returns ax = y<<8 + x
    push dx
    mov dx,3d4h
    mov al,0eh
    out dx,al
    inc dx
    in al,dx
    mov ah,al
    dec dx
    mov al,0fh
    out dx,al
    inc dx
    in al,dx
    mov dl,80
    div dl
    pop dx
    ret
getcursor_ endp


;------------------------------ setcursor ---------
setcursor_ proc near ; ax = x, dx = y
    imul ax,80
    add ax,dx
    mov dx, 3d4h
    push ax
    mov al, 0fh
    out dx,al
    inc dx
    pop ax
    out dx,al
    dec dx
    mov al, 0eh
    out dx,al
    inc dx
    mov al,ah
    out dx,al
    ret
setcursor_ endp

;------------------------------ clear line ---------
delline_ proc near ;ax=char, dx = line
    push di
    push cx
    imul dx,10
    add dh,0b8h
    mov es,dx
    xor di,di
    mov cx,80
    rep stosw
    pop cx
    pop di
    ret
delline_ endp

;------------------------------ display char ---------
dispchr_ proc near ;ax=char, dx=x, bx=y, cx=color
    imul bx,10
    add bh,0b8h
    mov es,bx
    mov bx,dx
    add bx,bx
    mov ah,cl
    mov es:[bx],ax
    ret
dispchr_ endp

;------------------------------ set default palette ---------
LEDdisplay_ proc near
    out 0,al
    ret
LEDdisplay_ endp

;------------------------------ set default palette ---------
defpal_ proc near
        push dx
        mov dx,3c8h
        xor ax,ax
        out dx,al
        inc dx
lop:    
        mov al,ah
        and al,7
        shl al,3
        out dx,al
        mov al,ah
        and al,38h
        out dx,al
        mov al,ah
        ror al,2
        and al,30h
        cmp al,30h
        jne nob
        or al,8
nob:
        out dx,al
        inc ah
        jnz lop
        pop dx
        ret
defpal_ endp

;------------------------------ get palette ------------------
getpal_ proc near    ; es:di = mem palette, al=start color, cx = num colors
        push di
        push cx
        mov cx,dx
        mov di,bx
        mov dx,3c7h
        out dx,al
        inc dx
        inc dx
        imul cx,3
        push ds
        pop es
        rep insb
        pop cx
        pop di
        ret
getpal_ endp


;------------------------------ set palette ------------------
setpal_ proc near    ; ds:si = mem palette, al=start color, cx = num colors
        push si
        push cx
        mov cx,dx
        mov si,bx
        mov dx, 3c8h
        out dx,al
        inc dx
        imul cx,3
        rep outsb
        pop cx
        pop si
        ret
setpal_ endp


;------------------------------- copy screen ------------------
copyscr_ proc near   ; ax = src screen segment
        mov ds,ax
        mov ax,0a000h
        mov es,ax
        mov dx,48
copy1:
        mov cx,3200
        xor si,si
        xor di,di
        rep movsw
        mov ax,ds
        add ax,400
        mov ds,ax
        mov ax,es
        add ax,400
        mov es,ax
        dec dx
        jne copy1
        ret

copyscr_ endp


;------------------------------- flush --------------------------
flush_  proc near 
        push ds
        mov bh,63
        mov ds,bx
flush1:        
        mov al,[bx]
        dec bh
        jnz flush1
        pop ds
        ret  
flush_ endp    

; ----------------  serial receive byte 115200 bps --------------
srecb_   dw  0ff26h  


;----------------------------------- vertical scroll ------------------------
vscroll_ proc near   ; ax = lines
        push si
        push di
        push cx
        push 0b800h
        pop es
        imul si,ax,160
        xor di,di
        imul cx,ax,-80
        add cx,2000
        rep movs word ptr es:[di], word ptr es:[si]
        pop cx
        pop di
        pop si
        ret
vscroll_ endp


;----------------------------------- CLS -------------------------------------
cls_ proc near   ; ax = attr-char
        push di
        push cx
        xor di,di
        push 0b800h
        pop es
        mov cx,2000
        rep stosw
        pop cx
        pop di
        ret
cls_ endp
        
_small_code_ db 0
__compiled_under_generic db 0
___wcpp_4_data_init_fs_root_ db 0
__ppfltused_ db 0
_Not_Enough_Memory_ db 0
__GETDS db 0
___begtext db 0
__do_exit_with_msg__ db 0
__exit_ db 0
__nullarea db 0


_TEXT ends

STACK_SIZE      equ     1000h

CONST   segment word public 'DATA'
CONST   ends

_DATA   segment word public 'DATA'
int21hproc  dw 0
_DATA   ends

_BSS    segment word public 'BSS'
        db      (STACK_SIZE) dup(?)
endstack label word        
_BSS    ends

end _cstart_
