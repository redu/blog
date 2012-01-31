class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :recoverable, :registerable, 
  	:rememberable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  	:username, :description, :profile_link
	
	# associa usuario a suas postagens
	has_many :posts

	# valida email
	# validates :email, :presence  => true
	validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@redu.com.br/

	# valida senha
	validates :password, :length => { :minimum => 5 }
							
	# valida descricao
	validates :description, :length => 50..90
	
	# valida link do perfil Redu
	validates :profile_link, :presence => true
	validates_format_of :profile_link, 
							:with => /http:\/\/[www.]*redu.com.br\/pessoas\/[a-zA-Z_0-9]+/,
							:message => '(é necessário informar um link de perfil válido)'
	
end
