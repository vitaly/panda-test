class Video < ActiveRecord::Base
  def update_panda_status(panda_video)
    # If the video has been encoded, save the url of the standard quality flash video which users will watch
    if encoding = panda_video.find_encoding(PANDA_ENCODING)
      if encoding.status == 'success'
        self.filename = encoding.filename
        self.width = encoding.width
        self.height = encoding.height
        self.save
      end
    end
  end

  def url
  "http://#{VIDEOS_DOMAIN}/#{self.filename}"
  end

  def screenshot_url
  "#{self.url}.jpg"
  end

  def embed_html
  %(<embed src="http://#{VIDEOS_DOMAIN}/player.swf" width="#{self.width}" height="#{self.height}" allowfullscreen="true" allowscriptaccess="always" flashvars="&displayheight=#{self.height}&file=#{self.url}&image=#{self.screenshot_url}&width=#{self.width}&height=#{self.height}" />)
  end
end
