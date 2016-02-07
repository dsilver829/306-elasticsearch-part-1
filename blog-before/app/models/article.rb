require 'elasticsearch/model'

class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def self.search(params)
    query = params[:query] ? params[:query].to_s : "*:*"
    __elasticsearch__.search(query).records
  end
end
