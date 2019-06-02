Rails.application.routes.draw do
  root to: 'tickets#index'
  resources :tags
  resources :tickets do
    collection do
      get 'report', to: 'tickets#download_as_xls', as: :export
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
