ActionController::Routing::Routes.draw do |map|
 map.resources :users
 map.resource :session
 map.resources :example
 map.root :controller => "example", :action=>"write_text"
 map.connect ':controller/:action/:id'
 map.connect ':controller/:action/:id.:format'
end
