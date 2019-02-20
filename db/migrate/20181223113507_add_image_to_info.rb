class AddImageToInfo < ActiveRecord::Migration
  def change
    add_column :infos, :image, :string
  end
end
