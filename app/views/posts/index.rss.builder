xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Redu Blog"
    xml.description ("Blog da plataforma educacional Redu - Redu Educational 
                     Technologies")
    xml.link posts_url
 
    for post in @posts
      xml.item do
        xml.title post.title
        xml.body post.body
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
