# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| last_name        | string | null: false |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| birth_day        | date   | null: false |

### Association
- has many :items
- has many :comments
- has one :buyers 

## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| nickname            | references | null: false |
| item_name           | string     | null: false |
| item_name           | string     | null: false |
| category            | string     | null: false |
| status              | string     | null: false |
| delivery_payment    | string     | null: false |
| delivery_from_place | string     | null: false |
| delivery_day        | string     | null: false |
| price               | integer    | null: false |

### Association
- belongs to :users
- has many :comments
- has one :buys


## commentsテーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| text           | text      | null: false |
| nickname       | reference | null: false |
| item_name      | reference | null: false |

### Association
- belongs to :users
- belongs to :items


## buyersテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| nickname            | references | null: false |
| address             | string     | null: false |
| prefecture          | string     | null: false |
| city                | string     | null: false |
| city_text           | string     | null: false |
| city_building       | string     | null: false |
| tell                | integer    | null: false |
| card_num            | integer    | null: false |
| card_limit_month    | integer    | null: false |
| card_limit_year     | integer    | null: false |
| CVC                 | integer    | null: false |

### Association
- belongs to :users
- has one :buys


## buysテーブル(購入情報をレコード)

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| item                | references | null: false | 
| price               | references | null: false | 
| buyer_nickname      | references | null: false |
| address             | references | null: false |
| prefecture          | references | null: false |
| city                | references | null: false |
| city_text           | references | null: false |
| card                | references | null: false |
| card_limit_month    | references | null: false |
| card_limit_year     | references | null: false |
| CVC                 | references | null: false |

### Association
- belongs to :buyers
- belongs to :items
