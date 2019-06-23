Rails.application.routes.draw do
  namespace :api, default: { formats: :json } do
    namespace :v1 do
      resources :sessions, only: :create
      resources :registrations, only: :create
      resources :semesters
      resources :students
    end
  end
end

