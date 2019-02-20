class CreateAskcomments < ActiveRecord::Migration
  def change
    create_table :askcomments do |t|
      t.text :comment
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
