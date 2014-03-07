class PagesController < ApplicationController

  def home
  end

<<<<<<< HEAD
  def player     
=======
  def player
    @search_response = YOUTUBE_CLIENT.execute!(
      :api_method => YOUTUBE.videos.list,
      :parameters => {:part => 'id,snippet', :videoCategoryId => '17', :chart => 'mostPopular'}
    )

>>>>>>> 433a726d477a6982220afd5f74660502d3bdde24
  end

  def contact
  end

  def about
  end

  def join
  end


end
