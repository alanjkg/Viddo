class Collection < ActiveRecord::Base
	has_many :videos, through: :relationships 
	belongs_to :user

	validates :title, presence: true, length: { maximum: 70 }
	validates :description, presence: true, length: { maximum: 175 }
	validates :image, presence: true 
	validates :title, :description, uniqueness: true 


	

	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else 
			find(:all)
		end 
	end 

end
