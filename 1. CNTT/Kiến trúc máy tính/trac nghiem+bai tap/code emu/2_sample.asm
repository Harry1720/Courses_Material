name "add-sub"

org 100h

mov al, 5       ; bin=00000101b
mov bl, 10      ; hex=0ah or bin=00001010b

; 5 + 10 = 15 (decimal) or hex=0fh or bin=00001111b
add bl, al  ;bl bi thay doi

; 15 - 1 = 14 (decimal) or hex=0eh or bin=00001110b
sub bl, 1

; print result in binary:
mov cx, 8
print: mov ah, 2   ; print function.
       mov dl, '0'   ;ky tu 0 -> noi dung cua dl la ma ASCII cua 0
       test bl, 10000000b  ; test first bit.    ;Chi quan tam bit dau tien cua bl
       jz zero ;nhay den nhan dat ten la zero
       mov dl, '1'
zero:  int 21h  ;write character to standard output. ; entry: DL = character to write, after execution AL = DL.
       ;DL = character to write (in nd DL ra man hinh), after execution AL = DL.
       shl bl, 1 ;lay 7 bit ngoai cung tay phai cua bl, dich chuyen toan bo qua trai, ngoai cung ben phai thieu 1
       ;luc do bit ngoai cung ben trai ban dau day vao CF, bit cuoi cung sau khi di chuyen thi se them 0.
loop print  ;nhay den lenh print lam lien tuc cac lenh   ;CX = CX - 1

; print binary suffix:
mov dl, 'b'
int 21h

; wait for any key press:
mov ah, 0
int 16h  

ret
         ;Cac thanh ghi khi chay lenh int: flags register, CS, IP

