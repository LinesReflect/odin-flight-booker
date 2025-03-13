class ChangeColumnName < ActiveRecord::Migration[8.0]
  def change
    rename_column :flights, :start_date, :departure_date
  end
end
