class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :order_status, default: 0
      t.integer :order_type, default: 0
      t.string :description
      t.belongs_to :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
