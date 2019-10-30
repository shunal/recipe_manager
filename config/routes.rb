Rails.application.routes.draw do
  Rails.application.routes.draw do  
    root 'users#new'
  
    resources :users do 
      resources:recipes
      end
  
    resources :recipes do
      resources :ingredients
    end 
    
    resources :ingredients
  
    get    '/signup',  to: 'users#new'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :users

    get '/auth/facebook/callback' => 'sessions#createfb'
    
  end 
  
end
