class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :content
    	
    	t.integer :user_id
    	t.integer :post_id
    	t.integer :original_id

    	t.timestamps
    end
  end
end
