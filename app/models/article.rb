class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Commentable
  belongs_to :user

  field :name, type: String
  field :content, type: String

end
