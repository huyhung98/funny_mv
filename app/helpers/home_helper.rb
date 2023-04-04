module HomeHelper
  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
  
    %Q{<iframe title="YouTube video player" src="https://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen class="youtube-frame"></iframe>}
  end
end