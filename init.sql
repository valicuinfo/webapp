
-- Creare tabele
CREATE TABLE subunitati (
    id INT AUTO_INCREMENT PRIMARY KEY,
    denumire VARCHAR(255) NOT NULL,
    cod_slug VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE clase (
    id INT AUTO_INCREMENT PRIMARY KEY,
    denumire VARCHAR(50) NOT NULL
);
CREATE TABLE scoli (
    id INT AUTO_INCREMENT PRIMARY KEY,
    denumire VARCHAR(255) NOT NULL
);
CREATE TABLE cercuri (
    id INT AUTO_INCREMENT PRIMARY KEY,
    denumire VARCHAR(255) NOT NULL,
    subunitate_id INT,
    limita INT DEFAULT 0,
    activ BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (subunitate_id) REFERENCES subunitati(id)
);
CREATE TABLE inscrieri (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subunitate_id INT,
    nume_elev VARCHAR(255),
    cnp VARCHAR(13),
    clasa_id INT,
    scoala_id INT,
    nume_parinte VARCHAR(255),
    sex ENUM('masculin','feminin'),
    adresa TEXT,
    telefon VARCHAR(20),
    data_inscriere TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (subunitate_id) REFERENCES subunitati(id),
    FOREIGN KEY (clasa_id) REFERENCES clase(id),
    FOREIGN KEY (scoala_id) REFERENCES scoli(id)
);
CREATE TABLE inscriere_cerc (
    id INT AUTO_INCREMENT PRIMARY KEY,
    inscriere_id INT,
    cerc_id INT,
    FOREIGN KEY (inscriere_id) REFERENCES inscrieri(id),
    FOREIGN KEY (cerc_id) REFERENCES cercuri(id)
);
INSERT INTO subunitati (denumire, cod_slug) VALUES
('Palatul Copiilor TÂRGU-JIU', 'targu-jiu'),
('Clubul Copiilor MOTRU', 'motru'),
('Clubul Copiilor TÂRGU-CĂRBUNEȘTI', 'targu-carbunesti'),
('Clubul Copiilor ROVINARI', 'rovinari'),
('Clubul Copiilor BUMBEȘTI-JIU', 'bumbesti-jiu'),
('Clubul Copiilor NOVACI', 'novaci');
