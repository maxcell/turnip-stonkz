class CreateSellingPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :selling_prices do |t|
      t.belongs_to :user
      t.integer :price
      t.datetime :time_submitted

      t.timestamps
    end
  end
end
