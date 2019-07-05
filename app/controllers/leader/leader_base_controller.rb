class Leader::LeaderBaseController < BaseController
  before_action :authenticate_user!
  before_action :is_admin_page?

  def is_admin_page?
    return redirect_to admin_work_spaces_path if current_user.is_admin?
  end
end