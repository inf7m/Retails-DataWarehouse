LOAD DATA
INFILE 'Cashier_master.csv' -- Source data
INTO TABLE CASHIERDIM
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
    CashierKey,
    CashierEmployeeID,
    CashierName
)