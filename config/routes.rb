Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :events do
        member do
          post :join
          post :unjoin
        end
      end
    end
  end

  root 'api/v1/events#index'
end
