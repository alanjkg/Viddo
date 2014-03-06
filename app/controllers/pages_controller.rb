class PagesController < ApplicationController
  def home
    @search_response = YOUTUBE_CLIENT.execute!(
      :api_method => YOUTUBE.search.list,
      :parameters => {:part => 'id,snippet'}
    )
  end

  def contact
  end

  def about
  end

  def join
  end


end
