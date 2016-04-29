class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
    render :index
  end

  def new
    @creature = Creature.new
    render :new
  end

  def show
    creature_id = params[:id]

      # use `creature_id` to find the creature in the database
      # and save it to an instance variable
      @creature = Creature.find_by_id(creature_id)

      # render the show view (it has access to instance variable)
      render :show
  end

  # create a new creature in the database
  def create
    creature_params = params.require(:creature).permit(:name, :description)

    creature = Creature.new(creature_params)

    if creature.save
      redirect_to creature_path(creature)

    end
  end

  def edit
    creature_id = params[:id]

    # use `creature_id` to find the creature in the database
    # and save it to an instance variable
    @creature = Creature.find_by_id(creature_id)

    # render the edit view (it has access to instance variable)
    render :edit
  end

  def update
    creature_id = params[:id]

      # use `creature_id` to find the creature in the database
      # and save it to an instance variable
      creature = Creature.find_by_id(creature_id)

      # whitelist params and save them to a variable
      creature_params = params.require(:creature).permit(:name, :description)

      # update the creature
      creature.update_attributes(creature_params)

      # redirect to show page for the updated creature
      redirect_to creature_path(creature)
  end

end
