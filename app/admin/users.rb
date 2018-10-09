ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  filter :email_cont, label: 'Email'

  index do
    id_column
    column :email
    actions
    column () do |user|
      link_to 'Login', impersonate_admin_user_path(user)
    end
  end

  show do
    attributes_table do
      row :id
      row :created_at
      row :updated_at
      row :email
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :active_until
      row :reset_password_token
      row :reset_password_sent_at
      row :remember_created_at
      row :failed_attempts
      row :unlock_token
      row :locked_at
    end

    active_admin_comments
  end

  form do |f|
    semantic_errors
    inputs do
      input :email
      input :password
      input :password_confirmation
    end
    actions
  end

  member_action :impersonate do
    bypass_sign_in(User.find(params[:id]))
    redirect_to user_root_path
  end
end
