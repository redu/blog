module ApplicationHelper

  def getAuthor(post)
    if post.user == nil
      author = 'Desconhecido'
    else
      author = link_to(post.user.username, post.user.profile_link, :class => "link_author")
    end
    author
  end

end
