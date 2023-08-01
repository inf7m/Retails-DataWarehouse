LOAD DATA
INFILE 'PaymentMethod_master'
INTO TABLE PAYMENTMETHODDIM
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
    PaymentMethodKey,
    PaymentMethodDescription
    )