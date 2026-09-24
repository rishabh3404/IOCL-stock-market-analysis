-- IOCL Stock Market Analysis
-- SQL Business Analysis

-- 1. Total Records
SELECT
    COUNT(*) AS total_records
FROM iocl_stock_data;


-- 2. Average Closing Price
SELECT
    CAST(AVG(close) AS DECIMAL(10,2)) AS average_closing_price
FROM iocl_stock_data;


-- 3. Highest Closing Price
SELECT
    MAX(close) AS highest_closing_price
FROM iocl_stock_data;


-- 4. Lowest Closing Price
SELECT
    MIN(close) AS lowest_closing_price
FROM iocl_stock_data;


-- 5. Highest Trading Volume
SELECT
    MAX(volume) AS highest_trading_volume
FROM iocl_stock_data;


-- 6. Yearly Performance
SELECT
    YEAR(date) AS year,
    CAST(AVG(close) AS DECIMAL(10,2)) AS average_close,
    MAX(high) AS highest_price,
    MIN(low) AS lowest_price,
    SUM(volume) AS total_volume
FROM iocl_stock_data
GROUP BY YEAR(date)
ORDER BY year;


-- 7. Monthly Performance
SELECT
    YEAR(date) AS year,
    MONTH(date) AS month,
    CAST(AVG(close) AS DECIMAL(10,2)) AS average_close,
    MAX(high) AS highest_price,
    MIN(low) AS lowest_price
FROM iocl_stock_data
GROUP BY
    YEAR(date),
    MONTH(date)
ORDER BY
    year,
    month;


-- 8. Quarterly Performance
SELECT
    YEAR(date) AS year,
    DATEPART(QUARTER, date) AS quarter,
    CAST(AVG(close) AS DECIMAL(10,2)) AS average_close,
    MAX(high) AS highest_price,
    MIN(low) AS lowest_price
FROM iocl_stock_data
GROUP BY
    YEAR(date),
    DATEPART(QUARTER, date)
ORDER BY
    year,
    quarter;


-- 9. Yearly Price Change
SELECT
    YEAR(date) AS year,
    MIN(close) AS starting_period_price,
    MAX(close) AS ending_period_price,
    CAST(
        ((MAX(close) - MIN(close)) / NULLIF(MIN(close), 0)) * 100
        AS DECIMAL(10,2)
    ) AS price_change_percentage
FROM iocl_stock_data
GROUP BY YEAR(date)
ORDER BY year;


-- 10. Top 10 Highest Closing Prices
SELECT TOP 10
    date,
    close AS closing_price,
    volume
FROM iocl_stock_data
ORDER BY close DESC;


-- 11. Top 10 Trading Volume Days
SELECT TOP 10
    date,
    close AS closing_price,
    volume
FROM iocl_stock_data
ORDER BY volume DESC;


-- 12. Average Trading Volume by Year
SELECT
    YEAR(date) AS year,
    CAST(AVG(volume) AS BIGINT) AS average_volume
FROM iocl_stock_data
GROUP BY YEAR(date)
ORDER BY year;
