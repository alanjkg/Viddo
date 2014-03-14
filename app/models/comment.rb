class Comment < ActiveRecord::Base
	belongs_to :video
	belongs_to :user


	validates :blog, length: { maximum: 140 }
end
