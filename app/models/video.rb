class Video < ActiveRecord::Base
	belongs_to :user
	has_many :collections, through: :relationships
end 
