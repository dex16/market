class ThingsController < ApplicationController

  before_action :set_thing, only: [ :edit, :update, :destroy ]

  def index
    @things = Thing.all
  end
  
  def new
	@thing = current_user.things.build
  end

  def create
    @thing = current_user.things.build(thing_params)
    if @thing.save
      redirect_to root_path, notice: "Transaction was successfully added."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @thing.category = params[:thing][:category]
    if @thing.update(thing_params.reject { |k,v| k == "amount" })
      redirect_to root_path, notice: "Thing was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    notice = if @thing.destroy
      "Transaction was successfully deleted."
    else
      "Could not delete transaction."
    end
    redirect_to root_path, notice: notice
  end

  def set_thing
    @thing = Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(:name, :category, :user_id)
  end
end
