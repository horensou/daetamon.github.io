class AddUserIdToCommComment < ActiveRecord::Migration
  def change
    create_table :comm_comments do |t|
      t.text :message
      t.integer :article_id
      t.string :user
      
      t.timestamps null: false
    end
  end
end
