SELECT*
FROM czechia_price cp ;

SELECT*
FROM czechia_price_category cpc ;


SELECT*
FROM czechia_payroll cp ;

SELECT*
FROM czechia_payroll_unit cpu ;

CREATE TABLE t_potraviny_rocni_rust_cen AS
SELECT
	tprc.kód_kategorie,
	tprc.kategorie,
	tprc.rok,
	tprc.průměr_ceny,
	ROUND(LAG(tprc.průměr_ceny) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok), 2) AS cena_za_predchozi_rok,
	CASE
		 WHEN LAG(tprc.průměr_ceny) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok) IS NULL THEN 0
		 ELSE tprc.průměr_ceny - LAG(tprc.průměr_ceny) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok)
	END AS mezirocni_rust_cen
FROM t_potraviny_roční_ceny tprc;
	

SELECT*
FROM t_potraviny_roční_ceny tprc 

CREATE TABLE t_potraviny_rocni_rust_cen_v_procentech AS
SELECT
	tprc.kód_kategorie,
	tprc.kategorie,
	tprc.rok,
	tprc.průměr_ceny,
	LAG(tprc.průměr_ceny) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok) AS cena_za_predchozi_rok,
	CASE
	  WHEN LAG(tprc.průměr_ceny) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok) IS NULL THEN 0
	  ELSE ROUND(((tprc.průměr_ceny - LAG(tprc.průměr_ceny) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok)) / LAG(tprc.průměr_ceny) OVER (PARTITION BY tprc.kód_kategorie ORDER BY tprc.rok) * 100), 2)
	END AS procentualni_rust
FROM t_potraviny_roční_ceny tprc;

SELECT*
FROM t_potraviny_rocni_rust_cen_v_procentech tprrcvp 

SELECT*
FROM t_mzdy_rocni_rust_cen tmrrc ;

SELECT*
FROM t_potraviny_rocni_rust_cen tprrc ;


SELECT
    tmrrc.rok,
    ROUND(
        ((SUM(tmrrc.průměr_mzdy) - SUM(tmrrc.mzdy_předchozí_rok)) / SUM(tmrrc.mzdy_předchozí_rok)) * 100, 2
    ) AS celkem_mezirocni_rust_mezd_v_procentech,
    ROUND(
        ((SUM(tprrc.průměr_ceny) - SUM(tprrc.cena_za_predchozi_rok)) / SUM(tprrc.cena_za_predchozi_rok)) * 100, 2
    ) AS celkem_mezirocni_rust_cen_potravin_v_procentech
FROM t_mzdy_rocni_rust_cen tmrrc
LEFT JOIN t_potraviny_rocni_rust_cen tprrc ON tmrrc.rok = tprrc.rok
WHERE tmrrc.rok BETWEEN 2006 AND 2018
GROUP BY tmrrc.rok
ORDER BY tmrrc.rok;












