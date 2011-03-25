class Feed < ActiveRecord::Base
  attr_accessible :title, :description, :pubdate, :feed_type
end
