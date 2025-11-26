## Projeto: Integração Azure MySQL com Power BI

*Descrição do Projeto

Este projeto teve como objetivo a integração de uma instância MySQL hospedada no Azure com o Power BI, além da transformação e análise de dados de uma base de dados de exemplo disponível no GitHub.

O desafio envolveu criação de banco, conexão com Power BI e aplicação de boas práticas de ETL para transformar a base em um formato adequado para análises.
Etapas do Projeto

1. Criação da instância no Azure

Não consegui criar uma instância no Azure, devido ao seguinte erro:

<img width="1604" height="774" alt="image" src="https://github.com/user-attachments/assets/dd4bffea-73d9-459c-977c-0853ad1bb723" />

        Para dar andamento ao projeto criei a Base de Dados diretamente no mySQL.

2. Criação do banco de dados

A base de dados foi criada com base nos dados disponíveis no repositório do GitHub da professora Juliana, contendo tabelas como:

<img width="477" height="161" alt="mysql image" src="https://github.com/user-attachments/assets/20c4b10c-e8ba-4c55-825c-2e8e09582f9a" />


3. Integração do Power BI com MySQL.

Foi realizada a conexão do Power BI a base de dados do mySQL.

4. Transformação de dados

Através do PowerQuery no PowerBI foi realizado a transformação dos dados.

    1 - Modificado cabeçalhos e excluído colunas;
    
    Coluna "Salário" na tabela employee foi modificada para "Decimal fixo";

    Verificação de nulos
        Analisados os campos com valores nulos.
        O campo Super_ssn possui valores nulos para colaboradores que são gerentes (ex.: James).

    Departamentos sem gerente
        Foi verificado que todos os departamentos possuem gerente, portanto nenhuma lacuna foi encontrada.

    Número de horas dos projetos
        A coluna Hours da tabela works_on já estava em formato decimal. Mantida como está.

    Separação de colunas complexas
        A coluna Address da tabela employee foi separada em:
            Number (número do endereço)
            Street (rua)
            City (cidade)
            UF (estado)
        Ajustes realizados para cidades com nomes compostos (ex.: Oak Humble) e correção de UF.

    Mescla de consultas employee e departament
        Criada a tabela employee_department no Power BI, relacionando colaboradores ao nome do departamento.
        Tipo de junção utilizada: Externa esquerda (Left Join).

    Junção com nomes dos gerentes
        Utilizando a tabela employee_department, foi possível associar cada colaborador ao nome completo do gerente.
        Observação: o nome completo incluiu o Minit entre nome e sobrenome.

    Mescla de colunas Nome e Sobrenome
        Criada a coluna Full Name unindo Fname, Minit e Lname.

    Mescla de departamentos e localização
        Criada tabela dep_location com combinação única de Department e Location.
        Query SQL utilizada no Power BI:

SELECT 
    d.Dname,
    l.Dlocation,
    CONCAT(d.Dname, ' - ', l.Dlocation) AS Department_Location
FROM dept_locations l
JOIN departament d
    ON l.Dnumber = d.Dnumber;

Tecnologias Utilizadas

    Azure Database for MySQL – Hospedagem do banco de dados na nuvem.
    MySQL – Sistema de gerenciamento do banco de dados relacional.
    Power BI – Conexão com o banco e transformação/análise de dados.
    SQL – Criação de consultas para extração e manipulação dos dados.
    ETL (Extract, Transform, Load) – Processos de limpeza, transformação e modelagem de dados no Power BI.
