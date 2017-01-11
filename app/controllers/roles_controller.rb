class RolesController < ApplicationController
    before_action :find_role, only: [:edit, :update, :delete, :show]
    
    def index
        @roles = Role.all
    end
    
    def new
        @role = Role.new
    end
    
    def create
        @role = Role.new(role_params)
        if @role.save!
            flash[:notice] = "You have successfully added a pornstar to a video!"
            redirect_to role_path(@role)
        else
            flash[:alert] = "There was an error adding the pornstar to a video!"
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @role.update_attributes(role_params)
            flash[:notice] = "You have successfully updated the pornstar of the video"
            redirect_to role_path(@role)
        else
            flash[:alert] = "There was an error updating the pornstar of the video"
            render :edit
        end
    end
    
    def show
    end
    
    def destroy
        if @role.destroy
            flash[:notice] = "You have successfully removed the pornstar from the video"
            redirect_to roles_path
        else
            flash[:alert] = "There was an error removing the pornstar from the video"
        end
    end
    
    private
    
    def role_params
        params.require(:role).permit(:pornstar_id, :video_id)
    end
    
    def find_role
        @role = Role.find(params[:id])
    end
end
