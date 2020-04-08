class AddTimeOfDayToSellingPrice < ActiveRecord::Migration[6.0]
  def change
    add_column :selling_prices, :time_of_day, :string, null: false, default: 'morning'
  end
end
