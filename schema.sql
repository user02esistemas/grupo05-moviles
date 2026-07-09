CREATE TABLE users (
	id INTEGER NOT NULL, 
	nombre VARCHAR(80) NOT NULL, 
	correo VARCHAR(120) NOT NULL, 
	contrasena VARCHAR(255) NOT NULL, 
	rol VARCHAR(20), 
	fecha_creacion DATETIME, 
	PRIMARY KEY (id), 
	UNIQUE (correo)
);
CREATE TABLE eventos (
	id INTEGER NOT NULL, 
	organizador_id INTEGER NOT NULL, 
	nombre VARCHAR(120) NOT NULL, 
	descripcion TEXT, 
	fecha_inicio DATETIME NOT NULL, 
	fecha_fin DATETIME NOT NULL, 
	direccion VARCHAR(200) NOT NULL, 
	latitud NUMERIC(10, 7) NOT NULL, 
	longitud NUMERIC(10, 7) NOT NULL, 
	aforo INTEGER, 
	qr_token VARCHAR(64), 
	estado VARCHAR(20), imagen_url TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY(organizador_id) REFERENCES users (id), 
	UNIQUE (qr_token)
);
CREATE TABLE participantes (
	id INTEGER NOT NULL, 
	evento_id INTEGER NOT NULL, 
	nombre VARCHAR(80) NOT NULL, 
	dni VARCHAR(15) NOT NULL, 
	correo VARCHAR(120), 
	telefono VARCHAR(20), 
	qr_code VARCHAR(64), 
	fecha_registro DATETIME, 
	PRIMARY KEY (id), 
	FOREIGN KEY(evento_id) REFERENCES eventos (id), 
	UNIQUE (qr_code)
);
CREATE TABLE agenda (
	id INTEGER NOT NULL, 
	evento_id INTEGER NOT NULL, 
	titulo VARCHAR(120) NOT NULL, 
	descripcion TEXT, 
	hora_inicio DATETIME NOT NULL, 
	hora_fin DATETIME NOT NULL, 
	responsable VARCHAR(80), 
	PRIMARY KEY (id), 
	FOREIGN KEY(evento_id) REFERENCES eventos (id)
);
CREATE TABLE asistencias (
	id INTEGER NOT NULL, 
	participante_id INTEGER NOT NULL, 
	evento_id INTEGER NOT NULL, 
	estado VARCHAR(20), 
	metodo VARCHAR(10), 
	fecha_marcado DATETIME, 
	PRIMARY KEY (id), 
	FOREIGN KEY(participante_id) REFERENCES participantes (id), 
	FOREIGN KEY(evento_id) REFERENCES eventos (id)
);
