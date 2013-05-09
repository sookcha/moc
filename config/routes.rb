Moc::Application.routes.draw do
  resources :feeds
  resources :links
  
  devise_for :users
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
  
  match "/feed", :to => "feeds#index"
  match "/:username" => "users#show", :except => "/feed"
  
end
