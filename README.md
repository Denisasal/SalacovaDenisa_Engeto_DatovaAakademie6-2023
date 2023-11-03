# SalacovaDenisa_Engeto_DatovaAakademie6-2023
All data for my Engeto project



Otázka 1
Rostou v prùbìhu let mzdy ve všech odvìtvích, nebo v nìkterých klesají?


1) Na zaèátek jsem si vypsala všechny tabulky, které budu v prùbìhu zpracování otázky používat.

2) Dalším krokem je vyfiltrovat hlavní tabulku dle zadaných požadavkù to je
a) Value_type_code 5958 – Prùmìrná hrubá mzda na zamìstnance
b) Unit code 200 - Kè
3) Následnì jsem si propojila hlavní tabulku czechia payroll s tabulkou czechia payroll industry branch pomocí funkce LEFT JOIN, èímž se mi propojí kód a název odvìtví.	
4) V další fázi jsem jsem si pøejmenovala jednotlivé sloupce, vytvoøila prùmìrné mzdy a vyfiltrovala data dle kódu odvìtví, roku a kvartálu
5) Po pøípravì jednotlivých krokù jsem si tyto dva kroky spojila, tedy k rozdìlené hlavní tabulce pøipojila pomocí LEFT JOIN tabulku s oznaèenými oddìleními a následnì odstranila sloupec s kvartálem
6)Dalším krokem je vložení funkce LAG , díky které jsem schopna vypoèítat meziroèní rùst mzdy.
7) Vytvoøenou tabulku jsem si následnì pomocí funkce CASE rozdìlila a oznaèila procentuální nárùst pro lepší pøehled.

Z výsledkù je možné vyvodit, že u 15 odvìtví minimálnì jednou za období mzdy klesly. Naopak u odvìtví Zpracovatelský prùmysl, Doprava a skladování, Zdravotní a sociální péèe a Ostatní èinnosti v každém období rostly.




Otázka 2

Kolik je možné si koupit litrù mléka a kilogramù chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

1) K tomuto výpoètu jsem použila spojení tabulky s výpoètem mezd a cen potravin, kde jsem si vypoèítala prùmìrnou roèní mzdu a dále vytvoøila nový sloupec se vzorcem pro výpoèet nákupu daného produktu. Dále jsem si pomocí WHERE vyfiltrovala požadované kategorie.

Z výsledkù se dá urèit, že si mùžeme koupit za první srovnatelné období 1287,46 kg chleba konzumního a 1437,24 l, mléka. Za poslední srovnatelné období pak 1342,24 kg chleba konzumního a 1641,57 l mléka




Otázka 3
Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroèní nárùst)?

1) Opìt jsem si vypsala použité tabulky
2) Dále jsem si spoèítala sumu cen za jednotlivé roky jednotlivých potravin a upravila formát data na rok. K tabulce czechia price jsem pomocí JOIN  pøipojila tabulku czechia price category a pøiøadila tak ke kódùm potravin také názvy a seøadila vzestupnì
3) Dále jsem si vytvoøila tabulku t_potraviny_roèní_ceny s vyjmenovanými požadavky
4) Následující tabulku jsem si pak upravila formou subselectu, kam jsem pøidala funkci LAG , díky které jsem si vypoèítala ceny za pøedešlý rok a následnì pak procentuální rùst.
5) Dalším krokem byla úprava vytvoøené tabulky s meziroèním nárùstem v procentech, kde jsem seèetla procenta a seøadila vzestupnì. 
5) Nejvìtší meziroèní procentuální pokles ceny byl zaznamenán u kategorie 

Kategorie s nejnižším procentuálním nárùstem je Cukr krystalový, s nejvyšším pak Jakostní víno bílé





Otázka 4
Existuje rok, ve kterém byl meziroèní nárùst cen potravin výraznì vyšší než rùst mezd (vìtší než 10 %)?

1) Opìt jsem si nejdøíve vypsala použité tabulky
2) Stejným zpùsobem jako u otázky 3 jsem si vytvoøila tabulku mzdy_roèní_rùst_cen kde jsem v jednom selectu vypoèítala souèet mezd za jednotlivé roky, dále pak souèet mezd za pøedchozí roky a z toho opìt pomocí funkce LAG meziroèní nárùst. K tomu jsem pomocí LEFT JOIN pøipojila tabulku s názvy jednotlivých odvìtví a pomocí WHERE  GROUP BY odfiltrovala nepotøebná data.
3) Dalším krokem byl souèet mezd za všechna odvìtví a rozdìlení dle roku od 2006 do 2018, jelikož toto je spoleèné období v obou tabulkách jak cen tak i mezd.
4) Následnì jsem si sloupec s meziroèním rùstem cen pøevedla na procenta
5) Stejným zpùsobem jsem si upravila tabulku s cenami potravin, kde jsem si také seèetla ceny za jednotlivé roky a vypoèítala meziroèní rùst cen v procentech
6) Nakonec jsem tyto dvì tabulky spojila pomocí LEFT JOIN díky èemu mùžu porovnat procentuální nárùst mezd a cen potravin vedle sebe. 

Z výsledkù mùžeme vyvodit, že není žádný rok, kde by meziroèní nárùst cen potravin výraznì vyšší než mezd tedy vyšší než 100. K 10% se pøibližujeme jen v roce 2017, kde výsledek cen potravin vychází na 9,63% 





Otázka 5
Má výška HDP vliv na zmìny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výraznìji v jednom roce, projeví se to na cenách potravin èi mzdách ve stejném nebo následujícím roce výraznìjším rùstem?

1)Pro výpoèet jsem zvolila spojení primární a sekundární tabulky pomocí spoleèné hodnoty rok, následnì vybrala country a vyfiltrovala Èeskou Republiku, dále pak data rùstu mezd a cen potravin.
2)Z pøipojené sekundární tabulky pak HDP.
3)Opìt pomocí funkce LAG vypoèítala procentuální nárùst HDP za jednotlivé roky.

Dle výsledkù je zøejmé, že výška HDP má vliv na vývoj mezd a cen potravin, mzdy a ceny se ale nemìní soumìrnì každý rok c pohybem HDP, neovlivòuje jej tedy pravidelnì.

