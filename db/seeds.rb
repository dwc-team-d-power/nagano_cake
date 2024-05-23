name = ['', 'キャンディ', 'チョコバナナ', 'クッキー', 'フルーツタルト','プリン']

Genre.create!(
  [
    {
      name: "ケーキ"
    },
    {
      name: "キャンディ"
    },
    {
      name: "チョコレート"
    },
    {
      name: "焼き物"
    },
    {
      name: "その他"
    },
    {
      name: "プリン"
    }
  ]
)

# Item.create!(
#   [
#     {
#       name: "ケーキ" 
#       introduction: "メリークリスマス！"
#       image_id: cake.jpg
#       price: 2000
#       genre_id: 1
#     },
#     {
#       name: "キャンディ" 
#       introduction: "ハロウィンに最適"
#       image_id: candy.jpg
#       price: 800
#       genre_id: 2
#     },
#     {
#       name: "チョコバナナ" 
#       introduction: "バラ売りはしておりません"
#       image_id: chocobanana.jpg
#       price: 700
#       genre_id: 3
#     },
#     {
#       name: "クッキー" 
#       introduction: "ギフトにどうぞ"
#       image_id: cookie.jpg
#       price: 500
#       genre_id: 4
#     },
#     {
#       name: "フルーツタルト" 
#       introduction: "フルーツを贅沢に使用"
#       image_id: fruit_tarte.jpg
#       price: 3000
#       genre_id: 5
#     },
#     {
#       name: "プリン" 
#       introduction: "プッチンプリン転売中"
#       image_id: purin.jpg
#       price: 200
#       genre_id: 6
#     }
#   ]
# )