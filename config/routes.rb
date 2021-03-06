Rails.application.routes.draw do
  get '/licences/new/:id', to: "licences#new", as: "new_licence_ip"
  resources :licences
  resources :organisations
  resources :ips
  resources :domains
  resources :collaborators
  resources :faculties
  resources :students
  resources :transactions
  resources :accounts
  devise_for :users,  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
    }, :path => '', :path_names => {
      :sign_in => 'login',
      :sign_up => 'register',
      :sign_out => 'logout'
    }
  ActiveAdmin.routes(self)
  scope :admin do
    resources :users do
      member do
          get :status
          get :clear
      end
    end
  end

  get '/pending', to: "dashboard#pending"
  get '/reviewing', to: "dashboard#reviewing"
  get '/accept', to: "dashboard#accepted"
  get '/reject', to: "dashboard#rejected"
  root :to => redirect("/login")
  get '/dashboard', to: "dashboard#index"
  get '/acceptIP/:id', to: "ips#accept", as: "acceptIP"
  get '/rejectIP/:id', to: "ips#reject", as: "rejectIP"
  get 'reviewingIP', to: "users#showpIP", as: "reviewingIP"
  get 'acceptedIP', to: "users#showaIP", as: "acceptedIP"
  resources :users
end
