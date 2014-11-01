class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.integer :user_id, null: false
  		t.string :title
  		t.text :text
  		t.string :url, null: false

  		t.timestamps
  	end
  end
end
