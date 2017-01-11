class PornstarsController < ApplicationController
  before_action :find_pornstar, only: [:edit, :update, :show, :delete]

  # Index action to render all pornstars
  def index
    @pornstars = Pornstar.all
  end

  # New action for creating pornstar
  def new
    @pornstar = Pornstar.new
  end

  # Create action saves the pornstar into database
  def create
    @pornstar = Pornstar.new(pornstar_params)
    if @pornstar.save
      flash[:notice] = "Successfully created pornstar!"
      redirect_to pornstar_path(@pornstar)
    else
      flash[:alert] = "Error creating new pornstar!"
      render :new
    end
  end

  # Edit action retrives the pornstar and renders the edit page
  def edit
  end

  # Update action updates the pornstar with the new information
  def update
    if @pornstar.update_attributes(pornstar_params)
      flash[:notice] = "Successfully updated pornstar!"
      redirect_to pornstar_path(@pornstar)
    else
      flash[:alert] = "Error updating pornstar!"
      render :edit
    end
  end

  # The show action renders the individual post after retrieving the the id
  def show
  end

  # The destroy action removes the post permanently from the database
  def destroy
    if @pornstar.destroy
      flash[:notice] = "Successfully deleted pornstar!"
      redirect_to pornstars_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  def pornstar_params
    params.require(:pornstar).permit(:name, :picture)
  end

  def find_pornstar
    @pornstar = Pornstar.find(params[:id])
  end
end
