
Rails.application.routes.draw do


  resources :topics do
 # #34
  resources :posts, except: [:index]
   end

  resources :users, only: [:new, :create]

  POST_TO  'confirmation' => 'users#confirmation'

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
