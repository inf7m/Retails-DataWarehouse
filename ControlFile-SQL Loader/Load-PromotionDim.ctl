LOAD DATA
INFILE 'Promotion_master.csv'
INTO TABLE PROMOTION
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
    PromotionID,
    PromotionName,
    PromotionDescription,
    PromotionStartDate DATE 'DD-MM-YYYY',
    PromotionEndDate 'DD-MM-YYYY',
    PROMOTIONKEY "PROMOTION_KEY"
)