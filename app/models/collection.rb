class Collection < ActiveRecord::Base
	has_and_belongs_to_many :videos, -> {order("youtube_id").uniq}
	belongs_to :user

	validates :title, presence: true, length: { maximum: 70 }

	validates :title, uniqueness: true
	validates :title, uniqueness: { case_sensitive: false }

	validates :description, presence: true, length: { maximum: 175 }

	acts_as_followable


	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end

end
