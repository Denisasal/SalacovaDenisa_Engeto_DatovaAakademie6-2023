# SalacovaDenisa_Engeto_DatovaAakademie6-2023
All data for my Engeto project



Ot�zka 1
Rostou v pr�b�hu let mzdy ve v�ech odv�tv�ch, nebo v n�kter�ch klesaj�?


1) Na za��tek jsem si vypsala v�echny tabulky, kter� budu v�pr�b�hu zpracov�n� ot�zky pou��vat.

2) Dal��m krokem je vyfiltrovat hlavn� tabulku dle zadan�ch po�adavk� to je
a) Value_type_code 5958 � Pr�m�rn� hrub� mzda na zam�stnance
b) Unit code 200 - K�
3) N�sledn� jsem si propojila hlavn� tabulku czechia payroll s�tabulkou czechia payroll industry branch pomoc� funkce LEFT JOIN, ��m� se mi propoj� k�d a n�zev odv�tv�.	
4) V�dal�� f�zi jsem jsem si p�ejmenovala jednotliv� sloupce, vytvo�ila sou�et pr�m�rn� mzdy a vyfiltrovala data dle k�du odv�tv�, roku a kvart�lu
5) Po p��prav� jednotliv�ch krok� jsem si tyto dva kroky spojila, tedy k�rozd�len� hlavn� tabulce p�ipojila pomoc� LEFT JOIN tabulku s�ozna�en�mi odd�len�mi a n�sledn� odstranila sloupec s�kvart�lem
6) Dal��m krokem je vlo�en� funkce LAG , d�ky kter� jsem schopna vypo��tat meziro�n� r�st mzdy












Ot�zka 2

Kolik je mo�n� si koupit litr� ml�ka a kilogram� chleba za prvn� a posledn� srovnateln� obdob� v dostupn�ch datech cen a mezd?

1) Op�t jsem si na za��tku vypsala v�echny pou�it� tabulky a hodnoty, se kter�mi budu pracovat (k�dy potravin)
2) D�le jsem si se�adila date from, abych zjistila, kdy za��n� srovnateln� obdob�. V�tabulce Czechia_price za��naj� data dnem 2.1.2026 a kon�� 10.12.2018. V�tabulce Czechia_payroll pracujeme s�daty, kter� za��naj� v�lednu 2000 a kon�� v�prosinci 2021.Prvn� srovnateln� obdob� za��n� tedy v�roce 2006 a kon�� v�roce 2018
3) N�sledn� jsem si upravila form�t data a vyfiltrovala prvn� kategorii - chl�b
4) 
