Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "lists#index"

  resources :lists do
    member do
      post :done
    end
  end
end
