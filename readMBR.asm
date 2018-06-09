;read MBR sector

.286
 CSEG segment

assume CS:CSEG, DS:CSEG, ES:CSEG, SS:CSEG

 org 100h
start:
jmp start2

error db "error read",13,10,'$'
error2 db "error write file",13,10,'$'
ok db "ok",13,10,'$'
file db 'readmbr.sec',0

start2:

mov ah,2
mov al,1 
mov ch,0
mov cl,1
mov dl,80h
lea bx,buffer
int 13h
cmp al,0
jz next
lea dx,error
int 21h

;start2:
next:
mov ah,3ch
lea dx,file
mov cx,32
int 21h
mov bx,ax

mov ah,40h
mov cx,512
lea dx,buffer
int 21h
jnc next2
lea dx,error2
int 21h

next2:

mov ah,3eh
int 21h

lea dx,ok
int 21h

mov ah,0
int 16h

int 20h

buffer db 512 dup(0) 
CSEG ends
 end Start













 end start
        
        END
