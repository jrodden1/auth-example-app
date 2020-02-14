class CreateSeedOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :seed_orders do |t|
      t.string :name
      t.datetime :order_date
      t.string :pickup_location
      t.string :season

      t.timestamps
    end
  end
end
