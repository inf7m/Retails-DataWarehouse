LOAD DATA
INFILE 'styles.csv'
APPEND
INTO TABLE FULL_PRODUCT_INFO
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
    id,
    gender,
    masterCategory,
    subCategory,
    articleType,
    baseColour,
    season,year,
    usage,
    productDisplayName

)