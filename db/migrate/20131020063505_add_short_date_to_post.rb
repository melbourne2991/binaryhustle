class AddShortDateToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :date, :date
  end
end
