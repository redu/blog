class Post < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  validates :title, :presence => true, :length => { :maximum => 140 }

  # valida o corpo da postagem (deve existir e não possui limite de tamanho)
  validates :body, :presence => true

  # Atualiza as tags relacionadas ao post
  def update_tags(tags_id)
    self.tags = []
    unless tags_id == nil
      tags_id[:id].each {|new_tag| self.tags << Tag.find(new_tag)}
    end
    self.save
  end

	def to_param
		"#{id} #{title}".parameterize
	end

  def self.search query
    result_posts = []

    Post.all.collect do |post|
      Post.relevant_terms(query).collect do |term|
        if (post.body.downcase.include? term.downcase or 
            post.title.downcase.include? term.downcase)
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

  def self.filter_archive(year, month)
    if year == nil and month == nil
      Post.all(:order => 'created_at DESC')
    elsif month == nil
      Post.all(:order=>"created_at DESC").group_by { |t| t.created_at.year.to_s}[year.to_s]
    elsif year == nil
        Post.all(:order=>"created_at DESC").group_by { |t| t.created_at.strftime("%m")}[t month.to_s]
    else
      Post.all(:order=>"created_at DESC").group_by { |t| t.created_at.year.to_s + '.' +t.created_at.strftime('%m')}[year.to_s+'.'+month.to_s]
    end
  end

end
