class AddDeadlineToListing < ActiveRecord::Migration
  def change
    def up
      add_column :listings, :deadline, :date
    end
    
   
  end
end
