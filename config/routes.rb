Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get '/users/item.user.id', to: 'users#show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end  # devise_for :users

  root "items#index"  
  resources :users, only: :show 
  resources :items do 
    resources :comments, only: [:create, :destroy]
  end

  resources :buys, only: :new

  # クレカに関する記述
  resources :credits, expect: :index do
    collection do
      get 'regist_done'
      get 'delete_done'
      post 'show', to: 'credit#show'
      post 'pay', to: 'credit#pay'
      post 'delete', to: 'credit#delete'
    end
    member do
      get 'buy'
      get 'pay'
    end
  end

end
