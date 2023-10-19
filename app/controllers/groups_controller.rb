class GroupsController < ApplicationController
  def index
    @groups = Group.where(author_id: current_user.id)
  end

  def new
    @group = Group.new

    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @group = Group.new(group_params)
    @group.author_id = current_user.id

    respond_to do |format|
      format.html do
        if @group.save
          redirect_to groups_path, notice: 'Category Saved successfully'
        else
          flash.now[:error] = 'Error: Category could not be saved'
          render :new
        end
      end
    end
  end

  # def show
  #   @group = Group.find(params[:group_id])
  # end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end

