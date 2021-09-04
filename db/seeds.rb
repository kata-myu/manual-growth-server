# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(
  [
    {
      name: '業務フロー'
    },
    {
      name: '接客マナー'
    },
    {
      name: 'キッチン業務'
    },
    {
      name: 'トラブル対応'
    }
  ]
)

Manual.create!(
  [
    {
      title: '開店業務',
      heading: '開店に必要な作業をまとめています',
      text: '清掃が行き届いているか確認し、予約の確認をします。仕込みを終えましょう。',
      category_id: 1
    },
    {
      title: 'メニュー注文',
      heading: 'ご注文を受けるときの対応です。',
      text: '聞き取りやすい声ではっきりと喋ります。確認をとってください。',
      category_id: 2
    },
    {
      title: 'ドリンク',
      heading: 'ドリンクの注文を受けたときの対応です。',
      text: '注文を確認し、グラスを用意します。ドリンクを入れたらスタッフを呼びます。',
      category_id: 3
    },
    {
      title: 'クレーム対応',
      heading: 'お客様からご意見を受けたときの対応です。',
      text: 'まずは傾聴します。自分で判断ができないときは、必ず相談します。',
      category_id: 4
    },
    
  ]
)

