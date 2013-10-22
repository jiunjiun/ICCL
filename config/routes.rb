ICCL::Application.routes.draw do
  root 'index#index'

  match 'news/:id'                => 'news#show',          :via => 'get'
  match 'reset'                   => 'index#reset',        :via => 'get'
  match 'sign_in'                 => 'users#sign_in',      :via => 'get'
  match 'auth/:provider/callback' => 'users#auth_fb',      :via => 'get'
  match 'sign_failure'            => 'users#failure',      :via => 'get'
  match 'sign_up'                 => 'users#sign_up',      :via => 'get'
  match 'sign_upping'             => 'users#sign_upping',  :via => 'post'
  match 'sign_out'                => 'users#sign_out',     :via => 'get'
  match 'user/account'            => 'users#account',      :via => 'get'
  match 'news/:id'                => 'news#view',          :via => 'get'
  match 'member/Professor'        => 'member#professor',   :via => 'get'
  match 'member/Graduate'         => 'member#graduate',    :via => 'get'
  match 'member/Student'          => 'member#student',     :via => 'get'
  match 'study'                   => 'study#index',        :via => 'get'
  match 'study/Master'            => 'study#master',       :via => 'get'
  match 'study/University'        => 'study#university',   :via => 'get'
  match 'plan'                    => 'plan#index',         :via => 'get'
  match 'about'                   => 'about#index',        :via => 'get'
  match 'lab/contact'             => 'lab#contact',        :via => 'get'

  match 'im/su'                   => 'imsu#index',         :via => 'get'
  match 'im/su/:id'               => 'imsu#update',        :via => 'post'

  namespace :admin do
    root  'index#index'
    match 'user/audit'            => 'user#audit',         :via => 'get'
    match 'user/verify/:id'       => 'user#verify',        :via => 'get'
    resources :user
    resources :paper
    resources :news
    resources :plan
    resources :study
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
