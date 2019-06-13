class ApplicationController < ActionController::Base
  # 引数に指定された名前のメソッドをテンプレートの中でも使えるメソッドとして登録する
  helper_method :current_member


  class LoginRequired < StandardError; end
  class Forbidden < StandardError; end

  private def login_required
    raise LoginRequired unless current_member
  end
end
