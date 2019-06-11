class ApplicationController < ActionController::Base
  # セッションデータ:member_idに値がセットされていれば該当するmemberオブジェクトを返し、そうでなければnilを返す
  private def current_member
    Member.find_by(id:session[:member_id])if session[:member_id]
  end
  # 引数に指定された名前のメソッドをテンプレートの中でも使えるメソッドとして登録する
  helper_method :current_member
end
