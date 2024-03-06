create database db_generation_game_online;

use db_generation_game_online;

create table tb_classes (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL,
    tipo_classe VARCHAR(50) NOT NULL
);

INSERT INTO tb_classes(nome_classe, tipo_classe) VALUES
('Arqueiro', 'Longo alcance'),
('Mago', 'Magia'),
('Paladino', 'Suporte/Tank'),
('Guerreiro', 'Curto alcance'),
('Assasino', 'Furtividade');

create table tb_personagens (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    poder_defesa INT,
    poder_ataque INT,
    id_classe INT,
    foreign key (id_classe) references tb_classes(id)
);

INSERT INTO tb_personagens (nome, poder_defesa, poder_ataque, id_classe) VALUES
('Ashe', 1200, 2500, 1),
('Ryze', 1300, 2800, 2),
('Taric', 2500, 2000, 3),
('Garen', 1800, 2300, 4),
('Talon', 1200, 2700, 5),
('Corki', 1400, 2200, 1),
('Poppy', 2800, 1800, 3),
('Veigar', 1100, 2900, 2);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa > 1000 AND poder_defesa < 2000;

SELECT * FROM tb_personagens WHERE nome LIKE '%C%';
SELECT tb_personagens.nome, tb_personagens.poder_ataque, tb_personagens.poder_defesa, tb_classes.class_name 
FROM tb_personagens 
INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id;

SELECT tb_personagens.nome, tb_personagens.poder_ataque, tb_personagens.poder_defesa, tb_classes.nome_classe 
FROM tb_personagens 
INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id;

SELECT tb_personagens.nome, tb_personagens.poder_ataque, tb_personagens.poder_defesa, tb_classes.nome_classe 
FROM tb_personagens 
INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id 
WHERE tb_classes.nome_classe = 'Arqueiro';
