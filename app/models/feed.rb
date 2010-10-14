class Feed < ActiveRecord::Base
  attr_accessible :title, :description, :pubdate
end
