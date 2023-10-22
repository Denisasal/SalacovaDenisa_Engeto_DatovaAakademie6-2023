# SalacovaDenisa_Engeto_DatovaAakademie6-2023
All data for my Engeto project



Ot�zka 1
Rostou v pr�b�hu let mzdy ve v�ech odv�tv�ch, nebo v n�kter�ch klesaj�?


1) Na za��tek jsem si vypsala v�echny tabulky, kter� budu v�pr�b�hu zpracov�n� ot�zky pou��vat.

2) Dal��m krokem je vyfiltrovat hlavn� tabulku dle zadan�ch po�adavk� to je
a) Value_type_code 5958 � Pr�m�rn� hrub� mzda na zam�stnance
b) Unit code 200 - K�
3) N�sledn� jsem si propojila hlavn� tabulku czechia payroll s�tabulkou czechia payroll industry branch pomoc� funkce LEFT JOIN, ��m� se mi propoj� k�d a n�zev odv�tv�.	
4) V�dal�� f�zi jsem jsem si p�ejmenovala jednotliv� sloupce, vytvo�ila pr�m�rn� mzdy a vyfiltrovala data dle k�du odv�tv�, roku a kvart�lu
5) Po p��prav� jednotliv�ch krok� jsem si tyto dva kroky spojila, tedy k�rozd�len� hlavn� tabulce p�ipojila pomoc� LEFT JOIN tabulku s�ozna�en�mi odd�len�mi a n�sledn� odstranila sloupec s�kvart�lem
6)Dal��m krokem je vlo�en� funkce LAG , d�ky kter� jsem schopna vypo��tat meziro�n� r�st mzdy.
7) Z�v�sled� je z�ejm�, �e prvn� pokles cen byl zaznamen�n v�roce 2009, kter� se t�kal odv�tv� Pen�nictv� a poji��ovnictv�, t�ba a dob�v�n�

D�le tak� Informa�n� a komunika�n� �innosti spolu s�V�robou a rozvodem elekt�ina, plynu, tepla a klimatizace vzduchu. U t�chto odv�tv� zaznamen�v�me p�d a� do roku 2010. V�roce 2010 klesly tak� Profesn� v�deck� a technick� �innosti.

Dal�� velk� v�kyv m��eme vid�t v�roce 2013 v�Pen�nictv� a poji��ovnictv�, kde byl pokles a� o 6�097 K�, tedy 11,64%. Od tohoto zlomu je vid�l trval� v�kyv propad� a r�stu a� do roku 2021.

V�roce 2013, 2015 a 2017  registrujeme znovu pokles odv�tv� V�roby a rozvodu elekt�iny, plynu, tepla a klimatizace vzduchu.

Od roku 2017 vid�me velk� r�sty a p�dy ve v�t�in� odv�tv� a� do roku 2021

 










Ot�zka 2

Kolik je mo�n� si koupit litr� ml�ka a kilogram� chleba za prvn� a posledn� srovnateln� obdob� v dostupn�ch datech cen a mezd?

1) Op�t jsem si na za��tku vypsala v�echny pou�it� tabulky a hodnoty, se kter�mi budu pracovat (k�dy potravin)
2) D�le jsem si se�adila date from, abych zjistila, kdy za��n� srovnateln� obdob�. V�tabulce Czechia_price za��naj� data dnem 2.1.2026 a kon�� 10.12.2018. V�tabulce Czechia_payroll pracujeme s�daty, kter� za��naj� v�lednu 2000 a kon�� v�prosinci 2021.Prvn� srovnateln� obdob� za��n� tedy v�roce 2006 a kon�� v�roce 2018
3) N�sledn� jsem si upravila form�t data a vyfiltrovala prvn� kategorii - chl�b
4) 





Ot�zka 3

Kter� kategorie potravin zdra�uje nejpomaleji (je u n� nejni��� percentu�ln� meziro�n� n�r�st)?

1) Op�t jsem si vypsala pou�it� tabulky
2) D�le jsem si spo��tala sumu cen za jednotliv� roky jednotliv�ch potravin a upravila form�t data na rok. K�tabulce czechia price jsem pomoc� JOIN  p�ipojila tabulku czechia price category a p�i�adila tak ke k�d�m potravin tak� n�zvy a se�adila vzestupn�
3) D�le jsem si vytvo�ila tabulku t_potraviny_ro�n�_ceny s�vyjmenovan�mi po�adavky
4) N�sleduj�c� tabulku jsem si pak upravila formou subselectu, kam jsem p�idala funkci LAG , d�ky kter� jsem si vypo��tala ceny za p�ede�l� rok a n�sledn� pak procentu�ln� r�st.
5) Nejv�t�� meziro�n� procentu�ln� pokles ceny byl zaznamen�n u kategorie Pe�ivo p�eni�n� b�l� a to -62,69%. Nejni��� meziro�n� n�r�st je ale u kategorie P�eni�n� mouka hladk� o 0,05% v�roce 2008.

Ot�zka 4
Existuje rok, ve kter�m byl meziro�n� n�r�st cen potravin v�razn� vy��� ne� r�st mezd (v�t�� ne� 10 %)?
1) Op�t jsem si nejd��ve vypsala pou�it� tabulky
2) Stejn�m zp�sobem jako u ot�zky 3 jsem si vytvo�ila tabulku mzdy_ro�n�_r�st_cen kde jsem v�jednom selectu vypo��tala sou�et mezd za jednotliv� roky, d�le pak sou�et mezd za p�edchoz� roky a z�toho op�t pomoc� funkce LAG meziro�n� n�r�st. K�tomu jsem pomoc� LEFT JOIN p�ipojila tabulku s�n�zvy jednotliv�ch odv�tv� a pomoc� WHERE  GROUP BY odfiltrovala nepot�ebn� data.
3) Dal��m krokem byl sou�et mezd za v�echna odv�tv� a rozd�len� dle roku od 2006 do 2018, jeliko� toto je spole�n� obdob� v�obou tabulk�ch jak cen tak i mezd.
4) N�sledn� jsem si sloupec s�meziro�n�m r�stem cen p�evedla na procenta
5) Stejn�m zp�sobem jsem si upravila tabulku s�cenami potravin, kde jsem si tak� se�etla ceny za jednotliv� roky a vypo��tala meziro�n� r�st cen v�procentech
6) Nakonec jsem tyto dv� tabulky spojila pomoc� LEFT JOIN d�ky �emu m��u porovnat procentu�ln� n�r�st mezd a cen potravin vedle sebe. 

Z v�sledk� m��eme vyvodit, �e nen� ��dn� rok, kde by meziro�n� n�r�st cen potravin v�razn� vy��� ne� mezd tedy vy��� ne� 100. K�10% se p�ibli�ujeme jen v�roce 2017, kde v�sledek vych�z� na 9,98% Naopak zaznamen�v�me v�razn� pokles cen potravin v�letech 2009 (-51,29%) a 2011 (-43,46%) 


