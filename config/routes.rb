Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :users, only: %i(create) do
      post '/follow/:id', to: 'users#follow'
      post '/unfollow/:id', to: 'users#unfollow'
      resources :followers, only: %i(index)
    end
  end

end
