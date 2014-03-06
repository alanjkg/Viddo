class PagesController < ApplicationController
  def home
    @search_response = YOUTUBE_CLIENT.execute!(
      :api_method => YOUTUBE.videos.list,
      :parameters => {:part => 'id,snippet', :videoCategoryId => '17', :chart => 'mostPopular'}
    )

  end

  def contact
  end

  def about
  end

  def join
  end


end
