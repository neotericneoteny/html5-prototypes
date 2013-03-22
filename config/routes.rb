Html5Prototypes::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

	match 'file_reader' => 'file_reader#index'
end