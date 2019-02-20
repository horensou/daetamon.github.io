class Ask < ActiveRecord::Base
    searchable do
    text :title
    text :content 
  end
end
