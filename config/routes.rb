Rails.application.routes.draw do
  get 'posts/index' => 'posts#index', as:'index'
  post 'posts/create' => 'posts#create', as: 'posts'
  get 'posts/:id' => 'posts#show', as: 'post'
  get 'posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch 'posts/:id' => 'posts#update', as: 'update_post'
  delete 'posts/:id' => 'posts#destroy', as: 'destroy_post'

  get '/top' => 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
