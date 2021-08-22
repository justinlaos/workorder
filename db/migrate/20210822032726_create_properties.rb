class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :property_type
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :price
      t.string :bed_rooms
      t.string :bath_rooms
      t.string :square_feet
      t.string :lot_size
      t.string :year_built
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
