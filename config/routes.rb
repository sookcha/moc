Moc::Application.routes.draw do
  resources :feeds
  resources :links
  
  devise_for :users
	root :to => 'main#index'
  
  namespace :api do
    namespace :v1 do
      resources :tokens,:only => [:create, :destroy]
    end
  end
    
  devise_scope :user do
    get 'login', :to => 'devise/sessions#new'
    delete 'logout', :to => 'devise/sessions#destroy'
    get 'register', :to => 'devise/registrations#new'
  end
  
  post '/follow/:userName', :to => 'users#follow'
  delete '/unfollow/:userName', :to =>'users#unfollow'
  
  match '/feed', :to => 'feeds#index'
  match '/:userName' => 'users#show', :except => ['/feed','/follow']
end