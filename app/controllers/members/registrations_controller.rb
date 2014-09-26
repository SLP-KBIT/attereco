class Members::RegistrationsController < Devise::RegistrationsController
  before_action :sign_in_required
end
