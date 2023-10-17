# SalacovaDenisa_Engeto_DatovaAakademie6-2023
All data for my Engeto project



Otázka 1
Rostou v prùbìhu let mzdy ve všech odvìtvích, nebo v nìkterých klesají?


1) Na zaèátek jsem si vypsala všechny tabulky, které budu v prùbìhu zpracování otázky používat.

2) Dalším krokem je vyfiltrovat hlavní tabulku dle zadaných požadavkù to je
a) Value_type_code 5958 – Prùmìrná hrubá mzda na zamìstnance
b) Unit code 200 - Kè
3) Následnì jsem si propojila hlavní tabulku czechia payroll s tabulkou czechia payroll industry branch pomocí funkce LEFT JOIN, èímž se mi propojí kód a název odvìtví.	
4) V další fázi jsem jsem si pøejmenovala jednotlivé sloupce, vytvoøila souèet prùmìrné mzdy a vyfiltrovala data dle kódu odvìtví, roku a kvartálu
5) Po pøípravì jednotlivých krokù jsem si tyto dva kroky spojila, tedy k rozdìlené hlavní tabulce pøipojila pomocí LEFT JOIN tabulku s oznaèenými oddìleními a následnì odstranila sloupec s kvartálem
6) Dalším krokem je vložení funkce LAG , díky které jsem schopna vypoèítat meziroèní rùst mzdy












Otázka 2

Kolik je možné si koupit litrù mléka a kilogramù chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

1) Opìt jsem si na zaèátku vypsala všechny použité tabulky a hodnoty, se kterými budu pracovat (kódy potravin)
2) Dále jsem si seøadila date from, abych zjistila, kdy zaèíná srovnatelné období. V tabulce Czechia_price zaèínají data dnem 2.1.2026 a konèí 10.12.2018. V tabulce Czechia_payroll pracujeme s daty, která zaèínají v lednu 2000 a konèí v prosinci 2021.První srovnatelné období zaèíná tedy v roce 2006 a konèí v roce 2018
3) Následnì jsem si upravila formát data a vyfiltrovala první kategorii - chléb
4) 
