Rails.application.routes.draw do
  resources :musics

  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

	resource :user, only: :destroy  do
		get 'retire'
	end

	resources :musics, except: :index do
		resources :checks, only: [:new, :create, :destroy]
	end
	match '*path' => 'application#error404', via: :all 
end
