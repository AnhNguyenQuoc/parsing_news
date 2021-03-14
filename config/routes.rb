Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#index'
  get 'article/:id', to: 'articles#show', as: 'article'
  get 'refresh', to: 'articles#sync_data', as: 'sync_data'
end
