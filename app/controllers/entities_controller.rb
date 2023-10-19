class EntitiesController < ApplicationController
    # only: [:index, :new, :create, :edit, :update, :destroy]
    def index
      @group = current_user.groups.find(params[:group_id])
      @entities = @group.entities.order(created_at: :desc)

    end
  
    def new
      @entity = Entity.new
      @group = current_user.groups.find(params[:group_id])

      respond_to do |format|
        format.html { render :new }
      end
    end
  
    def create
      group_ids = params[:entity][:group_ids].reject(&:empty?)

      if group_ids.any?
        @groups = current_user.groups.where(id: group_ids)
        @entity = Entity.new(entity_params)
        @entity.author_id = current_user.id

        respond_to do |format|
          format.html do
            if @entity.save
              @entity.groups << @groups
              redirect_to group_entities_path, notice: 'Transaction Added successfully'
            else
              flash.now[:error] = 'Error: Transaction could not be added'
              logger.error(@entity.errors.full_messages) # Log validation errors
              render :new, notice: 'Error: Transaction could not be added'
            end
          end
        end
      else
        flash[:error] = 'Error: Please select at least one group'
        redirect_to new_group_entity_path(group_id: params[:group_id])
      end
    
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end

    private 

    def entity_params
      params.require(:entity).permit(:name, :amount, :group_ids)
    end
end
