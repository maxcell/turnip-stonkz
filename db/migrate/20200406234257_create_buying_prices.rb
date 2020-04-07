class CreateBuyingPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :buying_prices do |t|
      t.belongs_to :user
      t.integer :price
      t.integer :amount
      t.datetime :time_submitted

      t.timestamps
    end
  end
end
