SELECT*
FROM economies e ;

SELECT*
FROM countries c 


SELECT
	country ,
	`year` ,
	GDP ,
	taxes 
FROM economies e 
WHERE country = 'Czech Republic' AND `year` BETWEEN 2006 AND 2018
ORDER BY `year` ASC;

SELECT
	rok ,
	ROUND (SUM (cena_za_rok),2) AS součet_cen_potravin_za_rok
FROM t_potraviny_rocni_rust_cen tprrc 
GROUP BY rok ;

SELECT
*
FROM t_mzdy_rocni_rust_cen tmrrc 




