--Delete previous tables
DROP TABLE Clientes;

create table Clientes
(
	ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	DNI VARCHAR(10),
	NOMBRE VARCHAR(50),
	SOCIO BOOLEAN
);

-- Insert sample records
insert into Clientes (dni,nombre,socio) VALUES ('11111111-A','Manuel García',true);
insert into Clientes (dni,nombre,socio) VALUES ('22222222-B','María López',true);
insert into Clientes (dni,nombre,socio) VALUES ('33333333-C','Samuel Aranda',false);
insert into Clientes (dni,nombre,socio) VALUES ('44444444-D','Sonia Pérez',false);
