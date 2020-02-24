class ReservesController < ApplicationController
  def new
    @reserve = Reserve.new
  end

  def show
    @reserve = Reserve.find(reserve_params)
  end

  def create
    @reserve = Reserve.new(reserve_params)
    @reservations = Reserve.where('reservation_start <= ? and reservation_end >= ?', @reserve.reservation_end, @reserve.reservation_start)

    count = @reservations.count
    capacity = @reservations.sum(:number_of_people)

    if capacity + @reserve.number_of_people > 10
      flash[:notice] = "ご希望の宿泊期間は利用者数の上限に達しているためご利用できません"
      render :new
    elsif count > 5
      flash[:notice] = "ご希望の宿泊予定日は満室なためご利用できません"
      render :new
    elsif @reserve.save
      redirect_to @reserve, notice: "予約を受付けました"
    end
  end

  def index
  end

  private

    def reserve_params
      params.require(:reserve).permit(:id, :reservation_start, :reservation_end, :number_of_people,
        :name, :phonetic, :phone_number, :mail, :mail_confirm, :plan, :password, :password_confirm)
    end
end
