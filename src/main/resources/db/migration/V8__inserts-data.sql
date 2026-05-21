-- ============================================================
--  SEED DATA - Banco de Dados
--  Gerado automaticamente com base nas migrations V1-V7
-- ============================================================

-- ============================================================
-- CATEGORIAS (4)
-- ============================================================
INSERT INTO categorias (id, nome) VALUES
(1, 'Eletrônicos'),
(2, 'Roupas e Acessórios'),
(3, 'Casa e Decoração'),
(4, 'Esportes e Lazer');


-- ============================================================
-- USUÁRIOS (6)
-- ============================================================
INSERT INTO usuarios (id, nome, email) VALUES
(1, 'Ana Paula Ferreira',    'ana.ferreira@email.com'),
(2, 'Carlos Eduardo Souza',  'carlos.souza@email.com'),
(3, 'Mariana Lima',          'mariana.lima@email.com'),
(4, 'Rafael Oliveira',       'rafael.oliveira@email.com'),
(5, 'Fernanda Costa',        'fernanda.costa@email.com'),
(6, 'Lucas Mendes',          'lucas.mendes@email.com');


-- ============================================================
-- PRODUTOS (16 — 4 por categoria)
-- ============================================================
INSERT INTO produtos (id, nome, id_categoria, preco) VALUES
-- Eletrônicos
(1,  'Smartphone XPro 256GB',        1,  2499.90),
(2,  'Fone de Ouvido Bluetooth S3',  1,   349.90),
(3,  'Notebook UltraSlim 15"',       1,  4799.00),
(4,  'Smartwatch Fit Plus',          1,   899.90),

-- Roupas e Acessórios
(5,  'Jaqueta Corta-Vento Slim',     2,   259.90),
(6,  'Tênis Casual Urban Walk',      2,   319.90),
(7,  'Bolsa de Couro Feminina',      2,   489.00),
(8,  'Camiseta Dry-Fit Premium',     2,    89.90),

-- Casa e Decoração
(9,  'Luminária LED Minimalista',    3,   199.90),
(10, 'Tapete Persa Moderno 2x3m',    3,   749.00),
(11, 'Conjunto de Panelas Antiader', 3,   429.90),
(12, 'Quadro Decorativo Canvas',     3,   159.00),

-- Esportes e Lazer
(13, 'Bicicleta Speed Carbon 21v',   4,  3299.00),
(14, 'Kit Musculação Completo',      4,   899.90),
(15, 'Mochila de Trilha 40L',        4,   279.90),
(16, 'Raquete de Tênis Pro Series',  4,   349.00);


-- ============================================================
-- AVALIAÇÕES (2 por produto = 32 avaliações)
-- Usuários alternados, meses aleatórios entre jan-mai/2026
-- Comentários: positivos, neutros e negativos variados
-- ============================================================
INSERT INTO avaliacoes (id_usuario, id_produto, comentario, data) VALUES

-- Produto 1 — Smartphone XPro 256GB
(1, 1, 'Excelente smartphone! Câmera incrível, bateria dura o dia todo e o desempenho é muito superior ao que esperava. Super recomendo.', '2026-01-14'),
(3, 1, 'O produto chegou com a tela levemente arranhada. Entrei em contato com o suporte mas demorou mais de uma semana para me responder. Decepcionante para um item desse preço.', '2026-03-22'),

-- Produto 2 — Fone de Ouvido Bluetooth S3
(2, 2, 'Qualidade de som surpreendente para o preço. Cancelamento de ruído funciona bem. Chegou antes do prazo estimado, muito satisfeito.', '2026-02-08'),
(5, 2, 'O fone em si é bom, mas a qualidade do estojo deixa a desejar — o fecho já soltou com menos de 1 mês de uso. Esperava mais durabilidade por esse valor.', '2026-04-17'),

-- Produto 3 — Notebook UltraSlim 15"
(4, 3, 'Notebook rápido, leve e com ótima tela. Perfeito para trabalho e até para jogar títulos mais leves. Entrega foi pontual.', '2026-01-29'),
(6, 3, 'Pagei quase R$ 5.000 e o produto chegou sem o carregador na caixa. O suporte demorou 10 dias para resolver e ainda assim tive que ir até uma loja física. Péssima experiência.', '2026-05-03'),

-- Produto 4 — Smartwatch Fit Plus
(1, 4, 'Relógio bonito, interface fluida e monitoramento de saúde preciso. Recomendo para quem quer um smartwatch sem gastar uma fortuna.', '2026-03-11'),
(2, 4, 'Funcionalidades básicas são boas, mas o GPS demora muito para pegar sinal. Para o preço cobrado, esperava algo mais refinado. Produto mediano.', '2026-02-25'),

-- Produto 5 — Jaqueta Corta-Vento Slim
(3, 5, 'Jaqueta muito confortável, caimento perfeito e o tecido é de alta qualidade. Já usei em trilhas e funcionou muito bem contra o vento e garoa.', '2026-04-05'),
(5, 5, 'A jaqueta até parece boa, mas a entrega atrasou 12 dias além do prazo. Quando reclamei, o atendimento foi grosseiro e não ofereceu nenhuma compensação.', '2026-01-19'),

-- Produto 6 — Tênis Casual Urban Walk
(4, 6, 'Tênis leve, confortável e com visual moderno. Uso no dia a dia e ainda não apresentou nenhum problema. Chegou bem embalado e rápido.', '2026-05-12'),
(6, 6, 'O tamanho veio diferente do indicado na tabela. Pedi 42 e recebi 41. Troca demorou quase 3 semanas. Atendimento do suporte deixou muito a desejar.', '2026-03-30'),

-- Produto 7 — Bolsa de Couro Feminina
(1, 7, 'Bolsa lindíssima! O couro é genuíno, os acabamentos são impecáveis e ela é muito espaçosa. Vale cada centavo do investimento.', '2026-02-14'),
(3, 7, 'Produto bonito, mas o preço é salgado para o que entrega. A alça já começou a soltar com 3 semanas de uso. Qualidade do material não condiz com o valor cobrado.', '2026-04-28'),

-- Produto 8 — Camiseta Dry-Fit Premium
(2, 8, 'Camiseta leve, não retém suor e o tecido não perde a forma depois de várias lavagens. Ótima para treinos. Preço justo.', '2026-01-07'),
(5, 8, 'A estampa começou a descascar após a segunda lavagem. Para uma camiseta "premium", esperava durabilidade maior. Qualidade abaixo do esperado.', '2026-05-21'),

-- Produto 9 — Luminária LED Minimalista
(6, 9, 'Design elegante, iluminação suave e agradável. Montagem simples e o cabo é comprido o suficiente. Perfeita para escritório em casa.', '2026-03-16'),
(4, 9, 'A luminária funciona, mas a intensidade da luz é bem fraca comparada ao que as fotos sugerem. Produto ok, mas não é o que parece no anúncio.', '2026-02-03'),

-- Produto 10 — Tapete Persa Moderno 2x3m
(1, 10, 'Tapete maravilhoso! As cores são vibrantes, o tecido é macio e deu um charme enorme para a sala. Entrega cuidadosa, chegou enrolado e bem protegido.', '2026-04-10'),
(3, 10, 'O tapete atrasou 18 dias na entrega e chegou com um leve odor de mofo. Tive que deixar arejando por dias. Suporte não deu retorno satisfatório sobre o ocorrido.', '2026-01-25'),

-- Produto 11 — Conjunto de Panelas Antiaderente
(2, 11, 'Panelas excelentes! Distribuição de calor uniforme, antiaderência de verdade e fácil limpeza. Vale o investimento para quem cozinha bastante.', '2026-05-09'),
(6, 11, 'Duas das seis panelas vieram com o cabo torto de fábrica. O produto até cozinha bem, mas a qualidade do acabamento é inconsistente. Esperava mais capricho.', '2026-03-04'),

-- Produto 12 — Quadro Decorativo Canvas
(5, 12, 'Quadro com impressão nítida e moldura bem feita. Ficou lindo na parede da sala. Embalagem reforçada garantiu que chegasse sem danos.', '2026-02-20'),
(4, 12, 'As cores do quadro real são bem mais apagadas do que na foto do anúncio. Não é um produto ruim, mas não correspondeu à expectativa gerada. Comum mas decepcionante.', '2026-04-14'),

-- Produto 13 — Bicicleta Speed Carbon 21v
(1, 13, 'Bicicleta incrível! Câmbio preciso, quadro leve e confortável mesmo em longas pedaladas. Entrega foi rápida e a montagem inicial veio bem adiantada.', '2026-01-31'),
(3, 13, 'Para uma bike de R$ 3.299, o freio traseiro chegou descalibrado e o suporte técnico não soube me orientar sobre como ajustar. Produto bom, mas suporte péssimo.', '2026-05-15'),

-- Produto 14 — Kit Musculação Completo
(2, 14, 'Kit completo e bem dimensionado. Os anilhos são de borracha e não fazem barulho. Ótimo custo-benefício para montar uma academia em casa.', '2026-03-08'),
(6, 14, 'A barra veio com leve curvatura de fábrica. Para uso casual até dá, mas para treinos sérios seria um problema. Pelo preço cobrado, esperava controle de qualidade melhor.', '2026-02-11'),

-- Produto 15 — Mochila de Trilha 40L
(5, 15, 'Mochila resistente, com excelente sistema de encaixe nas costas. Usei em uma trilha de 3 dias e ela performou perfeitamente. Recomendo muito!', '2026-04-22'),
(4, 15, 'Produto razoável. Os zíperes já puxam com um pouco de esforço logo de início. Para uso leve é ok, mas para trilhas pesadas não me arriscaria. Qualidade mediana.', '2026-01-16'),

-- Produto 16 — Raquete de Tênis Pro Series
(1, 16, 'Raquete com ótimo equilíbrio e grip confortável. Melhorou bastante minha performance nas partidas. Chegou em ótimas condições e com capa protetora.', '2026-05-27'),
(2, 16, 'O preço está acima do mercado para as especificações entregues. Raquetes similares de outras marcas custam menos e têm qualidade equivalente. Não voltaria a comprar.', '2026-03-19');
