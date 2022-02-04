class HelloController < ApplicationController
  def index
    @musics = Music.all
  end
end
