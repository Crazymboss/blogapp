class DashboardsController < ApplicationController
  def index
    @postares = Postare.joins(:user).all
  end
end
