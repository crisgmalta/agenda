# Versão Ruby
* 2.6.3

# Versão Nodejs
* v10.21.0

# Banco de Dados
* Sqlite3

# Passos para instalação do projeto
Para configuar este projeto clone este repositorio e execute
* bundle install
* yarn install --check-files
* bundle exec rails db:create
* bundle exec rails db:migrate
* bundle exec rails db:seed
* bundle exec rails s (projeto disponível em http://localhost:3000)

Crie o seu usuário clicando no link "Sign up" e faça o login

# Como executar testes
* rake spec
* rspec spec/controllers
* rspec spec/models


## CLIENTES

#### listar todos os clientes:
http://localhost:3000

#### adicionar novo cliente:
http://localhost:3000/clients/new

#### editar cliente:
http://localhost:3000/clients/id_cliente/edit

#### deletar comentario
http://localhost:3000/clients/id_cliente


## CONTATOS


#### listar todos os contato do cliente:
http://localhost:3000/clients/id_cliente/contacts
ou
cliclar no link "Contatos" na tela principal de Clientes


#### adicionar novo contato:
http://localhost:3000/clients/id_cliente/contacts/new

#### editar contato:
http://localhost:3000/clients/id_cliente/contacts/id_contato/edit

#### deletar contato:
http://localhost:3000/clients/id_cliente/contacts/id_contato


## USERS

Login
http://localhost:3000/users/sign_in



### REPORT

# Como gerar relatório Clientes e Contatos
http://localhost:3000/clients/report
