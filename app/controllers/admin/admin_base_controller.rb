class Admin::AdminBaseController < BaseController
  before_action :authenticate

  private

  def authenticate
    return redirect_to new_user_session_path unless current_user
  end
end