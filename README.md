# 概要
- 実験及び練習用のリポジトリ

# 使用方法
## Case 1: Docker で開発する場合

```bash
$ git clone https://github.com/masayuki-0319/rails_template.git

$ mv rails_tamplate #{project_name}

$ cd #{project_name}

$ ./docker/entrypoint_for_repo_clone.sh
```

## Case 2: それ以外の場合

```bash
$ rails new #{project_name} \
            -m https://raw.githubusercontent.com/masayuki-0319/rails_template/master/rails_template.rb \
            -d #{%w[mysql postgresql sqlite3 etc...]}
```

- [参考: 小さく薄くrails newする\(ViewやJSが必要ない場合\) \- Qiita](https://qiita.com/shifumin/items/f4f4ea68d9963dbe9ca2)


# その他
## RSpec 使用方法
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

## OSS を使用したい場合
./docs ディレクトリに存在する OSS の手順通りに設定してください。
- [RefineryCMS](https://github.com/refinery/
- [AlchemyCMS](https://github.com/AlchemyCMS/alchemy_cms)
- [SpinaCMS](https://github.com/SpinaCMS/Spina)

# 覚書
## 残りOSS
- [mastodon/config at master · tootsuite/mastodon](https://github.com/tootsuite/mastodon/tree/master/config)
- [solidusio/solidus: 🛒Solidus, Rails eCommerce System](https://github.com/solidusio/solidus)
## より便利にできるかも
- [PaaS入門　〜Heroku \+ wordpress〜 \- Qiita](https://qiita.com/fukazawashun/items/a8a9698d5cf781f87812)
- [Docker で RSpec の System Spec を実行するための設定メモ \- Qiita](https://qiita.com/suketa/items/d783ac61c2a3e4c16ad4)
- [DockerComposeでコンテナベースのRailsアプリを作成してHerokuにデプロイする \- Qiita](https://qiita.com/akirakudo/items/16a01271b0a39316e439#heroku%E3%81%B8%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4%E3%81%99%E3%82%8B)
