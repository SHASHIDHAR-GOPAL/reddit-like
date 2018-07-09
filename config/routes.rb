Rails.application.routes.draw do
  root "links#index"
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  resources :links do
    member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end