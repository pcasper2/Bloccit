Rails.application.routes.draw do

  devise_for :users
  resources :questions do
    put :complete
  end

  resources :posts

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  resources :advertisements

  root to: 'welcome#index'
end
