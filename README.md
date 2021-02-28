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

## itemsテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| product_name   | string     | null:false        |
| category_id    | string     | null:false        |
| price          | integer    | null:false        |
| description    | text       | null:false        |
| status_id      | integer    | null:false        |
| shippingfee_id | integer    | null:false        |
| area_id        | integer    | null:false        |
| shippingday_id | integer    | null:false        |
| user           | references | foreign_key: true |

### Association

- belongs_to : user
- has_one : purchase

## purchasesテーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : shipping

## shippingsテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| post           | string     | null:false        |
| area_id        | integer    | null:false        |
| city           | string     | null:false        |
| address        | string     | null:false        |
| building       | string     |                   |
| phone          | string     | null:false        |
| purchase       | references | foreign_key: true |

### Association

- belongs_to : purchase
- belongs_to : items