class ApplicationController < ActionController::API
  before_action :authenticate_user

  def current_user
    @current_user ||= User.find_by(email: request.headers["X-User-Email"])
  end

  private

  def authenticate_user
    if current_user.blank?
      render(json: { message: "Please login before making requests."} , status: :unprocessable_entity) && return
    end
  end
end
