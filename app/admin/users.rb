ActiveAdmin.register User do
  index do
    column :username do |user|
        link_to user.username, [:admin, user]
      end
    column :email
    column "Last login", :last_sign_in_at
    column "Created at", :created_at
    column "User" do |user|
      user.role?("Registered") ? "&#10003;".html_safe : "&#10005;".html_safe
    end
    column "Admin" do |user|
      user.role?("Admin") ? "&#10003;".html_safe : "&#10005;".html_safe
    end
  end

  filter :email

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, :label => "Rolle", :as => :check_boxes
    end
    f.buttons
  end

  create_or_edit = Proc.new {
    @user            = User.find_or_create_by_id(params[:id])
    @user.roles = params[:user][:roles]
    @user.attributes = params[:user].delete_if do |k, v| 
      (k == "@user.roles") ||
      (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    end
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit

end