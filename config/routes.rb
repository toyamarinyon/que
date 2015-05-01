Rails.application.routes.draw do
  use_doorkeeper
  resources :users, only: %i(index show create) do
    resources :jobs
  end
end
