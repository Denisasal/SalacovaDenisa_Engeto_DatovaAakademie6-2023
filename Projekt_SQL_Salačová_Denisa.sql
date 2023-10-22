
--Otzázka 1--

SELECT*
FROM czechia_payroll cp ;

SELECT *
FROM czechia_payroll_value_type cpvt ;

SELECT*
FROM czechia_payroll_calculation cpc ;

SELECT*
FROM czechia_payroll_industry_branch cpib;

SELECT*
FROM czechia_payroll_unit cpu ;


SELECT*
FROM czechia_payroll cp 
WHERE value_type_code = 5958 AND unit_code = 200;


SELECT*
FROM czechia_payroll cp 
LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code 
WHERE value_type_code = 5958 AND unit_code = 200;


SELECT
	industry_branch_code AS kód_oddělení,
	payroll_year AS rok ,
	payroll_quarter AS kvartál ,
	AVG(value) AS průměrná_mzda
FROM czechia_payroll cp 
WHERE value_type_code = 5958 AND unit_code = 200 AND industry_branch_code IS NOT NULL
GROUP BY industry_branch_code , payroll_quarter ,payroll_year 
ORDER BY industry_branch_code , payroll_year , payroll_quarter ;

SELECT
	cp.industry_branch_code AS kód_odětví,
	cpib.name AS název_odvětví,
	cp.payroll_quarter AS kvartál,
	cp.payroll_year AS rok ,
	AVG(cp.value) AS součet_mzdy
FROM czechia_payroll cp 
LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code 
WHERE cp.value_type_code = 5958 AND cp.unit_code = 200 AND cp.industry_branch_code IS NOT NULL
GROUP BY cp.industry_branch_code , cp.payroll_quarter , cp.payroll_year 
ORDER BY cp.industry_branch_code , cp.payroll_year , cp.payroll_quarter ;


SELECT
	cp.industry_branch_code AS kód_odětví,
	cpib.name AS název_odvětví,
	cp.payroll_year AS rok ,
	ROUND (AVG (cp.value),2) AS průměr_mzdy
FROM czechia_payroll cp 
LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code 
WHERE cp.value_type_code = 5958 AND cp.unit_code = 200 AND cp.industry_branch_code IS NOT NULL
GROUP BY cp.industry_branch_code , cp.payroll_year 
ORDER BY cp.industry_branch_code , cp.payroll_year , cp.payroll_quarter ;


SELECT
    cp.industry_branch_code AS kód_odvětví,
    cpib.name AS název_odvětví,
    cp.payroll_year AS rok,
    CEIL(AVG(cp.value)) AS průměrná_mzda,
    LAG(CEIL(AVG(value))) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) AS průměrné_mzdy_předchozí_rok,
    CASE
        WHEN LAG(CEIL(AVG(value))) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) IS NULL THEN 0
        ELSE CEIL(AVG(value)) - LAG(CEIL(AVG(value))) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year)
    END AS meziroční_růst_mzdy
FROM czechia_payroll cp
LEFT JOIN czechia_payroll_industry_branch cpib 
    ON cp.industry_branch_code = cpib.code 
WHERE cp.value_type_code = 5958 AND cp.unit_code = 200 AND cp.industry_branch_code IS NOT NULL
GROUP BY industry_branch_code, payroll_year 
ORDER BY industry_branch_code, payroll_year;


--zkouška uložení verze v Gitu--


SELECT
    cp.industry_branch_code AS kód_odvětví,
    cpib.name AS název_odvětví,
    cp.payroll_year AS rok,
    CEIL(AVG(cp.value)) AS průměrná_mzda,
    LAG(CEIL(AVG(cp.value))) OVER (PARTITION BY cp.industry_branch_code ORDER BY cp.payroll_year) AS průměrné_mzdy_předchozí_rok,
    ROUND(
    CASE
        WHEN LAG(AVG(cp.value)) OVER (PARTITION BY cp.industry_branch_code ORDER BY cp.payroll_year) IS NULL THEN 0
        ELSE(AVG(cp.value) - LAG(AVG(cp.value)) OVER (PARTITION BY cp.industry_branch_code ORDER BY cp.payroll_year)) / LAG(AVG(cp.value)) OVER (PARTITION BY cp.industry_branch_code ORDER BY cp.payroll_year) * 100
    END,2) AS meziroční_růst_mzdy_v_procentech
FROM czechia_payroll cp
LEFT JOIN czechia_payroll_industry_branch cpib ON cp.industry_branch_code = cpib.code
WHERE cp.value_type_code = 5958 AND cp.unit_code = 200 AND cp.industry_branch_code IS NOT NULL
GROUP BY cp.industry_branch_code, cp.payroll_year
ORDER BY cp.industry_branch_code, cp.payroll_year;














