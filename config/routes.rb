Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get 'juice'               => 'items#index', item_type: 'juice'
  get 'icecream'            => 'items#index', item_type: 'icecream'
  get 'all_item'            => 'items#index'
  get 'all_items'           => 'items#index'
  get 'juices'              => 'items#index', item_type: 'juice', page: 1

  get '/add_to_cart'        => 'items#add_to_cart'
  get '/remove_from_cart'   => 'items#remove_from_cart'

  get '/my_cart'            => 'items#cart'

  get '/order'              => 'items#order'
end
