# Description
Rails template with Docker

# Requirements
## Local setting for using Ruby on Rails
no descripiton

## Want use Docker
### Install Docker
- [Docker Desktop for Mac and Windows \| Docker](https://www.docker.com/products/docker-desktop)

### Download this repository and run container
```bash
$ git clone https://github.com/masayuki-0319/rails_template.git

$ mv rails_tamplate #{project_name}
$ cd #{project_name}

$ ./docker/entrypoint_for_repo_clone.sh

$ docker-compose up -d
$ docker-compose exec app ash
```

# How to use

```bash
$ rails new #{project_name} \
            -m https://raw.githubusercontent.com/masayuki-0319/rails_template/master/rails_template.rb \
            -d #{%w[mysql postgresql sqlite3 etc...]}
```

- [参考: 小さく薄くrails newする\(ViewやJSが必要ない場合\) \- Qiita](https://qiita.com/shifumin/items/f4f4ea68d9963dbe9ca2)


# Others
## RSpec Usage
```bash:bash
# spec 生成コマンド（ e.g. user 関係の場合）
$ rails g rspec:model user
$ rails g rspec:job users
$ rails g rspec:view users
$ rails g rspec:helper users
$ rails g rspec:system user_registration
$ rails g rspec:request users
```

```bash:bash
# 一部をテストする場合（ディレクトリ、describe を指定可能）
$ bin/rspec spec/models/user_spec.rb:12

# 全体をテストする場合
$ bundle exec rspec
```

## Want use OSS
./docs ディレクトリに存在する OSS の手順通りに設定してください。
一部 README と重複しているため、適宜読み替えて設定願います。

- OSS oficial Sites
  - [RefineryCMS](https://github.com/refinery/)
  - [AlchemyCMS](https://github.com/AlchemyCMS/alchemy_cms)
  - [SpinaCMS](https://github.com/SpinaCMS/Spina)

# Note
## My references
- [オブジェクト指向スクリプト言語 Ruby リファレンスマニュアル \(Ruby 2\.7\.0 リファレンスマニュアル\)](https://docs.ruby-lang.org/ja/latest/doc/index.html)
- [Ruby on Rails \- APIdock](https://apidock.com/rails)
- [Ruby on Rails ガイド：体系的に Rails を学ぼう](https://railsguides.jp/)
## Remaining OSS
- [mastodon/config at master · tootsuite/mastodon](https://github.com/tootsuite/mastodon/tree/master/config)
- [solidusio/solidus: 🛒Solidus, Rails eCommerce System](https://github.com/solidusio/solidus)
## May be more convenient
- [PaaS入門　〜Heroku \+ wordpress〜 \- Qiita](https://qiita.com/fukazawashun/items/a8a9698d5cf781f87812)
- [Docker で RSpec の System Spec を実行するための設定メモ \- Qiita](https://qiita.com/suketa/items/d783ac61c2a3e4c16ad4)
- [DockerComposeでコンテナベースのRailsアプリを作成してHerokuにデプロイする \- Qiita](https://qiita.com/akirakudo/items/16a01271b0a39316e439#heroku%E3%81%B8%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4%E3%81%99%E3%82%8B)
