class DropTable < ActiveRecord::Migration
  def change
    
    drop_table :categories_products
    
    
    create_table 'categories_listings', :id => false do |t|
      t.column :category_id, :integer
      t.column :listing_id, :integer
    end
  end
end
