class VideosController < ApplicationController
    before_action :find_video, only: [:edit, :update, :delete, :show]
    
    def index
        @videos = Video.all
    end
    
    def new
        @video = Video.new
    end
    
    def create
        @video = Video.new(video_params)
        if @video.save!
            flash[:notice] = "You have successfully added a video!"
            redirect_to video_path(@video)
        else
            flash[:alert] = "There was an error creating the video!"
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @video.update_attributes(video_params)
            flash[:alert] = "You have successfully updated this video!"
            redirect_to video_path(@video)
        else
            flash[:alert] = "There was an error updating this video!"
            render :edit
        end
    end
    
    def show
    end
    
    def destroy
        if @video.destroy
            flash[:notice] = "You have successfully deleted this video!"
            redirect_to videos_path
        else
            flash[:alert] = "There was an error deleting this video!"
        end
    end
    
    private
    
    def video_params
        params.require(:video).permit(:title, :link, :description)
    end
    
    def find_video
        @video = Video.find(params[:id])
    end
end
