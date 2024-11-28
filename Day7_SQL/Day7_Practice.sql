/* Module - 9 */
/*****************/
CREATE TABLE EQUIPMENT
(  MACHINE_ID    VARCHAR(20),  
   MACHINE_NAME  VARCHAR(30),                          
   MODEL         INTEGER,
   PRIMARY KEY  (MACHINE_ID) 
) ; 

INSERT INTO EQUIPMENT values  
	( 'MAC01' , 'SPINNING' , 2018 ) ,   
	( 'MAC02' , 'DYEING'   , 2019 ) ;

CREATE TABLE LEASE (   MACHINE_ID   VARCHAR(20) ,	
		       INVOICE       VARCHAR(10) ,				
		       QUANTITY      INTEGER,	                            			
                       UNIT_PRICE    DECIMAL(12,2) ,                              
                       LEASE_DATE    Date ,
		       LEASE_EXPIRY  Date ,
                       PRIMARY KEY   ( INVOICE )
		   ) ; 

INSERT INTO LEASE VALUES
	( 'MAC01' , 'INV001' ,7 , 20100, '2019-04-01' , '2022-04-01'  ) ,
	( 'MAC01' , 'INV002' ,3 , 35000, '2020-02-01' , '2021-02-01'  ) ,
	( 'MAC02' , 'INV003' ,4 , 15000, '2019-06-01' , '2021-06-01'  ) ;


/* Branches */ 

CREATE TABLE ALL_BANKS (BANK    VARCHAR(20), 
			     CITY    VARCHAR(20),  	
                             BRANCH  VARCHAR(20),                  
                             IFSC_CODE VARCHAR(35)) ;
insert into ALL_BANKS  values 
('HDFC', 'HYDERABAD',  'ABIDS, MALAKPET'  ,  'HDFC0000145, HDFC0000849') ,
('SBI ', 'BENGALURU',  'BTM,  Whitefield' ,  'SBI00006756, SBI00002311') ,
('ICICI','MUMBAI',     'MALAD, DADAR'     ,  'ICIC0007645, ICIC0003349') ;


CREATE TABLE BANKS (BANK    VARCHAR(20), 
		    CITY    VARCHAR(20),  	
                    BRANCH  VARCHAR(20),                  
                    IFSC_CODE VARCHAR(35)) ;
insert into BANKS  values 
('HDFC', 'HYDERABAD',  'ABIDS'  ,  'HDFC0000145') ,
('HDFC', 'HYDERABAD',  'MALAKPET'  ,  'HDFC0000849') ,
('SBI ', 'BENGALURU',  'BTM' ,  'SBI00006756') ,
('SBI ', 'BENGALURU',  'Whitefield' ,  'SBI00002311') ,
('ICICI','MUMBAI',     'MALAD'    ,  'ICIC0007645') ,
('ICICI','MUMBAI',     'DADAR'     ,  'ICIC0003349') ;


CREATE TABLE EQUIPMENT_LEASE
	(
		MACHINE_ID    VARCHAR(20) ,
		MACHINE_NAME  VARCHAR(30) , 
		MODEL         INTEGER,
		INVOICE       VARCHAR(10) ,
		QUANTITY      INTEGER,
		UNIT_PRICE    DECIMAL(12,2) , 
		LEASE_DATE    Date ,
		EXPIRY_DATE   Date 
        );
	

Insert into EQUIPMENT_LEASE values 
		( 'MAC01' , 'SPINNING' , 2018 ,  'INV001' ,7, 20100, '2019-04-01' , '2022-04-01'  ) ,
		( 'MAC01' , 'SPINNING' , 2018 ,  'INV002' ,3, 35000, '2020-02-01' , '2021-02-01'  ) ,
	        ( 'MAC02' , 'DYEING'   , 2019 ,  'INV003' ,4, 15000, '2019-06-01' , '2021-06-01'  ) ;

CREATE TABLE EQUIPMENT(	MACHINE_ID    VARCHAR(20) ,				
			MACHINE_NAME  VARCHAR(30) , 
                        MODEL     INTEGER ,
			PRIMARY KEY (MACHINE_ID) );

CREATE TABLE LEASE (    MACHINE_ID    VARCHAR(20) ,
			INVOICE       VARCHAR(10) ,				
			QUANTITY      INTEGER,	                            
			UNIT_PRICE    DECIMAL(12,2) ,                             
			LEASE_DATE    Date ,
			LEASE_EXPIRY  Date ,
			PRIMARY KEY ( INVOICE )) ; 


INSERT INTO EQUIPMENT values 
( 'MAC01' , 'SPINNING' , 2018 ) ,  	
( 'MAC02' , 'DYEING'   , 2019 ) ;

INSERT INTO LEASE VALUES 
( 'MAC01' , 'INV001' ,7 , 20100, '2019-04-01' , '2022-04-01'  ) ,
( 'MAC01' , 'INV002' ,3 , 35000, '2020-02-01' , '2021-02-01'  ) ,
( 'MAC02' , 'INV003' ,4 , 15000, '2019-06-01' , '2021-06-01'  ) ;



DROP TABLE ACCOUNT_TRANSACTION;
Create TABLE ACCOUNT_TRANSACTION( 	Cust_Id         INTEGER , 	
				Account_Number  varchar(50),  	
				Account_type 	varchar(20),   	
				Balance 		Integer ,    
				Tran_ID         varchar(20),     
				Cheque       Varchar(20),     
				Pay_purpose     Varchar(20),     
				Tran_Amount     Integer    );


Insert into  ACCOUNT_TRANSACTION VALUES 
( 123002 , '4000-1956-2001' ,  'SAVINGS', 900000 ,  'T99901' , 'CHQ0001' , 'Education Fee' ,  500000 ),
( 123002 , '4000-1956-2001' ,  'SAVINGS', 950000 ,  'T99907' , 'CHQ0023' , 'Deposit' ,  50000 ),
( 123002 , '5000-1700-5001' ,  'FIXED DEPOSITS', 7500000 ,  'T99904' , 'CHQ0002' , 'Overdraft'    , 500000  ) ,
( 123002 , '5000-1700-5001' ,  'FIXED DEPOSITS', 7950000 ,  'T99904' , 'CHQ0006' , 'Annual deposit'    , 450000) ;


Create TABLE ACCOUNT
( 	Cust_id 		INT, 
	Account_Number   varchar(50),  
	Account_type 	varchar(20),   
	Balance 		Integer 
);

INSERT INTO ACCOUNT VALUES 
(123002, '4000-1956-2001', 'SAVINGS', 950000 ) ,
(123002, '5000-1700-5001', 'FIXED DEPOSITS', 7950000 ) ;

Create TABLE 	TRANSACTION( 	 
				Account_Number  varchar(50),  	
				Tran_ID         varchar(20),     
				Cheque       Varchar(20),     
				Pay_purpose     Varchar(20),     
				Tran_Amount     Integer    );

Insert into  TRANSACTION VALUES 
( '4000-1956-2001' ,  'T99901' , 'CHQ0001' , 'Education Fee' ,  500000 ),
( '4000-1956-2001' ,  'T99907' , 'CHQ0023' , 'Deposit' ,  50000 ),
( '5000-1700-5001' ,  'T99904' , 'CHQ0002' , 'Overdraft'    , 500000  ) ;
( '5000-1700-5001' ,  'T99904' , 'CHQ0006' , 'Annual deposit'    , 450000) ;


Create TABLE 	TRAN_DETAILS ( 	 
				Account_Number  varchar(50),  	
				Tran_ID         varchar(20),     
				Cheque       Varchar(20)
			     ) ;
			
Insert into  TRAN_DETAILS  VALUES 
( '4000-1956-2001' ,  'T99901' , 'CHQ0001' ), 
( '4000-1956-2001' ,  'T99907' , 'CHQ0023' );

Create TABLE 	CHEQUE_DETAILS( 	Cheque       Varchar(20),      
				BILL_NO         varchar(20),     
				Pay_purpose     Varchar(20),     
				Tran_Amount     Integer    );

Insert into CHEQUE_DETAILS values 
('CHQ0001' , 'BIL001', 'Education Fee', 400000 ) ,
('CHQ0001' , 'BIL002', 'Income Tax', 100000 ) ,
('CHQ0023' , 'BIL003', 'Deposit' ,  46000 ),
('CHQ0023' , 'BIL004', 'TDS' ,  4000 );

/* Lockers */

CREATE TABLE ACCT_LOCKER(
          	Acct_Num varchar(19) PRIMARY KEY,
          	Safe_box INT references BANK_LOCKER
          		) ;

CREATE TABLE BANK_LOCKER (
	  BANK       CHAR (10),         
          Safe_box   INT PRIMARY KEY,
          Location   CHAR (19),         
	  Acct_Num   varchar(19) references ACCT_LOCKER ) ;


Insert into ACCT_Locker values
( '4000-1956-2001' , 999101 ) ,
( '4000-1956-2900' , 999102 ) ;

Insert into Bank_Locker values
( 'HDFC',   999101 , 'HYD', '4000-1956-2001' ) ,
( 'HDFC',   999102 , 'DELHI', '4000-1956-2900' ) ;




