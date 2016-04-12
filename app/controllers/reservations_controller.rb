class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  def show
  end

  # GET /reservations/new
  def new
    @listing_id = params[:listing_id]
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        # UserMailer.reservation_email(@reservation.listing.user).deliver
        format.html { redirect_to new_transaction_path(reservation_id: @reservation) }
        # format.html { redirect_to @reservation.listing notice: 'Reservation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /reservations/1
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /reservations/1
  def destroy
    @listing = @reservation.listing
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to listing_path(@listing), notice: 'Reservation was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:from, :until, :listing_id, :user_id)
    end
end
