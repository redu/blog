class Post < ActiveRecord::Base

	def to_param
		"#{id} #{title}".parameterize
	end

	# TODO confirmar a obrigatoriedade da existência de um título para postagem
	# TODO confirmar o tamanho máximo permitido para o título de um post
	validates :title, :presence => true, :length => { :maximum => 140 }

	# valida o corpo da postagem (deve existir e não possui limite de tamanho)
	validates :body, :presence => true

	# TODO viabilizar a validação da associação post-user (usuário deve existir)

end
