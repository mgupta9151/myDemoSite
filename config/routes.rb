Rails.application.routes.draw do
  resources :advertisements
  resources :contacts ,only:[:new,:create] do
  	collection do
  		post :get_state
  		post :get_city
  	end
  end
  root 'posts#index'

  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
