[org 0x0100]
jmp start
;memory declarations
;;-------------usman------------------
;;------------------------------------
switch_stage1: dw 0
switch_stage2: dw 0
switch_stage3: dw 0
switch_stage4: dw 0
switch_stage5: dw 0
lastlevelprinted: dw 0
levelsarray: dw 0,0,0,0,0
secondsintervalofspeed: dw 20
secondsintervalofspeeddummy:dw 0
secondspassed: dw 1
speedtimer: dw 1
killerattributesarray: db 0x60,0x10,0x40,0xf0,0x20,0xd0,0x90,0x11,0x2a,0
attarr: dw 0x474, 0xb04, 0xb72, 0x9f6, 0x3e8, 0x46e, 0xd3c, 0xc40
attarcount: dw 8
iterator: dw 0
seedsattribute: db 0
bonusattribute: db 0
pageswitch: dw 1
poisonattribute: db 0
timeovermsg: db'TIME OVER!!',0
str1: db 'present by'
len1: dw 10
str2 :db 'Usman and Mubarik'
len2: dw 17 

str3: db 'press 1 to play stage one'
len3: dw 25
str4: db 'press 2 to play stage two'
len4: dw 25
str5: db 'press 3 to play stage three'
len5: dw 25
str6: db 'press 4 to play stage four'
len6: dw 25
str7: db 'press 5 to play stage five'
len7: dw 25

timemsg: db 'Time:',0
timeminutespart: dw 0
timesecondspart: dw 0
timeallowedminutespart: dw 4
start_tick_count: dw 0
start_timer: dw 0
timeallowedsecondspart: dw 0
timedivisor: dw 3408
scoremsg:db 'Score:',0
livesmsg: db 'Lives:',0
livesovermsg: db 'LIVES OVER!!',0
levelcompletedmsg: db 'Congratulations!! you completed level with bonus!',0
restartgamemsg: db 'Press two times S to restart the game, 1-Level 1, 2-Level 2, 3-Level 3, 4-Level 4, 5-Level 5',0
previouskey: dw 0; 1-left 2-right 3-up 4-down 
onetimeswitch: dw 1
secondonetimeswitch: dw 1
poison: dw 0;cordinates
bonus: dw 0
seed: dw 0xff03 
seedswitch: dw 1
oldkbisr: dd 0
snakelength: dw 10
snakelengthdefault: dw 10

maxlengthofsnake: dw 240
ticks: dw 1
score: dw 0
lives: dw 3
speeddivisionfactor: dw 0
totallevels: dw 1
totalkillerattributes: dw 10
attributeofsnake: db 0x2a; this atribute is unique only for snake
attributeofhead: db 0x40
headmaterial: dw 0x402a
bodymaterial: dw 0x2a20

head: dw 0
tail: dw 1170
oldtail: dw 1170
endthelevelswitch: dw 0

left: dw 0
right: dw 0
up: dw 0
down: dw 0
;;-------------------usman------------------

;-----------------------Mubarak's Area------------------
sound:

push ax 
push bx 
push cx
push dx 

mov dx,22ch
mov al,10h
out dx,al

mov si,[play_index]
mov al,[play+si]
out dx,al

inc word[play_index]

cmp word[play_index],51529
jb skipsound
mov word[play_index],0
skipsound:

pop dx 
pop cx 
pop bx 
pop ax

ret

play:
    incbin "kingsv.wav"	;write file name here
    play_index: dw 0
;--------------------------------------------------------

board1:
pusha

mov ax,0xb800
mov es,ax

mov di,640
mov cx,80
mov al,' '
mov ah,0xf0
cld
rep stosw

mov di,3840
mov ah,0xf0
mov cx,80
cld
rep stosw

mov al,' '
mov di,800
mov cx,19
mov ah,0xf0
again3:mov [es:di],ax
add di,160
sub cx,1
jnz again3

mov di,958
mov cx,19
mov ah, 0xf0
again5:mov [es:di],ax
add di,160
sub cx,1
jnz again5

popa
ret

board2:;;66 main
pusha

mov ax,0xb800
mov es,ax

mov di,640
mov cx,80
mov al,' '
mov ah,0x60
cld
rep stosw

mov di,3840
mov cx,80
cld
rep stosw

mov al,' '
mov di,800
mov cx,19
again:mov [es:di],ax
add di,160
sub cx,1
jnz again

mov di,958
mov cx,19
again1:mov [es:di],ax
add di,160
sub cx,1
jnz again1

mov al,' '
mov di,2960
mov cx,4
mov ah, 0x40;;extraaaa 
again2:mov [es:di],ax
add di,160
sub cx,1
jnz again2

mov di,2920
mov cx,0x45
mov al,' ';;;extraaaaaaaaaa
mov ah,0x10
cld
rep stosw

mov di,1680
mov cx,39
mov al,' ';;;extraaaaaaaaaa yellow
mov ah,0x60
cld
rep stosw

mov al,' '
mov di,800
mov cx,19
mov ah, 0x60
again15:mov [es:di],ax
add di,160
sub cx,1
jnz again15

mov al,' '
mov di,958
mov cx,19
mov ah, 0x60
again16:mov [es:di],ax
add di,160
sub cx,1
jnz again16

mov cx, [cs:seed]
mov di, 1296
mov word[es:di], cx

popa
ret

board3:
pusha

mov ax,0xb800
mov es,ax

mov di,640
mov cx,80
mov al,' '
mov ah,0x10
cld
rep stosw

mov di,760
mov cx,20
mov al,' '
mov ah,0x10
cld
rep stosw


mov di,3840
mov ah,0x10 
mov cx,80
cld
rep stosw

mov di,3960
mov ah,0x10 
mov cx,20
cld
rep stosw

mov al,' '
mov di,800
mov cx,5
mov ah,0x10
again6:mov [es:di],ax
add di,160
sub cx,1
jnz again6

mov al,' '
mov di,3200
mov cx,5
mov ah,0x10
again17:mov [es:di],ax
add di,160
sub cx,1
jnz again17

mov di,958
mov cx,5
mov ah, 0x10
again8:mov [es:di],ax
add di,160
sub cx,1
jnz again8

mov di,3358
mov cx,5
mov ah, 0x10
again18:mov [es:di],ax
add di,160
sub cx,1
jnz again18

mov al,' '
mov di,1518
mov cx,13
mov ah, 0x40 
again7:mov [es:di],ax;;extraaaaaaaaaaaa
add di,160
sub cx,1
jnz again7

mov di,2420
mov ah,0x40;extraaaaaaaaa 
mov cx,60
cld
rep stosw

popa
ret

board4:
pusha

mov ax,0xb800
mov es,ax


mov di,1600
mov cx,50
mov al,' '
mov ah,0x20 
cld
rep stosw


mov di,2880
mov cx,50
mov al,' '
mov ah,0x40
cld
rep stosw


;-------------
mov di,1340
mov cx,50
mov al,' '
mov ah,0xf0
cld
rep stosw


mov di,2620
mov cx,50
mov al,' '
mov ah,0xd0
cld
rep stosw


mov di,3840
mov cx,50
mov al,' '
mov ah,0x90 
cld
rep stosw

mov di,480
mov cx,80
mov al,' '
mov ah,0x40
cld
rep stosw

mov di,3840
mov cx,80
mov al,' '
mov ah,0x90
cld
rep stosw
;-----------

popa
ret
board5:
pusha

mov ax,0xb800
mov es,ax

mov di,640
mov cx,80
mov al,' '
mov ah,0x40
cld
rep stosw

mov di,700
mov cx,20
mov al,' '
mov ah,0x7
cld
rep stosw

mov di,3840
mov ah,0x40
mov cx,80
cld
rep stosw

mov di,3900
mov cx,20
mov al,' '
mov ah,0x7
cld
rep stosw

mov al,' '
mov di,800
mov cx,19
mov ah,0x40
again12:mov [es:di],ax
add di,160
sub cx,1
jnz again12

mov di,958
mov cx,19
mov ah, 0x40
again13:mov [es:di],ax
add di,160
sub cx,1
jnz again13

mov di,2400
mov cx,80
mov al,' '
mov ah,0x40;;extraaaa
cld
rep stosw

mov di,2920
mov cx,40
mov al,' ';;;extraaaaaaaaaa
mov ah,0x11
cld
rep stosw


mov al,' '
mov di,220
mov cx,4
mov ah, 0x60;;extraaaaaaaaaaaa
again14:mov [es:di],ax
add di,160
sub cx,1
jnz again14


mov al,' '
mov di,260
mov cx,4
mov ah, 0x60;;extraaaaaaaaaaaa
again19:mov [es:di],ax
add di,160
sub cx,1
jnz again19

mov al,' '
mov di,1600
mov cx,10
mov ah,0x7
again20:mov [es:di],ax
add di,160
sub cx,1
jnz again20

mov di,1758
mov cx,10
mov ah, 0x7
again21:mov [es:di],ax
add di,160
sub cx,1
jnz again21

mov di,0
mov cx,80
mov al,' '
mov ah,0x90 
cld
rep stosw

mov di,3840
mov cx,80
mov al,' '
mov ah,0x90 
cld
rep stosw

popa
ret
;;------------------------------------------

printnum:   ;bp+4 ->nmbr and bp+6->index
  push bp      
  mov  bp, sp     
  push es       
  push ax       
  push bx       
  push cx       
  push dx       
  push di 
  mov  ax, 0xb800      
  mov  es, ax        
  ; point es to video base     
  mov  ax, [bp+4]    
  ; load number in ax     
  mov  bx, 10      
  ; use base 10 for division     
  mov  cx, 0       
  ; initialize count of digits 
  nextdigit:    mov  dx, 0      
  ; zero upper half of dividend        
  div  bx         
  ; divide by 10        
  add  dl, 0x30     
  ; convert digit into ascii value      
  push dx            
  ; save ascii value on stack        
  inc  cx          
  ; increment count of values       
  cmp  ax, 0        
  ; is the quotient zero       
  jnz  nextdigit     
  ; if no divide it again 
   mov  di, [bp+6]     
   ; point di to top left column 
   nextpos:    
   pop  dx         
   ; remove a digit from the stack        
   mov  dh, 0x07      
   ; use normal attribute      
   mov [es:di], dx     
   ; print char on screen      
   add  di, 2        
   ; move to next screen location       
   loop nextpos        
   ; repeat for all digits on stack
    pop  di        
	pop  dx        
	pop  cx       
	pop  bx       
	pop  ax       
	pop  es       
	pop  bp       
	ret  4 
printstr:    
 push bp       
 mov  bp, sp   
 push es    
 push ax   
 push cx  
 push si  
 push di
 
 push ds    
 pop  es    
 ; load ds in es  

 mov  di, [bp+4] 
 ; point di to string    
 mov  cx, 0xffff    
 ; load maximum number in cx 
 xor  al, al      
 ; load a zero in al   
 repne scasb    
 ; find zero in the string    
 mov  ax, 0xffff     
 ; load maximum number in ax    
 sub  ax, cx        
 ; find change in cx       
 dec  ax        
 ; exclude null from length      
 jz   exitprint      
 ; no printing if string is empty
  mov  cx, ax     
  ; load string length in cx     
  mov  ax, 0xb800      
  mov  es, ax       
  ; point es to video base      
  mov  al, 80      
  ; load al with columns per row      
  mul byte[bp+8]     
  ; multiply with y position     
  add  ax, [bp+10]    
  ; add x position       
  shl  ax, 1      
  ; turn into byte offset     
  mov  di,ax       
  ; point di to required location       
  mov  si, [bp+4]    
  ; point si to string     
  mov  ah, [bp+6]    
  ; load attribute in ah 
  cld        ; auto increment mode 
  nextchar:     
  lodsb       ; load next char in al
 stosw        ; print char/attribute pair    
 loop nextchar     ; repeat for the whole string  
exitprint:    
     pop  di         
	 pop  si         
	 pop  cx         
	 pop  ax         
	 pop  es         
	 pop  bp         
	 ret  8 
clrscr:
;; push regs used
push ax
push cx
push dx
push di

mov ax, 0xb800
mov es, ax
mov di, 0 
mov cx, 2000
mov dx, 0x720
l2:
mov [es:di], dx
add di, 2 
loop l2

pop di
pop dx
pop cx
pop ax
ret 

printstr3:
push bp
mov bp,sp
push ax
push bx
push cx
push es
push si
push di


mov ax, 0xb800
mov es, ax
mov si, [bp+8]
mov di,0

mov bx, [bp+4]

nextprt11:
mov al, [bx+di]
mov ah, 0x45
mov word[es:si], ax
add si,2

add di, 1
cmp di, [bp+6]
jne nextprt11

pop di
pop si
pop es
pop cx
pop bx
pop ax
pop bp

ret 6

clrscr3:
push ax
push dx
push es
push si

mov ax, 0xb800
mov es, ax
mov si, 0

nextprt12:
mov word[es:si], 0x4720
add si,2
cmp si,4000
jne nextprt12

pop si
pop es
pop dx
pop ax
ret



printwithredbk:
push bp
mov bp,sp
pusha

mov ax,0xb800
mov es,ax

mov ax,0x2220

mov si,4
mov di,si
mov cx,9
Z1:
mov word[es:di],ax
mov word[es:di+2],ax
mov word[es:di+4],ax
mov word[es:di+6],ax
mov word[es:di+8],ax
mov word[es:di+10],ax
add di,160
sub cx,1
jnz Z1

mov ch,10
Z2:add si,14
mov di,si
mov cl,9
Z9:
mov word[es:di],ax
mov word[es:di+2],ax
mov word[es:di+4],ax
mov word[es:di+6],ax
mov word[es:di+8],ax
mov word[es:di+10],ax
add di,160
sub cl,1
jnz Z9
sub ch,1
jnz Z2


mov ax,0x2220

mov si,2564
mov di,si
mov cx,9
Z3:
mov word[es:di],ax
mov word[es:di+2],ax
mov word[es:di+4],ax
mov word[es:di+6],ax
mov word[es:di+8],ax
mov word[es:di+10],ax
add di,160
sub cx,1
jnz Z3

mov ch,10
Z5:add si,14
mov di,si
mov cl,9
Z4:
mov word[es:di],ax
mov word[es:di+2],ax
mov word[es:di+4],ax
mov word[es:di+6],ax
mov word[es:di+8],ax
mov word[es:di+10],ax
add di,160
sub cl,1
jnz Z4
sub ch,1
jnz Z5

mov si,1660
push si
push word[len3]
mov bx,str3
push bx
call printstr3

add si,160
push si
push word[len4]
mov bx,str4
push bx
call printstr3

add si,160
push si
push word[len5]
mov bx,str5
push bx
call printstr3

add si,160
push si
push word[len6]
mov bx,str6
push bx
call printstr3

add si,160
push si
push word[len7]
mov bx,str7
push bx
call printstr3


popa
pop bp 
ret

clrscrwithbluebk:
;; push regs used
push ax
push cx
push dx
push di

mov ax, 0xb800
mov es, ax
mov di, 0 
mov cx, 2000
mov dx, 0x4020
l93:
mov [es:di], dx
add di, 2 
loop l93

pop di
pop dx
pop cx
pop ax
ret 

hitrightkey:
mov word[cs:start_tick_count],1
mov word[cs:right], 1
mov word[cs:left], 0
mov word[cs:up], 0
mov word[cs:down], 0
pop ax
jmp far [cs:oldkbisr]

hitleftkey:
mov word[cs:start_tick_count],1
mov word[cs:right], 0
mov word[cs:left], 1
mov word[cs:up], 0
mov word[cs:down], 0
pop ax
jmp far [cs:oldkbisr]

hitupkey:
mov word[cs:start_tick_count],1
mov word[cs:right], 0
mov word[cs:left], 0
mov word[cs:up], 1
mov word[cs:down], 0
pop ax
jmp far [cs:oldkbisr]

hitdownkey:
mov word[cs:start_tick_count],1
mov word[cs:right], 0
mov word[cs:left], 0
mov word[cs:up], 0
mov word[cs:down], 1
pop ax
jmp far [cs:oldkbisr]

tailatright:
cmp byte[es:bx-2], 20h
jne ad22
add word[cs:tail], 2
mov word[es:bx], 0x720
ad22: ret
tailatleft:
cmp byte[es:bx+2], 20h
jne ad23
sub word[cs:tail], 2
mov word[es:bx], 0x720
ad23:ret
tailatup:
cmp byte[es:bx+160], 20h
jne ad24
sub word[cs:tail], 160
mov word[es:bx], 0x720
ad24:ret
tailatdown:
cmp byte[es:bx-160], 20h
jne ad25
add word[cs:tail], 160
mov word[es:bx], 0x720
ad25:ret


updatetail:
 mov si, bx
add si, 3
cmp byte[es:si], dl
jne ad8
call tailatright; ret
ret
ad8:mov si, bx
sub si, 1
cmp byte[es:si], dl
jne ad9
call tailatleft
ret
ad9: mov si, bx
sub si, 159
cmp byte[es:si], dl
jne ad6
call tailatup
ret
ad6:mov si, bx
add si, 161
cmp byte[es:si], dl
jne ad7
call tailatdown
ad7:ret
 

decreaselife:
mov word[cs:right], 0
mov word[cs:left], 0
mov word[cs:up], 0
mov word[cs:down], 0
mov word[cs:start_tick_count],0

dec word[cs:lives]
mov word[cs:seedswitch], 1
mov word[cs:onetimeswitch], 1
mov word[cs:secondonetimeswitch], 1
jmp ad16

checkforkillerattributes:
push bp
mov bp, sp
push ax
push si
push bx
push cx

mov ax, [bp+4]; loads attribute to be tested
mov cx, [cs:totalkillerattributes]
mov si, 0

ad15:
cmp byte[cs:killerattributesarray+si], ah
je decreaselife; jmp ad16
add si, 1
loop ad15

ad16:pop cx
 pop bx
pop si
pop ax
pop bp
ret 2

seedeaten:
inc word[cs:score]
mov word[cs:seedswitch], 1
call generateseed

mov cx, 4
ad39: call increasetailonetimes
loop ad39
jmp ad38

checkforseed:
push bp
mov bp, sp
push ax
push si
push bx
push cx

mov ax, [bp+4]; loads attribute to be tested

cmp word[cs:seed], ax
je seedeaten; jmp ad16
ad38:
pop cx
pop bx
pop si
pop ax
pop bp
ret 2

movright:;;2
cmp word[cs:previouskey], 1;;comparing with left
je ad26
ad27: push ax
push bx
push dx
push si
push cx

cmp word[cs:onetimeswitch], 1
je ad100

mov bx, [cs:head]
mov ax, 0xb800
mov es, ax
add bx, 2
push word[es:bx]
call checkforkillerattributes; ret 2

push word[es:bx]
call checkforseed; ret 2

cmp word[cs:onetimeswitch], 1
je ad100

mov ax, 0xb800
mov es, ax
mov bx, [cs:head]
mov si, [cs:bodymaterial]
mov word[es:bx], si
add bx, 2 ;that's where your motion changes
mov si, [cs:tail]
mov cx, [es:si]
mov [es:bx], cx
mov [cs:head], bx;updated head
mov si, [cs:headmaterial]
mov word[es:bx], si

mov bx, [cs:tail]
mov dl, [cs:attributeofsnake]
call updatetail
jmp ad17

ad100:
mov word[cs:start_tick_count],0


ad17:

pop cx
pop si
pop dx
pop bx
pop ax
mov word[cs:previouskey], 2
ret

movleft:;;1
cmp word[cs:previouskey], 2
je ad27; simple return
cmp word[cs:previouskey], 0
je ad27; simple return
ad26: push ax
push bx
push dx
push si
push cx
cmp word[cs:onetimeswitch], 1
je ad99

mov bx, [cs:head]
mov ax, 0xb800
mov es, ax
sub bx, 2
push word[es:bx]
call checkforkillerattributes; ret 2

push word[es:bx]
call checkforseed; ret 2

cmp word[cs:onetimeswitch], 1
je ad99
mov ax, 0xb800
mov es, ax
mov bx, [cs:head]
mov si, [cs:bodymaterial]
mov word[es:bx], si
sub bx, 2;that's where your motion changes
mov si, [cs:tail]
mov cx, [es:si]
mov [es:bx], cx
mov [cs:head], bx;updated head
mov si, [cs:headmaterial]
mov word[es:bx], si

mov bx, [cs:tail]
mov dl, [cs:attributeofsnake]
call updatetail
jmp ad18

ad99:
mov word[cs:start_tick_count],0

ad18:pop cx
pop si
pop dx
pop bx
pop ax
mov word[cs:previouskey], 1
ret

movup:;;3
cmp word[cs:previouskey], 4;;for down
je ad29; simple return
ad28: push ax
push bx
push dx
push si
push cx

cmp word[cs:onetimeswitch], 1
je ad98

mov bx, [cs:head]
mov ax, 0xb800
mov es, ax
sub bx, 160
push word[es:bx]
call checkforkillerattributes; ret 2

push word[es:bx]
call checkforseed; ret 2

cmp word[cs:onetimeswitch], 1
je ad98
mov ax, 0xb800
mov es, ax
mov bx, [cs:head]
mov si, [cs:bodymaterial]
mov word[es:bx], si
sub bx, 160;that's where your motion changes
mov si, [cs:tail]
mov cx, [es:si]
mov [es:bx], cx
mov [cs:head], bx;updated head
mov si, [cs:headmaterial]
mov word[es:bx], si

mov bx, [cs:tail]
mov dl, [cs:attributeofsnake]
call updatetail
jmp ad19

ad98:
mov word[cs:start_tick_count],0

ad19:
pop cx
pop si
pop dx
pop bx
pop ax
mov word[cs:previouskey], 3
ret

movdown:;;4
cmp word[cs:previouskey], 3
je ad28; simple return
ad29: push ax
push bx
push dx
push si
push cx
cmp word[cs:onetimeswitch], 1
je ad97
mov bx, [cs:head]
mov ax, 0xb800
mov es, ax
add bx, 160
push word[es:bx]
call checkforkillerattributes; ret 2

push word[es:bx]
call checkforseed; ret 2

cmp word[cs:onetimeswitch], 1
je ad97
mov ax, 0xb800
mov es, ax
mov bx, [cs:head]
mov si, [cs:bodymaterial]
mov word[es:bx], si
add bx, 160;that's where your motion changes
mov si, [cs:tail]
mov cx, [es:si]
mov [es:bx], cx
mov [cs:head], bx;updated head
mov si, [cs:headmaterial]
mov word[es:bx], si

mov bx, [cs:tail]
mov dl, [cs:attributeofsnake]
call updatetail
jmp ad20
ad97:
mov word[cs:start_tick_count],0

ad20:
pop cx
pop si
pop dx
pop bx
pop ax
mov word[cs:previouskey], 4
ret

initiliazeSnake:
push ax
push si
push cx
mov word[cs:seedswitch], 1

mov ax, 0xb800
mov es, ax
mov cx, [cs:snakelength]
mov si, [cs:oldtail]
mov [cs:tail], si
mov ax, [cs:bodymaterial]
l1: mov [es:si], ax
add si, 2
loop l1
sub si, 2
mov [cs:head], si
mov ax, [cs:headmaterial]
mov word[es:si], ax
pop cx
pop si
pop ax
ret

addatright:
mov cx, [cs:bodymaterial]
mov word[es:si+2],cx
add word[cs:tail], 2
inc word[cs:snakelength]
popa
ret

addatleft:
mov cx, [cs:bodymaterial]
mov word[es:si-2],cx
sub word[cs:tail], 2
inc word[cs:snakelength]
popa
ret

addatup:
mov cx, [cs:bodymaterial]
mov word[es:si-160],cx
sub word[cs:tail], 160
inc word[cs:snakelength]
popa
ret

addatdown:
mov cx, [cs:bodymaterial]
mov word[es:si+160],cx
add word[cs:tail], 160
inc word[cs:snakelength]
popa
ret

increasetailonetimes:
pusha
mov si, [cs:tail]
mov ax, 0xb800
mov es, ax
cmp word[es:si+2], 0x720
je addatright
cmp word[es:si-2], 0x720
je addatleft
cmp word[es:si+160], 0x720
je addatdown
cmp word[es:si-160], 0x720
je addatup
popa
ret

movsnakeonebit:
cmp word[cs:right], 1
jne ad2
ad11:call movright
jmp ad5
ad2:cmp word[cs:left], 1
jne ad3
ad12:call movleft
jmp ad5
ad3:cmp word[cs:up], 1
jne ad4
ad13:call movup
jmp ad5
ad4:cmp word[cs:down], 1
jne ad5
ad14:call movdown
ad5: ret

printtickstosecondsandscoreandlives:
pusha
mov dx, [cs:secondspassed]

push word 65
push word 0
push word 7
push cs
pop ds
push word timemsg
call printstr
push word 150
push word dx
call printnum

push word 65
push word 1
push word 7
push cs
pop ds
push word scoremsg
call printstr
mov dx, [cs:score]
push word 310
push word dx
call printnum

push word 65
push word 2
push word 7
push cs
pop ds
push word livesmsg
call printstr
mov dx, [cs:lives]
push word 470
push word dx
call printnum
popa
ret
printlivesover:
call clrscr
 call page3
 
 mov cx, 0xffff
 ad53: loop ad53
 
push word 20
push word 20
push word 0x87
push word livesovermsg
call printstr

push word 10
push word 10
push word 0x87
push word restartgamemsg
call printstr

jmp exittimeisr

printtimeover:
call clrscr
push word 10
push word 10
push word 0x87
push word timeovermsg
call printstr
jmp exittimeisr

exittimeisr:
push ax
mov al, 0x20
out 0x20, al
pop ax
iret

endtheleveljmp:
add word[cs:score], 100;bonus
call clrscr
push word 10
push word 10
push word 0x87
push word levelcompletedmsg
call printstr
mov word[cs:endthelevelswitch], 1
mov word[cs:lives], 0
jmp ad30

timecompletedchecklength:
mov ax, [cs:maxlengthofsnake]
cmp [cs:snakelength], ax
je endtheleveljmp
jmp ad30

checklengthwrtfourmins:
pusha
cmp word[cs:secondspassed], 240
je timecompletedchecklength; jmp ad30
ad30: popa
ret

doublespeedexittimeisrwithpopa:
mov dx, [cs:timedivisor]
shr dx, 1
;sub dx, 300
mov [cs:timedivisor], dx
jmp ad51

checkspeedup:
pusha
mov cx, [cs:secondsintervalofspeed]; any
cmp word[cs:secondsintervalofspeeddummy], cx
jne ad51
mov word[cs:secondsintervalofspeeddummy],0
jmp doublespeedexittimeisrwithpopa
ad51: popa
ret


rand:
push bp
mov bp,sp
pusha

mov ax, [cs:head]

mov bx,3830
div bx
cmp dx,802
jnb no_action
add dx,802
no_action:
mov [bp+4],dx
popa
pop bp
ret 

place_friut:
push bp
mov bp,sp
pusha
 mov di,[bp+4]
mov ax, 0xb800
mov es, ax

jmp ad40

ad35:
add di, 2 
ad40: cmp word[es:di], 0x0720
jne ad35

mov cx, [cs:seed]

mov word[es:di], cx
popa
pop bp
ret 2

generateseed:
mov word[cs:seedswitch], 0
pusha
push 0
call rand
pop ax

push ax
call place_friut

popa
ret

exittimeisrpopa:
mov al, 0x20
out 0x20, al
popa
iret

increasesecond:
inc word[cs:secondspassed]
inc word[cs:secondsintervalofspeeddummy]
mov word[cs:speedtimer], 1
jmp ad50


timeisr:
call sound
inc word[cs:speedtimer]
cmp word[cs:start_timer],1
jne exittimeisr
cmp word[cs:start_tick_count],1
jne us1
inc word[cs:ticks]
us1:
cmp word[cs:endthelevelswitch], 1
je exittimeisr
call checklengthwrtfourmins; ret 
;----------
pusha
mov ax, [cs:speedtimer]
mov dx, 0
mov cx, word[cs:timedivisor]
div cx
cmp dx, 0
jne exittimeisrpopa

mov cx, 3408
mov ax, [cs:speedtimer]
cmp ax, cx
je increasesecond
ad50:
ad31:
popa
call checkspeedup;ret
;-----------
ad32:
cmp word[cs:secondspassed], 240
je printtimeover; jmp to exittimeisr
cmp word[cs:lives], 0
je printlivesover
cmp word[cs:pageswitch], 1
je ad43
call printtickstosecondsandscoreandlives; ret

ad43:
push ax
call movsnakeonebit
mov al, 0x20
out 0x20, al
pop ax
iret

restartgame:
mov word[cs:lastlevelprinted], 0

mov word[cs:onetimeswitch], 1
mov word[cs:secondonetimeswitch], 1
mov word[cs:endthelevelswitch], 0
mov word[cs:lives], 3
mov word[cs:score], 0
mov ax, [cs:snakelengthdefault]
mov [cs:snakelength], ax
mov word[cs:ticks], 0
mov word[cs:speedtimer], 0
mov word[cs:secondspassed], 0
mov word[cs:timedivisor], 3408
pop ax
jmp far [cs:oldkbisr]

printstr1:
push bp
mov bp,sp
push ax
push bx
push cx
push es
push si
push di


mov ax, 0xb800
mov es, ax
mov si, [bp+8]
mov di,0

mov bx, [bp+4]

nextprt1:
mov al, [bx+di]
mov ah, 0x07
mov word[es:si], ax
add si,2

add di, 1
cmp di, [bp+6]
jne nextprt1

pop di
pop si
pop es
pop cx
pop bx
pop ax
pop bp

ret 6


printpage1:
pusha
mov ax,0xb800
mov es,ax
mov cx,10

;write s
MOV si,490
mov di,si
l91:mov word[es:di],0x3520
mov dx,0xffff
delay:sub dx,1
jnz delay
add di,2
sub cx,1
jnz l91
mov cx,5
mov di,si
l92:mov word[es:di],0x3520
mov dx,0xffff
delay1:sub dx,1
jnz delay1
add di,160
sub cx,1
jnz l92

mov cx,10
l3:mov word[es:di],0x3520
mov dx,0xffff
delay2:sub dx,1
jnz delay2
add di,2
sub cx,1
jnz l3

mov cx,5
l4:mov word[es:di],0x3520
mov dx,0xffff
delay3:sub dx,1
jnz delay3
add di,160
sub cx,1
jnz l4

mov cx,10
l5:mov word[es:di],0x3520
mov dx,0xffff
delay4:sub dx,1
jnz delay4
sub di,2
sub cx,1
jnz l5

;write n
;mov di,si
add si,28
mov di,si
mov cx,11
;mov di,512
A1:mov word[es:di],0x3520
mov dx,0xffff
delay5:sub dx,1
jnz delay5
add di,160
sub cx,1
jnz A1

mov cx,11
mov di,si
A2:mov word[es:di],0x3520
mov dx,0xffff
delay6:sub dx,1
jnz delay6
add di,162
sub cx,1
jnz A2

sub di,160
mov cx,11
A3:mov word[es:di],0x3520
mov dx,0xffff
delay7:sub dx,1
jnz delay7
sub di,160
sub cx,1
jnz A3

;write code for a
mov cx,11
add di,8
add di,160
mov si,di
N1:mov word[es:di],0x3520
mov dx,0xffff
delay8:sub dx,1
jnz delay8
add di,160
sub cx,1
jnz N1

mov di,si
mov cx,10
N2:mov word[es:di],0x3520
mov dx,0xffff
delay9:sub dx,1
jnz delay9
add di,2
sub cx,1
jnz N2

mov cx,11
N3:mov word[es:di],0x3520
mov dx,0xffff
delay10:sub dx,1
jnz delay10
add di,160
sub cx,1
jnz N3

mov di,si
mov cx,5
s_again:add di,160
sub cx,1
jnz s_again

mov cx,10
N4:mov word[es:di],0x3520
mov dx,0xffff
delay11:sub dx,1
jnz delay11
add di,2
sub cx,1
jnz N4

;write for k
mov cx,11
add si,28
mov di,si

D1:
mov word[es:di],0x3520
mov dx,0xffff
delay12:sub dx,1
jnz delay12
add di,160
sub cx,1
jnz D1

mov di,si
mov cx,5
s_again1:add di,160
sub cx,1
jnz s_again1
mov cx,6
D2:
mov word[es:di],0x3520
add di,2
mov word[es:di],0x3520
mov dx,0xffff
delay13:sub dx,1
jnz delay13
add di,162
sub cx,1
jnz D2

mov di,si
mov cx,5
s_again2:add di,160
sub cx,1
jnz s_again2
mov cx,6
D3:
mov word[es:di],0x3520
add di,2
mov word[es:di],0x3520
mov dx,0xffff
delay14:sub dx,1
jnz delay14
sub di,158
sub cx,1
jnz D3

;write for e
mov si,di
add si,160
add si,8
mov di,si
mov cx,11
E1:
mov word[es:di],0x3520
mov dx,0xffff
delay15:sub dx,1
jnz delay15
add di,160
sub cx,1
jnz E1

mov di,si
mov cx,10
E2:mov word[es:di],0x3520
mov dx,0xffff
delay16:sub dx,1
jnz delay16
add di,2
sub cx,1
jnz E2

mov di,si
mov cx,5
s_again4:add di,160
sub cx,1
jnz s_again4
mov cx,10
E3:mov word[es:di],0x3520
mov dx,0xffff
delay17:sub dx,1
jnz delay17
add di,2
sub cx,1
jnz E3

mov di,si
mov cx,10
s_again5:add di,160
sub cx,1
jnz s_again5
mov cx,10
E4:mov word[es:di],0x3520
mov dx,0xffff
delay18:sub dx,1
jnz delay18
add di,2
sub cx,1
jnz E4
mov dx,0
mov dx,0xffff
delay19:add dx,1
jnz delay19

push 3000
push word[len1]
mov bx,str1
push bx
call printstr1

mov dx,0
mov dx,0xffff
delay20:add dx,1
jnz delay20

push 3160
push word[len2]
mov bx,str2
push bx
call printstr1

popa
ret

;-------- page 3
page3:
pusha

mov ax,0xb800
mov es,ax
mov di,160
mov si,di

mov cl,80
mov ch,5
ad54:

mov word[es:di],0x9020
mov word[es:di+160],0x9020
mov word[es:di+320],0x9020
add si,4
mov di,si
sub cl,1
jnz ad54
mov cl,80
;sub si,4
add si,480
mov di,si
sub ch ,1
jnz ad54

popa
ret
;----------

ad21:
push ax
mov word[cs:secondonetimeswitch], 0
mov word[cs:previouskey], 0
mov word[cs:right], 0
mov word[cs:left], 0
mov word[cs:up], 0
mov word[cs:down], 0

mov ax, 0
in al, 0x60
cmp al, 0x4d;rightkey
je hitrightkey
cmp al, 0x48;upkey
je hitupkey
cmp al, 0x50;downkey
je hitdownkey
;cmp al, ;to end game
pop ax
jmp far [cs:oldkbisr]

generateseedcall:
call generateseed
cmp word[cs:switch_stage1],1
jne sh1
jmp ad41
sh1:
cmp word[cs:switch_stage2],1
jne sh2
jmp sh6
sh2:
cmp word[cs:switch_stage3],1
jne sh3
jmp sh10
sh3:
cmp word[cs:switch_stage4],1
jne sh4
jmp sh11 
sh4:
cmp word[cs:switch_stage5],1
jne ad10
jmp sh12
sh5:

kbisr:
mov word[cs:start_timer],1
cmp word[cs:onetimeswitch], 0
je ad10
;mov ax, 0
cmp word[cs:lastlevelprinted], 1
je jl1
cmp word[cs:lastlevelprinted], 2
je jl2
cmp word[cs:lastlevelprinted], 3
je jl3
cmp word[cs:lastlevelprinted], 4
je jl4
cmp word[cs:lastlevelprinted], 5
je jl5
in al, 0x60
;usman
;----------------------
cmp al,0x02
jne stage2
jl1: mov word[cs:switch_stage1],1
mov word[cs:lastlevelprinted], 1
call clrscr
call board1
call initiliazeSnake
cmp word[cs:seedswitch], 1
je generateseedcall; jmp ad41
ad41: mov word[cs:onetimeswitch], 0
cmp word[cs:secondonetimeswitch], 0
je ad10
jmp ad21; to exclude left movement during initiliazation of snake
ad201:; no use till now 
;pop ax
stage2:
cmp al,0x03
jne stage3
jl2: mov word[cs:switch_stage2],1
mov word[cs:lastlevelprinted], 2
call clrscr
call board2
call initiliazeSnake
cmp word[cs:seedswitch], 1
je generateseedcall; jmp ad41
sh6: mov word[cs:onetimeswitch], 0
cmp word[cs:secondonetimeswitch], 0
je ad10
jmp ad21; to exclude left movement during initiliazation of snake

stage3:

cmp al,0x04
jne stage4
jl3:mov word[cs:switch_stage1],1
mov word[cs:lastlevelprinted], 3
call clrscr
call board3
call initiliazeSnake
cmp word[cs:seedswitch], 1
je generateseedcall; jmp ad41
sh10: mov word[cs:onetimeswitch], 0
cmp word[cs:secondonetimeswitch], 0
je ad10
jmp ad21; to exclude left movement during initiliazation of snake

stage4:
cmp al,0x05
jne stage5
jl4: mov word[cs:switch_stage1],1
mov word[cs:lastlevelprinted], 4
call clrscr
call board4
call initiliazeSnake
cmp word[cs:seedswitch], 1
je generateseedcall; jmp ad41
sh11: mov word[cs:onetimeswitch], 0
cmp word[cs:secondonetimeswitch], 0
je ad10
jmp ad21; to exclude left movement during initiliazation of snake

stage5:
cmp al,0x06
jne ad10
jl5 :mov word[cs:switch_stage1],1
mov word[cs:lastlevelprinted], 5
call clrscr
call board5
call initiliazeSnake
cmp word[cs:seedswitch], 1
je generateseedcall; jmp ad41
sh12: mov word[cs:onetimeswitch], 0
cmp word[cs:secondonetimeswitch], 0
je ad10
jmp ad21; to exclude left movement during initiliazation of snake

ad10:push ax
;mubarik
mov ax, 0
in al, 0x60
cmp al, 0x4d;rightkey
je hitrightkey
cmp al, 0x4b;leftkey
je hitleftkey
cmp al, 0x48;upkey
je hitupkey
cmp al, 0x50;downkey
je hitdownkey
cmp al, 1fh; restart game
je restartgame
pop ax
jmp far [cs:oldkbisr]

; ad46:
; mov al, 0x20
; mov 0x20, al
; iret

;start
start:
mov ax,350
out 0x40,al
mov al,ah
out 0x40,al

call clrscrwithbluebk
call printpage1
 mov ah,0
 int 16h
mov cx, 0xffff
ad44: loop ad44
call clrscr3
call printwithredbk
 mov ah,0
 int 16h
mov cx, 0xffff
ad45: loop ad45
mov word[cs:pageswitch], 0

mov ax, 0
mov es, ax

mov ax, [es:9*4]
mov [cs:oldkbisr], ax
mov ax, [es:9*4+2]
mov [cs:oldkbisr+2], ax

cli
mov word[es:9*4], kbisr
mov word[es:9*4+2], cs
mov word[es:8*4], timeisr
mov word[es:8*4+2], cs
sti

;must do it a TSR below
mov dx, start
add dx, 15
mov cl, 4
shr dx, cl
mov ax, 0x3100
int 0x21