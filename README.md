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
# backpackers DB design 
## user table
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :comments
- has_many :posts
- has_many :goods

## comment table
|Column|Type|Option|
|------|----|------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## post table
|Column|Type|Option|
|------|----|------|
|text|text|null: false|
|image|string|null: false|
|video|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|area_id|integer|null: false, foreign_key: true|
### Association
- has_many :comments
- has_many :goods
- belongs_to :user
- belongs_to :area

## area table
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|country_id|integer|null: false, foreign_key: true|
### Association
- has_many :posts
- belongs_to :country

## country table
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
### Association
- belongs_to :area

## good table
|Column|Type|Option|
|------|----|------|
|num|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post

