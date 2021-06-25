Rails.application.routes.draw do
  namespace :api do
    root 'top#index'

    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }
  end
end
