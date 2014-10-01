class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def index
    @attend = Attend.new
  end

  private

  # サインインしていなければログインページへ
  def sign_in_required
    redirect_to new_member_session_path unless member_signed_in?
  end

  def admin_required
    redirect_to root_path unless current_member.is_admin?
  end

  # ログイン前に指定したURLを把握しておき、ログイン後に移動
  ## 動作してない?
  def store_location
    return unless request.get?
    if ( request.path != "members/sign_in" &&
         request.path != "members/sign_up" &&
         request.path != "members/password/new" &&
         request.path != "members/sign_out" &&
         !request.xhr?)
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  protected

  # deviseのparameterで account を取得
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat([:account, :name, :is_admin, :student_number, :grade])
    devise_parameter_sanitizer.for(:account_update).concat([:account, :name, :is_admin, :student_number, :grade])
  end
end
