class Link < ActiveRecord::Base
  attr_accessible :content, :user_id, :title, :url
end
