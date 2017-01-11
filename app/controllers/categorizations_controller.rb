class CategorizationsController < ApplicationController
    before_action :find_categorization, only: [:edit, :update, :show, :delete]
    
    def index
        @categorizations = Categorization.all
    end
    
    def new
        @categorization = Categorization.new
    end
    
    def create
        @categorization = Categorization.new(categorization_params)
        if @categorization.save!
            flash[:notice] = "You have successfully added a video to a category!"
            redirect_to categorization_path(@categorization)
        else
            flash[:alert] = "There was an error adding the video to the category"
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @categorization.update_attributes(categorization_params)
            flash[:notice] = "You have successfully updated the video of the category"
            redirect_to categorization_path(@categorization)
        else
            flash[:alert] = "There was an error updating the video of the category"
            render :edit
        end
    end
    
    def show
    end
    
    def destroy
        if @categorization.destroy
            flash[:notice] = "Successfully removed video from category"
            redirect_to categorizations_path
        else
            flash[:alert] = "There was an error removing the video from the category"
        end
    end
    
    private
    
    def categorization_params
        params.require(:categorization).permit(:category_id, :video_id)
    end
    
    def find_categorization
        @categorization = Categorization.find(params[:id])
    end
end
