-- oracle syntax
CREATE TABLE DateDim(
    DateKey INT PRIMARY KEY,
    FullDate VARCHAR2(10),
    DayOfWeek INT,
    DayNumber_in_month INT,
    DayNumber_in_year INT,
    LastDay_indicator BOOLEAN,
    CalendarWeek INT,
    CalendarMonth INT,
    CalendarQuarter INT,
    Holidays_indicator BOOLEAN,
    Weekend_indicator BOOLEAN
);

-- Store Dimension
CREATE TABLE StoreDim(
    StoreKey INT PRIMARY KEY,
    StoreNumber INT,
    StoreName VARCHAR2(100),
    StoreDistrict  VARCHAR2(100),
    StoreRegion VARCHAR2(100)
);

CREATE TABLE CashierDim(
    CashierKey INT PRIMARY KEY,
    CashierEmployeeID INT,
    CashierName VARCHAR2(100)
);

CREATE TABLE ProductDim(
    ProductKey INT PRIMARY KEY,
    SKUNumber INT,
    ProductDescription VARCHAR2(100),
    Brand VARCHAR2(100),
    BrandDescription VARCHAR2(100),
    CategoryDescription VARCHAR2(100)
);

CREATE TABLE PromotionDim
(
    PromotionKey INT PRIMARY KEY,
    PromotionID INT,
    PromotionName VARCHAR2(100),
    PromotionDescription VARCHAR2(100),
    PromotionStartDate DATE,
    PromotionEndDate DATE
);

CREATE TABLE PaymentMethodDim
(
    PaymentMethodKey         INT PRIMARY KEY,
    PaymentMethodDescription VARCHAR2(100)
);
CREATE TABLE RetailSalesFact(
    SaleQuantity INT,
    RegularUnitPrice FLOAT,
    DiscountUnitPrice FLOAT,
    NetUnitPrice FLOAT,
    ExtendedDiscountDollarAmount FLOAT,
    ExtendedSalesDollarAmount FLOAT,
    ExtendedTaxDollarAmount FLOAT,
    ExtendedGrossProfitDollarAmount FLOAT,
    DateKey INT,
    StoreKey INT,
    CashierKey INT,
    ProductKey INT,
    PromotionKey INT,
    PaymentMethodKey INT,
    CONSTRAINT DATE_KEY FOREIGN KEY (DateKey) REFERENCES DateDim(DateKey),
    CONSTRAINT Store_KEY FOREIGN KEY (StoreKey) REFERENCES StoreDim(StoreKey),
    CONSTRAINT Cashier_KEY FOREIGN KEY (CashierKey) REFERENCES CashierDim(CashierKey),
    CONSTRAINT Product_KEY FOREIGN KEY (ProductKey) REFERENCES ProductDim(ProductKey),
    CONSTRAINT Promotion_KEY FOREIGN KEY (PromotionKey) REFERENCES PromotionDim(PromotionKey),
    CONSTRAINT PaymentMethod_KEY FOREIGN KEY (PaymentMethodKey) REFERENCES PaymentMethodDim(PaymentMethodKey)
    );
