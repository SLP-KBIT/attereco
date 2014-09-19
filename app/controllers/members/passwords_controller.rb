class Members::PasswordsController < Devise::PasswordsController
  before_action :sign_in_required
  
  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end
end
