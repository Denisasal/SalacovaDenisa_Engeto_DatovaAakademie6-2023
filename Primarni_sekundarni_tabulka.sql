---FINALNI TABULKA--


nove

SELECT*
FROM t_mzdy_rocni_rust_cen tmrrc ;

SELECT*
FROM t_mzdy_rocni_rust_cen_v_procentech tmrrcvp ;

SELECT*
FROM t_potraviny_rocni_rust_cen tprrc ;

SELECT*
FROM t_potraviny_rocni_rust_cen_v_procentech tprrcvp ;


SELECT 
	tmrrc.rok,
	tmrrc.kód_odvětví,
	tmrrc.název_odvětví ,
	tmrrc.průměr_mzdy ,
	tmrrc.mezirocni_rust_mezd,
	tprrc.kód_kategorie ,
	tprrc.kategorie ,
	tprrc.průměr_ceny,
	tprrc.mezirocni_rust_cen 
FROM t_mzdy_rocni_rust_cen tmrrc 
LEFT JOIN t_potraviny_rocni_rust_cen tprrc ON tmrrc.rok =tprrc.rok 
WHERE tmrrc.rok BETWEEN 2006 AND 2018
ORDER BY tmrrc.rok, tmrrc.kód_odvětví, tprrc.kód_kategorie ;




CREATE TABLE t_Denisa_Salacova_project_SQL_primary_final AS
	SELECT
		tmrrc.rok,
		tmrrc.kód_odvětví,
		tmrrc.název_odvětví ,
		tmrrc.průměr_mzdy,
		tmrrc.mzdy_předchozí_rok,
		tmrrc.mezirocni_rust_mezd,
		tmrrcvp.mezirocni_rust_mezd_v_procentech,
		tprrc.kód_kategorie ,
		tprrc.kategorie ,
		tprrc.průměr_ceny,
		tprrc.mezirocni_rust_cen ,
		tprrcvp.procentualni_rust 
	FROM t_mzdy_rocni_rust_cen tmrrc
	LEFT JOIN t_mzdy_rocni_rust_cen_v_procentech tmrrcvp ON tmrrc.rok = tmrrcvp.rok
	LEFT JOIN t_potraviny_rocni_rust_cen tprrc ON tmrrc.rok = tprrc.rok
	LEFT JOIN t_potraviny_rocni_rust_cen_v_procentech tprrcvp ON tmrrc.rok = tprrcvp.rok
	GROUP BY tmrrc.rok, tmrrc.kód_odvětví ,tprrc.kód_kategorie  ;

SELECT*
FROM t_denisa_salacova_project_sql_primary_final; 


SELECT*
FROM countries c ;

SELECT*
FROM economies e ;


----SEKUNDÁRNÍ TABULKA---



CREATE TABLE t_denisa_salacova_project_SQL_secondary_final AS
	SELECT 
		c.*, 
		e.country AS economies_country, 
		e.`year` , 
		e.GDP, 
		e.population economies_population, 
		e.gini 
	FROM countries c 
	LEFT JOIN economies e ON c.country = e.country;

SELECT*
FROM economies e ;


SELECT*
FROM t_denisa_salacova_project_sql_secondary_final tdspssf ;
