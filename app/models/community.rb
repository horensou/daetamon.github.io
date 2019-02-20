class Community < ActiveRecord::Base
  mount_uploader :image
  
    searchable do
    text :title
    text :content
  end
   has_many :comments
   is_impressionable
   
  
   has_many :likes
    has_many :l_users, through: :likes, source: :user
end
