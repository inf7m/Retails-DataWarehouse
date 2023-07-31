-- Package Header
CREATE OR REPLACE PACKAGE DateDimension_Operations AS
    FUNCTION generate_date_rows(startDate STRING, endDate STRING)
        RETURN SYS.ODCIDATELIST PIPELINED;
    FUNCTION CalendarWeek(inputDate DATE)
        RETURN NUMBER;
    FUNCTION last_day_indicator(inputDate DATE)
        RETURN BOOLEAN;
    FUNCTION Calendar_WEEK(input DATE)
        RETURN NUMBER;
    FUNCTION CalendarMonth(inputDate DATE)
        RETURN NUMBER;
    FUNCTION CalendarQuarter(inputDate DATE)
        RETURN NUMBER;
    FUNCTION WEEKEND_INDICATOR(inputDate DATE) RETURN BOOLEAN;
END DateDimension_Operations;
-- Package body
CREATE OR REPLACE PACKAGE BODY DateDimension_Operations AS
    -- Function to generate date rows
    FUNCTION generate_date_rows(startDate STRING, endDate STRING)
        RETURN SYS.ODCIDATELIST PIPELINED
        IS
        v_start_date DATE := TO_DATE(startDate, 'YYYY-MM-DD');
        v_end_date   DATE := TO_DATE(endDate, 'YYYY-MM-DD');

    BEGIN
        WHILE v_start_date <= v_end_date
            LOOP
                PIPE ROW (v_start_date);
                v_start_date := v_start_date + 1;
            END LOOP;
        RETURN;
    END generate_date_rows;

    -- Function to get the day of the week
    FUNCTION CalendarWeek(inputDate DATE)
        RETURN NUMBER
        IS
        v_day_of_week NUMBER;
    BEGIN
        v_day_of_week := TO_NUMBER(TO_CHAR(inputDate, 'D'));
        RETURN v_day_of_week;
    END CalendarWeek;

    -- Function to get the last day of the month
    FUNCTION last_day_indicator(inputDate DATE)
        RETURN BOOLEAN
        IS
        v_last_day BOOLEAN;
    BEGIN
        IF inputDate = LAST_DAY(inputDate) THEN
            v_last_day := TRUE;
        ELSE
            v_last_day := FALSE;
        END IF;
        RETURN v_last_day;
    END last_day_indicator;

    -- Function to get the week of the year
    FUNCTION Calendar_WEEK(input DATE)
        RETURN NUMBER
        IS
        v_week_of_year NUMBER;
    BEGIN
        v_week_of_year := TO_NUMBER(TO_CHAR(input, 'WW'));
        RETURN v_week_of_year;
    END Calendar_WEEK;

    -- Function to get the month of the year
    FUNCTION CalendarMonth(inputDate DATE)
        RETURN NUMBER
        IS
        v_month_of_year NUMBER;
    BEGIN
        v_month_of_year := TO_NUMBER(TO_CHAR(inputDate, 'MM'));
        RETURN v_month_of_year;
    END CalendarMonth;

    -- Function to get the quarter of the year
    FUNCTION CalendarQuarter(inputDate DATE)
        RETURN NUMBER
        IS
        v_quarter_of_year NUMBER;
    BEGIN
        v_quarter_of_year := TO_NUMBER(TO_CHAR(inputDate, 'Q'));
        RETURN v_quarter_of_year;
    END CalendarQuarter;


    FUNCTION WEEKEND_INDICATOR(inputDate DATE)
        RETURN BOOLEAN
        IS
        v_weekend_indicator BOOLEAN;
    BEGIN
        IF CalendarWeek(inputDate) IN (1, 7) THEN
            v_weekend_indicator := TRUE;
        ELSE
            v_weekend_indicator := FALSE;
        end if;
        RETURN v_weekend_indicator;
    end;
END DateDimension_Operations;

