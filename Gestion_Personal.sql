use gestiopersona;

create table pais (idpais int not null  auto_increment primary key,
nombre varchar(50),
eliminado TINYINT(1)  default 0
);

create table provincia (idprovincia int not null  auto_increment primary key,
nombre varchar(50),
idpais int default 1,
eliminado TINYINT(1)  default 0,
FOREIGN KEY (idpais) REFERENCES pais (idpais)
);

create table ciudad (idciudad int not null  auto_increment primary key,
nombre varchar(50),
idprovincia int default 1,
eliminado TINYINT(1)  default 0,
FOREIGN KEY (idprovincia) REFERENCES provincia (idprovincia));

create table canton (idcanton int not null auto_increment primary key,
nombre varchar(50),
idciudad int default 1,
eliminado TINYINT(1)  default 0,
FOREIGN KEY (idciudad) REFERENCES ciudad (idciudad));

create table parroquia (idparroquia int not null auto_increment primary key,
nombre varchar(50),
idcanton int default 1,
eliminado TINYINT(1)  default 0,
FOREIGN KEY (idcanton) REFERENCES canton (idcanton));

create table tipoidentificacion (idtipoidentificacion int not null auto_increment primary key,
nombre varchar(50),
eliminado TINYINT(1)  default 0
);

create table identificacion (ididentificacion int not null auto_increment primary key,
idtipoidentificacion int default 1,
eliminado TINYINT(1)  default 0,
FOREIGN KEY (idtipoidentificacion) REFERENCES tipoidentificacion (idtipoidentificacion));

create table estadocivil (idestadocivil int not null  auto_increment primary key,
nombre varchar(50),
eliminado TINYINT(1)  default 0
);

create table telefono (idtelefono int not null auto_increment primary key,
nombre varchar(50),
eliminado TINYINT(1)  default 0
);

create table sexo (idsexo int not null  auto_increment primary key,
nombre varchar(50),
eliminado TINYINT(1)  default 0
);

create table genero (idgenero int not null  auto_increment primary key,
nombre varchar(50),
eliminado TINYINT(1)  default 0
);

create table persona (idpersona int not null auto_increment primary key,
nombre varchar(50),
apellido varchar(50),
fechanacimiento date,
fechadefuncion date,
eliminado TINYINT(1)  default 0,
idtelefono int default 1,
idsexo int default 1,
idgenero int default 1,
ididentificacion int default 1,
idestadocivil int default 1,
FOREIGN KEY (idtelefono) REFERENCES telefono (idtelefono),
FOREIGN KEY (idsexo) REFERENCES sexo (idsexo),
FOREIGN KEY (idgenero) REFERENCES genero (idgenero),
FOREIGN KEY (ididentificacion) REFERENCES identificacion (ididentificacion),
FOREIGN KEY (idestadocivil) REFERENCES estadocivil (idestadocivil));

create table direccion (iddireccion int not null auto_increment primary key,
calleprincipal varchar(50),
callesecundaria varchar(50),
codigopostal varchar(50),
eliminado TINYINT(1)  default 0,
idparroquia int default 1,
idpersona int default 1,
FOREIGN KEY (idpersona) REFERENCES persona (idpersona),
FOREIGN KEY (idparroquia) REFERENCES parroquia (idparroquia));


-- Vista para la tabla 'pais'
CREATE VIEW vista_pais AS SELECT * FROM pais WHERE pais.eliminado = 0;

-- Vista para la tabla 'provincia'
CREATE VIEW vista_provincia AS SELECT * FROM provincia WHERE provincia.eliminado = 0;

-- Vista para la tabla 'ciudad'
CREATE VIEW vista_ciudad AS SELECT * FROM ciudad WHERE ciudad.eliminado = 0;

-- Vista para la tabla 'canton'
CREATE VIEW vista_canton AS SELECT * FROM canton WHERE canton.eliminado = 0;

-- Vista para la tabla 'parroquia'
CREATE VIEW vista_parroquia AS SELECT * FROM parroquia WHERE parroquia.eliminado = 0;

-- Vista para la tabla 'tipoidentificacion'
CREATE VIEW vista_tipoidentificacion AS SELECT * FROM tipoidentificacion WHERE tipoidentificacion.eliminado = 0;

-- Vista para la tabla 'identificacion'
CREATE VIEW vista_identificacion AS SELECT * FROM identificacion WHERE identificacion.eliminado = 0;

-- Vista para la tabla 'estadocivil'
CREATE VIEW vista_estadocivil AS SELECT * FROM estadocivil WHERE estadocivil.eliminado = 0;

-- Vista para la tabla 'telefono'
CREATE VIEW vista_telefono AS SELECT * FROM telefono WHERE telefono.eliminado = 0;

-- Vista para la tabla 'sexo'
CREATE VIEW vista_sexo AS SELECT * FROM sexo WHERE sexo.eliminado = 0;

-- Vista para la tabla 'genero'
CREATE VIEW vista_genero AS SELECT * FROM genero WHERE genero.eliminado = 0;

-- Vista para la tabla 'direccion'
CREATE VIEW vista_direccion AS SELECT * FROM direccion WHERE direccion.eliminado = 0;

--Vista para la tabla 'persona'
CREATE VIEW vista_persona AS SELECT * FROM persona  WHERE persona.eliminado = 0;
