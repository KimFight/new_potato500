# README

## アプリ名
#### POTATO５００

## 概要
このアプリケーションでは、パソコンなどに不慣れな個人飲食店経営者の方が
気軽にテイクアウトや広告宣伝ができることを目的としました。

テイクアウトメニューにポテトを選んだ理由は、ポテトを嫌いな人が少ないということと
作るのが簡単でアレンジもしやすいという点です。
また、フライという指定もなく、じゃがいも限定というわけでもありません。
店舗が無理なく、やりたい範囲で楽しく参加していただければと思っています。

現在、コロナウィルスの影響で人員を最小限に営業している店舗が多いです。
人が少なくてもお客様を待たせずに美味しいものを提供すると考えた時に、
シンプルな調理法のポテトが思い浮かびました。
また、他媒体での慣れない手続きや管理外の割引があると
ただでさえ人手の少ない店舗は営業がめちゃくちゃになります。

やりとりはお客様からの直接電話のみにし、
会計もいつも通り店舗でのやり方でやっていただきます。

「５００」は税込み５００円の意味で、会計がスムーズにできるということ５刻みの数字は心地いいからです。
ポテトと何かのセットで税込５００の円のメニューを作っていただければ掲載自由。

また、ツイッター感覚で臨時休業の連絡などもでき、
コロナでの自粛要請が出た際にお客様との連絡がスムーズにできることを目指しました。


## 本番環境
## 制作背景
## DEMO
- 工夫したポイント
- 使用技術
- 課題や今後実装したい機能



# DB設計

## users テーブル

| Colum              | Type    | Options     |
| -------------------|---------|-------------|
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |

## Association

- has_one  : store
- has_many : comment

##  stores テーブル

| Colum               | Type        | Options                         |
| --------------------|-------------|---------------------------------|
| store_name          | string      | null: false                     |
| postal_code         | string      | null: false                     |
| prefecture_id       | integer     | null: false                     |
| city                | string      | null: false                     |
| phone_number        | string      | null: false                     |
| address             | string      | null: false                     |
| building_name       | string      |                                 |
| close_day           | string      | null: false                     |
| open_time           | time        | null: false                     |
| close_time          | time        | null: false                     |
| content_500         | string      | null: false                     |
| introduction        | string      | null: false                     |
| user                | references  | null: false , foreign_key: true |

## Association

- belongs_to  : user
- has_many    : comment


## comments テーブル

| Colum        | Type        | Options                         |
| -------------|-------------|---------------------------------|
| comment      | text        | null: false                     |
| user         | references  | null: false , foreign_key: true |
| store        | references  | null: false , foreign_key: true |

## Association

- belongs_to : user
- belongs_to : store


## orders テーブル

| Colum             | Type        | Options                         |
| ------------------|-------------|---------------------------------|
| name              | string      | null: false                     |
| prefectures_code  | string      | null: false                     |
| postal_code       | string      | null: false                     |
| city              | string      | null: false                     |
| building          | string      |                                 |
| phone_number      | string      | null: false                     |
| purchase          | references  | null: false , foreign_key: true |

## Association

- belongs_to :purchase


## purchases テーブル

| Colum        | Type        | Options                         |
| -------------|-------------|---------------------------------|
| item         | references  | null: false , foreign_key: true |
| user         | references  | null: false , foreign_key: true |

## Association
- belongs_to   : user
- belongs_to   : item
- has_one      : order


## items テーブル

| Colum        | Type        | Options                         |
| -------------|-------------|---------------------------------|
| name         | string      | null: false                     |
| introduction | string      | null: false                     |
| price        | integer     | null: false , foreign_key: true |


## Association
- has_one : purchase


