# テーブル設計

## usersテーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| nickname           | string  | null:false   |
| email              | string  | unique: true |
| encrypted_password | string  | null:false   |
| last_name          | string  | null:false   |
| first_name         | string  | null:false   |
| birthday           | date    | null:false   |
| last_hurigana      | string  | null:false   |
| first_hurigana     | string  | null:false   |

### Association

- has_many : items
- has_many : purchases
- has_many : shippings

## itemsテーブル

| Column         | Type     | Options    |
| -------------- | -------- | ---------- |
| syouhin_name   | string   | null:false |
| category       | string   | null:false |
| price          | integer  | null:false |
| setumei        | text     | null:false |
| zyoutai_id        | integer  | null:false |
| souryou_id        | integer  | null:false |
| hassouname_id    | integer  | null:false |
| hassouday_id     | integer  | null:false |
| syupin_id      | integer  |            |
| kounyuu_id     | integer  |            |

### Association

- belongs_to : user
- has_one : purchase

## purchasesテーブル

| Column      | Type       | Options    |
| ----------- | ---------- | ---------- |
| items       | references | null:false |
| user        | references | null:false |

### Association

- belongs_to : user
- belongs_to : item
- has_one : shipping

## shippingsテーブル

| Column         | Type    | Options    |
| -------------- | ------- | ---------- |
| yuubin         | string  | null:false |
| todouhuken     | string  | null:false |
| sichouson      | string  | null:false |
| banti          | string  | null:false |
| tatemono       | string  |            |
| denwa          | string  | null:false |

### Association

- belongs_to : purchase