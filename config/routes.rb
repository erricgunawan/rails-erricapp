Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'
  # get 'home', to: 'static_pages#home', as: 'rumah'
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # get 'users/new'
  post 'users', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # put 'users/:id', to: 'users#update'
  patch 'users/:id', to: 'users#update'
  # delete 'users/:id/destroy', to: 'users#destroy', as: 'destroy_user'
  delete 'users/:id', to: 'users#destroy', as: 'destroy_user'

  resources :journals, only: [:create]
  resources :password_resets


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
