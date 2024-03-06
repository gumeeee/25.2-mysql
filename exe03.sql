CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50),
    descricao_categoria VARCHAR(255)
);

CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    descricao_produto VARCHAR(255),
    preco_produto DECIMAL(10, 2),
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES 
('Medicamentos', 'Produtos relacionados à saúde e tratamentos médicos'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais');

INSERT INTO tb_produtos (nome_produto, descricao_produto, preco_produto, id_categoria) VALUES
('Analgesico X', 'Alivia dores leves a moderadas', 10.50, 1),
('Creme Hidratante Y', 'Hidratação profunda para a pele', 25.90, 2),
('Shampoo Z', 'Limpeza e cuidado para os cabelos', 8.75, 2),
('Vitaminas ABC', 'Suplemento vitamínico', 60.00, 1),
('Creme Facial Anti-idade', 'Reduz rugas e linhas de expressão', 75.50, 2),
('Sabonete Liquido', 'Limpeza suave para a pele', 5.99, 2),
('Anti-inflamatório A', 'Reduz a inflamação e dor', 45.00, 1),
('Perfume Floral', 'Fragrância delicada e floral', 85.00, 2);

SELECT * FROM tb_produtos WHERE preco_produto > 50.00;

SELECT * FROM tb_produtos WHERE preco_produto BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT tb_produtos.*, tb_categorias.* 
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.nome_categoria 
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome_categoria = 'Cosméticos';
