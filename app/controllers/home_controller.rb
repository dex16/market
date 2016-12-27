class HomeController < ApplicationController

  def index
    @things = current_user.try(:things)
  end

  def all_things
    #@bl = BlackList.all.where("user_id = ?", current_user.id)
	#@things = Thing.all.where("user_id != ? AND id != ?", current_user.id, bl.id)
	#@things = Thing.all.where("id != ?", bl.thing_id)
    #Thing.joins("INNER JOIN black_lists ON things.user_id = black_lists.user_id").where("things.id = black_lists.thing_id")
	#Thing.all.where("user_id != ? AND thing_id NOT IN ?", current_user.id, BlackList.select("thing_id").where("user_id = ?", current_user.id))

#Thing.all.where("user_id != ? AND id NOT IN ?", u.id, BlackList.select("thing_id").where("user_id = ?", u.id))
	@things = Thing.all.where("user_id != ? AND id NOT IN (?)", current_user.id, BlackList.select(:thing_id).where("user_id = ?", current_user.id))

#Thing.all.where("user_id != ? AND id NOT IN (?)", u.id, BlackList.select(:thing_id).where("user_id = ?", u.id))
  end
end
