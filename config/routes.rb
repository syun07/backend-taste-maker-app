Rails.application.routes.draw do
  resources :tastes
  resources :favorites
	resources :users
		post '/login', to: 'auth#create'
end
