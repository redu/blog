module ApplicationHelper

	def getUsername(post)
		if post.user == nil
			poster = 'Desconhecido'
		else
			poster = post.user.username
		end
	end
	
end
