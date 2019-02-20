Rails.application.routes.draw do
  resources :supports
  resources :infos
  resources :asks
  resources :communities
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "home#index"
  
  post '/communities/:id/like', to: 'likes#like_toggle', as: 'like_community'
  
  #post '/communities/:community_id' =>"comments#create"
  #delete '/communities/:community_id/comments/:id' =>"comments#destroy"
  #post '/communities/:community_id/comments/:id' =>"comments#update"
  #-----------
  post '/asks/:ask_id' =>"askcomments#create"
  
  get 'comm_comment/create'
  get 'comm_comment/destroy'
  
  post 'communities/new' => "community#new"
  post 'communities/comment' => "comm_comment#create"
  delete '/communities/:article_id/comment/:id' =>"comm_comment#delete"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
