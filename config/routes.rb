Rails.application.routes.draw do


  get 'summaries/index'

  devise_for :users
  resources :users, only: [:update, :show]
  resources :questions do
    put :complete
  end

  resources :summaries

  resources :topics do
    resources :posts, except: [:index]
  end
 
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up_vote' => 'votes#up_vote', as: :up_vote
    post '/down_vote' => 'votes#down_vote', as: :down_vote
  end
 



  get 'about' => 'welcome#about'

  get 'welcome/contact'

  resources :advertisements

  root to: 'welcome#index'
end
