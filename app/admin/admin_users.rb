ActiveAdmin.register AdminUser, :namespace => :super_admins do
  filter :email

  index do
    column :email
    default_actions
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
      params[:admin_user].delete_if {|k,v| k.to_sym == :password } unless params[:admin_user].fetch(:password).present?
      update!
    end
  end
end