CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50),
    descricao_categoria VARCHAR(255)
);

CREATE TABLE tb_cursos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100),
    descricao_curso VARCHAR(255),
    preco_curso DECIMAL(10, 2),
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES 
('Programação', 'Cursos relacionados a programação de software'),
('Design', 'Cursos relacionados a design digital');

INSERT INTO tb_cursos (nome_curso, descricao_curso, preco_curso, id_categoria) VALUES
('Curso de Python', 'Aprenda Python do básico ao avançado', 699.99, 1),
('Curso de Web Design', 'Desenvolva habilidades em design web', 799.00, 2),
('Curso de Java', 'Domine a linguagem de programação Java', 899.50, 1),
('Curso de UI/UX Design', 'Aprenda a criar interfaces de usuário intuitivas', 650.00, 2),
('Curso de JavaScript', 'Aprenda JavaScript para desenvolvimento web', 550.00, 1),
('Curso de Photoshop', 'Aprenda técnicas avançadas de edição de imagem', 999.99, 2),
('Curso de React.js', 'Construa aplicações web com React.js', 750.00, 1),
('Curso de Illustrator', 'Domine a criação de ilustrações digitais', 899.00, 2);

SELECT * FROM tb_cursos WHERE preco_curso > 500.00;

SELECT * FROM tb_cursos WHERE preco_curso BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome_curso LIKE '%J%';

SELECT tb_cursos.*, tb_categorias.nome_categoria 
FROM tb_cursos 
INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id;

SELECT tb_cursos.*, tb_categorias.nome_categoria 
FROM tb_cursos 
INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome_categoria = 'Programação';