Rails.application.routes.draw do

  resources :shops
  resources :fashions
  resources :ws

  resources :users
  resources :tags, except: :show
  get 'tags/:tag', to: 'clothings#index'

  get '/boutique', to: 'users#index'

  get '/men', to: 'ws#men'
  get '/fashion', to: 'fashions#index'


  resources :clothings do
    resources :bookmarks, only: [:create, :destroy], shallow: true
   end

   devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/tagged', to: "clothings#tagged", as: :tagged

  root 'clothings#index'
end
