class InfoController < ApplicationController

  def gem_list
    @gems = `gem list`.split("\n")
  end

  def users_list
    @users = User.all.select {|user| user.id != current_user.id }
  end

  def sent_friendships
    @sent_friendships = Friendship.where(owner_id: current_user.id)
  end

  def received_friendships
    @received_friendships = Friendship.where(friend_id: current_user.id)    
  end

end
