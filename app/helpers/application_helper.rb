module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Welcome to Viddo - Your own Personal Video Concierge"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end 
end
