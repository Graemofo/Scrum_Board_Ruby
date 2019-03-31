class ApplicationController < ActionController::Base
#after login, user should be taken to the projects page
  def after_sign_in_path_for(resource)
    projects_path
  end

end
