class Article < ApplicationRecord
  validates :title, :body, :released_at, presence: true
  validates :title, length: { maximum: 80 }
  validates :body, length: { maximum: 2000 }

  # expired_atの有無によってfasle or trueを返す
  def no_expiration
    expired_at.nil?
  end

  # 引数がtrueか文字列１の時に@no_expirationをtrueにする
  def no_expiration=(val)
    @no_expiration = val.in?([true, "1"])
  end

  # @no_expirationが真であれば、属性expired_atの値をnilにする
  before_validation do
    self.expired_at = nil if @no_expiration
  end

  validate do
    if expired_at && expired_at < released_at
      errors.add(:expired_at, :expired_at_too_old)
    end
  end

  scope :open_to_the_public, -> { where(member_only: false)}

  # 現在日時が掲載開始日時と掲載終了日時の間にある記事だけを取り出す
  scope :visible, -> do
    now = Time.current

    # 掲載終了日時が現在日時よりもあとであるか、掲載終了日時がセットされていない
    where("released_at <= ?", now)
      .where("expired_at > ? OR expired_at IS NULL", now)
  end
end
