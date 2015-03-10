Rails.application.routes.draw do
  
  # error's pages  
  match '/404', to: 'errors#file_not_found', via: :get, :defaults => {:format => :json} 
  match '/422', to: 'errors#unprocessable', via: :get, :defaults => {:format => :json} 
  match '/500', to: 'errors#internal_server_error', via: :get, :defaults => {:format => :json} 

  namespace :api do
    resources :sms, :only => [:show, :create]
  end
end
