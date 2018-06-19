class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  index({ ﻿commentable_type: 1, ﻿commentable_id: 1})

end
