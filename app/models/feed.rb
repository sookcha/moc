class Feed < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :url ,:user_id
end
