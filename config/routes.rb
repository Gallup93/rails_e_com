Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/:id/items", to: "items#show"
      end
      namespace :items do
        get "/:id/merchant", to: "merchants#show"
      end

      resources :items, except: [:new, :edit]
      resources :merchants, except: [:new, :edit]
    end
  end
end
