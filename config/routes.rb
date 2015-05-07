Rails.application.routes.draw do
  resources :users, only: %i(index show create) do
    resources :jobs
  end

end
