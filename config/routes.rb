Moc::Application.routes.draw do  
      
  namespace :api do
    namespace :v1 do
      resources :tokens,:only => [:create, :destroy]
      resources :links,:only => [:create, :destroy]
    end
  end
  
  resources :feeds
  resources :collection
  
  resources :comments do
    resource :childcomments, controller: "child_comments"
  end
  
  resources :links do
    resources :comments
  end
  
  devise_for :users
  
  devise_scope :user do
      get 'login', :to => 'devise/sessions#new'
      delete 'logout', :to => 'devise/sessions#destroy'
      get 'register', :to => 'devise/registrations#new'
    end
  
  
	root :to => 'main#index'
  
  post '/follow/:userName', :to => 'users#follow'
  get '/api/create', :to => 'links#createAPI'
  get '/discuss/:title', :to => 'links#show', :except => ['/add']
  
  delete '/unfollow/:userName', :to =>'users#unfollow'
  
  match '/vote/:id/:updown', :to => "links#updateVote", via: [:get]
  
  match '/change/:id/:method', :to => "links#publicize", via: [:get]
  
  match '/feed', :to => 'feeds#index', via: [:get]
  match '/add/', :to => "links#new", via: [:get]
  match '/add/:url', :to => 'links#new', via: [:get]
  match '/discuss/add', :to => 'links#new', via: [:get]
  match '/:userName' => 'users#show', :except => ['/feed','/follow','/api'], via: [:get]
  match '/comment/add/:id', :to => "child_comments#new", via: [:get]
end