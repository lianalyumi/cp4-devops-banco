-- ===================================================================
-- Script de criação das tabelas CORE (CP4) + dados de exemplo
-- MySQL — usado pelo Dockerfile.mysql via docker-entrypoint-initdb.d
-- ===================================================================

CREATE TABLE responsavel (
  id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador do responsável',
  nome VARCHAR(100) NOT NULL COMMENT 'Nome completo do responsável',
  cpf VARCHAR(11) NOT NULL UNIQUE COMMENT 'CPF do responsável, sem pontuação',
  telefone VARCHAR(15) NOT NULL COMMENT 'Telefone de contato'
);

CREATE TABLE animal (
  id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador do animal',
  nome VARCHAR(50) NOT NULL COMMENT 'Nome do animal',
  especie VARCHAR(50) NOT NULL COMMENT 'Espécie do animal',
  raca VARCHAR(50) NOT NULL COMMENT 'Raça do animal',
  peso DECIMAL(5,2) NOT NULL COMMENT 'Peso do animal em kg',
  data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do animal',
  microchip VARCHAR(30) COMMENT 'Número do microchip, se houver',
  rg VARCHAR(20) COMMENT 'RG do animal, se houver',
  responsavel_id BIGINT NOT NULL COMMENT 'Responsável pelo animal (FK)',
  CONSTRAINT fk_animal_responsavel FOREIGN KEY (responsavel_id) REFERENCES responsavel(id)
);

-- ===================================================================
-- Dados de exemplo (requisito: pelo menos 2 linhas significativas)
-- ===================================================================

INSERT INTO responsavel (nome, cpf, telefone) VALUES ('Maria Silva', '11144477735', '11987654321');
INSERT INTO responsavel (nome, cpf, telefone) VALUES ('Joao Souza', '52998224725', '11912345678');

INSERT INTO animal (nome, especie, raca, peso, data_nascimento, microchip, rg, responsavel_id)
VALUES ('Rex', 'cachorro', 'Labrador', 22.50, '2020-05-10', '5482', '12442500', 1);

INSERT INTO animal (nome, especie, raca, peso, data_nascimento, microchip, rg, responsavel_id)
VALUES ('Mia', 'gato', 'Siames', 4.20, '2021-08-22',  '6958', '69857423', 2);
