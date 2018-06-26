class InfoController < ApplicationController

  def gem_list
    @gems = `gem list`.split("\n")
  end

  def users_list
    @users = User.all    
  end

end
