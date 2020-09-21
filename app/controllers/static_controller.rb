class StaticController < ApplicationController
  def home
    render json: {status: "Welcome home"}
  end
end
