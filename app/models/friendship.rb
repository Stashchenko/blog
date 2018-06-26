class Friendship
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :owner, :class_name => "User"
  belongs_to :friend, :class_name => "User"

  field :status, :type => Symbol, :default => :idle

end
