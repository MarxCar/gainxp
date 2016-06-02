class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.timestamps null: false
    end
    
    create_table 'categories_products', :id => false do |t|
      t.column :category_id, :integer
      t.column :product_id, :integer
    end
    
  end
end
