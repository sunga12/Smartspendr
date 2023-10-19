class EntitiesController < ApplicationController
    # only: [:index, :new, :create, :edit, :update, :destroy]
    def index
      # @groups = Group.where(author_id: current_user.id)
      # @entities = Entity.where(author_id: current_user.id)

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
      # @entity = Entity.new(entity_params)  
      @group = current_user.groups.find(params[:entity][:group_id])
      @entity = @group.entities.new(entity_params)
      @entity.author_id = current_user.id

      respond_to do |format|
        format.html do
          if @entity.save
            redirect_to group_entities_path, notice: 'Transaction Added successfully'
          else
            flash.now[:error] = 'Error: Transaction could not be added'
            logger.error(@entity.errors.full_messages) # Log validation errors
            render :new, notice: 'Error: Transaction could not be added'
          end
        end
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
      params.require(:entity).permit(:name, :amount, :group_id)
    end
end
