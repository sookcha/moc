Moc::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tokens,:only => [:create, :destroy]
    end
  end
  
  resources :feeds
  resources :comments do
    resources :child_comments
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
  
  post '/follow/:userName', :to => 'users#follow'
  delete '/unfollow/:userName', :to =>'users#unfollow'
  
  match '/vote/:id/:updown', :to => "links#updateVote"
  
  match '/feed', :to => 'feeds#index'
  match '/add/', :to => "links#new"
  match '/add/:url', :to => 'links#new'
  match '/discuss/:title', :to => 'links#show'
  match '/:userName' => 'users#show', :except => ['/feed','/follow','/api']
  match '/comment/add/:id', :to => "childComments#new"
end