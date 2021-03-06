DevelopmentActivityApp::Application.routes.draw do


  resources :skill_groups

  resources :users_linemanagers

  resources :role_skills

  resources :dev_activities

  resources :roles do 
    resources :role_skills
  end

  resources :user_skills

  get "pages/AdminDashboard"
  get "pages/LineManagerDashboard"

  resources :skills

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get "mainpage/index"
  # You can have the root of your site routed with "root"
  root :to => "mainpage#index"

  devise_for :users,
            :controllers => {:registrations => "my_devise/registrations"}

  resources :users do

    collection do
      get 'linemanager_team'
      match 'linemanager_skill_search' => 'users#linemanager_skill_search', via: [:get, :post], as: :linemanager_skill_search
    end

    resources :dev_activities

    resources :user_skills

    resources :linemanagers

    resources :users_linemanagers do
        collection do
          get 'user_search'
        end
    end

    patch 'update_password', on: :collection
    get 'edit_password', on: :member

  end




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
