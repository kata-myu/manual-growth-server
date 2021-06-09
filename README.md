# README

# テーブル設計

## categories テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

### Association
- has_many :manuals

## manuals テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| job      | string     | null: false |
| heading  | string     | null: false |
| text     | string     | null: false |
| category | references | foreigin_key: true |

### Association
- belongs_to :category
