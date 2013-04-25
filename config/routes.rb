Moc::Application.routes.draw do
  resources :links

  devise_for :users
  
	resources :links

	root :to => "main#index"
  
  namespace :api do
    namespace :v1 do
      resources :tokens,:only => [:create, :destroy]
    end
  end
    
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    delete "logout", :to => "devise/sessions#destroy"
    get "register", :to => "devise/registrations#new"
  end
end
