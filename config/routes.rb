ICCL::Application.routes.draw do
  root "index#index"

  match 'index/:id'         => 'index#page',        :via => 'get'
  match 'sign_in'           => 'user#sign_in',      :via => 'get'
  match 'sign_out'          => 'user#sign_in',      :via => 'get'
  match 'news/:id'          => 'news#view',         :via => 'get'
  match 'member/Professor'  => 'member#professor',  :via => 'get'
  match 'member/Graduate'   => 'member#graduate',   :via => 'get'
  match 'member/University' => 'member#university', :via => 'get'
  match 'study/Graduate'    => 'study#graduate',    :via => 'get'
  match 'study/University'  => 'study#university',  :via => 'get'
  match 'plan'              => 'plan#index',        :via => 'get'
  match 'about'             => 'about#index',       :via => 'get'

  namespace :admin do
    root 'index#index'
    match 'user/verify'     => 'user#verify',  :via => 'get'
    match 'user/verify/add' => 'user#verify',  :via => 'get'
    resources :users
    resources :news
    resources :plans
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
