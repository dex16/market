class TradeController < ApplicationController
  def index
	@transactions = current_user.try(:trade_params)
  end

  def show
	@trade = Trade.all.where("user2 != ?", current_user.id)
  end

  def new
	@trade = current_user.thing.build(trade_params)
    if @thing.save
      redirect_to all_things_path, notice: "Предложение отправлено."
    else
      redirect_to all_things_path, notice: "Ошибка! Предложение не отправлено."
    end
  end

  def accept

  end

  def reject
  end

  def destroy
    notice = if @thing.destroy
      "Предложение удалено."
    else
      "Ошибка! Предложение не удалено."
    end
    redirect_to trade_index, notice: notice
  end

  def thing_params
    params.require(:thing).permit(:id :user_id)
  end

end
