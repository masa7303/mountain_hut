class MembersController < ApplicationController
  def index
    @members = Member.order("id")
    .page(params[:page]).per(15)
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new(birthday: Date.new(1980,1,1))
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to @member, notice: "職員を登録しました。"
    else
      render "new"
    end
  end

  def update
    @member = Member.find(params[:id])
    # 複数の値を同時更新したい時
    @member.assign_attributes(member_params)
    if @member.save
      redirect_to @member, notice: "職員情報を登録しました"
    else
      render "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice: "職員を削除しました。"
  end

  private
   def member_params
     params.require(:member).permit(:name, :full_name, :email, :birthday, :sex, :administrator)
   end
end
