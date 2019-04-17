class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

def show
    @album = Album.find(params[:id])
    @photos = @album.photos
  end

def create
    @album = Album.new(album_params)
    @album.user_id = params[:user_id]
     if @album.valid? 
      @album.save 
      redirect_to "/users/#{params[:user_id]}/albums/#{@album.id}"
     else
      render 'new'
  end
end

def index 
    @albums = Album.all
end


  def update 
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to "/users/#{params[:user_id]}", notice: "album Updated"
    end
  end

  def destroy 
    @album = Album.find(params[:id])
    @album.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@user.id) }
      format.json { head :no_content }
      format.js { render :layout => false }
    end
  end


  private 
  def album_params
    params.require(:album).permit(:title, :pictures)
  end 
end
