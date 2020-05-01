Create table tbl_mst_product(
ProdId number(10) constraint prod_id_01 primary key,
ProdName varchar2(20),
ProdDesc varchar2(50),
ProdQty number(10),
ProdPurPrice number(10,2),
ProdSellPrice number(10,2),
ProdPurDate date
);

Create table tbl_mst_customer(
CustId number(10) constraint cust_id_01 primary key,
CustFullName varchar2(20),
CustAdd varchar2(50),
CustPhone number(10) constraint cust_ph_01 unique,
CustEmail number(10,2),
CustCreatedDt date
);

Create table tbl_sales_invoice_header(
InvId number(10) constraint inv_id_01 primary key,
InvTotalPrice number(10,2),
InvHeaderDisc number(10,2),
InvDt date
);

Create table tbl_sales_invoice_details(
InvId number(10) references tbl_sales_invoice_header(InvId),
LineNo number(10),
ProdId number(10) references tbl_mst_product(ProdId),
Quantity number(10),
SellPrice number(10,2),
Discount number(10,2)
);

commit;
select * from  tbl_mst_product;

commit;