ActionController::Routing::Routes.draw do |map|
  map.resources :hesines

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users,:collection => {:new_mobile => :get,:create_mobile => :post}   

  map.resource :session

  map.resources :bookings

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  map.admin '/admin', :controller => 'admin' 
  
  map.namespace 'admin' do |admin| 
    admin.resources :categories,:collection => { :reset_count => :get }
  end

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end          
  map.resources :categories
  map.resource :session
  map.resources :vendors do |vendor|
    vendor.resource :bookings 
  end
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "landing"  
  map.get_nearby '/get_nearby', :controller => 'landing', :action => 'get_nearby'    
  map.set_nearby '/set_nearby', :controller => 'landing', :action => 'set_nearby' 
  map.set_cate_nearby 'set_cate_nearby', :controller => 'landing', :action => 'set_cate_nearby'
  
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.

end
