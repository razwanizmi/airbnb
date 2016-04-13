class RemovePictureFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :picture
    add_column :listings, :pictures, :json
  end
end
