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
7) Vytvo�enou tabulku jsem si n�sledn� pomoc� funkce CASE rozd�lila a ozna�ila procentu�ln� n�r�st pro lep�� p�ehled.

Z�v�sledk� je mo�n� vyvodit, �e u 15 odv�tv� minim�ln� jednou za obdob� mzdy klesly. Naopak u odv�tv� Zpracovatelsk� pr�mysl, Doprava a skladov�n�, Zdravotn� a soci�ln� p��e a Ostatn� �innosti v�ka�d�m obdob� rostly.




Ot�zka 2

Kolik je mo�n� si koupit litr� ml�ka a kilogram� chleba za prvn� a posledn� srovnateln� obdob� v dostupn�ch datech cen a mezd?

1) K�tomuto v�po�tu jsem pou�ila spojen� tabulky s�v�po�tem mezd a cen potravin, kde jsem si vypo��tala pr�m�rnou ro�n� mzdu a d�le vytvo�ila nov� sloupec se vzorcem pro v�po�et n�kupu dan�ho produktu. D�le jsem si pomoc� WHERE vyfiltrovala po�adovan� kategorie.

Z�v�sledk� se d� ur�it, �e si m��eme koupit za prvn� srovnateln� obdob� 1287,46 kg chleba konzumn�ho a 1437,24 l, ml�ka. Za posledn� srovnateln� obdob� pak 1342,24 kg chleba konzumn�ho a 1641,57 l ml�ka




Ot�zka 3
Kter� kategorie potravin zdra�uje nejpomaleji (je u n� nejni��� percentu�ln� meziro�n� n�r�st)?

1) Op�t jsem si vypsala pou�it� tabulky
2) D�le jsem si spo��tala sumu cen za jednotliv� roky jednotliv�ch potravin a upravila form�t data na rok. K�tabulce czechia price jsem pomoc� JOIN  p�ipojila tabulku czechia price category a p�i�adila tak ke k�d�m potravin tak� n�zvy a se�adila vzestupn�
3) D�le jsem si vytvo�ila tabulku t_potraviny_ro�n�_ceny s�vyjmenovan�mi po�adavky
4) N�sleduj�c� tabulku jsem si pak upravila formou subselectu, kam jsem p�idala funkci LAG , d�ky kter� jsem si vypo��tala ceny za p�ede�l� rok a n�sledn� pak procentu�ln� r�st.
5) Dal��m krokem byla �prava vytvo�en� tabulky s�meziro�n�m n�r�stem v�procentech, kde jsem se�etla procenta a se�adila vzestupn�. 
5) Nejv�t�� meziro�n� procentu�ln� pokles ceny byl zaznamen�n u kategorie 

Kategorie s�nejni���m procentu�ln�m n�r�stem je Cukr krystalov�, s�nejvy���m pak Jakostn� v�no b�l�





Ot�zka 4
Existuje rok, ve kter�m byl meziro�n� n�r�st cen potravin v�razn� vy��� ne� r�st mezd (v�t�� ne� 10 %)?

1) Op�t jsem si nejd��ve vypsala pou�it� tabulky
2) Stejn�m zp�sobem jako u ot�zky 3 jsem si vytvo�ila tabulku mzdy_ro�n�_r�st_cen kde jsem v�jednom selectu vypo��tala sou�et mezd za jednotliv� roky, d�le pak sou�et mezd za p�edchoz� roky a z�toho op�t pomoc� funkce LAG meziro�n� n�r�st. K�tomu jsem pomoc� LEFT JOIN p�ipojila tabulku s�n�zvy jednotliv�ch odv�tv� a pomoc� WHERE  GROUP BY odfiltrovala nepot�ebn� data.
3) Dal��m krokem byl sou�et mezd za v�echna odv�tv� a rozd�len� dle roku od 2006 do 2018, jeliko� toto je spole�n� obdob� v�obou tabulk�ch jak cen tak i mezd.
4) N�sledn� jsem si sloupec s�meziro�n�m r�stem cen p�evedla na procenta
5) Stejn�m zp�sobem jsem si upravila tabulku s�cenami potravin, kde jsem si tak� se�etla ceny za jednotliv� roky a vypo��tala meziro�n� r�st cen v�procentech
6) Nakonec jsem tyto dv� tabulky spojila pomoc� LEFT JOIN d�ky �emu m��u porovnat procentu�ln� n�r�st mezd a cen potravin vedle sebe. 

Z v�sledk� m��eme vyvodit, �e nen� ��dn� rok, kde by meziro�n� n�r�st cen potravin v�razn� vy��� ne� mezd tedy vy��� ne� 100. K�10% se p�ibli�ujeme jen v�roce 2017, kde v�sledek cen potravin vych�z� na 9,63% 





Ot�zka 5
M� v��ka HDP vliv na zm�ny ve mzd�ch a cen�ch potravin? Neboli, pokud HDP vzroste v�razn�ji v jednom roce, projev� se to na cen�ch potravin �i mzd�ch ve stejn�m nebo n�sleduj�c�m roce v�razn�j��m r�stem?

1)Pro v�po�et jsem zvolila spojen� prim�rn� a sekund�rn� tabulky pomoc� spole�n� hodnoty rok, n�sledn� vybrala country a vyfiltrovala �eskou Republiku, d�le pak data r�stu mezd a cen potravin.
2)Z�p�ipojen� sekund�rn� tabulky pak HDP.
3)Op�t pomoc� funkce LAG vypo��tala procentu�ln� n�r�st HDP za jednotliv� roky.

Dle v�sledk� je z�ejm�, �e v��ka HDP m� vliv na v�voj mezd a cen potravin, mzdy a ceny se ale nem�n� soum�rn� ka�d� rok c pohybem HDP, neovliv�uje jej tedy pravideln�.

