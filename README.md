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
### 1: 直接操作
1. 本リポジトリとの関係を削除
  - $ rm -rf .git
2. 初期化実行
  - $ git init
  - $ git add .
  - $ git commit -m "first commit"

### 2: entrypoint_clone.sh を使用
```bash:bash
./docker/entrypoint_clone.sh
```

## プロジェクトの生成
- [小さく薄くrails newする\(ViewやJSが必要ない場合\) \- Qiita](https://qiita.com/shifumin/items/f4f4ea68d9963dbe9ca2)
- [【Rails】generate コマンドで生成されるファイルをconfig\.generatorsで設定する \| RemoNote](https://remonote.jp/rails-config-generators)

### 方法１: OSS を使用
./docs ディレクトリに存在する OSS の手順通りに設定してください。
- [RefineryCMS](https://github.com/refinery/
- [AlchemyCMS](https://github.com/AlchemyCMS/alchemy_cms)
- [SpinaCMS](https://github.com/SpinaCMS/Spina)

### 方法2: オリジナル
#### 通常モード
#### APIモード

## 各設定ファイルの調整
### database.yml の調整
`config`ディレクトリに SQLite、PostgreSQL、MySQL 用の database.yml を用意しているため、使用する DB に応じたファイルをご使用ください。

## RSpec 設定
```bash:bash
# spec 生成コマンド
$ rails g rspec:model user
$ rails g rspec:job users
$ rails g rspec:view users
$ rails g rspec:helper users
$ rails g rspec:system user_registration
$ rails g rspec:request users
```

```bash:bash
# 一部をテストする場合
$ bin/rspec spec/models/user_spec.rb:12

# 全体をテストする場合
$ bundle exec rspec
```


# 覚書
## 残りOSS
- [mastodon/config at master · tootsuite/mastodon](https://github.com/tootsuite/mastodon/tree/master/config)
- [solidusio/solidus: 🛒Solidus, Rails eCommerce System](https://github.com/solidusio/solidus)
## より便利にできそうな技術
- RSpec の自動設定
- Rubocop の自動設定
- [PaaS入門　〜Heroku \+ wordpress〜 \- Qiita](https://qiita.com/fukazawashun/items/a8a9698d5cf781f87812)
- [bundler に Gemfile に追記してくれるコマンドが増えていた \| なんや書くところ](https://hondash.app/bundle-new-command/)
- [Docker で RSpec の System Spec を実行するための設定メモ \- Qiita](https://qiita.com/suketa/items/d783ac61c2a3e4c16ad4)
- [DockerComposeでコンテナベースのRailsアプリを作成してHerokuにデプロイする \- Qiita](https://qiita.com/akirakudo/items/16a01271b0a39316e439#heroku%E3%81%B8%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4%E3%81%99%E3%82%8B)
