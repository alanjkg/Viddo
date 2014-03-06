class Collection < ActiveRecord::Base
	has_and_belongs_to_many :videos
	belongs_to :user
end
