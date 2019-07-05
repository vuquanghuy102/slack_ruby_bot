class Admin::AdminBaseController < BaseController
  before_action :authenticate_user!
  before_action :is_admin_page?

  def is_admin_page?
    return redirect_to leader_work_spaces_path unless current_user.is_admin?
  end
end