Rails.application.routes.draw do
  namespace :api do
    resources :home, only: %i[index]
  end
end
