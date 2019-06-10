class Member < ApplicationRecord
  # パスワードの保存と認証の仕組みをモデルクラスに追加できる
  has_secure_password

  # ある会員が削除されると、その会員が書いたブログ記事も削除される
  has_many :entries, dependent: :destroy

  validates :name, presence: true,
    # case_sensitive=大文字と小文字の区別
    uniqueness: { case_sensitive: false }

  validates :full_name, presence: true

  validates :email, email: { allow_blank: true }

end
