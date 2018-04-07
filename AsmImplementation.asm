assume cs:code,ds:data
data segment
	arr	db 32,43,13,56,42,12,11
	key db 0
data ends
code segment
	start:
		mov ax,data
		mov ds,ax
		mov di,12*160
		call display
		mov ax,0
		mov cx,offset key-offset arr-1
		mov di,1
		INSERT:
			mov al,arr[di]
			mov key,al			;key=A[j]
			mov ax,di	
			mov si,ax			;i=j-1
			dec si
			compara:
				mov al,arr[si]
				cmp al,key
				jna next
				mov arr[si+1],al
				dec si
				cmp si,0
			jae compara
		next:
			mov al,key
			mov arr[si+1],al
			inc di
		loop INSERT
		mov di,13*160
		call display
		
	mov ax,4C00H
	int 21H
		display:
			mov ax,0B800H
			mov es,ax
			mov si,0
			mov cx,offset key-offset arr
			s:
				mov ah,0
				mov al,arr[si]
				call hextodec
				mov es:[di],al
				mov es:[di+2],ah
				mov al,32
				mov es:[di+6],al
				inc si
				add di,6
			loop s
		ret

		hextodec:
			mov bh,10
			div bh
			add ah,30H
			add al,30H
		ret

code ends
end start