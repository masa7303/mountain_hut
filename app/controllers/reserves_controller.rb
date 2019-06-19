class ReservesController < ApplicationController
  def index
    @reserve = Reserve.new
  end

  def new

  end
end
