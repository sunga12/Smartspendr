class EntitiesController < ApplicationController
    # only: [:index, :new, :create, :edit, :update, :destroy]
    def index
      @entities = Entity.groupfind(params())
    end
  
    def new
    end
  
    def create
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end
end
