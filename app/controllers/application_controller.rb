class ApplicationController < ActionController::API

  def current_user
    @current_user ||= User.find_by(email: request.headers["X-User-Email"])
  end
end
