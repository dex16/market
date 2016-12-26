class ThingsController < ApplicationController
  
  def new
	@thing = current_user.things.build
  end

  def create
    @thing = current_user.things.build(thing_params)
    if @thing.save
      redirect_to root_path, notice: "Предмет добавлен."
    else
      render :new
    end
  end

  def destroy
    @thing = Thing.find(params[:id])
    notice = if @thing.destroy
      "Предмет удален."
    else
      "Не удалось удалить предмет."
    end
    redirect_to root_path, notice: notice
  end

  def thing_params
    params.require(:thing).permit(:name, :category, :user_id)
  end
end
