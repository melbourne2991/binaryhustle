Binaryhustle::Application.routes.draw do
  #root
  root 'posts#index'

  #resources
  resources :posts, except: [:show, :update, :destroy]
  resources :users, only: [:create]

  #Posts
  get "/meta", to: "posts#meta"
  get "/posts/:year/:month/:day/:slug", to: "posts#show", as: :post, via: [:get]

  #User Routes
  get "/signup", to: "users#new"
  get "/success", to: "users#index"

  #login Routes
  get "/login", to: "sessions#login"
  post "/sessions/login_attempt", to: "sessions#login_attempt"

  #session routes
  get "/sessions/home", to: "sessions#home"
  get "/sessions/logout", to: "sessions#logout"

  #admin routes
  #resources :posts, module: 'admin', except: [:show, :index]
  namespace :admin do 
    root 'posts#new'
    resources :posts, except: [:show, :index]
  end


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
