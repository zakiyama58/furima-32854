# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false, unique:true|
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| last_name          | string | null: false             |
| first_name_kana    | string | null: false             |
| last_name_kana     | string | null: false             |
| birthday           | date   | null: false             |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| description        | text       | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| delivery_charge_id | integer    | null: false       |
| area_id            | integer    | null: false       |
| days_to_ship_id    | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer dependent: :destroy

## buyers テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address dependent: :destroy

## addresses テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| postal_code       | string     | null: false       |
| area_id           | integer    | null: false       |
| city              | string     | null: false       |
| house_number      | string     | null: false       |
| house_name        | string     |                   |
| phone_number      | string     | null: false       |
| buyer             | references | foreign_key: true |

### Association

- belongs_to :buyer
