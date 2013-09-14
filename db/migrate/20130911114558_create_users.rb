class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :profile_image
      t.date   :dob

      t.timestamps
    end
  end
end
