class AddSalaryDeadlineAndLocationToListing < ActiveRecord::Migration
  def change
    add_column :listings, :salary, :integer
    add_column :listings, :deadline, :date
    add_column :listings, :organization, :string
  end
end
