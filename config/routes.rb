ActionController::Routing::Routes.draw do |map|
  map.create_user "/create_user", :controller => "users", :action => "create"
  map.resources :user
  map.root :controller => "users", :action => "show"
end
