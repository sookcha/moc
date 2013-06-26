Moc::Application.routes.draw do  
  namespace :api do
    namespace :v1 do
      resources :tokens,:only => [:create, :destroy]
    end
  end
  
  resources :feeds
  
  resources :comments do
    resource :childcomments
  end
  
  resources :links do
    resources :comments
  end
  
  devise_for :users
	root :to => 'main#index'
      
  devise_scope :user do
    get 'login', :to => 'devise/sessions#new'
    delete 'logout', :to => 'devise/sessions#destroy'
    get 'register', :to => 'devise/registrations#new'
  end
    
  post '/follow/:userName', :to => 'users#follow', via: [:get]
  delete '/unfollow/:userName', :to =>'users#unfollow', via: [:get]
  
  match '/vote/:id/:updown', :to => "links#updateVote", via: [:get]
  
  match '/feed', :to => 'feeds#index', via: [:get]
  match '/add/', :to => "links#new", via: [:get]
  match '/add/:url', :to => 'links#new', via: [:get]
  match '/discuss/:title', :to => 'links#show', via: [:get]
  match '/:userName' => 'users#show', :except => ['/feed','/follow','/api'], via: [:get]
  #match '/comment/add/:id', :to => "childComments#new", via: [:get]
end