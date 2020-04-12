# RefineryCMS 初期設定
## 概要

Ruby on Rails で作られた [Open Source Software]([OSS](https://ja.wikipedia.org/wiki/%E3%82%B3%E3%83%B3%E3%83%86%E3%83%B3%E3%83%84%E7%AE%A1%E7%90%86%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0)) であり、 Content Mangement System([CMS](https://ja.wikipedia.org/wiki/%E3%82%B3%E3%83%B3%E3%83%86%E3%83%B3%E3%83%84%E7%AE%A1%E7%90%86%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0))と呼ばれるソフトウェアである。つまり、PHP で考えると Wordpress のように投稿記事(Content)を管理(Management)する目的で使用されるソフトウェア(Software)である。

公式及びコミュニティにおいて、付属機能(extension)が開発されているため、デフォルトの機能に付け足して様々な機能を拡張することが可能であるが、Refinery のバージョンによって使用不可の機能があるため注意すること。

- [公式 | Ruby on Rails CMS that supports Rails 6\.0\+ \- Refinery CMS](https://www.refinerycms.com/)
- [リポジトリ | refinery/refinerycms: An extendable Ruby on Rails CMS that supports Rails 6\.0\+](https://github.com/refinery/refinerycms)
- [Getting Started \- Guides \- Refinery CMS](https://www.refinerycms.com/guides/getting-started)
- [Rubyで動くCMS、「RefineryCMS」を動かしてみた話 \- ファーエンドテクノロジー株式会社](https://www.farend.co.jp/blog/2019/01/refinerycms/)

## 設定( 2020年4月1日現在 )
### バージョンの調整
- docker-compose.yml 中の args を該当OSSと置換する。
  - Ruby 2.7 の場合、BigDecimal.new でエラーが発生するため、Ruby のバージョンを落とす。
    - [RailsアプリをRuby 2\.7\.0で動かして分かったこと – PSYENCE:MEDIA](https://tech.recruit-mp.co.jp/server-side/post-19932/)
  - OSS の最新サポートが Rails 5.1+

### プロジェクトを生成

```bash:ash(コンテナ内)
$ gem install execjs refinerycms

# 上が安定板、下が先行版
$ rails new . -m https://www.refinerycms.com/t/4.0.0
$ rails new . -m https://www.refinerycms.com/t/edge
```

### 関連ファイルの調整
#### 日本語化
```ruby:config/initializers/refinery/i18n.rb
Refinery::I18n.configure do |config|
  config.default_locale = :ja

  config.current_locale = :ja

  config.default_frontend_locale = :ja

  config.frontend_locales = [:ja]
end
```

#### アセットファイルの追加（OSS側のバグかも）
```diff:config/initializers/assets.rb
...
+ Rails.application.config.assets.precompile += %w( wymeditor/lang/en.js )
...
```


### アプリケーションを起動

```bash:ash
$ rails s -b 0.0.0.0 -p 3000

$ open http://localhost:3000/refinery/users/register
```
