Rails.application.routes.draw do
  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'

  root 'subjects#index'

  resources :subjects do
    member do
      get :delete
    end
  end

#By default delete route is not included , to include it we have to do this
  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get 'delete'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
