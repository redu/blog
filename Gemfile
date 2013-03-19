source 'http://rubygems.org'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Rails
gem 'rails', '~> 3.2.13'

# Active Admin
gem 'activeadmin', '~> 0.5.1'

# JSon
gem 'json'

# Meta Search
gem "meta_search",    '>= 1.1.0.pre'

# RedCarpet
gem 'redcarpet'

# Devise (autenticação)
gem 'devise'

# Gem necessária para configuração do Action Mailer
gem 'tlsmail'

# JQuery Rails
gem 'jquery-rails'

# WYMEditor
gem 'wymeditor'

# Nokogiri
gem 'nokogiri'

# Sass Rails
gem 'sass-rails',   '~> 3.2.3'

# The Ruby Racer
gem 'therubyracer'

# Rack-Rewrite para sobrescrever URL's do blog antigo.
gem 'rack-rewrite', '~>1.2.1'

# Gems utilizadas para assets e desnecessárias ao ambiente de produção.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

# Gems utilizadas nos ambientes de desenvolvimento e testes.
group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.6'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  if RUBY_VERSION =~ /1.9/
    gem 'ruby-debug19'
  else
    gem 'ruby-debug'
  end
end

# Gems utilizadas no ambiente de produção.
group :production do
  gem 'pg'
end
