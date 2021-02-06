# アプリ概要

[CustomerCalender](customer-calender.com/)


「営業マン向けのスケジュール管理＆顧客管理アプリ」です。


<img width="1208" alt="トップ画面　new" src="https://user-images.githubusercontent.com/68436861/106907243-63cf5780-6741-11eb-823e-76021ca13ce8.png">



このアプリでは
・顧客情報登録、詳細表示、編集、削除
・スケジュール管理、新規登録、詳細表示、編集、削除
が可能です。

また、スケジュール新規登録の際に、登録済の顧客名をチェックする事により<br>
顧客情報詳細表示画面にて、顧客にどんな対応をしたか活動記録として確認出来ます。


![image](https://user-images.githubusercontent.com/68436861/103549377-9ab81080-4eea-11eb-9b97-5c33e53b715b.png)

# URL
https://customer-calender.com/

# ログイン方法
簡単ログイン機能ございます。
ゲストログイン（閲覧用）よりテストユーザーとしてログインして頂けます。


# 使用技術・言語

- フロントエンド(javascript, jQuery, fullcalendar v5, Haml/scss)
- バックエンド(Ruby on Rails6.0)
- テスト(RSpec, FactoryBot,faker)
- Web サーバ(nginx)
- アプリケーションサーバ(unicorn)
- データベース(MySQL)
- AWS(VPC, EC2, Route53, ELB, ACM)
- 開発環境(MacOS, VScode, Git, GitHub, Docker, Circle-ci, capistrano)
- API (Google Calendar API )



# インフラ構成

![インフラ構成new2](https://user-images.githubusercontent.com/68436861/106246769-fc516d80-6251-11eb-8360-94e95a89db85.png)




# 機能要件

### スケジュール登録

- スケジュール一覧表示(fullcalendar)
- スケジュール新規登録(顧客情報紐付け可能)
- スケジュール詳細表示
- スケジュール編集、削除

### 顧客情報登録

- 顧客情報一覧表示(トップページ)
- 顧客情報詳細表示(顧客情報が紐付けされているスケジュールを登録した場合、こちらに表示される)
- 顧客情報編集、削除

# 非機能要件
- レスポンシブ対応
- HTTPS 接続
- モデル/コントローラの単体テスト
- Google Calendar API による祝日表示

# このアプリで解決したい課題

- 営業マンの業務効率化。
いろんなアプリを使いながら顧客管理やスケジュール管理をしているのが大変なので、
同じアプリにまとめる事により業務効率化になるのではと考えました。

# 実際使ってみた声

- とても使いやすい。今まで別のアプリで顧客情報を管理していたので便利(Mさん)
- タスク機能があると、より使いやすそう(Kさん)
- ケータイでもパソコンでも開けるのは良い。ただ、ケータイでは見にくい(Hさん)
- iphoneアプリにして欲しい(Nさん)


# 今後、追加したい機能
- タスク機能
- 顧客ごとのスケジュール表示
- レスポンシブに使いやすく修正
- アプリ名修正(calender→calendar)
- テストコード追加