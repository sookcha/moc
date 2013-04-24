class Link < ActiveRecord::Base
  attr_accessible :content, :owner, :title, :url
end
