-- Afegir Usuaris de test
INSERT INTO usuaris (nom, cognom, nom_usuari, rol, contrasenya)
VALUES 
    ('Joan', 'Garcia', 'joangarcia', 'usuari', 'password123'),
    ('Maria', 'Lopez', 'marialopez', 'administrador', 'adminpass456'),
    ('Pere', 'Sánchez', 'peresanchez', 'usuari', 'mypassword789');

-- Afegir Materials de test
-- ::::::::::::::::::::::::::::::::: Dades de Prova  ::::::::::::::::::::::::::::::::::::::::::::::
-- Afegir Usuaris de test
INSERT INTO usuaris (nom, cognom, nom_usuari, rol, contrasenya)
VALUES 
    ('Joan', 'Garcia', 'joangarcia', 'user', 'password123','test@test.cat'),
    ('Maria', 'Lopez', 'marialopez', 'admin', 'adminpass456','test@test.cat'),
    ('Pere', 'Sánchez', 'peresanchez', 'user', 'mypassword789','test@test.cat');

-- Afegir Materials de test
INSERT INTO Material (nom, descripcio, proveidor)
VALUES 
    ('Plata', 'Material metàl·lic preciós', 'Proveïdor A'),
    ('Oro', 'Material metàl·lic preciós de color daurat', 'Proveïdor B'),
    ('Acetat', 'Material sintètic per a peces personalitzades', 'Proveïdor C');

-- Afegir Colors de test
INSERT INTO Color (nom, descripcio, valorHex)
VALUES 
    ('Vermell', 'Color vermell brillant', 'FF0000'),
    ('Blau', 'Color blau cel', '0000FF'),
    ('Negre', 'Color negre intens', '000000');

-- Afegir Polseres Generiques de test
INSERT INTO Polseres_generiques (nom_polsera, descripcio, id_usuari)
VALUES 
    ('Polsera Minimalista', 'Polsera de disseny senzill per a tots els dies', 1),
    ('Polsera Clàssica', 'Polsera elegant amb material d’alta qualitat', 2);

-- Afegir Polseres Personalitzades de test
INSERT INTO Polseres_personalitzades (nom_polsera, descripcio, id_usuari, wishlist)
VALUES 
    ('Polsera Estiu', 'Polsera personalitzada amb disseny tropical', 1, TRUE),
    ('Polsera de Festa', 'Polsera brillant per a esdeveniments', 2, FALSE);

-- Afegir Peces de test
INSERT INTO Peces (material, color, disponible)
VALUES 
    (1, 1, TRUE),  -- Plata + Vermell
    (2, 2, TRUE),  -- Oro + Blau
    (3, 3, FALSE); -- Acetat + Negre

-- Afegir Peces a Polseres Personalitzades
INSERT INTO Polsera_personalitzada_peces (id_polsera_personalitzada, id_peça, posicio)
VALUES 
    (1, 1, 1),  -- Polsera Estiu, Peça 1, Posició 1
    (2, 2, 1);  -- Polsera de Festa, Peça 2, Posició 1

-- Afegir Peces a Polseres Generiques
INSERT INTO Polsera_generica_peces (id_polsera_generica, id_peça, posicio)
VALUES 
    (1, 1, 1),  -- Polsera Minimalista, Peça 1, Posició 1
    (2, 3, 1);  -- Polsera Clàssica, Peça 3, Posició 1
    
