class User < ActiveRecord::Base
  # Configura o Devise. Outras possíveis configurações são:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :recoverable, :registerable,
  	     :rememberable, :confirmable

  # Configura atributos acessíveis.
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  	              :username, :description, :profile_link

	# Associa usuário a suas postagens.
	has_many :posts

  # Valida unicidade da coluna email.
  validates_uniqueness_of :email

	# Valida o formato do e-mail.
	validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@redu.com.br/

	# Valida formato da senha.
	validates :password, :length => { :minimum => 5 }, :unless => "password.blank?"

	# Valida descrição.
	validates :description, :length => 50..90

	# Valida link do perfil do Redu.
	validates :profile_link, :presence => true
	validates_format_of :profile_link,
							        :with => /http:\/\/[www.]*redu.com.br\/pessoas\/[a-zA-Z_0-9]+/,
							        :message => '(é necessário informar um link de perfil válido)'

end
