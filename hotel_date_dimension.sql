USE Hotel;
GO
DECLARE @StartDate DATE = '2022-01-01';
DECLARE @EndDate DATE = '2026-12-31';


WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO Common.Hotel_Calender (Date_ID, Year_Of_Date, Month_Of_Date, Quarter_Of_Year, Day_Of_Week)
    VALUES (
        @StartDate,                           
        YEAR(@StartDate),                     
        MONTH(@StartDate),                    
        DATEPART(QUARTER, @StartDate),        
        DATENAME(WEEKDAY, @StartDate)         
    );


    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;
GO
