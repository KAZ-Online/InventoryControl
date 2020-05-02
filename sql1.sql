Create table TBL_MST_PRODUCT(
ProdID number(10) not null,
ProdName varchar(10 ) not null,
ProdDesc varchar(10 ) not null,
ProdQty number(10) not null,
ProdPurPrice number(10) not null,
ProdSellPrice number(10) not null,
ProdPurDate Date,
CONSTRAINT ProdID_pk primary key(ProdID)
);

Create table TBL_MST_CUSTOMER(
CustID number(10) not null,
CustFullName varchar(10 ) not null,
CustAddress varchar(10 ) not null,
CustPhone number(10) not null,
CustEmail number(10) not null,
CustCreatedDT Date,
CONSTRAINT Cust_pk primary key(CustID)
);


Create table TBL_SALES_INVOICE_HEADER(
InvID number(10) not null,
InvTotalPrice number(10) not null,
InvHeaderDisc number(10) not null,
InvDT Date,
CONSTRAINT Inv_pk primary key(InvID)
);

Create table TBL_SALES_INVOICE_DETAILS(
InvID number(10) not null ,
LineNo number(10) not null,
ProdID number(10) not null,
Quantity number(10) not null,
SellPrice number(10) not null,
Discount number(10)not null,
FOREIGN KEY(InvID) REFERENCES TBL_SALES_INVOICE_HEADER (InvID),
FOREIGN KEY(ProdID) REFERENCES TBL_MST_PRODUCT(ProdID));



i