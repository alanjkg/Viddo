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

     def video_helper video_id
        video = '<iframe id="player" type="text/html" width="100%" height="500px"
        src="http://www.youtube.com/embed/' + video_id + '?enablejsapi=1&origin=http://localhost:3000"
        frameborder="0"></iframe>'

        video.html_safe
    end
end
