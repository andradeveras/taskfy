# README

Task Manager

Este é um projeto simples de gerenciamento de tarefas utilizando Ruby on Rails, Hotwire (Turbo Streams) e TailWind.

Funcionalidades
  Criar, editar e excluir tarefas
  Marcar tarefas como concluídas ou pendentes
  Interface dinâmica com Turbo Frames e Turbo Streams para atualização em tempo real

Tecnologias Utilizadas

  Ruby on Rails (Backend e Views)
  Turbo (Hotwire) para interação dinâmica
  TailwindCSS para estilização

Instale as dependências:

bundle install
yarn install

Configure o banco de dados:
  rails db:create db:migrate

Inicie o servidor:
  rails server

Uso

Para adicionar uma nova tarefa, acesse http://localhost:3000/tasks, insira a descrição e clique em "Criar".
Para marcar uma tarefa como concluída, basta clicar no checkbox ao lado da descrição. A tarefa será automaticamente atualizada usando Turbo Streams.

Estrutura do Código
  Controllers:
    TasksController gerencia a lógica de criação, edição e marcação de tarefas.

Views:
  tasks/index.html.erb exibe a lista de tarefas.
  tasks/_task.html.erb renderiza cada tarefa individualmente dentro de um Turbo Frame.

Contribuição
  Sinta-se à vontade para contribuir! Abra um pull request ou relate um problema.

