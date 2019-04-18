class PhotosController < ApplicationController
    def new
        @photo = Photo.new
      end
    
      def edit
        @photo = Photo.find(params[:id])
      end
    
    def show
        @photo = Photo.find(params[:id])
      end
    
    def create
        @photo = Photo.new(photo_params)
        @album_id = params[:album_id]
        @photo_id = params[:photo_id]
        @photo.album_id = params[:album_id]
         if @photo.valid? 
          @photo.save 
          redirect_to "/users/#{params[:user_id]}/albums/#{params[:album_id]}"
         else
          render 'new'
         end
    end
    
    def index 
        @photos = Photo.all
    end
    
    
      def update 
        @photo = Photo.find(params[:id])
        if @photo.update(photo_params)
          redirect_to "/users/#{params[:user_id]}", notice: "photo Updated"
        end
      end
    
      def destroy 
        @photo = Photo.find(params[:id])
        @photo.destroy
        respond_to do |format|
          format.html { redirect_to user_path(@user.id) }
          format.json { head :no_content }
          format.js { render :layout => false }
        end
      end
    
    
      private 
      def photo_params
        params.require(:photo).permit(:picture)
      end 
end
