Rails.application.routes.draw do
  namespace :api do
    resources :top, only: %i[index]
  end
end
