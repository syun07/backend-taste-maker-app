Rails.application.routes.draw do
  resources :tastes
  resources :favorites
	resources :users
		post '/login', to: 'auth#create'
		
		get '/searched-wavelength', to: 'tastes#fetch'
		delete '/remove-wavelength', to: 'favorites#destroy'
end
