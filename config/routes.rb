Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  devise_for :admin_users,  ActiveAdmin::Devise.config
  devise_for :super_admins, ActiveAdmin::Devise.config.merge(path: :super_admins)

  resource :user, only: :edit
  resource :up,   only: :show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end