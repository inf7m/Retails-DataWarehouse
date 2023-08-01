BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE dateRaws_TEMP';
EXCEPTION
  WHEN OTHERS THEN
    NULL; -- Ignore any errors if the table does not exist
END;

-- Create a script for DROP TABLE dateRaws_TEMP when it exist
CREATE GLOBAL TEMPORARY TABLE dateRaws_TEMP(dateRaw DATE) ON COMMIT DELETE ROWS;
INSERT INTO dateRaws_TEMP(dateRaw)
SELECT COLUMN_VALUE
FROM TABLE(DATEDIMENSION_OPERATIONS.GENERATE_DATE_ROWS('2010-01-01', '2030-01-01'));
INSERT INTO DATEDIM (datekey,
                     fulldate,
                     dayofweek, -- 1-7
                     daynumber_in_month, -- 1-31
                     daynumber_in_year, -- 1-366
                     lastday_indicator, -- 0/1
                     calendarweek, -- 1-53
                     calendarmonth, -- 1-12
                     calendarquarter, -- 1-4
                     holidays_indicator, -- 0/1
                     weekend_indicator) -- 0/1
SELECT
    DATE_KEY.nextval, -- Sequence
    dateRaw, -- FullDate YYYY-MM-DD
    DATEDIMENSION_OPERATIONS.CALENDARWEEK(dateRaw), -- 1-7
    EXTRACT(DAY FROM dateRaw), -- 1-31
    TO_NUMBER(TO_CHAR(dateRaw, 'DDD')), -- 1-366
    DATEDIMENSION_OPERATIONS.LAST_DAY_INDICATOR(dateRaw), -- 0/1
    DATEDIMENSION_OPERATIONS.CALENDARWEEK(dateRaw), -- 1-53
    DATEDIMENSION_OPERATIONS.CALENDARMONTH(dateRaw), -- 1-12
    DATEDIMENSION_OPERATIONS.CALENDARQUARTER(dateRaw), -- 1-4
    1,
    DATEDIMENSION_OPERATIONS.WEEKEND_INDICATOR(dateRaw) -- 0/1
FROM dateRaws_TEMP;
COMMIT;