ActiveAdmin.register AdminUser, :namespace => :super_admins do
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
      params[:admin_user].delete_if {|k,_v| k.to_sym == :password } if params[:admin_user].fetch(:password).blank?
      update!
    end
  end
end