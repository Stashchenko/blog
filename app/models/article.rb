class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :content, type: String


  embeds_many :comments, cascade_callbacks: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
