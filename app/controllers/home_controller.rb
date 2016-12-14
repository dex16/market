class HomeController < ApplicationController

  def index
    @things = current_user.try(:thing)
  end

  def all_things
    @things = Thing.all
  end
end
