name "midterm"

org 100h

game:  mov dx, offset msg1
       mov ah, 9
       int 21h

       ; read character in al:
       mov ah, 1 
       int 21h  

       cmp al, '0'
       jb stop

       cmp al, '9'
       ja stop
       
       
       ;binary number
       mov bl, al
       mov bh, al
       sub bl, 30h
       
       mov ah, 2
       mov dl, 0Ah
       int 21h
       mov dl, 0Dh
       int 21h
       
       mov dx, offset binary
       mov ah, 9 
       int 21h
       
       mov cx, 8

print_1: mov ah, 2   ; print function.
         mov dl, '1'
         test bl, 10000000b  ; test first bit.
         jne zero
         mov dl, '0'

zero:    int 21h
         shl bl, 1
loop print_1   
mov dl,'b' 

       
       cmp bh, '2'
       jz equal
       jne not_equal
       mov dx, offset equal
       
equal:  mov dx, offset equal2 
        jmp print
       
not_equal:  jb below
            mov dx, offset above2
            jmp print
            
below:  mov dx, offset below2
        jmp print
        
print: mov ah, 9
       int 21h
       jmp game
          

stop: ret  ;stop


msg1 db "Enter a number or any other character to exit:  $"
binary db "Binary: $"    
equal2 db " is two", 0Dh,0Ah, "$"
below2 db " is below two!" , 0Dh,0Ah, "$"
above2 db " is above two!" , 0Dh,0Ah, "$" 



