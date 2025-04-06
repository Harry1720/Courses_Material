name "hi-world"

; this example prints out  "hello world!"
; by writing directly to video memory.
; in vga memory: first byte is ascii character, byte that follows is character attribute.
; if you change the second byte, you can change the color of
; the character even after it is printed.
; character attribute is 8 bit value,
; high 4 bits set background color and low 4 bits set foreground color.

;To mau nen cho chu
; hex    bin        color
; 
; 0      0000      black
; 1      0001      blue
; 2      0010      green
; 3      0011      cyan
; 4      0100      red
; 5      0101      magenta
; 6      0110      brown
; 7      0111      light gray
; 8      1000      dark gray
; 9      1001      light blue
; a      1010      light green
; b      1011      light cyan
; c      1100      light red
; d      1101      light magenta
; e      1110      yellow
; f      1111      white
 
; 5 lenh, 29 dong lenh.

org 100h

; set video mode
; can biet doi so can dua vao    
mov ax, 3     ; text mode 80x25, 16 colors, 8 pages (ah=0, al=3)  
;chep gia tri 3 vao thanh ghi ax
;thanh ghi duoc ky hieu mau do dam

int 10h       ; do it!

; cancel blinking and enable all 16 colors: (chuan bi lenh)
mov ax, 1003h
mov bx, 0
int 10h


; set segment register:
mov     ax, 0b800h  ;doi voi nhung du lieu so hexa bat dau = dang chu: a,b,c,d,e,f -> dien so 0 vao truoc
mov     ds, ax

; print "hello world"
; first byte is ascii code, second byte is color code.

;mov [02h], 'H' ;moi 1 vi tri tren man hinh hien thi chu

;mov [04h], 'e'

;mov [06h], 'l'

;mov [08h], 'l'

;mov [0ah], 'o'

;mov [0ch], ','

;mov [0eh], 'W'
 
;mov [10h], 'o'

;mov [12h], 'r'

;mov [14h], 'l'

;mov [16h], 'd'

;mov [18h], '!'


mov [402h], 078 ;moi 1 vi tri tren man hinh hien thi chu
mov [404h], 103
mov [406h], 117
mov [408h], 121
mov [40ah], 101
mov [40ch], 110
mov [40eh], 032
mov [410h], 081
mov [412h], 117
mov [414h], 111
mov [416h], 099
mov [418h], 032
mov [41ah], 066
mov [41ch], 097
mov [41eh], 111
mov [420h], 044
mov [422h], 032
mov [424h], 072
mov [426h], 117
mov [428h], 121
mov [42ah], 110
mov [42ch], 104



; color all characters:
mov cx, 22  ; number of characters.
mov di, 403h ; start from byte after 'h'

c:  mov [di], 11101100b   ; light red(1100) on yellow(1110)
    add di, 2 ; skip over next ascii code in vga memory.
    loop c

; wait for any key press:
mov ah, 0
int 16h

ret

