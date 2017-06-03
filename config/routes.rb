Rails.application.routes.draw do
  defaults format: :json do
    resources :reports, only: [:index, :create]
    resources :pins,    only: [:index, :create, :update, :destroy]

    get 'pins/all', to: 'pins#all_pins'
  end
end
