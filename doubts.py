# -*- coding: utf-8 -*-
"""
Created on Wed Apr 29 11:03:59 2020

@author: HP P DTS
"""

import cx_Oracle as cx

CN=cx.connect('scott/tiger@localhost:1521/orcl')
cur=cn.cursor()
para=[5,'Python programming','12-DEC-2020']
cur.execute('insert into my_table values(:id,:item_name,:created_dt)',para)
cn.commit()
cn.close()

## Sales Invoice
ProdID=int(input('Enter product id'))
Qty=int(input('Enter no of quantity'))
LineDiscYesNo= input('Line discount applicable [Y/N]')
if LineDiscYesNo=='Y':
    LineDisc=float(input("How much discount"))
else:
    LineDisc=0
 
# Search Function 
def SearchProduct(prodid):
    try:
        CN=cx.connect('scott/tiger@localhost:1521/orcl')
        cur=CN.cursor()
        query='select * from TBL_MST_Product where ProdID=:prodid'
        para=[prodid]
        rec=cur.execute(query,para)
        return rec
    except:
        print('Error')
    finally:
        CN.close()
        del query
        del para
        del rec
        
prod_det=SearchProduct(1001) 
prid=prod_det[0]
prname=prod_det[1]
prdesc=prod_det[2]
prsellprice=prod_det[3]
Prod_Total= prsellprice * Qty - LineDisc

def InsertProdDetails(InvNo,lineno,prodid,qty,linedisc,total):
    

