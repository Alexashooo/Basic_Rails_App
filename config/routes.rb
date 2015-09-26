
Rails.application.routes.draw do

  resources :posts

  resources :advertisements

  get 'welcome/index'

  get 'welcome/about'

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
