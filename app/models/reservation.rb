class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  has_many :transactions

  def total_price
    total_price = self.listing.price * (self.until - self.from)
    return total_price.to_f
  end
end