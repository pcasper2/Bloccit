Rails.application.routes.draw do


  get 'summaries/index'

  devise_for :users
  resources :users, only: [:update]
  resources :questions do
    put :complete
  end

  resources :summaries

  resources :topics do
    resources :posts, except: [:index]
  end
 
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end


  get 'about' => 'welcome#about'

  get 'welcome/contact'

  resources :advertisements

  root to: 'welcome#index'
end
