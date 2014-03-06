class Collection < ActiveRecord::Base
	has_many :videos, through: :relationships 
	belongs_to :user
end
