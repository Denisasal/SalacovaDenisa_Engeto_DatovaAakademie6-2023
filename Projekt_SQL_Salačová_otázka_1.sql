
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


CREATE TABLE t_mzdy_rocni_rust_cen AS
SELECT
    cp.industry_branch_code AS kód_odvětví,
    cpib.name AS název_odvětví,
    cp.payroll_year AS rok,
    ROUND(AVG(cp.value),2) AS průměr_mzdy,
    ROUND(LAG(AVG(value)) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year),2) AS mzdy_předchozí_rok,
    ROUND(
        CASE
            WHEN LAG(AVG(value)) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) IS NULL THEN 0
            ELSE AVG(value) - LAG(AVG(value))OVER (PARTITION BY industry_branch_code ORDER BY payroll_year)
        END, 2  ) AS mezirocni_rust_mezd
FROM czechia_payroll cp
LEFT JOIN czechia_payroll_industry_branch cpib
    ON cp.industry_branch_code = cpib.code
WHERE cp.value_type_code = 5958
    AND cp.unit_code = 200
    AND cp.industry_branch_code IS NOT NULL
GROUP BY industry_branch_code, payroll_year
ORDER BY industry_branch_code, payroll_year;


SELECT*
FROM t_mzdy_rocni_rust_cen tmrrc ;


CREATE TABLE t_mzdy_rocni_rust_cen_v_procentech AS

	SELECT
	    cp.industry_branch_code AS kód_odvětví,
	    cpib.name AS název_odvětví,
	    cp.payroll_year AS rok,
	    ROUND(AVG(cp.value),2) AS průměr_mzdy,
	    ROUND(LAG(AVG(value)) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year),2) AS mzdy_předchozí_rok,
	    ROUND(
	        CASE
	            WHEN LAG(AVG(value)) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) IS NULL THEN 0
	            ELSE ((AVG(value) - LAG(AVG(value)) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year)) / LAG(AVG(value)) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year)) * 100
	        END, 2 ) AS mezirocni_rust_mezd_v_procentech
	FROM czechia_payroll cp
	LEFT JOIN czechia_payroll_industry_branch cpib
	    ON cp.industry_branch_code = cpib.code
	WHERE cp.value_type_code = 5958 AND cp.unit_code = 200 AND cp.industry_branch_code IS NOT NULL
	GROUP BY industry_branch_code, payroll_year
	ORDER BY industry_branch_code, payroll_year;
	

SELECT
	kód_odvětví ,
	název_odvětví,
	rok ,
	průměr_mzdy ,
	mzdy_předchozí_rok ,
	mezirocni_rust_mezd_v_procentech ,
	CASE 
		WHEN mezirocni_rust_mezd_v_procentech <0 THEN 'klesající mzdy'
		WHEN mezirocni_rust_mezd_v_procentech =0 THEN 'stagnující mzdy'
		ELSE 'rostoucí mzdy'
	END	AS vyhodnocení_růstu_mezd
FROM t_mzdy_rocni_rust_cen_v_procentech
WHERE mzdy_předchozí_rok IS NOT NULL
GROUP BY kód_odvětví, rok 
ORDER BY kód_odvětví ,mezirocni_rust_mezd_v_procentech;

