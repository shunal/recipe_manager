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
  
    
    get '/auth/facebook/callback' => 'sessions#createfb'
    
  end 
  
end
