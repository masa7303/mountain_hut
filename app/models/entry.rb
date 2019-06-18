class Entry < ApplicationRecord

  STATUS_VALUES = %w(draft member_only public)

  # タイトルは空を禁止 200文字以内
  validates :title, presence: true, length: { maximum: 200 }
  # 本文と投稿日は空を禁止
  validates :body, :posted_at, presence: true
  # 状態の文字列は３つのうちいずれか
  validates :status, inclusion: { in: STATUS_VALUES }

  # 公開記事
  scope :common, -> { where(status: "public") }
  # 下書き状態では無い記事
  scope :published, -> { where("status <> ?", "draft")}
  # 引数に渡された職員の書いた記事か、下書き状態ではない記事
  scope :full, ->(member){
    where("status <> ? OR member_id = ?", "draft", member.id)}
  # ログイン前のユーザーには公開記事だけを見せ、ログイン後には公開記事と職員限定記事、自分の下書き記事を表示
  scope :readable_for, ->(member) { member ? full(member) : common }

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
