Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get :search, to: 'properties#search'

      resources :properties do
        resources :orders do
          resources :quotes
        end
      end

    end
  end
end
