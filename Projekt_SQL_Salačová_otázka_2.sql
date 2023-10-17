SELECT*
FROM czechia_price cp ;

SELECT*
FROM czechia_price_category cpc ;


SELECT*
FROM czechia_payroll cp ;

SELECT*
FROM czechia_payroll_unit cpu ;

--chléb - 111301--1kg
--mléko - 114201--1l


SELECT*
FROM czechia_price cp
WHERE category_code = 111301
ORDER BY date_from ASC;

SELECT*
FROM czechia_price cp
WHERE category_code = 114201
ORDER BY date_from ASC;

SELECT*
FROM czechia_price cp 
WHERE category_code = 111301
ORDER BY date_from DESC;

SELECT*
FROM czechia_payroll cp 
WHERE payroll_year = 2006
ORDER BY payroll_year ASC;

SELECT*
FROM czechia_payroll cp 
ORDER BY payroll_year DESC;

SELECT
    value AS cena,
    category_code AS kód_kategorie,
    date_format(date_from, '%y-%m-%d') AS období_od,
    date_format(date_to, '%y-%m-%d') AS období_do,
    (CASE
        WHEN MONTH(date_from) BETWEEN 01 AND 03 THEN 1
        WHEN MONTH(date_from) BETWEEN 04 AND 06 THEN 2
        WHEN MONTH(date_from) BETWEEN 07 AND 09 THEN 3
        WHEN MONTH(date_from) BETWEEN 10 AND 12 THEN 4
        ELSE NULL
    END) AS kvartál
FROM czechia_price cp
WHERE category_code = 111301 
ORDER BY date_from ASC;


SELECT
   category_code AS chléb,
	CEIL(AVG(value)) AS průměrná_cena 
FROM czechia_price cp 
WHERE category_code = 111301 AND date_from = '06-01-02' AND '06-12-24'


SELECT
	payroll_year AS rok,
	SUM (value) AS součet_mzdy
FROM czechia_payroll cp 
WHERE payroll_year = 2006
ORDER BY payroll_year ASC;


SELECT 3317691/15
-Výsledek- 221179,4 kg chleba--


SELECT
   category_code AS mléko,
	CEIL(AVG(value)) AS průměrná_cena 
FROM czechia_price cp 
WHERE category_code = 114201 AND date_from = '06-01-02' AND '06-12-24'
