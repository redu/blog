class Post < ActiveRecord::Base

	def to_param
		"#{id} #{title}".parameterize
	end

	belongs_to :user
	has_and_belongs_to_many :tags
    accepts_nested_attributes_for :tags

	# TODO confirmar a obrigatoriedade da existência de um título para postagem
	# TODO confirmar o tamanho máximo permitido para o título de um post
	validates :title, :presence => true, :length => { :maximum => 140 }

	# valida o corpo da postagem (deve existir e não possui limite de tamanho)
	validates :body, :presence => true

	# TODO viabilizar a validação da associação post-user (usuário deve existir)

    # Atualiza as tags relacionadas ao post
    def update_tags(tags_id)
      #FIXME: otimizar
      self.tags = []
      unless tags_id == nil
        tags_id[:id].each {|new_tag| self.tags << Tag.find(new_tag)}
      end
      self.save
    end

    def self.search query
      result_posts = []

      Post.all.collect do |post|
        Post.relevant_terms(query).collect do |term|
          if post.body.downcase.include? term.downcase or post.title.downcase.include? term.downcase
            result_posts << post
          end
        end
      end
      result_posts
    end

    def self.relevant_terms query
      query.strip!
      if query.include? ','
        query.gsub!(',', ' ')
      end
      term_list = query.split.collect! {|term| term.strip}
      Post.remove_stop_words(term_list)
    end

    def self.remove_stop_words term_list
      relevant_terms = []
      stop_words = Blog::Application.config.stop_words

      term_list.collect do |term|
        unless stop_words.include? term
          relevant_terms << term
        end
      end
      relevant_terms
    end

end
