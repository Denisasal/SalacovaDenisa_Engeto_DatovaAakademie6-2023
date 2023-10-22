SELECT*
FROM czechia_price cp ;

SELECT*
FROM czechia_price_category cpc ;


SELECT*
FROM czechia_payroll cp ;

SELECT*
FROM czechia_payroll_unit cpu ;



CREATE TABLE t_mzdy_rocni_rust_cen AS
SELECT
    cp.industry_branch_code AS kód_odvětví,
    cpib.name AS název_odvětví,
    cp.payroll_year AS rok,
    cp.value AS mzdy,
    LAG(value) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) AS mzdy_předchozí_rok,
    ROUND(
        CASE
            WHEN LAG(value) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) IS NULL THEN 0
            ELSE (value - LAG(value) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year))
        END, 2
    ) AS mezirocni_rust_mezd
FROM czechia_payroll cp
LEFT JOIN czechia_payroll_industry_branch cpib
    ON cp.industry_branch_code = cpib.code
WHERE cp.value_type_code = 5958
    AND cp.unit_code = 200
    AND cp.industry_branch_code IS NOT NULL
GROUP BY industry_branch_code, payroll_year
ORDER BY industry_branch_code, payroll_year;


CREATE TABLE t_potraviny_rocni_rust_cen AS
WITH t_potraviny_roční_ceny AS (
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
  tprc.kategorie,
  tprc.rok,
  tprc.cena_za_rok,
  ROUND(LAG(tprc.cena_za_rok) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok), 2) AS cena_za_predchozi_rok,
  CASE
    WHEN LAG(tprc.cena_za_rok) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok) IS NULL THEN 0
    ELSE tprc.cena_za_rok - LAG(tprc.cena_za_rok) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok)
  END AS mezirocni_rust_cen
FROM t_potraviny_roční_ceny tprc;


SELECT*
FROM t_mzdy_rocni_rust_cen tmrrc ;

SELECT*
FROM t_potraviny_rocni_rust_cen tprrc ;


SELECT
	rok,
	SUM (mzdy) AS mzda_celkem_za_rok,
	SUM (mzdy_předchozí_rok)AS mzda_celkem_za_předchozí_rok,
	SUM(mezirocni_rust_mezd) AS celkem_mezirocni_růst
FROM t_mzdy_rocni_rust_cen tmrrc2 
WHERE rok BETWEEN 2006 AND 2018
GROUP BY rok ; 

SELECT
    rok,
    SUM(mzdy) AS mzda_celkem_za_rok,
    SUM(mzdy_předchozí_rok) AS mzda_celkem_za_předchozí_rok,
    ROUND(
        ((SUM(mzdy) - SUM(mzdy_předchozí_rok)) / SUM(mzdy_předchozí_rok)) * 100, 2
    ) AS celkem_mezirocni_rust_mezd_v_procentech
FROM t_mzdy_rocni_rust_cen tmrrc 
WHERE rok BETWEEN 2006 AND 2018
GROUP BY rok;



SELECT
	rok,
	SUM(cena_za_rok) AS ceny_potravin_celkem_za_rok,
	SUM(cena_za_predchozi_rok) AS ceny_potravin_celkem_za_předchozí_rok,
	ROUND(
		((SUM (cena_za_rok)- SUM(cena_za_predchozi_rok))/ SUM (cena_za_predchozi_rok)) *100,2
	) AS celkem_meziroční_růst_cen_potravin_v_procentech
FROM t_potraviny_rocni_rust_cen tprrc 
GROUP BY rok ;



SELECT
    tmrrc.rok,
    ROUND(
        ((SUM(tmrrc.mzdy) - SUM(tmrrc.mzdy_předchozí_rok)) / SUM(tmrrc.mzdy_předchozí_rok)) * 100, 2
    ) AS celkem_mezirocni_rust_mezd_v_procentech,
    ROUND(
        ((SUM(tprrc.cena_za_rok) - SUM(tprrc.cena_za_predchozi_rok)) / SUM(tprrc.cena_za_predchozi_rok)) * 100, 2
    ) AS celkem_mezirocni_rust_cen_potravin_v_procentech
FROM t_mzdy_rocni_rust_cen tmrrc
LEFT JOIN t_potraviny_rocni_rust_cen tprrc ON tmrrc.rok = tprrc.rok
WHERE tmrrc.rok BETWEEN 2006 AND 2018
GROUP BY tmrrc.rok
ORDER BY tmrrc.rok;










