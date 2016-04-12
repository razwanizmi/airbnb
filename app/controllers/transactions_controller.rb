class TransactionsController < ApplicationController
  def new
    @reservation = Reservation.find(params[:reservation_id])
    gon.client_token = generate_client_token
  end

  private
  def generate_client_token
    Braintree::ClientToken.generate
  end
end
