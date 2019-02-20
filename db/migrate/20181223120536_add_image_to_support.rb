class AddImageToSupport < ActiveRecord::Migration
  def change
    add_column :supports, :image, :string
  end
end
