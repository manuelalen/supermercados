#Creación de la base de datos y las principales tablas.
CREATE DATABASE TARJETA_ALIMENTACION;
CREATE TABLE TARJETA_ALIMENTACION.CREDITOS(DNI VARCHAR(99) NOT NULL,
TARJETA VARCHAR(99),
CREDITOS FLOAT,
PRIMARY KEY(DNI));
CREATE TABLE TARJETA_ALIMENTACION.RENTAS(DNI VARCHAR(99) NOT NULL,
RENTA FLOAT,
PRIMARY KEY(DNI));
CREATE TABLE TARJETA_ALIMENTACION.DESCUENTOS(RENTA FLOAT,
DESCUENTOS FLOAT);
CREATE TABLE TARJETA_ALIMENTACION.CREDITOS_MOVILIDAD(TARJETA VARCHAR(99),
CREDITOS_MOVILIDAD FLOAT);


create view tarjeta_alimentacion.clientes
as
select c.dni,c.tarjeta,r.renta, d.descuentos, m.creditos_movilidad
from tarjeta_alimentacion.creditos c, tarjeta_alimentacion.descuentos d,
tarjeta_alimentacion.rentas r, tarjeta_alimentacion.creditos_movilidad m
where r.renta = d.renta and c.dni = r.dni
and m.tarjeta = c.tarjeta; 
create table tarjeta_alimentacion.supermercados as select * from tarjeta_alimentacion.clientes;

##Insertando datos
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('56862629M',4651088731260724,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('32864280V',4906215753148635,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('63812924E',4498067868127861,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('04661570E',4553071720510878,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('03827144J',4468276041837231,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('31762534V',4168351267565817,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('33416299J',4331926210320188,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('97813612V',4950482285808806,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('34424835E',4473180004474359,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('82373889X',4361337483347606,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('87138758S',4701014425315756,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('22820687H',4133213011284677,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('61321911R',4452757872440862,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('71237877T',4977332863603005,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('71110803R',4772606631512763,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('48832899N',4516370700086859,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('65697123S',4843941724621527,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('88040034J',4184775822317035,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('57981284D',4220774520280708,420);
INSERT INTO TARJETA_ALIMENTACION.CREDITOS VALUES('49633071Z',4656098018123029,420);

#Insertando en creditos_movilidad

insert into tarjeta_alimentacion.creditos_movilidad(tarjeta) 
select tarjeta from tarjeta_alimentacion.creditos;

##Insertando descuentos y rentas
INSERT INTO TARJETA_ALIMENTACION.DESCUENTOS VALUES(600,0.60);
INSERT INTO TARJETA_ALIMENTACION.DESCUENTOS VALUES(840,0.50);
INSERT INTO TARJETA_ALIMENTACION.DESCUENTOS VALUES(1200,0.40);

INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('56862629M',600);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('32864280V',840);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('63812924E',840);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('04661570E',600);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('03827144J',1200);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('31762534V',1200);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('33416299J',600);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('97813612V',600);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('34424835E',840);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('82373889X',1200);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('87138758S',600);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('22820687H',840);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('61321911R',840);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('71237877T',840);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('71110803R',600);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('48832899N',60);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('65697123S',1200);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('88040034J',1200);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('57981284D',1200);
INSERT INTO TARJETA_ALIMENTACION.RENTAS VALUES('49633071Z',600);

insert into tarjeta_alimentacion.supermercados select * from tajeta_alimentacion.clientes;