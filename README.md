# テーブル設計
 
## users テーブル

| Column           | Type    | Options                   |
| ---------------- | ------- | ------------------------- |
| nickname         | string  | null: false               |
| email            | string  | null: false, unique: true |
| password         | string  | null: false               |
| family_name      | string  | null: false               |
| first_name       | string  | null: false               |
| family_name_kana | string  | null: false               |
| first_name_kana  | string  | null: false               |
| birth_day        | integer | null: false               |

### Association
- has_many :items
- has_many :comments
- belongs_to :purchase


## items テーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| name         | string     | null: false |
| describe     | text       | null: false |
| category     | string     | null: false |
| status       | string     | null: false |
| charge       | string     | null: false |
| prefectures  | string     | null: false |
| date         | integer    | null: false |
| price        | integer    | null: false |

### Association

- belongs_to :user
- belongs_to :purchase
- has_many :comments
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :charge
- belongs_to_active_hash :date


## purchases テーブル
| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card_number    | integer    | null: false |
| expiry         | integer    | null: false |
| security_code  | integer    | null: false |
| post_code      | integer    | null: false |
| prefectures    | string     | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| building_name  | string     | null: false |
| tel_number     | integer    | null: false |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to_active_hash :prefectures


## comments テーブル
| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


