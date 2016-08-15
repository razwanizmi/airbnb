class TransactionsController < ApplicationController
  def new
    @reservation = Reservation.find(params[:reservation_id])
    gon.client_token = generate_client_token
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @result = Braintree::Transaction.sale(
              amount: @reservation.total_price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      @reservation.paid!
      Transaction.create(reservation_id: @reservation.id, braintree: @result.transaction.id)
      redirect_to @reservation.listing
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private
  def generate_client_token
    Braintree::ClientToken.generate
  end
end
