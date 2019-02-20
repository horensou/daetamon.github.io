class CreateInfocomments < ActiveRecord::Migration
  def change
    create_table :infocomments do |t|
      t.text :content
      t.integer :info_id
      t.timestamps null: false
    end
  end
end
