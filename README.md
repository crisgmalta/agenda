# Versão Ruby
* ruby 2.6.3

# Banco de Dados
* Sqlite3

# Passos para instalação do projeto
Para configuar este projeto clone este repositorio e execute
* bundle install 
* rails db:create
* rails db:migrate 
* rails db:seed
* rake webpacker:install 
* rails s (projeto disponível na porta 3000)


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



