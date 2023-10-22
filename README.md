# SalacovaDenisa_Engeto_DatovaAakademie6-2023
All data for my Engeto project



Otázka 1
Rostou v prùbìhu let mzdy ve všech odvìtvích, nebo v nìkterıch klesají?


1) Na zaèátek jsem si vypsala všechny tabulky, které budu v prùbìhu zpracování otázky pouívat.

2) Dalším krokem je vyfiltrovat hlavní tabulku dle zadanıch poadavkù to je
a) Value_type_code 5958 – Prùmìrná hrubá mzda na zamìstnance
b) Unit code 200 - Kè
3) Následnì jsem si propojila hlavní tabulku czechia payroll s tabulkou czechia payroll industry branch pomocí funkce LEFT JOIN, èím se mi propojí kód a název odvìtví.	
4) V další fázi jsem jsem si pøejmenovala jednotlivé sloupce, vytvoøila prùmìrné mzdy a vyfiltrovala data dle kódu odvìtví, roku a kvartálu
5) Po pøípravì jednotlivıch krokù jsem si tyto dva kroky spojila, tedy k rozdìlené hlavní tabulce pøipojila pomocí LEFT JOIN tabulku s oznaèenımi oddìleními a následnì odstranila sloupec s kvartálem
6)Dalším krokem je vloení funkce LAG , díky které jsem schopna vypoèítat meziroèní rùst mzdy.
7) Z vısledù je zøejmé, e první pokles cen byl zaznamenán v roce 2009, kterı se tıkal odvìtví Penìnictví a pojišovnictví, tìba a dobıvání

Dále také Informaèní a komunikaèní èinnosti spolu s Vırobou a rozvodem elektøina, plynu, tepla a klimatizace vzduchu. U tìchto odvìtví zaznamenáváme pád a do roku 2010. V roce 2010 klesly také Profesní vìdecké a technické èinnosti.

Další velkı vıkyv mùeme vidìt v roce 2013 v Penìnictví a pojišovnictví, kde byl pokles a o 6 097 Kè, tedy 11,64%. Od tohoto zlomu je vidìl trvalı vıkyv propadù a rùstu a do roku 2021.

V roce 2013, 2015 a 2017  registrujeme znovu pokles odvìtví Vıroby a rozvodu elektøiny, plynu, tepla a klimatizace vzduchu.

Od roku 2017 vidíme velké rùsty a pády ve vìtšinì odvìtví a do roku 2021

 










Otázka 2

Kolik je moné si koupit litrù mléka a kilogramù chleba za první a poslední srovnatelné období v dostupnıch datech cen a mezd?

1) Opìt jsem si na zaèátku vypsala všechny pouité tabulky a hodnoty, se kterımi budu pracovat (kódy potravin)
2) Dále jsem si seøadila date from, abych zjistila, kdy zaèíná srovnatelné období. V tabulce Czechia_price zaèínají data dnem 2.1.2026 a konèí 10.12.2018. V tabulce Czechia_payroll pracujeme s daty, která zaèínají v lednu 2000 a konèí v prosinci 2021.První srovnatelné období zaèíná tedy v roce 2006 a konèí v roce 2018
3) Následnì jsem si upravila formát data a vyfiltrovala první kategorii - chléb
4) 





Otázka 3

Která kategorie potravin zdrauje nejpomaleji (je u ní nejniší percentuální meziroèní nárùst)?

1) Opìt jsem si vypsala pouité tabulky
2) Dále jsem si spoèítala sumu cen za jednotlivé roky jednotlivıch potravin a upravila formát data na rok. K tabulce czechia price jsem pomocí JOIN  pøipojila tabulku czechia price category a pøiøadila tak ke kódùm potravin také názvy a seøadila vzestupnì
3) Dále jsem si vytvoøila tabulku t_potraviny_roèní_ceny s vyjmenovanımi poadavky
4) Následující tabulku jsem si pak upravila formou subselectu, kam jsem pøidala funkci LAG , díky které jsem si vypoèítala ceny za pøedešlı rok a následnì pak procentuální rùst.
5) Nejvìtší meziroèní procentuální pokles ceny byl zaznamenán u kategorie Peèivo pšenièné bílé a to -62,69%. Nejniší meziroèní nárùst je ale u kategorie Pšenièná mouka hladká o 0,05% v roce 2008.

Otázka 4
Existuje rok, ve kterém byl meziroèní nárùst cen potravin vıraznì vyšší ne rùst mezd (vìtší ne 10 %)?
1) Opìt jsem si nejdøíve vypsala pouité tabulky
2) Stejnım zpùsobem jako u otázky 3 jsem si vytvoøila tabulku mzdy_roèní_rùst_cen kde jsem v jednom selectu vypoèítala souèet mezd za jednotlivé roky, dále pak souèet mezd za pøedchozí roky a z toho opìt pomocí funkce LAG meziroèní nárùst. K tomu jsem pomocí LEFT JOIN pøipojila tabulku s názvy jednotlivıch odvìtví a pomocí WHERE  GROUP BY odfiltrovala nepotøebná data.
3) Dalším krokem byl souèet mezd za všechna odvìtví a rozdìlení dle roku od 2006 do 2018, jeliko toto je spoleèné období v obou tabulkách jak cen tak i mezd.
4) Následnì jsem si sloupec s meziroèním rùstem cen pøevedla na procenta
5) Stejnım zpùsobem jsem si upravila tabulku s cenami potravin, kde jsem si také seèetla ceny za jednotlivé roky a vypoèítala meziroèní rùst cen v procentech
6) Nakonec jsem tyto dvì tabulky spojila pomocí LEFT JOIN díky èemu mùu porovnat procentuální nárùst mezd a cen potravin vedle sebe. 

Z vısledkù mùeme vyvodit, e není ádnı rok, kde by meziroèní nárùst cen potravin vıraznì vyšší ne mezd tedy vyšší ne 100. K 10% se pøibliujeme jen v roce 2017, kde vısledek vychází na 9,98% Naopak zaznamenáváme vıraznı pokles cen potravin v letech 2009 (-51,29%) a 2011 (-43,46%) 


