class Members::PasswordsController < Devise::PasswordsController
  before_action :sign_in_required
end
