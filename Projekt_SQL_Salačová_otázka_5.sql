SELECT*
FROM economies e ;

SELECT*
FROM countries c 



SELECT
    tdspspf.rok,
    tdspssf.economies_country AS země,
    tdspspf.mezirocni_rust_mezd_v_procentech,
    tdspspf.procentualni_rust AS procentualni_rust_cen,
    ROUND(((tdspssf.GDP - LAG(tdspssf.GDP) OVER (ORDER BY tdspspf.rok)) / LAG(tdspssf.GDP) OVER (ORDER BY tdspspf.rok)) * 100, 2) 
    AS procentualní_růst_HDP
FROM t_denisa_salacova_project_sql_primary_final tdspspf
JOIN t_denisa_salacova_project_sql_secondary_final tdspssf ON tdspspf.rok = tdspssf.`year` AND tdspssf.economies_country = 'Czech Republic'
GROUP BY tdspspf.rok, tdspssf.economies_country, tdspssf.GDP;



