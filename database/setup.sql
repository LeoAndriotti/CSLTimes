-- CSL Times - schema e dados iniciais
-- Banco: bdcrud (configurado em classes/BancoDeDados.php)

CREATE DATABASE IF NOT EXISTS bdcrud
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE bdcrud;

-- Profissões (papéis dos usuários)
CREATE TABLE IF NOT EXISTS profissao (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Categorias de notícias
CREATE TABLE IF NOT EXISTS categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Usuários
CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  sexo ENUM('M', 'F', 'Outro') NOT NULL DEFAULT 'Outro',
  fone VARCHAR(20) DEFAULT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  senha VARCHAR(255) NOT NULL,
  profissao INT NOT NULL,
  CONSTRAINT fk_usuario_profissao FOREIGN KEY (profissao) REFERENCES profissao(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Notícias
CREATE TABLE IF NOT EXISTS noticias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  noticia TEXT NOT NULL,
  data DATE NOT NULL,
  autor INT NOT NULL,
  categoria INT NOT NULL,
  imagem VARCHAR(500) DEFAULT NULL,
  CONSTRAINT fk_noticia_autor FOREIGN KEY (autor) REFERENCES usuarios(id) ON DELETE CASCADE,
  CONSTRAINT fk_noticia_categoria FOREIGN KEY (categoria) REFERENCES categorias(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Anúncios
CREATE TABLE IF NOT EXISTS anuncios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  imagem VARCHAR(500) DEFAULT NULL,
  link VARCHAR(500) DEFAULT NULL,
  ativo TINYINT(1) NOT NULL DEFAULT 1,
  destaque TINYINT(1) NOT NULL DEFAULT 0,
  dataCadastro DATE NOT NULL,
  valorAnuncio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  texto TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dados iniciais: profissões
INSERT INTO profissao (id, nome) VALUES
  (1, 'Jornalista'),
  (2, 'Anunciante'),
  (3, 'Leitor')
ON DUPLICATE KEY UPDATE nome = VALUES(nome);

-- Categorias
INSERT INTO categorias (id, nome) VALUES
  (1, 'Tecnologia'),
  (2, 'Esportes'),
  (3, 'Política'),
  (4, 'Entretenimento'),
  (5, 'Economia')
ON DUPLICATE KEY UPDATE nome = VALUES(nome);

-- Usuários de demonstração (senha: 123456)
INSERT INTO usuarios (id, nome, sexo, fone, email, senha, profissao) VALUES
  (1, 'Admin Jornalista', 'M', '(11) 99999-0001', 'jornalista@csltimes.local',
   '$2y$10$1SSsXOMIPLS9yvuLhDhFBeBTizFWGSkYUeSdo9hWc2bSCSdhHc76C', 1),
  (2, 'Empresa Anunciante', 'F', '(11) 99999-0002', 'anunciante@csltimes.local',
   '$2y$10$1SSsXOMIPLS9yvuLhDhFBeBTizFWGSkYUeSdo9hWc2bSCSdhHc76C', 2),
  (3, 'Visitante Leitor', 'M', '(11) 99999-0003', 'leitor@csltimes.local',
   '$2y$10$1SSsXOMIPLS9yvuLhDhFBeBTizFWGSkYUeSdo9hWc2bSCSdhHc76C', 3)
ON DUPLICATE KEY UPDATE nome = VALUES(nome);

-- Notícias de exemplo
INSERT INTO noticias (id, titulo, noticia, data, autor, categoria, imagem) VALUES
  (1, 'CSL Times está no ar',
   'O portal de notícias CSL Times foi configurado com sucesso. Explore as categorias, faça login e publique suas próprias notícias.',
   CURDATE(), 1, 1, 'https://picsum.photos/seed/csl1/800/450'),
  (2, 'Tecnologia transforma o jornalismo digital',
   'Ferramentas de IA e plataformas colaborativas estão mudando a forma como notícias são produzidas e distribuídas na web.',
   CURDATE(), 1, 1, 'https://picsum.photos/seed/csl2/800/450'),
  (3, 'Campeonato regional define finalistas',
   'Times da região se enfrentam neste fim de semana em partidas decisivas para a grande final do torneio.',
   CURDATE(), 1, 2, 'https://picsum.photos/seed/csl3/800/450')
ON DUPLICATE KEY UPDATE titulo = VALUES(titulo);

-- Anúncios de exemplo
INSERT INTO anuncios (id, nome, imagem, link, ativo, destaque, dataCadastro, valorAnuncio, texto) VALUES
  (1, 'Empresa Anunciante', 'https://picsum.photos/seed/ad1/400/200',
   'https://example.com', 1, 1, CURDATE(), 500.00, 'Anúncio em destaque do CSL Times'),
  (2, 'Empresa Anunciante', 'https://picsum.photos/seed/ad2/400/200',
   'https://example.com', 1, 0, CURDATE(), 250.00, 'Segundo banner promocional')
ON DUPLICATE KEY UPDATE nome = VALUES(nome);
