push ax
push cx
push si
push di

 mov  ax, 80   
 mul byte[cs:upCount]
 mov  si, ax        
 push si             
 shl  si, 1       
 mov  cx, 2000     
 sub  cx, ax         
 mov  ax, 0xb800      
 mov  es, ax         
 mov  ds, ax       
 xor  di, di      
 cld               
 rep  movsw         
 mov  ax, 0x0720   
 pop  cx         
 rep  stosw   
 pop di
pop si
pop cx
pop ax
ret