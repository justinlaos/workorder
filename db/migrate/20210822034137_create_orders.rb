class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status, default: "created"
      t.string :type
      t.belongs_to :property, foreign_key: true

      t.timestamps
    end
  end
end
