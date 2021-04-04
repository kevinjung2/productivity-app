class AmountsController < ApplicationController
  def destroy
    amount = Amount.find_by(id: params[:id])
    amount.destroy
    redirect_back fallback_location: '/profile'
  end
end
