class TradeController < ApplicationController
  def index
	
  end

  def show
	@trade = Trade.all.where("user_id = ?", current_user.id)
  end

  def new
	@thing1_id = params[:thing_id]
  @user1_id = params[:user_id]
	#@t1 = Trade.new()

	@things = current_user.try(:things)

  end

  def create
    @t1 = Trade.new(user_id: params[:user_id], user2_id: params[:user2_id], thing_id: params[:thing_id], thing2_id: params[:thing2_id])
    if @t1.save
      redirect_to root_path, notice: "Предложение отправлено."
    else
      redirect_to all_things_path, notice: "Не удалось предложить обмен."
    end
  end

  def accept
    @trade= Trade.find(params[:id])
    notice = if @trade.destroy
               Thing.find(@trade.thing_id).destroy
               Thing.find(@trade.thing2_id).destroy
               "Обмен удался."
             else
               "Обмен не удался."
             end
    redirect_to root_path, notice: notice
  end

  def reject
    @trade= Trade.find(params[:id])
    BlackList.create(user_id: @trade.user_id, thing_id: @trade.thing2_id)
    BlackList.create(user_id: @trade.user2_id, thing_id: @trade.thing_id)
    redirect_to root_path, notice: "Предложение отклонено"
  end

  def destroy
    notice = if @thing.destroy
      "Предложение удалено."
    else
      "Ошибка! Предложение не удалено."
    end
    redirect_to trade_index, notice: notice
  end

  def thing_id
    params.permit( :user_id, :user2_id, :thing_id, :thing2_id)
  end

  def thing_params
    params.require(:thing).permit(:name, :category, :user_id)
  end
end
