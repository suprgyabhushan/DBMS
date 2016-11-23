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
      :sign_up => 'register',
      :sign_out => 'logout'
    }
  ActiveAdmin.routes(self)
  scope :admin do
    resources :users do
      member do
          get :status
      end
    end
  end
  get '/reviewingIP/', to:"users#showpIP"
  get '/pending', to: "users#show"
  get '/review', to: "users#showr"
  get '/accept', to: "users#showa"
  root :to => redirect("/login")
  get '/dashboard', to: "dashboard#index"
  get '/acceptIP/:id', to: "ips#accept", as: "acceptIP"
  get '/rejectIP/:id', to: "ips#reject", as: "rejectIP"

  resources :users , :has_one => :student
end
