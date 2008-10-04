ActionController::Routing::Routes.draw do |map|

  map.resources :videos, :member => {:status => :post, :upload => :get, :done => :get}
end
