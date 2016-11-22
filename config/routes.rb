Rails.application.routes.draw do
  resources :ips
  resources :domains
  resources :collaborators
  resources :faculties
  resources :students
  devise_for :users,  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
    }, :path => '', :path_names => {
      :sign_in => 'login',
      :sign_up => 'register'
    }
  ActiveAdmin.routes(self)
  scope :admin do
    resources :users do
      member do
          get :status
      end
    end
  end
  get '/review', to: "users#showr"
  get '/accept', to: "users#showa"
  root :to => redirect("/login")
  get '/dashboard', to: "dashboard#index"

  resources :users , :has_one => :student

  devise_scope :user do
    get 'logout' => 'users/sessions#destroy'
  end
end
