class ReservesController < ApplicationController
  def new
    @reserve = Reserve.new
  end

  def show
    @reserve = Reserve.find(params[:id])
  end

  def create
    @reserve = Reserve.new(reserve_params)
    count = Reserve.where(reservation_start: @reserve.reservation_start..@reserve.reservation_end,
      reservation_end: @reserve.reservation_start..@reserve.reservation_end)
    capacity = count.sum(:number_of_people)
    if capacity < 10 && @reserve.save
      redirect_to @reserve, notice: "予約を受付けました"
    else
      flash.alert = "ご希望の宿泊予定日は満室なためご利用できません"
    end
  end

  private

    def reserve_params
      params.require(:reserve).permit(:id, :reservation_start, :reservation_end, :number_of_people,
        :name, :phonetic, :phone_number, :mail, :mail_confirm, :plan, :password, :password_confirm)
    end
end
