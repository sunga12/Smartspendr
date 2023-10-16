class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
  end

  def create
  end

  def show
    @group = Group.find(params[:group_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
