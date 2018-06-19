class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Commentable

  field :name, type: String
  field :content, type: String

end
