class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    User.find_by(api_key: params[:api_key])
  end

  def authenticate_user
    unless current_user
      render json: "Authorization Failed", status: 401
    end
  end

end
