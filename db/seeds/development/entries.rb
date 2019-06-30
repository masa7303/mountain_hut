body =
  "今日の天気は晴れでした。\n\n" +
  "登山客もいっぱい！。" +
  "周辺には高山植物も顔を出すようになりました。" +
  "周辺には高山植物も顔を出すようになりました。" +
  "周辺には高山植物も顔を出すようになりました。" +
  "周辺には高山植物も顔を出すようになりました。" +
  "今週末はぜひ立山ロッジへお越しください！"

%w(Taro Jiro Hana).each do |name|
  0.upto(9) do |idx|
    Entry.create(
      title: "今日の景色#{idx}",
      body: body,
      posted_at: 10.days.ago.advance(days: idx)
    )
  end
end
