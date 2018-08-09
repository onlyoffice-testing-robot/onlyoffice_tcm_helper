source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in onlyoffice_tcm_helper.gemspec
gemspec

group :test do
  gem 'codecov', require: false
  gem 'onlyoffice_file_helper'
  gem 'rspec'
end

group :development do
  gem 'onlyoffice_file_helper'
  gem 'overcommit', require: false
  gem 'rubocop', require: false
end
