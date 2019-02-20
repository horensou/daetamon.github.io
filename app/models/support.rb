class Support < ActiveRecord::Base
    is_impressionable
    mount_uploader :image
  searchable do
    text :title
    text :content 
  end
end
