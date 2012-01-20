class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :recoverable, :registerable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
	
	has_many :posts

	# verifica se foi informado um email para o usuario
	# possivelmente validates_format_of invalidaria um email inexistente
	# portanto, mantive o codigo abaixo apenas para finalidade de informação
	validates :email, :presence  => true

	# valida o formato de email
	# validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :on => :create
	validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@redu.com.br/

	# verifica a existência de uma senha de usuário e valida seu tamanho
	# TODO confirmar o tamanho mínimo aceitável para senha
	validates :password, 	:presence => true,
							:length => { :minimum => 5 }
end
