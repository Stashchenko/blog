class InfoController < ApplicationController

  def gem_list
    @gems = `gem list`.split("\n")
  end

end