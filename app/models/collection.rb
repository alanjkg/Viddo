class Collection < ActiveRecord::Base
	has_and_belongs_to_many :videos
	belongs_to :user

	validates :title, presence: true, length: { maximum: 70 }
	validates :title, uniqueness: true 
	validates :title, uniqueness: { case_sensitive: false }
end
