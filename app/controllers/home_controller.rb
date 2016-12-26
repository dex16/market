class HomeController < ApplicationController

  def index
    @things = current_user.try(:things)
  end

  def all_things

	@things = Thing.all.where("user_id != ?", current_user.id)
	@bl = current_user.black_lists
  end
end
