class AddWageToListing < ActiveRecord::Migration
  def change
    add_column :listings, :wage, :integer
  end
end
