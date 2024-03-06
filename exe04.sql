CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255)
);

CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produtos VARCHAR(100),
    descricao_produto VARCHAR(255),
    preco_produto DECIMAL(10, 2),
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES 
('Carnes Bovinas', 'Produtos relacionados à carne bovina'),
('Carnes Suínas', 'Produtos relacionados à carne suína');

INSERT INTO tb_produtos (nome_produtos, descricao_produto, preco_produto, id_categoria) VALUES
('Picanha', 'Corte nobre de carne bovina', 89.99, 1),
('Costela de Porco', 'Costela suína temperada', 55.00, 2),
('Filé Mignon', 'Corte nobre de carne bovina', 120.00, 1),
('Linguiça Toscana', 'Linguiça suína temperada', 35.50, 2),
('Alcatra', 'Corte de carne bovina macio', 75.00, 1),
('Paleta Suína', 'Carne suína para assar', 42.00, 2),
('Contrafilé', 'Corte de carne bovina para churrasco', 65.00, 1),
('Pernil de Porco', 'Pernil suíno para assar', 49.90, 2);

SELECT * FROM tb_produtos WHERE preco_produto > 50.00;

SELECT * FROM tb_produtos WHERE preco_produto BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome_produtos LIKE '%C%';

SELECT tb_produtos.*, tb_categorias.nome_categoria
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.nome_categoria
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome_categoria IN ('Carnes Suínas', 'Carnes Bovinas')

