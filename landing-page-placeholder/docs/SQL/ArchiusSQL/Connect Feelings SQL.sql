create database ConnectFeelings;
use ConnectFeelings;
-- ::::::::::::::::::::::::::::::::: Usuaris ::::::::::::::::::::::::::::::::::::::::::::::
Create table usuaris(
	id_usuari INT AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(100),
	cognom VARCHAR(100),
	nom_usuari VARCHAR(100) NOT NULL,
	rol VARCHAR(10) DEFAULT 'user',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	contrasenya VARCHAR(255),
    correu VARCHAR(255),
    CONSTRAINT verificar_correu CHECK (
        correu REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    )
);
-- ::::::::::::::::::::::::::::::::: Polseres ::::::::::::::::::::::::::::::::::::::::::::::
Create table Polseres_generiques(
	id_polsera INT AUTO_INCREMENT PRIMARY KEY,
	nom_polsera VARCHAR(100),
    descripcio TEXT,
    id_usuari INT
);

Create table Polseres_personalitzades(
	id_polsera INT AUTO_INCREMENT PRIMARY KEY,
	nom_polsera VARCHAR(100),
    descripcio TEXT,
    id_usuari INT,
    wishlist BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuari) REFERENCES usuaris(id_usuari)  -- CORRECTE: canviat "usaris" per "usuaris"
);

-- ::::::::::::::::::::::::::::::::: Material i Colors ::::::::::::::::::::::::::::::::::::::::::::::
create table Material(
	id_Material INT AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(100),
	descripcio VARCHAR(255),
	proveidor VARCHAR(255)
);

create table Color(
	id_Color INT AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(100),
	descripcio VARCHAR(255),
	valorHex VARCHAR(6)
);


-- ::::::::::::::::::::::::::::::::: Peces ::::::::::::::::::::::::::::::::::::::::::::::
Create table Peces(
	id_peça INT AUTO_INCREMENT PRIMARY KEY,
    material INT,
    color INT,
    disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (material) REFERENCES Material(id_Material),
    FOREIGN KEY (color) REFERENCES Color(id_Color)
);


-- ::::::::::::::::::::::::::::::::: Unio entre Polseres i Peces ::::::::::::::::::::::::::::::::::::::::::::::
create table Polsera_personalitzada_peces(
	id_Peça_Polsera INT AUTO_INCREMENT PRIMARY KEY,
	id_polsera_personalitzada INT,
	id_peça INT,
	posicio INT,
    CONSTRAINT chk_valor_max_20 CHECK (posicio <= 20),
    FOREIGN KEY (id_polsera_personalitzada) REFERENCES Polseres_personalitzades(id_polsera),
    FOREIGN KEY (id_peça) REFERENCES Peces(id_peça)
);

create table Polsera_generica_peces(
	id_Peça_Polsera INT AUTO_INCREMENT PRIMARY KEY,
	id_polsera_generica INT,
	id_peça INT,
	posicio INT,
    FOREIGN KEY (id_polsera_generica) REFERENCES Polseres_generiques(id_polsera),
    FOREIGN KEY (id_peça) REFERENCES Peces(id_peça)
);

-- ::::::::::::::::::::::::::::::::: Fi SQL Actual ::::::::::::::::::::::::::::::::::::::::::::::



-- ::::::::::::::::::::::::::::::::: Unio entre Polseres i Peces ::::::::::::::::::::::::::::::::::::::::::::::
create table Polsera_personalitzada_peces(
	id_Peça_Polsera INT AUTO_INCREMENT PRIMARY KEY,
	id_polsera_personalitzada INT,
	id_peça INT,
	posicio INT,
    FOREIGN KEY (id_polsera_personalitzada) REFERENCES Polseres_personalitzades(id_polsera),
    FOREIGN KEY (id_peça) REFERENCES Peces(id_peça)
);

create table Polsera_generica_peces(
	id_Peça_Polsera INT AUTO_INCREMENT PRIMARY KEY,
	id_polsera_generica INT,
	id_peça INT,
	posicio INT,
    FOREIGN KEY (id_polsera_generica) REFERENCES Polseres_generiques(id_polsera),
    FOREIGN KEY (id_peça) REFERENCES Peces(id_peça)
);

-- ::::::::::::::::::::::::::::::::: Fi SQL Actual ::::::::::::::::::::::::::::::::::::::::::::::
