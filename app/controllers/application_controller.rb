class ApplicationController < ActionController::Base
  private

    def current_user
      User.find_by(id: session[:user_id])
    end

    def find_user
      User.find_by(id: params[:id])
    end

    def redirect_if_not_logged_in
      redirect_to '/login' if !session[:user_id]
    end

    def redirect_if_user_doesnt_match(user_id)
      redirect_to '/profile' if current_user != User.find_by(id: user_id)
    end
end
