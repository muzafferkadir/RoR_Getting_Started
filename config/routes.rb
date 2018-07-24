Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get 'comment_list/index'
  get 'search', to: 'articles#index'
  

  resources :articles do
  	resources :comments
  end   
  resources :comment_list

end
