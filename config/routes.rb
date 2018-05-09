Rails.application.routes.draw do
  
  resources :ubicacions
  
  resources :solicituds do  	 
      resources :evaluacions       
  end
  
  devise_for :users

  get 'place' => "solicituds#place"
  get 'welcome/index'
  root 'welcome#index'
  devise_scope :user do
  	#get "sign_in" => "devise/sessions#new"
    #get "sign_up" => "devise/registrations#new"
    get 'logout' => 'devise/sessions#destroy'
  end

  #devise_for :users
  #match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
