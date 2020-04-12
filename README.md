# 概要
- 実験及び練習用のリポジトリ

# 使用手順例
## リモートからダウンロード
1. ダウンロード
  - $ git clone https://github.com/masayuki-0319/rails_template.git
2. 任意のフォルダ名に変更
  - $ mv rails_tamplate `プロジェクト名`
3. プロジェクトに移動
  - $ cd `プロジェクト名`

## Git の初期化
1. 本リポジトリとの関係を削除
  - $ rm -rf .git
2. 初期化実行
  - $ git init
  - $ git add .
  - $ git commit -m "first commit"

## プロジェクトの生成
### 方法１: OSS を使用
./docs ディレクトリに存在する OSS の手順通りに設定してください。
- Refinery
- Alchemy

### 方法2: オリジナル
#### 通常モード
#### APIモード

## 各設定ファイルの調整
### database.yml の調整
`config`ディレクトリに SQLite、PostgreSQL、MySQL 用の database.yml を用意しているため、使用する DB に応じたファイルをご使用ください。

# より便利にできそうな技術
- RSpec の自動設定
- Rubocop の自動設定
- [PaaS入門　〜Heroku \+ wordpress〜 \- Qiita](https://qiita.com/fukazawashun/items/a8a9698d5cf781f87812)
- [bundler に Gemfile に追記してくれるコマンドが増えていた \| なんや書くところ](https://hondash.app/bundle-new-command/)
- [Docker で RSpec の System Spec を実行するための設定メモ \- Qiita](https://qiita.com/suketa/items/d783ac61c2a3e4c16ad4)
- [DockerComposeでコンテナベースのRailsアプリを作成してHerokuにデプロイする \- Qiita](https://qiita.com/akirakudo/items/16a01271b0a39316e439#heroku%E3%81%B8%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4%E3%81%99%E3%82%8B)
