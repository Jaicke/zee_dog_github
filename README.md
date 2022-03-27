
# Zee.Dog - Github API

[![CI](https://github.com/Jaicke/zee_dog_github/actions/workflows/ci_cd.yml/badge.svg?branch=main)](https://github.com/Jaicke/zee_dog_github/actions/workflows/ci_cd.yml)

## Aplicação
Aplicação desenvolvida com a finalidade de consumir a [API de busca de repositórios do Github](https://docs.github.com/en/rest/reference/search#search-repositories), possibilitando utilizar todos os filtros disponibilizados.

### Requisitos

- [x]  Autenticação via JWT;
- [x]  Listagem de todos os repositórios públicos;

#### Busca de repositórios possibilitando:
- [x]  Termo de busca textual (texto livre a ser pesquisado);
- [x]  Buscar por linguagem específica (valor padrão ‘​ruby’)​ ;
- [x]  Buscar por repositórios de um usuário;
- [x]  Ordenar via quantidade de estrelas de um repositório;
- [x]  Ordenar via quantidade de forks de um repositório;
- [x]  Ordenar via data de atualização;
- [x]  Permitir ordenação ascendente e descendente;

#### Repositórios devem conter:
- [x]  Nome completo;
- [x]  Descrição;
- [x]  Quantidade de estrelas;
- [x]  Quantidade de forks;
- [X]  Nome do autor;

#### Resposta
- [x]  A resposta das requisições deve ser paginada.

## Ferramentas utilizadas

- [Docker](https://www.docker.com/)
- [Docker Compose](https://github.com/docker/compose)
- [Github Actions](https://github.com/features/actions)
- [Heroku](https://www.heroku.com/)
- [JWT](https://jwt.io/)
- [Postman](https://www.postman.com/)

## Documentação
Veja [documentação](https://documenter.getpostman.com/view/8728434/UVyn2JZN#intro) para informações de funcionamento.

## Testando aplicação

### Pré-requisitos
- Docker instalado, veja como instalar [aqui](https://docs.docker.com/).
- Docker compose instalado, veja como instalar [aqui](https://docs.docker.com/compose/install/).

### Preparando aplicação

- ``` docker-compose build ```
- ``` docker-compose up```
- ``` docker-compose exec web rails db:create ```
- ``` docker-compose exec web rails db:migrate ```

### Executando testes

- ``` docker-compose run web rspec ```

### Executando servidor da aplicação

- ``` docker-compose up ```

Dessa forma é possivel acessar a aplicação em ```localhost:3000```
