--inserari in categorii
INSERT INTO `proiectpbd`.`categorii` (`idcateg`, `denumire`) VALUES ('1', 'adidasi');
INSERT INTO `proiectpbd`.`categorii` (`idcateg`, `denumire`) VALUES ('2', 'tricouri');
INSERT INTO `proiectpbd`.`categorii` (`idcateg`, `denumire`) VALUES ('3', 'camasi');
INSERT INTO `proiectpbd`.`categorii` (`idcateg`, `denumire`) VALUES ('4', 'hanorace');
--inserari in clienti
INSERT INTO `proiectpbd`.`clienti` (`idclient`, `nume`, `prenume`, `mail`, `adresa`, `telefon`) VALUES ('1', 'muresan', 'george', 'gggg@gmail.com', 'Bucium 17-19 apartamentul 9', '0754683376');
INSERT INTO `proiectpbd`.`clienti` (`idclient`, `nume`, `prenume`, `mail`, `adresa`, `telefon`) VALUES ('2', 'test1', 'test1', 'test1@gmail.com', 'test1', '0000000000');
INSERT INTO `proiectpbd`.`clienti` (`idclient`, `nume`, `prenume`, `mail`, `adresa`, `telefon`) VALUES ('3', 'test2', 'test2', 'test2@gmail.com', 'test2', '1111111111');
INSERT INTO `proiectpbd`.`clienti` (`idclient`, `nume`, `prenume`, `mail`, `adresa`, `telefon`) VALUES ('4', 'test3', 'test3', 'test3@gmail.com', 'test3', '2222222222');
--inserari in tari
INSERT INTO `proiectpbd`.`tari` (`idtara`, `denumire`, `continent`) VALUES ('1', 'Romania', 'Europa');
INSERT INTO `proiectpbd`.`tari` (`idtara`, `denumire`, `continent`) VALUES ('2', 'Austria', 'Europa');
INSERT INTO `proiectpbd`.`tari` (`idtara`, `denumire`, `continent`) VALUES ('3', 'Belgia', 'Europa');
INSERT INTO `proiectpbd`.`tari` (`idtara`, `denumire`, `continent`) VALUES ('4', 'Bulgaria', 'Europa');
--inserari in furnizori 
INSERT INTO `proiectpbd`.`furnizori` (`idfurnizor`, `nume`, `adresa`, `telefon`, `mail`, `idtara`) VALUES ('1', 'furnizor1', 'furnizor1', '1111111111', 'f2@gmail.com', '1');
INSERT INTO `proiectpbd`.`furnizori` (`idfurnizor`, `nume`, `adresa`, `telefon`, `mail`, `idtara`) VALUES ('2', 'furnizor2', 'furnizor2', '2222222222', 'f2@gmail.com', '3');
INSERT INTO `proiectpbd`.`furnizori` (`idfurnizor`, `nume`, `adresa`, `telefon`, `mail`, `idtara`) VALUES ('3', 'furnizor3', 'furnizor3', '3333333333', 'f3@gmail.com', '3');
INSERT INTO `proiectpbd`.`furnizori` (`idfurnizor`, `nume`, `adresa`, `telefon`, `mail`, `idtara`) VALUES ('4', 'furnizor4', 'furnizor4', '4444444444', 'f4@gmail.com', '4');
--inserari in produse
INSERT INTO `proiectpbd`.`produse` (`idprodus`, `denumire`, `pret`, `stoc`, `idcateg`, `idfurnizor`) VALUES ('1', 'nike air force 1', '450', '50', '1', '2');
INSERT INTO `proiectpbd`.`produse` (`idprodus`, `denumire`, `pret`, `stoc`, `idcateg`, `idfurnizor`) VALUES ('2', 'nike air presto', '499', '20', '1', '2');
INSERT INTO `proiectpbd`.`produse` (`idprodus`, `denumire`, `pret`, `stoc`, `idcateg`, `idfurnizor`) VALUES ('3', 'nike sb', '35', '10', '4', '1');
INSERT INTO `proiectpbd`.`produse` (`idprodus`, `denumire`, `pret`, `stoc`, `idcateg`, `idfurnizor`) VALUES ('4', 'nike air', '120', '20', '2', '4');
--inserari in comenzi 
INSERT INTO `proiectpbd`.`comenzi` (`idcomanda`, `ziua`, `idclient`) VALUES ('1', '2019-05-23', '1');
INSERT INTO `proiectpbd`.`comenzi` (`idcomanda`, `ziua`, `idclient`) VALUES ('2', '2019-05-23', '1');
INSERT INTO `proiectpbd`.`comenzi` (`idcomanda`, `ziua`, `idclient`) VALUES ('3', '2019-05-24', '2');
INSERT INTO `proiectpbd`.`comenzi` (`idcomanda`, `ziua`, `idclient`) VALUES ('4', '2019-05-24', '3');
--inserari in detalii comenzi 
INSERT INTO `proiectpbd`.`detalii_comenzi` (`iddetalii_comanda`, `idcomanda`, `idprodus`, `cantitate`) VALUES ('1', '1', '1', '2');
INSERT INTO `proiectpbd`.`detalii_comenzi` (`iddetalii_comanda`, `idcomanda`, `idprodus`, `cantitate`) VALUES ('2', '2', '3', '1');
INSERT INTO `proiectpbd`.`detalii_comenzi` (`iddetalii_comanda`, `idcomanda`, `idprodus`, `cantitate`) VALUES ('3', '3', '4', '1');
INSERT INTO `proiectpbd`.`detalii_comenzi` (`iddetalii_comanda`, `idcomanda`, `idprodus`, `cantitate`) VALUES ('4', '4', '2', '1');
--inserari in retururi
INSERT INTO `proiectpbd`.`retururi` (`idretur`, `idprod`, `idclient`) VALUES ('1', '4', '2');
INSERT INTO `proiectpbd`.`retururi` (`idretur`, `idprod`, `idclient`) VALUES ('2', '1', '1');

-----------------------------------------------------------------------------------Query-uri utile 
--afisati toate produsele returnate si numele clientilor nemultumiti 
select clienti.nume, clienti.prenume, produse.denumire from clienti
inner join retururi on retururi.idclient = clienti.idclient
inner join produse on produse.idprodus = retururi.idprod

--afisati produsele si stocul de la furnizori din Romania 
select produse.denumire, produse.stoc
from produse
inner join furnizori on furnizori.idfurnizor=produse.idfurnizor
inner join tari on tari.idtara = furnizori.idtara
where tari.denumire = 'romania'

--afisati numarul de produse din fiecare categorie 
select count(produse.idprodus) as numarProduse, categorii.denumire
from produse
inner join categorii on categorii.idcateg=produse.idcateg
group by categorii.denumire

----------------------------------------------------------------------------views-------------------------------------------------------------------
--view pentru toti furnizorii din europa 
create view 'furnizori_europa' AS
select furnizori.nume, furnizori.adresa, furnizori.telefon
from furnizori
inner join tari on tari.idtara = furnizori.idtara
where tari.continent = 'Europa';

--view pentru produse din categoria adidasi 
create view 'produse_categoria_adidasi' as
select produse.idprodus, produse.denumire, produse.stoc
from produse 
inner join categorii on categorii.idcateg = produse.idcateg
where categorii.denumire = 'adidasi';

--view pentru produsele din categoria hanorace 
create view 'produse_categoria_adidasi' as
select produse.idprodus, produse.denumire, produse.stoc
from produse 
inner join categorii on categorii.idcateg = produse.idcateg
where categorii.denumire = 'hanorace';

--view pentru produsele din categoria tricouri
create view 'produse_categoria_adidasi' as
select produse.idprodus, produse.denumire, produse.stoc
from produse 
inner join categorii on categorii.idcateg = produse.idcateg
where categorii.denumire = 'tricouri';

-------------------------------------------------------------------------------------------proceduri stocate------------------------------------------------------------------------
--procedura stocata pentru afisarea tuturor produselor peste 200 de lei 
create procedure `produsePeste200Lei` ()
begin
select idprodus, denumire
from produse 
where pret > 200;
end

call produsePeste200Lei();

--procedura stocata pentru afisarea tuturor produselor ce provin dintr-o anumita tara data ca parametru 
CREATE PROCEDURE `produseDinTaraX`(IN denumireTara varchar(255))
BEGIN
select produse.denumire from produse
inner join furnizori on furnizori.idfurnizor=produse.idfurnizor
inner join tari on tari.idtara=furnizori.idtara
where tari.denumire = denumireTara;
END

set @denumire = 'romania';
call produseDinTaraX(@denumire);

--procedura stocata pentru inserarea unui produs nou 
CREATE PROCEDURE `inserareProdus` (IN var1 int, IN var2 varchar(50), IN var3 int, IN var4 int, IN var5 int, IN var6 int) 
BEGIN
insert into produse ( idprodus, denumire, pret, stoc, idcateg, idfurnizor)
values ( var1, var2, var3, var4, var5, var6);
END

--procedura stocata pentru stergerea unui furnizor dupa numele acestuia 
CREATE PROCEDURE `stergereFurnizorDupaNume`(IN numefurnizor varchar(200))
BEGIN
delete from furnizori 
where nume  = numefurnizor;
END

--------------------------------------------------------------------------------------------------------functii-------------------------------------------
--sa se creeze o functie care sa afiseze numarul de produse ce provin dintr-o tara data ca parametru 
create function `functie1` (@denumireTara varchar(50) )
return int
begin
declare @total int;
select @total = sum(stoc)  from produse
inner join furnizori on furnizori.idfurnizor=produse.idfurnizor
inner join tari on tari.idtara=furnizori.idtara
where tari.denumire = denumireTara
return total;
end

--sa se creeze o functie care sa afiseze numele produselor care provin dintr-o anumita categorie
create function `functie2` (@denumireCategorie varchar(50))
return varchar 
begin
declare @nume varchar(50);
select @nume = produse.denumire
from produse
inner join categorii on categorii.idcateg = produse.idcateg
where categorii.denumire = @denumireCategorie;
return @nume;
end

--sa se creeze o functie care sa returneze denumirea produselor returnate  pe baza unui motiv  dat 
create function `functie3` (@motiv varchar(50))
return varchar 
begin
declare @numeProd varchar(50);
select @numeProd = produse.denumire
from produse
inner join retururi on retururi.idprodus = produse.idprodus
where retururi.motiv = @motiv;
return @numeProd;
end

--sa se creeze o functie  care calculeaza numarul de produse comandate intr-o zi 
create function `functie4` (@ziua date)
return int
begin
declare @totalNrProd int;
select @totalNrProd = count(cantitate)
from detalii_comenzi
inner join comenzi on comenzi.idcomanda=detalii_comenzi.idcomanda
where comenzi.ziua = @ziua;
return @totalNrProd
end


------------------------------------------------------------------------triggere---------------------------------------------------------
--sa nu se poata adauga stoc 0 la inserarea unui nou produs (fiecare produs sa aiba stocul mai mare decat 0)
DROP TRIGGER stocMaiMareCa0
CREATE TRIGGER stocMaiMareCa0
ON produse
FOR INSERT
AS
BEGIN
	IF EXISTS(SELECT * FROM inserted WHERE stoc <= 0)
	BEGIN
		RAISERROR('Op. interzisa', 16, 1)
		ROLLBACK TRANSACTION
	END
END

-- sa nu se poata sterge comenzile din ziua curenta 
DROP TRIGGER fara_stergere_comenzi_zi_curenta
CREATE TRIGGER fara_stergere_comenzi_zi_curenta
ON comenzi
FOR DELETE
AS
BEGIN
	IF EXISTS(SELECT * FROM deleted WHERE DAY(getdate()) = DAY(ziua))
	BEGIN
		RAISERROR('Op. interzisa', 16, 1)
		ROLLBACK TRANSACTION
	END
END

--sa nu se poata modifica datele clientilor care au facut comenzi in ziua curenta 
CREATE TRIGGER update_interzis_clienti
ON clienti
FOR UPDATE
AS
BEGIN
	IF EXISTS
	(
		SELECT * FROM inserted 
		JOIN comenzi ON comenzi.idclient = inserted.idclient
		WHERE DAY(comenzi.ziua) = DAY(getdate())
	)
	BEGIN
		RAISERROR('Op. interzisa', 16, 1)
		ROLLBACK TRANSACTION
	END
END

--sa nu se poata adauga produse de la de la furnizori din Polonia 
DROP TRIGGER faraProduseDinPolonia
CREATE TRIGGER faraProduseDinPolonia
ON produse
FOR INSERT
AS
BEGIN
	IF EXISTS
	(
		SELECT * FROM inserted 
		JOIN furnizori ON furnizori.idfurnizor = inserted.idfurnizor
		JOIN tari on tari.idtara = furnizori.idtara
		WHERE tari.denumire = 'Polonia'
	)
	BEGIN
		RAISERROR('Op. interzisa', 16, 1)
		ROLLBACK TRANSACTION
	END
END

















