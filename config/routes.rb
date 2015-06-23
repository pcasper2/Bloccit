Rails.application.routes.draw do


  get 'summaries/index'

  devise_for :users
  resources :questions do
    put :complete
  end

  resources :summaries

  resources :topics do
    resources :posts, except: [:index]
  end


  get 'about' => 'welcome#about'

  get 'welcome/contact'

  resources :advertisements

  root to: 'welcome#index'
end
