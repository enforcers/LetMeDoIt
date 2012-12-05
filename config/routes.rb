LetMeDoIt::Application.routes.draw do
  resources :skills
  resources :categories

  # PROJECTS

  scope "/projects", :module => "projects" do # Workaround for custom named helper
    match '/show/:id' => 'projects#show', :as => :project_show
  end
  


  namespace :projects do
    get '/' => 'projects#index'
    get '/new' => 'projects#new'
    post '/new' => 'projects#create'
    get '/edit' => 'projects#edit'
    post '/edit' => 'projects#update'
    post '/' => 'projects#create'
    #match '/:id' => 'projects#index'

    match 'tasks/show/:id' => 'tasks#show', :as => :tasks_show
    match 'tasks/edit/:id' => 'tasks#edit', :as => :tasks_edit
    get 'tasks/' => 'tasks#index'
    get 'tasks/new' => 'tasks#new'
    post 'tasks/new' => 'tasks#create'
    get 'tasks/edit' => 'tasks#edit'
    post 'tasks/edit' => 'tasks#update'
    post 'tasks/' => 'tasks#create'
  end

  root :to => "home#index"

  # PROFILES
  match '/' => 'home#index', :as => :user_root
  devise_for :users, :path_names => {:sign_in => "login", :sign_out => "logout"}, :path => 'user'
  match '/user/:id' => 'users#show', :as => :user_show

#  namespace :admin do
#    match '/' => 'users#index'
#    resources :users
#  end

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
