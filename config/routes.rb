Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :users, only: [:show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings'
    get 'followers' => 'relationships#followers'
  end
  
  resources :messages, only: [:create, :show]

  resources :student_posts, only: [:index, :show, :new, :create] do
    #resourceにする事で、/:idが付かなくなる
    resource :favorites, only: [:create, :destroy]
    resources :student_comments, only: [:create, :destroy]
  end

end
