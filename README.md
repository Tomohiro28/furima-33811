# テーブル設計

## usersテーブル

| Column         | Type    | Options    |
| -------------- | ------- | ---------- |
| nickname       | string  | null:false |
| email          | string  | null:false |
| password       | string  | null:false |
| last_name      | string  | null:false |
| first_name     | string  | null:false |
| birthday       | string  | null:false |
| last_hurigana  | string  | null:false |
| first_hurigana | string  | null:false |

### Association

- has_many : items
- has_many : purchases
- has_many : shippings

## itemsテーブル

| Column         | Type    | Options    |
| -------------- | ------- | ---------- |
| image          | string  | null:false |
| syouhin_name   | string  | null:false |
| category       | string  | null:false |
| kakaku         | string  | null:false |
| setumei        | text    | null:false |
| zyoutai        | string  | null:false |
| souryou        | string  | null:false |
| hassou_name    | string  | null:false |
| hassou_day     | string  | null:false |
| syupin_id      | integer |            |
| kounyuu_id     | integer |            |

### Association

- belongs_to : users
- has_one : purchases

## purchasesテーブル

| Column         | Type    | Options    |
| -------------- | ------- | ---------- |
| items.id       | integer | null:false |
| syupin_id      | integer | null:false |
| kounyuu_id     | integer | null:false |
| shipping.id    | integer | null:false |

### Association

- belongs_to : users
- belongs_to : items
- has_one : shippings

## shippingsテーブル

| Column         | Type    | Options    |
| -------------- | ------- | ---------- |
| yuubin         | string  | null:false |
| todouhuken     | string  | null:false |
| sichouson      | string  | null:false |
| banti          | string  | null:false |
| denwa          | integer | null:false |

### Association

- belongs_to : purchases