Rails.application.routes.draw do
   #Root route
   root "articles#index"

   get "/articles", to: "articles#index"
   get "/articles/:id", to: "articles#show"

   #Simple route: This will match with Product Controller's #index action and #show action.
   get 'product/index'
   get 'product/show'
   #match 'product/index', to:'product#index', via: :get

   #Default route:
   #get ':controller(/:action(/:id))' #Here parenthesis is added so that action and id is optional in route.


     # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   ################################################################
    get 'product/another_index'
    get 'product/redirect_page'
    get 'product/amazon'
end
