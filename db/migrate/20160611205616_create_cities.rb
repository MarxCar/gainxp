class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :title
      t.timestamps null: false
    end
    
    add_reference :listings, :city, index: true
    add_foreign_key :listings, :cities
  end
end
