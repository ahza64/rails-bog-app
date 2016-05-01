class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
    render :index
  end

  def new
    @creatures = Creature.new
    render :new
  end

  def create
    # gather data
    c_params = params.require(:creature).permit(:name, :description)
    # add to db
    creature = Creature.new(c_params)
    # if save success, direct to show page
    if creature.save
      redirect_to creature_path(creature)
    end
  end

  def show
    # get id
    creature_id = params[:id]
    # find creature and set var to use in view
    @creature = Creature.find_by_id(creature_id)
    # show show page
    render :show
  end

  def edit
    # get id
    id = params[:id]
    # find creature and set instanse var to use in view
    @creature = Creature.find_by_id(id)
    # show edit page
    render :edit
  end

  def update
    # get id
    id = params[:id]
    # find creature
    creature = Creature.find_by_id(id)
    # gather data
    c = params.require(:creature).permit(:name, :description)
    # add to db
    creature.update_attributes(c)
    redirect_to creatures_path
  end

  def destroy
    # find id
    id = params[:id]
    # find creature
    creature = Creature.find_by_id(id)
    # remove creature
    creature.destroy
    # move to index page
    redirect_to creatures_path
  end

end
