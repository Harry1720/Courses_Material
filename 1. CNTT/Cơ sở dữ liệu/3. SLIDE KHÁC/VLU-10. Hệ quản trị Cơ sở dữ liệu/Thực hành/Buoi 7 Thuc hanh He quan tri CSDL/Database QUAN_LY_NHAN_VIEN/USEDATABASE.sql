/***************************USE DATABASE***********************************/
			
GO 
USE QUANLYNHANVIEN_B7_MSSV

INSERT INTO PHONGBAN VALUES('NGHIEN CUU',5,'333445555','05/22/1988')
		INSERT INTO PHONGBAN VALUES('DIEU HANH',4,'987987987','01/01/1995')
        	INSERT INTO PHONGBAN VALUES('QUAN LY',1,'888665555','06/19/1981')

INSERT INTO NHANVIEN VALUES('PHAM','VAN','VINH','888665555','11/10/1937','450 TRUNG VUONG HA NOI','NAM',55000,NULL,1)
	INSERT INTO NHANVIEN VALUES('NGUYEN','THANH','TUNG','333445555','12/08/1955','638 NGUYEN VAN CU Q5 TP HCM','NAM',40000,'888665555',5)
		INSERT INTO NHANVIEN VALUES('LE','QUYNH','NHU','987654321','06/20/1951','291 HO VAN HUE QPN TP HCM','NU',43000,'888665555',4)
			INSERT INTO NHANVIEN VALUES('DINH','BA','TIEN','123456789','01/09/1965','731 TRAN HUNG DAO Q1 TP HCM','NAM',30000,'333445555',5) 
				INSERT INTO NHANVIEN VALUES('NGUYEN','MANH','HUNG','666884444','09/15/1962','543 BA RIA VUNG TAU','NAM',38000,'333445555',5)
					INSERT INTO NHANVIEN VALUES('TRAN','THANH','TAM','453453453','07/31/1972','543 MAI THI LUU Q1 TP HCM','NU',25000,'333445555',5) 
						INSERT INTO NHANVIEN VALUES('BUI','NGOC','HANG','999887777','07/19/1968','332 NGUYEN TAHI HOC Q1 TP HCM','NU',25000,'987654321',4) 
							INSERT INTO NHANVIEN VALUES('TRAN','HONG','QUANG','987987987','03/09/1969','980 LE HONG PHONG Q10 TP HCM','NAM',25000,'987654321',4) 

INSERT INTO DIADIEM_PHG VALUES(1,'TP HCM')
    INSERT INTO DIADIEM_PHG VALUES(4,'HANOI')
        INSERT INTO DIADIEM_PHG VALUES(5,'VUNG TAU')
            INSERT INTO DIADIEM_PHG VALUES(5,'NHA TRANG')
                INSERT INTO DIADIEM_PHG VALUES(5,'TP HCM')


INSERT INTO DEAN VALUES('SAN PHAM X',1,'VUNG TAU',5)
    INSERT INTO DEAN VALUES('SAN PHAM Y',2,'NHA TRANG',5)
      INSERT INTO DEAN VALUES('SAN PHAM Z',3,'TP HCM',5) 
         INSERT INTO DEAN VALUES('TIN HOC HOA',10,'HA NOI',4)
            INSERT INTO DEAN VALUES('CAP QUANG',20,'TP HCM',1)
               INSERT INTO DEAN VALUES('DAO TAO','30','HA NOI',4)


INSERT INTO PHANCONG VALUES('123456789',1,32.5)
   INSERT INTO PHANCONG VALUES('123456789',2,7.5)
     INSERT INTO PHANCONG VALUES('666884444',3,40.0)
        INSERT INTO PHANCONG VALUES('453453453',1,20.0)
          INSERT INTO PHANCONG VALUES('453453453',2,20.0)
            INSERT INTO PHANCONG VALUES('333445555',2,10.0)
              INSERT INTO PHANCONG VALUES('333445555',3,10.0)
                INSERT INTO PHANCONG VALUES('333445555',10,10.0)
                  INSERT INTO PHANCONG VALUES('333445555',20,10.0)
                     INSERT INTO PHANCONG VALUES('999887777',30,30.0)
                       INSERT INTO PHANCONG VALUES('999887777',10,10.0)
                          INSERT INTO PHANCONG VALUES('987987987',10,35.0)
                            INSERT INTO PHANCONG VALUES('987987987',30,5.0)
                              INSERT INTO PHANCONG VALUES('987654321',30,20.0) 
                                 INSERT INTO PHANCONG VALUES('987654321',20,15.0)
                                     INSERT INTO PHANCONG VALUES('888665555',20,NULL)


INSERT INTO THANNHAN VALUES('333445555','TRINH','NU','04/05/1986','CON GAI')
    INSERT INTO THANNHAN VALUES('333445555','KHANG','NAM','10/25/1983','CON TRAI')
       INSERT INTO THANNHAN VALUES('333445555','PHUONG','NU','05/03/1958','VO CHONG')			
          INSERT INTO THANNHAN VALUES('987654321','MINH','NAM','02/28/1942','VO CHONG')
             INSERT INTO THANNHAN VALUES('123456789','TIEN','NAM','01/01/1988','CON TRAI')
               INSERT INTO THANNHAN VALUES('123456789','CHAU','NU','12/30/1988','CON TRAI')
                 INSERT INTO THANNHAN VALUES('123456789','PHUONG','NU','05/05/1967','VO CHONG')


/***************************TRUY XUAT CAC BANG **************************/

SELECT * FROM NHANVIEN	
SELECT * FROM PHONGBAN
SELECT * FROM DIADIEM_PHG 
SELECT * FROM PHANCONG
SELECT * FROM THANNHAN
SELECT * FROM DEAN	

/*****************************CAC CAU TRUY VAN**************************/

  
				