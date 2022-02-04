class MusicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
      if params[:search] == nil
        @musics= Music.all
      elsif params[:search] == ''
        @musics= Music.all
      else
        @musics = Music.where("artist_name LIKE ? ",'%' + params[:search] + '%')
      end
  end
  
  def link
  end
  
  def new
    @music = Music.new
  end
  
  def create
    music = Music.new(music_params)
    music.user_id = current_user.id
    if music.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
  
  def edit
    @music = Music.find(params[:id])
  end
  
  def update
    music = Music.find(params[:id])
    if music.update(music_params)
      redirect_to :action => "index", :id => music.id
    else
      redirect_to :action => "new"
    end
  end
  
  def destroy
    music = Music.find(params[:id])
    music.destroy
    redirect_to action: :index
  end
  
  private
    def music_params
      params.require(:music).permit(:artist_name,:song_name)
    end
  
end
