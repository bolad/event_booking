class Api::SessionsController < ApplicationController
  def create
    user = User
      .find_by(email: params["user"]["email"])
      .try(:authenticate, params["user"]["password"])

    if user
      #store the user's id into the session's :user_id variable
      session[:user_id] = user.id
      render json: {
        status: :created,
        logges_in: true,
        user: user
      }
    else
      render json: {
        status: 401
      }
    end
  end
end
