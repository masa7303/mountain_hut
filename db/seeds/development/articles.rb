body =
  "2019年６月から料金が改正されます。\n\n" +
  "変更後の詳細は上部タブの「料金」からご確認ください。"

0.upto(9) do |idx|
  Article.create(
    title: "ロッジからのお知らせ#{idx}",
    body: body,
    released_at: 8.days.ago.advance(days: idx),
    expired_at: 2.days.ago.advance(days: idx),
    member_only: (idx % 3 == 0)
  )
end
