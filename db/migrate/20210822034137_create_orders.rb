class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status, default: "created"
      t.string :type
      t.string :description
      t.belongs_to :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
