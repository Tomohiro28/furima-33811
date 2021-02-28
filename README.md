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

| Column         | Type       | Options    |
| -------------- | ---------- | ---------- |
| product_name   | string     | null:false |
| category_id    | string     | null:false |
| price          | integer    | null:false |
| description    | text       | null:false |
| status_id      | integer    | null:false |
| shippingfee_id | integer    | null:false |
| area_id        | integer    | null:false |
| shippingday_id | integer    | null:false |
| user           | references | null:false |

### Association

- belongs_to : user
- has_one : purchase

## purchasesテーブル

| Column      | Type       | Options    |
| ----------- | ---------- | ---------- |
| item        | references | null:false |
| user        | references | null:false |

### Association

- belongs_to : user
- belongs_to : item
- has_one : shipping

## shippingsテーブル

| Column         | Type       | Options    |
| -------------- | ---------- | ---------- |
| yuubin         | string     | null:false |
| todouhuken     | string     | null:false |
| sichouson      | string     | null:false |
| banti          | string     | null:false |
| tatemono       | string     |            |
| denwa          | string     | null:false |
| purchase       | references | null:false |

### Association

- belongs_to : purchase