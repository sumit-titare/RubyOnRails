Rails.application.routes.draw do
  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'

  root 'subjects#index'

  resources :subjects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
