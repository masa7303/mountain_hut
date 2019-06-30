body =
  "今日の天気は晴れ。\n\n" +
  "登山客もいっぱい！。" +
  "あああああああああああああああああああああああああああああああああああ。" +
  "あああああああああああああああああああああああああああああああああああ。\n\n" +
  "あああああああああああああああああああああああああああああああああああ。"

%w(Taro Jiro Hana).each do |name|
  0.upto(9) do |idx|
    Entry.create(
      title: "今日の景色#{idx}",
      body: body,
      posted_at: 10.days.ago.advance(days: idx)
    )
  end
end
