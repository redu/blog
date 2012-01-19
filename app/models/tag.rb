class Tag < ActiveRecord::Base

	has_and_belongs_to_many :posts
	
	# verifica se foi informado um nome para a tag
	# TODO confirmar o intervalo aceitável para o tamanho do nome
	validates :name, :presence => true, :length => 1..30

end
