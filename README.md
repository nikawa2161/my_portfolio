# リライフ

<img width="1440" alt="スクリーンショット 2021-01-30 21 33 45" src="https://user-images.githubusercontent.com/68407983/106356536-a9f07980-6343-11eb-91f1-a0944e3f55da.png">

# サイト概要
「転職をもっと気軽に」<br>
 企業側と求職者のマッチングを助けるアプリです。

# URL
http://re-life.work/ <br>
 「閲覧用」から企業側・ユーザーの簡単ログインが可能です。

# 制作背景
 現職の理学療法士は、2040年には供給数が需要の1.5倍になると言われており、3人に1人は職がない可能性があります。

 病院などでしか働くことができない理学療法士は、専門性を生かせる環境が少ないため今後課題になると感じました。そのため、日々自己研鑽を行っているリハビリ職の専門性を様々な環境で生かせたらと思い、「転職を気軽に」考えてもらい働き方の自由度が上がって欲しいという思いからこのサービスを制作しました。

# サイトテーマ
 リライフ（relife）の意味は「再び」　「rehabilitation　life（リハビリライフ）」を掛け合わせました。<br>
「リハビリ職の人生をよりよくする」がテーマです。

# ターゲットユーザ
- 求職者
  - 病院やクリニック以外で働きたいと思っている方
  - 企業側の生の声を聞き職場を選びたい方
  - 気軽に企業と連絡がとりたい方
  - 異なった環境に挑戦したい方
  
- 法人 
  - 採用が上手くいかない企業
  - 新しい採用方法に挑戦してみたい企業
  - 想いを伝えたい企業

# 機能一覧
- ログイン機能
- 簡単ログイン
- 募集記事、投稿・編集・削除機能
- プロフィール登録機能
- いいね機能
- いいね記事閲覧機能
- フォロー機能
- フォロー企業観覧機能
- テストコード

# 設計書
![インフラ２](https://user-images.githubusercontent.com/68407983/106387734-76cee880-641e-11eb-97c3-b96895c93ad0.png)


# 環境・使用技術

### フロントエンド
HTML/CSS <br>
SCSS <br>
Bootstrap

### バックエンド
Ruby 2.7.1<br>
Rails 6.0.3
## 開発環境
MacOS, VScode, Git, GitHub

## 本番環境
AWS（VPC・EC2・RDS・S3・IAM・Route53・ACM・ALBを使用）<br>
Nginx、 Puma<br>
Capistranoにより自動デプロイ
