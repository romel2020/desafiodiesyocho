Rails.application.routes.draw do
  devise_for :users
  get  'tasks/index'
  get  'todos', to: 'todos#index'
  get 'todos/:id', to: "todos#show", as:'show_todo'
  patch 'todos/:id', to: "todos#update", as:"update_todos"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#index'
  
end
