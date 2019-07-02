class Entry < ApplicationRecord

  # タイトルは空を禁止 200文字以内
  validates :title, presence: true, length: { maximum: 15 }
  # 本文と投稿日は空を禁止
  validates :body, :posted_at, presence: true

end
