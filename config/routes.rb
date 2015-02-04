Rails.application.routes.draw do
  resources :cars do
    resources :slots
  end

  root to: 'cars#login'

end
