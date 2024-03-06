CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50),
    descricao_categoria VARCHAR(255)
);

CREATE TABLE tb_pizzas (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(255),
    descricao_pizza VARCHAR(255),
    preco DECIMAL(10, 2),
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Salgada', 'Pizza com recheio salgado'),
('Vegetariana', 'Pizza que não envolva carne e com ingredientes para o paladar vegetariano'),
('Doce', 'Pizza com recheio doce'),
('Especial', 'Pizzas exclusiva com ingredientes únicos'),
('à Escolha do Chefe', 'Você montara sua pizza de acordo com o que falar para o chefe');

INSERT INTO tb_pizzas (nome_pizza, descricao_pizza, preco, id_categoria) VALUES
('Pizza de Mussarela', 'Pizza tradicional de mussarela', 40.00, 1),
('Pizza de Calabresa', 'Pizza tradicional de mussarela', 40.00, 1),
('Pizza de Chocolate', 'Pizza doce com cobertura de chocolate', 55.00, 3),
('Pizza Vegetariana', 'Pizza com diversos vegetais, vegetariana da sua massa até cobertura', 45.0, 2),
('Pizza Especial da Casa', 'Pizza Exclusiva da pizzaria generation com ingredientes únicos!!', 60.00, 4),
('Pizza Quatro Queijos', 'Pizza com quatro tipos de queijo', 50.00, 1),
('Pizza de Frango com Catupiry', 'Pizza com frango desfiado e catupiry', 46.50, 1),
('Pizza de Cheese Cake', 'Pizza com ingredientes de um cheese cake', 59.00, 3);

SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco > 50.00 AND preco < 100;

SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

SELECT tb_pizzas.*, tb_categorias.nome_categoria 
FROM tb_pizzas 
INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id;

