require 'google/api_client'

# Set DEVELOPER_KEY to the "API key" value from the "Access" tab of the
# Google Developers Console <https://cloud.google.com/console>
# Please ensure that you have enabled the YouTube Data API for your project.
DEVELOPER_KEY = Figaro.env.youtube_api
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"

YOUTUBE_CLIENT = Google::APIClient.new(:application_name => 'Viddo',
  :application_version => '1.0.0', :key => DEVELOPER_KEY,
                               :authorization => nil)
YOUTUBE = YOUTUBE_CLIENT.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

# videos = []
# channels = []
# playlists = []

# # Add each result to the appropriate list, and then display the lists of
# # matching videos, channels, and playlists.
# search_response.data.items.each do |search_result|
#   case search_result.id.kind
#     when 'youtube#video'
#       videos.push("#{search_result.snippet.title} (#{search_result.id.videoId})")
#     when 'youtube#channel'
#       channels.push("#{search_result.snippet.title} (#{search_result.id.channelId})")
#     when 'youtube#playlist'
#       playlists.push("#{search_result.snippet.title} (#{search_result.id.playlistId})")
#   end
# end

# puts "Videos:\n", videos, "\n"
# puts "Channels:\n", channels, "\n"
# puts "Playlists:\n", playlists, "\n"