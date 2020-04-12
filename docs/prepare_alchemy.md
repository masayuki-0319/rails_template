# AlchemyCMS 初期設定
## 概要

- [Alchemy CMS \- About](https://alchemy-cms.com/about)
- [リポジトリ | AlchemyCMS/alchemy\_cms: AlchemyCMS is a Rails CMS engine](https://github.com/AlchemyCMS/alchemy_cms)
- [File: README — Documentation for AlchemyCMS/alchemy\_cms \(master\)](https://www.rubydoc.info/github/AlchemyCMS/alchemy_cms)
- [AlchemyCMS Guides](https://guides.alchemy-cms.com/)

## 設定( 2020年4月1日現在 )
### バージョンの調整
- docker-compose.yml 中の args を該当OSSと置換する。
  - RefineryCMS に合わせて、Ruby のバージョンを 2.6.6
  - OSS の最新サポートが Rails 4.2

### プロジェクトを生成

```bash:ash(コンテナ内)
$ rails new . -m https://raw.githubusercontent.com/AlchemyCMS/rails-templates/master/all.rb

# 生成中の回答
At which path do you want to mount Alchemy CMS at? (DEFAULT: At root path '/')
> `click enter key`
Overwrite /app/app/views/layouts/application.html.erb? (enter "h" for help) [Ynaqdhm]
> Y
What's the language code of your site's primary language? (DEFAULT: en)
> `click enter key`
What's the name of your site's primary language? (DEFAULT: English)
> `click enter key`
```

### 関連ファイルの調整

```ruby:routes.rb
...
  mount Alchemy::Engine => '/'
...
```

### アプリケーションを起動

```bash:ash
$ rails s -b 0.0.0.0 -p 3000

$ open http://localhost:3000/refinery/users/register
```
