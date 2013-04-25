Moc::Application.routes.draw do
  resources :links

  devise_for :users
  
	resources :links

	root :to => "main#index"
    
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    delete "logout", :to => "devise/sessions#destroy"
    get "register", :to => "devise/registrations#new"
  end
end
