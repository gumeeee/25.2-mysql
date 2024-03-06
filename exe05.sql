CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50),
    descricao_categoria VARCHAR(250)
);

CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome_produto VARCHAR(100),
    descricao_produto VARCHAR(255),
    preco_produto DECIMAL(10, 2),
    id_categoria BIGINT,
    foreign key (id_categoria) references tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES 
('Ferramentas', 'Produtos relacionados a ferramentas para construção'),
('Hidráulica', 'Produtos relacionados a materiais hidráulicos');


INSERT INTO tb_produtos (nome_produto, descricao_produto, preco_produto, id_categoria) VALUES
('Martelo', 'Ferramenta para bater pregos', 25.99, 1),
('Chave de Fenda', 'Ferramenta para apertar parafusos', 15.50, 1),
('Vaso Sanitário', 'Vaso sanitário com caixa acoplada', 120.00, 2),
('Fita Isolante', 'Fita adesiva para isolamento elétrico', 5.99, 1),
('Pia de Cozinha', 'Pia de cozinha em aço inox', 250.00, 2),
('Serra Elétrica', 'Serra elétrica para cortes precisos', 180.00, 1),
('Conjunto de Torneiras', 'Torneiras para cozinha e banheiro', 90.00, 2),
('Broca para Concreto', 'Broca para perfuração em concreto', 12.99, 1);

SELECT * FROM tb_produtos WHERE preco_produto > 100.00;

SELECT * FROM tb_produtos WHERE preco_produto BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';


SELECT tb_produtos.*, tb_categorias.nome_categoria 
FROM tb_produtos 
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id;

SELECT tb_produtos.*, tb_categorias.nome_categoria 
FROM tb_produtos 
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome_categoria = 'Hidráulica';
