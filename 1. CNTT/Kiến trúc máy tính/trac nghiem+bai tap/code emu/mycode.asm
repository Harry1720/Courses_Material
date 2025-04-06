;4 dong sau day la bat buoc phai co trong ctr
.model small
.stack 100h
.data 
;in chuoi ra man hinh;cuoi chuoi co dau $ 
nhan db "Xin chao$"
.code
main proc
    ;Viet code o day.
    
    ;ham ngat ah loai 1: de nhap vao mot ky tu tu ban phim
    ;mov ah,1
    ;int 21h 
    
    ;ham ngat ah loai 2: de in ra mot ky tu
    ;mov ah,2 
    
    ;dien ma ascii vao dong ben duoi, sau dau phay
    ;muon xem ma ascii cua cac ky tu, nhan vao ascii codes tren menu: 
    ;mau den la he thap phan, mau xanh (Chuot trai) la he hexa 
    ;mov dl, 35h    
    
    ;(he hexa) 35 la ky tu 5
    ;int 21h 
    
    ;ham ngat ah loai 9: de in ra 1 chuoi ky tu
    ;Dau tien, dat chuoi muon in ra ben duoi dong .data 
    mov ax, @data
    mov ds,ax
    mov ah,9  
    lea dx,nhan;tren dat ten ntn thi duoi goi y nhu vay.
    int 21h
main endp
end main