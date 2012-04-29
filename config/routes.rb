Blog::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  # Define rotas do devise para o recurso users
  devise_for :users

  # Redireciona as actions login e logut para as devidas actions do Devise
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end

  # Outras opções para autenticação com Devise
  #devise_for :admin_users, ActiveAdmin::Devise.config, ActiveAdmin::Devise.config

  # Bloco de definição de rotas para o recurso posts.
  resources :posts do
    collection do
      get 'search'
      get 'archive'
    end
  end

  # new, edit, show, index, create, destroy, update
  root :to => "posts#index"

  # Define as rotas (CRUD) para o recurso tags
  match "tags/:tag_id/posts" => "posts#index", :as => :tag_posts
end
