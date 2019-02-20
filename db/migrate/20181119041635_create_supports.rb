class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.text :title
      t.text :content

      t.timestamps null: false
    end
  end
end
