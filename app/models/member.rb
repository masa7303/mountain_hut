class Member < ApplicationRecord

  # ある会員が削除されると、その会員が書いたブログ記事も削除される
  has_many :entries, dependent: :destroy

end
