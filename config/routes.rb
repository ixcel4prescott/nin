Nin::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => 'users/registrations'}
  devise_scope :user do
    get "interpreter/sign_up" => "users/registrations#interpreter_sign_up", as: :interpreter_sign_up
    post "interpreter/create_account" => "users/registrations#interpreter_create", as: :interpreter_create_account
  end

  resources :users, :only => [:show, :index]
  resources :interpreters
  resources :job_requests, :only => [:new, :create, :update] do
    collection do
      post 'interpreters_available'
    end
  end

  resources :clients do
    post 'create_scheduled_location', :on => :member
  end
end
