Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'root#top'
  get '/about' => 'about#top'
  authenticate :user do
  resources :users, only:[:show, :index, :edit, :update ]
  resources :books
  end

end
