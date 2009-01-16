ActionController::Routing::Routes.draw do |map|
 map.resources :chords
 map.resources :scales
 map.resources :users
 map.resource :session
 map.resources :example
 map.root :controller => "example", :action=>"write_text"
 map.resource :contoller =>"arpeg_synth",:action=>"arp_synth"
 map.connect ':controller/:action/:id'
 map.connect ':controller/:action/:id.:format'
end
