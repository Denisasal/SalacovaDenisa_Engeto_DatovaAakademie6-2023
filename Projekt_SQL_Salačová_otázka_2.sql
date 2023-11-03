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
	tmrrc.rok ,
	tprrc.kategorie,
	ROUND(AVG(tmrrc.průměr_mzdy),2) AS celkem_mzdy,
	tprrc.průměr_ceny,
	ROUND(((AVG(tmrrc.průměr_mzdy))/tprrc.průměr_ceny ),2) AS celkem_nákup
FROM t_mzdy_rocni_rust_cen tmrrc 
JOIN t_potraviny_rocni_rust_cen tprrc ON tmrrc.rok = tprrc.rok 
WHERE tprrc.kód_kategorie = 111301 OR tprrc.kód_kategorie = 114201
GROUP BY tmrrc.rok, tprrc.kategorie  ;

