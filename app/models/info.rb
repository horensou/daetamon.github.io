class Info < ActiveRecord::Base
  is_impressionable
  mount_uploader :image 
  has_many :infocomments
  #solr
  searchable do
    text :title
    text :content 
  end
end
