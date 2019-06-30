class Entry < ApplicationRecord

  STATUS_VALUES = %w(draft member_only public)

  # タイトルは空を禁止 200文字以内
  validates :title, presence: true, length: { maximum: 200 }
  # 本文と投稿日は空を禁止
  validates :body, :posted_at, presence: true
  # 状態の文字列は３つのうちいずれか
  validates :status, inclusion: { in: STATUS_VALUES }

  class << self
    # ステータスカラムの値を日本語に変換
    def status_text(status)
      I18n.t("activerecord.attributes.entry.status_#{status}")
    end

    # [["下書き","draft"]]のような配列を作成する
    def status_options
      STATUS_VALUES.map { |status| [status_text(status),status]}
    end
  end

end
