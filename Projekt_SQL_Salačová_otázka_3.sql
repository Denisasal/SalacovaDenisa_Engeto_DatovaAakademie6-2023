--Otázka 3--

SELECT*
FROM czechia_price cp 

SELECT*
FROM czechia_price_category cpc 



SELECT
	cp.category_code AS kód_kategorie,
	cpc.name AS kategorie,
	SUM (cp.value) AS cena_za_rok,
	EXTRACT(YEAR FROM date_from) AS rok
FROM czechia_price cp 
JOIN czechia_price_category cpc 
	ON cp.category_code =cpc.code 
GROUP BY cp.category_code, EXTRACT(YEAR FROM cp.date_from)
ORDER BY cpc.code, cp.date_from ASC ;


CREATE TABLE t_POTRAVINY_Roční_ceny AS
	SELECT
	cp.category_code AS kód_kategorie,
	cpc.name AS kategorie,
	SUM (cp.value) AS cena_za_rok,
	EXTRACT(YEAR FROM date_from) AS rok
FROM czechia_price cp 
JOIN czechia_price_category cpc 
	ON cp.category_code =cpc.code 
GROUP BY cp.category_code, EXTRACT(YEAR FROM cp.date_from)
ORDER BY cpc.code, cp.date_from ASC;



SELECT*
FROM t_potraviny_roční_ceny tprc ;



WITH t_potraviny_roční_ceny  AS (
  SELECT
    cp.category_code AS kód_kategorie,
    cpc.name AS kategorie,
    EXTRACT(YEAR FROM cp.date_from) AS rok,
    SUM(cp.value) AS cena_za_rok
  FROM czechia_price cp
  JOIN czechia_price_category cpc ON cp.category_code = cpc.code
  GROUP BY cp.category_code, EXTRACT(YEAR FROM cp.date_from)
)
SELECT
	tprc.kód_kategorie,
 	tprc.kategorie ,
 	tprc.rok ,
	tprc.cena_za_rok,
  ROUND(LAG(tprc.cena_za_rok) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok),2) AS cena_za_predchozi_rok,
  ROUND(((tprc.cena_za_rok - LAG(tprc.cena_za_rok) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok)) / LAG(tprc.cena_za_rok) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok) * 100),2) AS procentualni_rust
FROM t_potraviny_roční_ceny tprc ;
 
 

 



