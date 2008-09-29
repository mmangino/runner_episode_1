ActionController::Routing::Routes.draw do |map|

  map.resources :runs
  map.resources :users do |users|
    users.resources :runs
  end
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
