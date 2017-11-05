class HomeController < ApplicationController
  def index
    @schedules = Schedule.all.order("appointment desc")
  end
end
