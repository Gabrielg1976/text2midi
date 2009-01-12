ActionController::Routing::Routes.draw do |map|
 map.root :controller => "example", :action=>"write_text"
 map.resources :example
 map.connect ':controller/:action/:id'
 map.connect ':controller/:action/:id.:format'
end
