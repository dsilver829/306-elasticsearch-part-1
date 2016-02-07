require 'elasticsearch/model'

class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
