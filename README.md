# アプリ概要
[CustomerCalender](http://54.92.32.88/)

「営業マン向けのスケジュール管理＆顧客管理アプリ」です。

![image](https://user-images.githubusercontent.com/68436861/103549445-ba4f3900-4eea-11eb-8857-e3eba45c9bc0.png)


このアプリでは
・顧客情報登録、詳細表示、編集、削除
・スケジュール管理、新規登録、詳細表示、編集、削除
が可能です。

また、スケジュール新規登録の際に、登録済の顧客名をチェックする事により<br>
顧客情報詳細表示画面にて、顧客にどんな対応をしたか活動記録として確認出来ます。

![image](https://user-images.githubusercontent.com/68436861/103549377-9ab81080-4eea-11eb-9b97-5c33e53b715b.png)

# URL
http://54.92.32.88/

■ログインを試される場合こちらを入力ください。
- email
- sample@gmail.com
- パスワード
- sample1


# 使用技術・言語

- フロントエンド(javascript, jQuery, fullcalender, HTML/CSS, bootstrap)
- バックエンド(Ruby on Rails6.0)
- テスト(RSpec, FactoryBot)
- Web サーバ(nginx, unicorn)
- データベース(MySQL)
- AWS(EC2)
- 開発環境(MacOS, VScode, Git, GitHub)



# インフラ構成

![インフラ構築図](https://user-images.githubusercontent.com/68436861/103646336-dad7cb80-4f9c-11eb-81d7-9a4079bb42b3.png)


# 機能要件

### スケジュール登録

- スケジュール一覧表示(fullcalender)
- スケジュール新規登録(顧客情報紐付け可能)
- スケジュール詳細表示
- スケジュール編集、削除

### 顧客情報登録

- 顧客情報一覧表示(トップページ)
- 顧客情報詳細表示(顧客情報が紐付けされているスケジュールを登録した場合、こちらに表示される)
- 顧客情報編集、削除

# 非機能要件
- モデル/コントローラの単体テスト

# このアプリで解決したい課題

いろんなアプリを使いながら顧客管理やスケジュール管理をしているのが大変なので
同じアプリにまとめる事により業務効率化になるのではと考えました。

# 実際使ってみた声

- とても使いやすい。今まで別のアプリで顧客情報を管理していたので便利(Mさん)
- タスク機能があると、より使いやすそう(Kさん)
- ケータイでもパソコンでも開けるのは良い。ただ、ケータイでは見にくい(Hさん)

# 今後、追加したい機能
- タスク機能
- ハンバーガーメニュー
- Google マップAPI
- 祝日の表示
- 顧客ボタン
- 顧客ごとのスケジュール表示


# DB設計

## Usersテーブル

|Colum|Type|Options|
|------|----|------|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false, unique: true|

## Association

- has_many :events,foreign_key: :user_id, dependent: :destroy
- has_many :customers,foreign_key: :user_id, dependent: :destroy

## Eventsテーブル

|Colum|Type|Options|
|------|----|------|
|title|string|null: false|
|body|string|
|start_time|datetime|null: false|
|end_time|datetime|null: false|
|user_id|reference|foreign_key: true|

## Association
- belongs_to :user, optional: true
- has_many :customer_events,dependent: :destroy
- has_many :customer,through: :customer_events,dependent: :destroy


## Customersテーブル

|Colum|Type|Options|
|------|----|------|
|name|string|null: false|
|code|string|
|current_address|string|
|building_site|string|
|phone|string|
|body|text|
|user_id|reference|foreign_key: true|

## Association
- belongs_to :user, optional: true
- has_many :customer_events,dependent: :destroy
- has_many :events, through: :customer_events,dependent: :destroy

## CustomerEventsテーブル

|Colum|Type|Options|
|------|----|------|
|customer_id|reference|foreign_key: true|
|event_id|reference|foreign_key: true|

## Association
- belongs_to :customer
- belongs_to :event

