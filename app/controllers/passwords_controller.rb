class PasswordsController < ApplicationController
  before_action :login_required

  def show
    redirect_to :account
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    current_password = params[:account][:current_password]

    if current_password.present?
      # 現在のパスワードが正しいかどうか確認している
      if @member.authenticate(current_password)
        @member.assign_attributes(params[:account])
        # 新しいパスワードの保存に成功したら、マイアカウントページに遷移
        if @member.save
          redirect_to :account, notice: "パスワードを変更しました。"
        else
          render "edit"
        end
      else
        @member.errors.add(:current_password, :wrong)
        render "edit"
      end
    else
      @member.errors.add(:current_password, :empty)
      render "edit"
    end
  end
end
