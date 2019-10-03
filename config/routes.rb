Rails.application.routes.draw do
  root to: 'pages#home'
  resources :categories
  resources :articles 
  get 'articles/category/:cat_id', :controller => 'articles', :action => 'showByCat'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
