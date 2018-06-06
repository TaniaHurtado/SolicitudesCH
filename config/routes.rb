Rails.application.routes.draw do
  
  resources :informes
  root 'welcome#index'
  resources :ubicacions
  resources :solicituds do  	 
    resources :evaluacions       
  end


  get 'place' => "solicituds#place"
  get 'welcome/index'
  
  scope 'Solicitante' do
    
    resources :solicituds do     
      resources :evaluacions       
    end
    match '/solicituds/:id/solicitud_evaluada', to: 'evaluacions#solicitud_evaluada',via: [:put, :get], as: 'solicitud_evaluada'
  end

scope 'Responsable' do
  get "responsable_solicituds" => "solicituds#responsable_solicituds"
  match '/solicituds/:id/aceptar_solicitud', to: 'solicituds#aceptar_solicitud',via: [:put, :get], as: 'aceptar_solicitud'
  match '/solicituds/:id/realizar_solicitud', to: 'solicituds#realizar_solicitud',via: [:put, :get], as: 'realizar_solicitud'
  #put 'aceptar_solicitud' => 'solicituds#aceptar_solicitud'
end
 
#match '/users/account_update_params', to: 'registrations#account_update_params',via: [:put, :get], as: 'update_params' 
scope 'Admin' do
  match '/users/:id/account_update_params', to: 'registrations#account_update_params',via: [:put, :get], as: 'update_params_user'
  resources :users
  get "admin_solicituds" => "solicituds#admin_solicituds"
  #get "order_date_solicituds" => "solicituds#order_date_solicituds"
  #get "order_state_solicituds" => "solicituds#order_state_solicituds"
end

  devise_for :users,controllers: { confirmations: 'confirmations',registrations:'registrations'} 
  devise_scope :user do
  	#get "sign_in" => "devise/sessions#new"
    #get "sign_up" => "devise/registrations#new"
    get 'logout' => 'devise/sessions#destroy'
  end

  #devise_for :users
  #match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
