OrchiveApp::Application.routes.draw do	
        
  resources :comments

  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "join" }, :controllers => {:registrations => 'users/registrations', :sessions=> 'users/sessions'}  
	
	resources :beta_pages
	resources :pages
	
	resources :users do
		resources :comments
		resources :posts
	end
	
	resources :posts do
    resources :comments
    
    #Jon's modifications
#       member do
#       post 'vote_up'
#       delete 'destroy'
#    end
  end

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
	root :to => 'beta_pages#index'
	  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
  match '/contact' => 'Pages#Contact'
  match '/about' => 'Pages#About'
	match '/help' => 'Pages#Help'
	match '/command' => 'Pages#Command'
  match '/privacy' => 'Pages#Privacy'
  match '/terms' => 'Pages#Terms'
  match '/future' => 'Pages#Future'
	
	match '/request' => 'beta_pages#request'

	match '/thankyou' => 'beta_pages#Thank_You'
	
	match '/tys' => 'beta_pages#_signup'
	match '/tyo' => 'beta_pages#_open'
	match '/tyf' => 'beta_pages#_full'

	match '/users/:id', :to => 'users#show',    :as => :user,         :via => :get
	match '/dashboard' => 'users#adminUI'
  
  #jon's code
  match '/posts/:id/destroy', :to => "posts#destroy", :as=> :user, :via => :delete
end