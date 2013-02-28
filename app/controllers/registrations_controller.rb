class RegistrationsController < Devise::RegistrationsController

  def create
    super
    Mailer.sign_up_email(@user).deliver unless @user.invalid?
  end
end