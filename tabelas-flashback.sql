CREATE DATABASE flashback;

USE flashback;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    sobrenome VARCHAR(45),
    email VARCHAR(45), CONSTRAINT chkEmail CHECK (LOCATE('@', email) > 0),
    senha VARCHAR(45),
    dataCadastro DATE
);

CREATE TABLE musica (
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(45),
    artista VARCHAR(45),
    album VARCHAR(45),
    estilo VARCHAR(45),
    tipo VARCHAR(45), CONSTRAINT chkTipo CHECK (tipo IN('Nacional', 'Internacional')),
    ano CHAR(4)
);

CREATE TABLE playlist (
	fkUsuario INT,
    fkMusica INT,
    dataPlaylist DATE,
    PRIMARY KEY (fkUsuario, fkMusica),
    CONSTRAINT fkUsuarioPlaylist FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fkMusicaPlaylist FOREIGN KEY (fkMusica) REFERENCES musica(idMusica)
);