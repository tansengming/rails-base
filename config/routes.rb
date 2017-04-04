require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'roots#show'

  devise_for :users
  ActiveAdmin.routes(self)

  devise_for :admin_users,  ActiveAdmin::Devise.config
  devise_for :super_admins, ActiveAdmin::Devise.config.merge(path: :super_admins)

  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end

  resource :user, only: :edit
  get '/user/edit' => 'users#edit', as: :user_root # creates user_root_path for Devise's after_sign_in_path

  resource :up,       only: :show
  resource :payment,  only: :new

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end