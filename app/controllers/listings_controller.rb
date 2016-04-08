class ListingsController < ApplicationController

  before_action :require_login, only: [:edit, :update, :destroy, :create, :new]

  def create
    @listing = Listing.new(params.require(:listing).merge(user_id: current_user.id).permit(:name, :home_type, :room_type, :accommodates, :address, :city, :user_id))
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def index
    @listings = Listing.all
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(params.require(:listing).permit(:name, :home_type, :room_type, :accommodates, :address, :city, :user_id))
    if @listing.save
      redirect_to @listing
    else
      render :edit
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end
end
