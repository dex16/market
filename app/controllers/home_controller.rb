class HomeController < ApplicationController

  def index
    @things = current_user.try(:things)
  end

  def all_things

	@things = Thing.all.where("user_id != ? AND id NOT IN (?)", current_user.id, BlackList.select(:thing_id).where("user_id = ?", current_user.id))


  end
end
