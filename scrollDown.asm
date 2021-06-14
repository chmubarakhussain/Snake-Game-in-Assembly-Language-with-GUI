push ax
push cx
push si
push di

 mov  ax, 80   
 mul byte[cs:downCount]
 push ax
 shl ax, 1
 mov si, 3998
 sub si, ax
 mov cx, 2000
 sub cx, ax
 mov ax, 0xb800
 mov es, ax
 mov ds, ax
 mov di, 3998
 std
 rep movsw
 mov ax, 0x0720
 pop cx
 rep stosw
 pop di
pop si
pop cx
pop ax
ret
