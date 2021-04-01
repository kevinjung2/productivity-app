class ApplicationController < ActionController::Base
  private

    def current_user
      User.find_by(id: session[:user_id])
    end

    def find_user
      User.find_by(id: params[:id])
    end
end
