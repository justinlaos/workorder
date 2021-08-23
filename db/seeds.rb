# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach(Rails.root.join('lib/properties_seeds.csv'), headers: true) do |row|
  Property.create( {
    property_type: row["PROPERTY_TYPE"],
    address: row["ADDRESS"], 
    city: row["CITY"], 
    state: row["STATE_OR_PROVINCE"], 
    zip_code: row["ZIP_OR_POSTAL_CODE"], 
    price: row["PRICE"], 
    bed_rooms: row["BEDS"], 
    bath_rooms:row["BATHS"], 
    square_feet: row["SQUARE_FEET"], 
    lot_size: row["LOT_SIZE"], 
    year_built: row["YEAR_BUILT"], 
    latitude: row["LATITUDE"], 
    longitude: row["LONGITUDE"]
  } ) 
end