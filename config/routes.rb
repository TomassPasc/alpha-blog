Rails.application.routes.draw do
 root 'pages#home'
 resources :articles
 get 'about', to: 'pages#about'
 get 'signup', to: 'users#new'
 resources :users, except: [:new]
end
