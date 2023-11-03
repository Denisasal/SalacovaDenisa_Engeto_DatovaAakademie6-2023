--Otázka 3--

SELECT*
FROM czechia_price cp 

SELECT*
FROM czechia_price_category cpc 


CREATE TABLE t_potraviny_roční_ceny AS
	SELECT
	cp.category_code AS kód_kategorie,
	cpc.name AS kategorie,
	ROUND(AVG(cp.value),2) AS průměr_ceny,
	EXTRACT(YEAR FROM date_from) AS rok
FROM czechia_price cp 
JOIN czechia_price_category cpc 
	ON cp.category_code =cpc.code 
GROUP BY cp.category_code, EXTRACT(YEAR FROM cp.date_from)
ORDER BY cpc.code, cp.date_from ASC;

SELECT*
FROM t_potraviny_roční_ceny tprc 
 

CREATE TABLE t_potraviny_rocni_rust_cen_v_procentech AS
	WITH t_potraviny_roční_ceny AS (
	  SELECT
	    cp.category_code AS kód_kategorie,
	    cpc.name AS kategorie,
	    EXTRACT(YEAR FROM cp.date_from) AS rok,
	    cp.value AS ceny,
	    SUM(cp.value) AS cena_za_rok
	  FROM czechia_price cp
	  JOIN czechia_price_category cpc ON cp.category_code = cpc.code
	  GROUP BY cp.category_code, EXTRACT(YEAR FROM cp.date_from)
	)
	SELECT
	  tprc.kód_kategorie,
	  tprc.kategorie,
	  tprc.rok,
	  tprc.ceny,
	  tprc.cena_za_rok,
	  LAG(tprc.cena_za_rok) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok) AS cena_za_predchozi_rok,
	  CASE
	    WHEN LAG(tprc.cena_za_rok) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok) IS NULL THEN 0
	    ELSE ROUND(((tprc.cena_za_rok - LAG(tprc.cena_za_rok) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok)) / LAG(tprc.cena_za_rok) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok) * 100), 2)
	  END AS procentualni_rust
	FROM t_potraviny_roční_ceny tprc;


SELECT*
FROM t_potraviny_rocni_rust_cen_v_procentech tprrcvp ;


SELECT
	kód_kategorie ,
	kategorie ,
	SUM(procentualni_rust) AS součet_nárůstu
FROM t_potraviny_rocni_rust_cen_v_procentech tprrcvp
GROUP BY kategorie
ORDER BY součet_nárůstu ASC;
