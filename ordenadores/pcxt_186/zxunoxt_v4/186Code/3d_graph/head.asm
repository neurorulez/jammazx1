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
public fillrect_
public dispchr_
public int21hanlder_
public _LineDraw
public _SCREEN_SEGMENT


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
_TEXT           SEGMENT WORD PUBLIC USE16 'CODE' 
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
    

        xor al,al
        out 0,al
        mov al,0h
        out 21h,al

        mov ax,0ah
        out 8ah,ax
        inc ax
        out 8bh,ax
        inc ax
        out 8ch,ax
        inc ax
        out 8dh,ax
        inc ax
        out 8eh,ax
 
        mov dx,3c0h
        mov al,10h
        out dx,al
        mov al,41h
        out dx,al   ; // VGA 320*200

        
        mov     al, 13h
        out     dx, al
        mov     al, 0
        out     dx, al          ; 0 pan

        mov dx, 3d4h
        mov ax, 8006h
        out dx, ax
        mov ax, 2813h
        out dx, ax


        mov     dx, 3c4h
        mov     ax, 0f02h
        out     dx, ax          ; enable all write planes
        mov     ax, 0804h
        out     dx, ax          ; clear planar mode
        mov     dl, 0ceh
        mov     ax, 0001h
        out     dx, ax          ; disable set/reset
        mov     ax, 0003h
        out     dx, ax          ; reset logical op and rotate count
        mov     ax, 0005h
        out     dx, ax          ; set write mode to 00 (CPU access)
        mov     ax, 0ff08h
        out     dx, ax          ; set bitmask to CPU access


    
 ;   mov al,34h
 ;   out 43h,al
 ;   mov al,0
 ;   out 40h,al
 ;   xor al,al
 ;   out 40h,al  ; program PIT 18.2Hz
    sti
    
        
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



;------------------------------ rect ---------
fillrect_ proc near  ; ax=x, dx=y, bx=color, cx=dx, sp1=dy
    jcxz hlexit
    push bp
    mov bp,sp
    jmp ent
 nextln:   
    push ax
    push cx
    push dx
    call hrzline_
    pop dx
    pop cx
    pop ax
    inc dx
ent:    
    dec word ptr [bp+4]
    jns nextln
    leave
hlexit:
    ret 2
fillrect_ endp


;------------------------------ horizontal  line ---------
hrzline_ proc near  ; ax=x, dx=y, bl=color, cx=len
    jcxz lexit
    push di
    imul dx,20
    add dh,byte ptr _SCREEN_SEGMENT + 1
    mov es,dx
    mov di,ax
    mov al,bl
    mov ah,bl
    test di,1
    jz xeven
    stosb
    dec cx
 xeven:
    shr cx,1
    rep stosw
    adc cx,cx
    rep stosb
    pop di
lexit:
    ret
hrzline_ endp

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
        push ds
        push cx
        push si
        push di
        mov ds,ax
        mov ax,_SCREEN_SEGMENT
        mov es,ax
copy1:
        mov cx,32000
        xor si,si
        xor di,di
        rep movsw
        pop di
        pop si
        pop cx
        pop ds
        ret

copyscr_ endp

;------------------------------- putpixel ----------------------
cputpixel_:
        cmp ax, 320
        jae cppret
        cmp dx, 200
        jae cppret
putpixel_:
        imul dx,20
        add dh,byte ptr _SCREEN_SEGMENT+1
        mov es,dx
        xchg ax,bx
        mov es:[bx],al
cppret:
        ret


;------------------------------- flush --------------------------
flush_  proc near 
        push ds
        push bx
        mov bh,8
        mov ds,bx
flush1:        
        mov bl,[bx]
        dec bh
        jnz flush1
        pop bx
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
        push _SCREEN_SEGMENT
        pop es
        imul si,ax,320
        xor di,di
        imul cx,ax,-160
        add cx,32000
        rep movs word ptr es:[di], word ptr es:[si]
        pop cx
        pop di
        pop si
        ret
vscroll_ endp


;----------------------------------- CLS -------------------------------------
cls_ proc near   ; al = color
        push di
        push cx
        xor di,di
        push _SCREEN_SEGMENT
        pop es
        mov cx,32000
        mov ah,al
        rep stosw
        pop cx
        pop di
        ret
cls_ endp
       


;----------------------------------- LineDraw Abrash -------------------------------------
SCREEN_WIDTH       equ 320
; Parameters to call.
parms   struc
           dw    ?              ;pushed BP
           dw    ?              ;pushed return address
XStart     dw    ?              ;X start coordinate of line
YStart     dw    ?              ;Y start coordinate of line
XEnd       dw    ?              ;X end coordinate of line
YEnd       dw    ?              ;Y end coordinate of line
Color      db    ?              ;color in which to draw line
           db    ?              ;dummy byte because Color is really a word
parms ends

;ASSUME bp:PTR parms
; Local variables.
AdjUp          equ -2          ;error term adjust up on each advance
AdjDown        equ -4          ;error term adjust down when error term turns over
WholeStep      equ -6          ;minimum run length
XAdvance       equ -8          ;1 or -1, for direction in which X advances
LOCAL_SIZE     equ  8
_LineDraw   proc  near
      cld
      push        bp                  ;preserve caller’s stack frame
      mov         bp,sp               ;point to our stack frame
      sub sp,     LOCAL_SIZE          ;allocate space for local variables
      push        si                  ;preserve C register variables
      push        di
      push        ds                  ;preserve caller’s DS
; We’ll draw top to bottom, to reduce the number of cases we have to handle,
; and to make lines between the same endpoints always draw the same pixels.
      mov         ax,[bp].YStart
      cmp         ax,[bp].YEnd
      jle         LineIsTopToBottom
      xchg        [bp].YEnd,ax;          swap endpoints
      mov         [bp].YStart,ax
      mov bx,      [bp].XStart
      xchg        [bp].XEnd,bx
      mov         [bp].XStart,bx
LineIsTopToBottom:
; Point DI to the first pixel to draw.
      mov         dx,SCREEN_WIDTH
      mul         dx                    ;YStart * SCREEN_WIDTH
      mov         si,[bp].XStart
      mov         di,si
      add         di,ax                 ;DI = YStart * SCREEN_WIDTH + XStart
                                        ; = offset of initial pixel
; Figure out how far we’re going vertically (guaranteed to be positive).
      mov         cx,[bp].YEnd
      sub         cx,[bp].YStart        ;CX = YDelta
; Figure out whether we’re going left or right, and how far we’re going
; horizontally. In the process, special-case vertical lines, for speed and
; to avoid nasty boundary conditions and division by 0.
      mov         dx,[bp].XEnd
      sub         dx,si                 ;XDelta
      jnz         NotVerticalLine       ;XDelta == 0 means vertical line
                                        ;it is a vertical line
                                        ;yes, special case vertical line
      mov         ax,_SCREEN_SEGMENT
      mov         ds,ax                 ;point DS:DI to the first byte to draw
      mov         al,[bp].Color
VLoop:
      mov         [di],al
      add         di,SCREEN_WIDTH
      dec         cx
      jns         VLoop
      jmp         Done
; Special-case code for horizontal lines.
      align       2
IsHorizontalLine:
      mov         ax,_SCREEN_SEGMENT
      mov         es,ax                 ;point ES:DI to the first byte to draw
      mov         al,[bp].Color
      mov         ah,al                 ;duplicate in high byte for word access
      and         bx,bx                 ;left to right?
      jns         DirSet                ;yes
      sub         di,dx                 ;currently right to left, point to left
                                        ; end so we can go left to right
                                        ; (avoids unpleasantness withright to
                                        ;  left REP STOSW)
DirSet:
      mov         cx,dx
      inc         cx                    ;# of pixels to draw
      shr         cx,1                  ;# of words to draw
      rep         stosw                 ;do as many words as possible
      adc         cx,cx
      rep         stosb                 ;do the odd byte, if there is one
      jmp         Done
; Special-case code for diagonal lines.
      align       2
IsDiagonalLine:
      mov         ax,_SCREEN_SEGMENT
      mov         ds,ax                 ;point DS:DI to the first byte to draw
      mov         al,[bp].Color
      add         bx,SCREEN_WIDTH       ;advance distance from one pixel to next
DLoop:
      mov         [di],al
      add         di,bx
      dec         cx
      jns         DLoop
      jmp         Done

      align       2
NotVerticalLine:
      mov         bx,1                  ;assume left to right, so XAdvance = 1
                                        ;***leaves flags unchanged***
      jns         LeftToRight           ;left to right, all set
      neg         bx                    ;right to left, so XAdvance = -1
      neg         dx                    ;|XDelta|
LeftToRight:
; Special-case horizontal lines.
            and       cx,cx             ;YDelta == 0?
            jz        IsHorizontalLine  ;yes




; Special-case diagonal lines.
      cmp         cx,dx                 ;YDelta == XDelta?
      jz         IsDiagonalLine         ;yes
; Determine whether the line is X or Y major, and handle accordingly.
      cmp         dx,cx
      jae         XMajor
           jmp         YMajor
; X-major (more horizontal than vertical) line.
      align       2
XMajor:
      mov         ax,_SCREEN_SEGMENT
      mov         es,ax                 ;point ES:DI to the first byte to draw
      and         bx,bx                 ;left to right?
      jns         DFSet                 ;yes, CLD is already set
      std                               ;right to left, so draw backwards
DFSet:
      mov         ax,dx                 ;XDelta
      sub         dx,dx                 ;prepare for division
      div         cx                    ;AX = XDelta/YDelta
                                        ; (minimum # of pixels in a run in this line)
                                        ;DX = XDelta % YDelta
      mov         bx,dx                 ;error term adjust each time Y steps by 1;
      add         bx,bx                 ; used to tell when one extra pixel should be
      mov         word ptr AdjUp[bp],bx         ; drawn as part of a run, to account for
                                        ; fractional steps along the X axis per
                                        ; 1-pixel steps along Y
      mov         si,cx                 ;error term adjust when the error term turns
      add         si,si                 ; over, used to factor out the X step made at
      mov         word ptr AdjDown[bp],si       ; that time
; Initial error term; reflects an initial step of 0.5 along the Y axis.
      sub         dx,si                 ;(XDelta % YDelta) - (YDelta * 2)
                                        ;DX = initial error term
; The initial and last runs are partial, because Y advances only 0.5 for
; these runs, rather than 1. Divide one full run, plus the initial pixel,
; between the initial and last runs.
      mov         si,cx                 ;SI = YDelta
      mov         cx,ax                 ;whole step (minimum run length)
      shr         cx,1
      inc         cx                    ;initial pixel count = (whole step / 2) + 1;
                                        ; (may be adjusted later). This is also the
                                        ; final run pixel count
      push        cx                    ;remember final run pixel count for later
; If the basic run length is even and there’s no fractional advance, we have
; one pixel that could go to either the initial or last partial run, which
; we’ll arbitrarily allocate to the last run.
; If there is an odd number of pixels per run, we have one pixel that can’t
; be allocated to either the initial or last partial run, so we’ll add 0.5 to
; the error term so this pixel will be handled by the normal full-run loop.
      add         dx,si                 ;assume odd length, add YDelta to error term
                                        ; (add 0.5 of a pixel to the error term)
      test        al,1                  ;is run length even?
      jnz         XMajorAdjustDone      ;no, already did work for odd case, all set
      sub         dx,si                 ;length is even, undo odd stuff we just did
      and         bx,bx                 ;is the adjust up equal to 0?
      jnz         XMajorAdjustDone      ;no (don’t need to check for odd length,
                                        ; because of the above test)
      dec         cx                    ;both conditions met; make initial run 1
                                        ; shorter
XMajorAdjustDone:
      mov         word ptr WholeStep[bp],ax     ;whole step (minimum run length)
      mov         al,[bp].Color         ;AL = drawing color
; Draw the first, partial run of pixels.
      rep         stosb                 ;draw the final run
      add         di,SCREEN_WIDTH       ;advance along the minor axis (Y)
; Draw all full runs.
      cmp         si,1                  ;are there more than 2 scans, so there are
                                        ; some full runs? (SI = # scans - 1)
      jna         XMajorDrawLast        ;no, no full runs
      dec         dx                    ;adjust error term by -1 so we can use
                                        ; carry test
      shr         si,1                  ;convert from scan to scan-pair count
      jnc         XMajorFullRunsOddEntry ;if there is an odd umber of scans,
                                        ; do the odd scan now
XMajorFullRunsLoop:
      mov         cx, word ptr WholeStep[bp]     ;run is at least this long
      add         dx,bx                 ;advance the error term and add an extra
      jnc         XMajorNoExtra         ; pixel if the error term so indicates
      inc         cx                    ;one extra pixel in run
      sub         dx, word ptr AdjDown[bp]       ;reset the error term
XMajorNoExtra:
      rep         stosb                 ;draw this scan line’s run
      add         di,SCREEN_WIDTH       ;advance along the minor axis (Y)
XMajorFullRunsOddEntry:                 ;enter loop here if there is an odd number
                                        ; of full runs
      mov         cx,word ptr WholeStep[bp]     ;run is at least this long
      add         dx,bx                 ;advance the error term and add an extra
      jnc         XMajorNoExtra2        ; pixel if the error term so indicates
      inc         cx                    ;one extra pixel in run
      sub         dx,word ptr AdjDown[bp]       ;reset the error term
XMajorNoExtra2:
      rep         stosb                 ;draw this scan line’s run
      add         di,SCREEN_WIDTH       ;advance along the minor axis (Y)

      dec         si
      jnz         XMajorFullRunsLoop
; Draw the final run of pixels.
XMajorDrawLast:
      pop         cx                    ;get back the final run pixel length
      rep         stosb                 ;draw the final run

      cld                               ;restore normal direction flag
      jmp         Done
; Y-major (more vertical than horizontal) line.
      align       2
YMajor:
      mov         word ptr XAdvance[bp],bx      ;remember which way X advances
      mov         ax,_SCREEN_SEGMENT
      mov         ds,ax                 ;point DS:DI to the first byte to draw
      mov         ax,cx                 ;YDelta
      mov         cx,dx                 ;XDelta
      sub         dx,dx                 ;prepare for division
      div         cx                    ;AX = YDelta/XDelta
                                        ; (minimum # of pixels in a run in this line)
                                        ;DX = YDelta % XDelta
      mov         bx,dx                 ;error term adjust each time X steps by 1;
      add         bx,bx                 ; used to tell when one extra pixel should be
      mov         word ptr AdjUp[bp],bx         ; drawn as part of a run, to account for
                                        ; fractional steps along the Y axis per
                                        ; 1-pixel steps along X
      mov         si,cx                 ;error term adjust when the error term turns
      add         si,si                 ; over, used to factor out the Y step made at
      mov         word ptr AdjDown[bp],si       ; that time

; Initial error term; reflects an initial step of 0.5 along the X axis.
      sub         dx,si                 ;(YDelta % XDelta) - (XDelta * 2)
                                        ;DX = initial error term
; The initial and last runs are partial, because X advances only 0.5 for
; these runs, rather than 1. Divide one full run, plus the initial pixel,
; between the initial and last runs.
      mov         si,cx                 ;SI = XDelta
      mov         cx,ax                 ;whole step (minimum run length)
      shr         cx,1
      inc         cx                    ;initial pixel count = (whole step / 2) + 1;
                                        ; (may be adjusted later)
      push         cx                   ;remember final run pixel count for later

; If the basic run length is even and there’s no fractional advance, we have
; one pixel that could go to either the initial or last partial run, which
; we’ll arbitrarily allocate to the last run.
; If there is an odd number of pixels per run, we have one pixel that can’t
; be allocated to either the initial or last partial run, so we’ll add 0.5 to
; the error term so this pixel will be handled by the normal full-run loop.
      add         dx,si                 ;assume odd length, add XDelta to error term
      test        al,1                  ;is run length even?
      jnz         YMajorAdjustDone      ;no, already did work for odd case, all set
      sub         dx,si                 ;length is even, undo odd stuff we just did
      and         bx,bx                 ;is the adjust up equal to 0?
      jnz         YMajorAdjustDone      ;no (don’t need to check for odd length,
                                        ; because of the above test)
      dec         cx                    ;both conditions met; make initial run 1
                                        ; shorter
YMajorAdjustDone:
      mov         word ptr WholeStep[bp],ax     ;whole step (minimum run length)
      mov         al,[bp].Color         ;AL = drawing color
      mov         bx,word ptr XAdvance[bp]      ;which way X advances
; Draw the first, partial run of pixels.
YMajorFirstLoop:
      mov         [di],al               ;draw the pixel
      add         di,SCREEN_WIDTH       ;advance along the major axis (Y)
      loop         YMajorFirstLoop
      add         di,bx                 ;advance along the minor axis (X)
        ; Draw all full runs.
      cmp         si,1                  ;# of full runs. Are there more than 2
                                        ; columns, so there are some full runs?
                                        ; (SI = # columns - 1)
      jna         YMajorDrawLast        ;no, no full runs
      dec         dx                    ;adjust error term by -1 so we can use
                                        ; carry test
      shr         si,1                  ;convert from column to column-pair count
      jnc         YMajorFullRunsOddEntry ;if there is an odd number of
                                        ; columns, do the odd column now
YMajorFullRunsLoop:
      mov         cx,word ptr WholeStep[bp]     ;run is at least this long
      add         dx,word ptr AdjUp[bp]         ;advance the error term and add an extra
      jnc         YMajorNoExtra         ; pixel if the error term so indicates
      inc         cx                    ;one extra pixel in run
      sub         dx,word ptr AdjDown[bp]       ;reset the error term
YMajorNoExtra:
  ;draw the run
YMajorRunLoop:
      mov         [di],al               ;draw the pixel
      add         di,SCREEN_WIDTH       ;advance along the major axis (Y)
      loop         YMajorRunLoop
      add         di,bx                 ;advance along the minor axis (X)
YMajorFullRunsOddEntry:                 ;enter loop here if there is an odd number
                                        ; of full runs
      mov         cx,word ptr WholeStep[bp]     ;run is at least this long
      add         dx,word ptr AdjUp[bp]         ;advance the error term and add an extra
      jnc         YMajorNoExtra2        ; pixel if the error term so indicates
      inc         cx                    ;one extra pixel in run
      sub         dx,word ptr AdjDown[bp]       ;reset the error term
YMajorNoExtra2:
  ;draw the run
YMajorRunLoop2:
      mov         [di],al               ;draw the pixel
      add         di,SCREEN_WIDTH       ;advance along the major axis (Y)
      loop         YMajorRunLoop2
      add         di,bx                 ;advance along the minor axis (X)

      dec         si
      jnz         YMajorFullRunsLoop
; Draw the final run of pixels.
YMajorDrawLast:
      pop         cx                    ;get back the final run pixel length
YMajorLastLoop:
      mov         [di],al               ;draw the pixel
      add         di,SCREEN_WIDTH       ;advance along the major axis (Y)
      loop         YMajorLastLoop
Done:
      pop         ds                    ;restore caller’s DS
      pop         di
      pop         si                    ;restore C register variables
      mov         sp,bp                 ;deallocate local variables
      pop         bp                    ;restore caller’s stack frame
      ret ;10
_LineDraw   endp
 
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

STACK_SIZE      equ     800h

CONST   segment word public 'DATA'
CONST   ends

_DATA   segment word public 'DATA'
int21hproc  dw 0
_SCREEN_SEGMENT     dw 0a000h
_DATA   ends

_BSS    segment word public 'BSS'
        db      (STACK_SIZE) dup(?)
endstack label word        
_BSS    ends

end _cstart_
