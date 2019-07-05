class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || (resource.is_admin? ? admin_work_spaces_path : leader_work_spaces_path)
  end
end
