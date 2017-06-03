Rails.application.routes.draw do
  defaults format: :json do
    resources :reports, only: [:index, :create]
    resources :pins,    only: [:index, :create, :update]
  end
end
