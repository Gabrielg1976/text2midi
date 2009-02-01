ActionController::Routing::Routes.draw do |map|
 map.resources :example
 map.root :controller => "example", :action=>"write_text"
 map.resources :controller => "main"
 map.connect ':controller/:action/:id'
 map.connect ':controller/:action/:id.:format'
end
