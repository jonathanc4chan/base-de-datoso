
CREATE TABLE hotel (
    codigo_hotel              VARCHAR2(100 CHAR) NOT NULL,
    nombre                    VARCHAR2(200 CHAR) NOT NULL,
    direccion                 VARCHAR2(100 CHAR) NOT NULL,
    ciudad                    VARCHAR2(50 CHAR) NOT NULL,
    telefono                  VARCHAR2(100 CHAR) NOT NULL,
    numero_plazas_disponibles NUMBER NOT NULL,
    PRIMARY KEY (codigo_hotel)
);

CREATE TABLE informacion_medica (
    id_medico             NUMBER NOT NULL,
    condicion_medica      VARCHAR2(50 CHAR) NOT NULL,
    alergias              VARCHAR2(100 CHAR) NOT NULL,
    medicamentos_actuales VARCHAR2(50 CHAR) NOT NULL,
    seguro_medico         NUMBER NOT NULL,
    PRIMARY KEY (id_medico)
);

CREATE TABLE reservahotel (
    codigo_reserva         NUMBER NOT NULL,
    fecha_llegada          DATE NOT NULL,
    regimen_hospedaje      VARCHAR2(100 CHAR) NOT NULL,
    fecha_partida          DATE,
    hotel_codigo_hotel     VARCHAR2(100 CHAR),
    turista_codigo_turista NUMBER,
    PRIMARY KEY (codigo_reserva),
    CONSTRAINT regimen_hospedaje_chk CHECK (regimen_hospedaje IN ('Media Pensión', 'Pensión Completa')),
    FOREIGN KEY (hotel_codigo_hotel) REFERENCES hotel (codigo_hotel),
    FOREIGN KEY (turista_codigo_turista) REFERENCES turista (codigo_turista)
);

CREATE TABLE reservavuelo (
    id_clase               NUMBER NOT NULL,
    clase                  VARCHAR2(50 CHAR) NOT NULL,
    turista_codigo_turista NUMBER NOT NULL,
    vuelo_numero_vuelo     NUMBER NOT NULL,
    PRIMARY KEY (id_clase),
    CONSTRAINT clase_chk CHECK (clase IN ('primera', 'turista')),
    FOREIGN KEY (turista_codigo_turista) REFERENCES turista (codigo_turista),
    FOREIGN KEY (vuelo_numero_vuelo) REFERENCES vuelo (numero_vuelo)
);

CREATE TABLE sucursal (
    codigo_sucursal NUMBER NOT NULL,
    direccion       VARCHAR2(150 CHAR) NOT NULL,
    telefono        VARCHAR2(200 CHAR) NOT NULL,
    PRIMARY KEY (codigo_sucursal)
);

CREATE TABLE turista (
    codigo_turista               NUMBER NOT NULL,
    nombre1                      VARCHAR2(150 CHAR) NOT NULL,
    nombre2                      VARCHAR2(150 CHAR) NOT NULL,
    nombre3                      VARCHAR2(100 CHAR),
    apellido1                    VARCHAR2(100 CHAR) NOT NULL,
    apellido2                    VARCHAR2(100 CHAR) NOT NULL,
    direccion                    VARCHAR2(100 CHAR) NOT NULL,
    pais_residencia              VARCHAR2(50 CHAR) NOT NULL,
    sucursal_codigo_sucursal     NUMBER,
    hotel_codigo_hotel           VARCHAR2(100 CHAR),
    vuelo_numero_vuelo           NUMBER,
    informacion_medica_id_medico NUMBER NOT NULL,
    PRIMARY KEY (codigo_turista),
    FOREIGN KEY (hotel_codigo_hotel) REFERENCES hotel (codigo_hotel),
    FOREIGN KEY (informacion_medica_id_medico) REFERENCES informacion_medica (id_medico),
    FOREIGN KEY (sucursal_codigo_sucursal) REFERENCES sucursal (codigo_sucursal),
    FOREIGN KEY (vuelo_numero_vuelo) REFERENCES vuelo (numero_vuelo)
);

CREATE TABLE telefono_turista (
    id_telefono         NUMBER NOT NULL,
    turista_codigo_turista NUMBER NOT NULL,
    num_telefono        VARCHAR2(20 CHAR) NOT NULL,
    tipo_compania       VARCHAR2(50 CHAR) NOT NULL,
    PRIMARY KEY (id_telefono),
    FOREIGN KEY (turista_codigo_turista) REFERENCES turista (codigo_turista)
);

CREATE TABLE correo_turista (
    id_correo           NUMBER NOT NULL,
    turista_codigo_turista NUMBER NOT NULL,
    correo              VARCHAR2(100 CHAR) NOT NULL,
    PRIMARY KEY (id_correo),
    FOREIGN KEY (turista_codigo_turista) REFERENCES turista (codigo_turista)
);

CREATE TABLE vuelo (
    numero_vuelo         NUMBER NOT NULL,
    fecha_hora           TIMESTAMP NOT NULL,
    origen               VARCHAR2(150 CHAR) NOT NULL,
    destino              VARCHAR2(100 CHAR) NOT NULL,
    plazas_totales       NUMBER NOT NULL,
    plazas_clase_turista NUMBER NOT NULL,
    nombre_empresa       VARCHAR2(150 CHAR) NOT NULL,
    PRIMARY KEY (numero_vuelo)
);

CREATE TABLE turista_sucursal (
    codigo_turista_sucursal  NUMBER NOT NULL,
    sucursal_codigo_sucursal NUMBER,
    turista_codigo_turista   NUMBER NOT NULL,
    PRIMARY KEY (codigo_turista_sucursal),
    FOREIGN KEY (sucursal_codigo_sucursal) REFERENCES sucursal (codigo_sucursal),
    FOREIGN KEY (turista_codigo_turista) REFERENCES turista (codigo_turista)
);
