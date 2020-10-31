Rails.application.routes.draw do
  resources :roles
  get 'home/index'
  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
      resources :roles
      resources :customers, only: 'index' do
        member do
          get :get_customer_age
        end
      end
    end
  end  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
