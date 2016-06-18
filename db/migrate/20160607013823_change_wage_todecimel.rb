class ChangeWageTodecimel < ActiveRecord::Migration
  def change
    change_column :listings, :wage, :decimal
  end
end
