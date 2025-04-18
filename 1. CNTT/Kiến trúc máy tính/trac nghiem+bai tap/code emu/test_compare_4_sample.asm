name "flags"

org 100h

; this sample shows how cmp instruction sets the flags.

; usually cmp instruction is followed by any relative
; jump instruction such as: je, ja, jl, jae...

; it is recommended to click "flags" and "analyze"
; for better visual expirience before stepping through this code.

; (signed/unsigned)
; 4 is equal to 4
mov ah, 4
mov al, 4
cmp ah, al
nop

; (signed/unsigned)
; 4 is above and greater then 3
mov ah, 4
mov al, 3
cmp ah, al
nop

; -5 = 251 = 0fbh

; (signed)
; 1 is greater then -5
mov ah, 1
mov al, -5
cmp ah, al
nop

; (unsigned)
; 1 is below 251
mov ah, 1
mov al, 251
cmp ah, al
nop

; (signed)
; -3 is less then -2
mov ah, -3
mov al, -2
cmp ah, al
nop

; (signed)
; -2 is greater then -3
mov ah, -2
mov al, -3
cmp ah, al
nop

; (unsigned)
; 255 is above 1
mov ah, 255
mov al, 1
cmp ah, al
nop

; now a little game:
game:  mov dx, offset msg1
       mov ah, 9
       int 21h

       ; read character in al:
       mov ah, 1 
       int 21h

       cmp al, '0'
       jb stop

       cmp al, '9'
       jg stop
          
       ; convert the character to its numeric value
       sub al, '0'

       ; print binary value
       mov cx, 8 ; 8 bits
print_binary:
       shl al, 1
       jnc zero_bit
       mov dx, offset one
       jmp print_bit
zero_bit:
       mov dx, offset zero

print_bit:
       mov ah, 9
       int 21h
       loop print_binary

       ; compare the input value with 5
       cmp al, 5
       jne not_equal
       
       mov dx, offset equal_5
       jmp print

not_equal: ; check if below or above
           jb below_five
           jmp above_five

below_five: mov dx, offset below_5
            jmp print

above_five: mov dx, offset above_5
            jmp print


print: mov ah, 9
       int 21h
       jmp game  ; loop.


stop: ret  ; stop


msg1 db "enter a number or any other character to exit:  $"
equal_5 db " is five! (equal)", 0Dh,0Ah, "$"
below_5 db " is below five!" , 0Dh,0Ah, "$"
above_5 db " is above five!" , 0Dh,0Ah, "$"
zero db "0", 0, "$"
one db "1", 0,"$"

