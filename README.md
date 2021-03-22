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

| Column                     | Type   | Options     |
| -------------------------- | ------ | ----------- |
| nickname                   | string | null: false |
| email                      | string | unique      |
| encrypted_password         | string | null: false |
| first_name                 | string | null: false |
| last_name                  | string | null: false |
| first_name_kana            | string | null: false |
| last_name_kana             | string | null: false |
| birth_day                  | date   | null: false |

### Association
- has many :items
- has many :comments
- has one :buyer 

## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| item_name           | string     | null: false |
| item_text           | text       | null: false |
| category            | string     | null: false |
| status              | string     | null: false |
| delivery_payment    | string     | null: false |
| delivery_from_place | string     | null: false |
| delivery_day        | string     | null: false |
| price               | integer    | null: false |

### Association
- belongs_to :user
- has many :comments
- has one :purchase


## commentsテーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| text           | text      | null: false |
| nickname       | reference | null: false |
| item_name      | reference | null: false |

### Association
- belongs_to :user
- belongs_to :item


## purchasesテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| item_id             | references | null: false | 
| price               | references | null: false | 
| buyer_nickname      | references | null: false |
| address_id          | integer    | null: false |
| prefecture_id       | integer    | null: false |
| city                | string     | null: false |
| city_text           | string     | null: false |
| city_building       | string     | null: false |
| tell                | string     | null: false |


### Association
- belongs_to :buyer
- belongs_to :item


## buyersテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| user_id             | references | null: false |
| buyer_nickname      | string     | null: false |
| purchase_id         | references | null: false |

### Association
- belongs_to :user
- has many :purchases