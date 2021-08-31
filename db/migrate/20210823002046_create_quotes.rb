class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.boolean :selected, null: false, default: false
      t.string :time_est
      t.string :price_est
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
