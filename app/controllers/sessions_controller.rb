class SessionsController < ApplicationController
  def create
    member = Member.find_by(name: params[:name])
    # 存在しない名前が送信されてきた場合は、memberにnilがセットされるため、ぼっち演算子でエラー防止
    if member&.authenticate(params[:password])
      session[:member_id] = member.id
    else
      flash.alert = "名前とパスワードが一致しません"
    end
    redirect_to :root
  end

  def destroy
    # セッションデータを削除して、トップページにリダイレクト
    session.delete(:member_id)
    redirect_to :root
  end

end
