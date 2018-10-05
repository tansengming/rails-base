ActiveAdmin.register AdminUser, namespace: :super_admins do
  filter :email
  permit_params :email, :password

  index do
    column :email
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
    end
    f.actions
  end

  controller do
    def update
      admin_user_params = params[:admin_user]
      admin_user_params.delete_if { |param_name, _v| param_name.to_sym == :password } if admin_user_params.fetch(:password).blank?
      update!
    end
  end
end
