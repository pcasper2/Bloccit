Rails.application.routes.draw do

  resources :questions

  resources :posts

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  resources :advertisements

  root to: 'welcome#index'
end
