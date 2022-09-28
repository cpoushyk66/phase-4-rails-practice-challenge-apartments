Rails.application.routes.draw do
  resources :leases, only: [:create, :destroy]
  resources :tenants, only: [:create, :show, :index, :update, :destory]
  resources :apartments, only: [:create, :show, :index, :update, :destory]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
