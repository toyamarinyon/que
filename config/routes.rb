Rails.application.routes.draw do
  resources :users, only: %i(index show create), format: :json do
    resources 'jobs'
  end

  post 'login' => 'authentication#create'

end
