LetMeDoIt::Application.routes.draw do

  ActiveAdmin.routes(self)

  root :to => "home#index"

  resources :skills
  resources :categories

  # PROJECTS
  resources :projects, :controller => "projects/projects" do
    resources :tasks, :controller => "projects/tasks" do
      resources :bids, :controller => "projects/bids"
    end
  end

  match '/my-projects' => 'projects/projects#self', :as => :my_projects
  match '/my-bids' => 'projects/bids#self', :as => :my_bids
  match '/notifications' => 'users#show_notifications', :as => :my_notifications
  match '/notifications/shown/:nid' => 'users#destroy_notification', :as => :notification_shown

  # PROFILES
  match '/' => 'home#index', :as => :user_root
  devise_for :users, :path_names => {:sign_in => "login", :sign_out => "logout"}, :path => 'user'
  match '/users/:id' => 'users#show', :as => :user_show

  # EXCEPTION HANDLING
  match "/404", :to => "errors#not_found"
  match "/422", :to => "errors#change_rejected"
  match "/500", :to => "errors#internal_error"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
