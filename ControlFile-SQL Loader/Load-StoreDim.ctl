LOAD DATA
INFILE 'Store_master.csv' -- Source Store_master_file
INTO TABLE STOREDIM
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
    StoreKey,
    StoreNumber,
    StoreName,
    StoreDistrict,
    StoreRegion
)