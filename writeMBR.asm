;read MBR sector

.286
 CSEG segment

assume CS:CSEG, DS:CSEG, ES:CSEG, SS:CSEG

 org 100h
start:
jmp start2

error db "error write mbr ",13,10,'$'
error2 db "error read file",13,10,'$'
ok db "ok",13,10,'$'
file db 'writembr.sec',0

start2:



;start2:
next:
mov ah,3dh
mov al,0
lea dx,file
mov cx,32
int 21h
mov bx,ax

mov ah,3fh
mov cx,512
lea dx,buffer
int 21h
jnc next2

mov ah,9
lea dx,error2
int 21h

next2:

mov ah,3eh
int 21h

mov ah,3
mov al,1 
mov ch,0
mov cl,1
mov dl,80h
lea bx,buffer
int 13h

jnc next3
mov ah,9

lea dx,error
int 21h
mov ah,9
lea dx,error
int 21h

next3:
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
