Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources:properties
      resources:orders
    end
  end
end
