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
       jl stop

       cmp al, '9'
       ja stop

       cmp al, '5'
       jl below
       ja above
       je equal
equal: mov dx, offset equal_5
       jmp print
below: mov dx, offset below_5     
       jmp print
above: mov dx, offset above_5
print: mov ah, 9
       int 21h
biout: mov dx, offset print_binary
       int 21h  
       
       cmp al, '0'
       je  print_0
       cmp al, '1'
       je  print_1
       cmp al, '2'
       je  print_2
       cmp al, '3'
       je  print_3  
       cmp al, '4'
       je  print_4
       cmp al, '5'
       je  print_5
       cmp al, '6'
       je  print_6
       cmp al, '7'
       je  print_7
       cmp al, '8'
       je  print_8
       cmp al, '9'
       je  print_9

print_0:mov dx, offset bin_0
       jmp printb
print_1:mov dx, offset bin_1 
       jmp printb
print_2:mov dx, offset bin_2    
       jmp printb
print_3:mov dx, offset bin_3    
       jmp printb
print_4:mov dx, offset bin_4
       jmp printb
print_5:mov dx, offset bin_5
       jmp printb
print_6:mov dx, offset bin_6
       jmp printb
print_7:mov dx, offset bin_7  
       jmp printb
print_8:mov dx, offset bin_8  
       jmp printb
print_9:mov dx, offset bin_9 
       jmp printb
printb:int 21h
jmp game
stop: ret  ; stop


msg1 db "enter a number or any other character to exit:  $"
equal_5 db " is five! (equal)", 0Dh,0Ah, "$"
below_5 db " is below five!" , 0Dh,0Ah, "$"
above_5 db " is above five!" , 0Dh,0Ah, "$"
print_binary db "binary of input   $"
bin_0 db "is 0000 0000b", 0Dh,0Ah, "$"
bin_1 db "is 0000 0001b", 0Dh,0Ah, "$"
bin_2 db "is 0000 0010b", 0Dh,0Ah, "$"
bin_3 db "is 0000 0011b", 0Dh,0Ah, "$"
bin_4 db "is 0000 0100b", 0Dh,0Ah, "$"
bin_5 db "is 0000 0101b", 0Dh,0Ah, "$"
bin_6 db "is 0000 0110b", 0Dh,0Ah, "$"
bin_7 db "is 0000 0111b", 0Dh,0Ah, "$"
bin_8 db "is 0000 1000b", 0Dh,0Ah, "$"
bin_9 db "is 0000 1001b", 0Dh,0Ah, "$"