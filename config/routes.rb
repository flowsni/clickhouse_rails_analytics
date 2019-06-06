Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :statistics

      # get '/dashboard' => 'statistics#dashboard', as: 'dashboard'
      match 'dashboard', to: 'statistics#dashboard', via: [:get, :post]
      # post '/hello' => 'statistics#hello', as: 'hello'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
