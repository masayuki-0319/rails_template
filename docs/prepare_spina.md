# RefineryCMS 初期設定
## 概要
- [リポジトリ | SpinaCMS](https://github.com/SpinaCMS/Spina)
- [Spina CMS \- Ruby on Rails 6\+](https://www.spinacms.com/)
- [Introduction](https://www.spinacms.com/guide/introduction)

## 設定
### 特記事項
- DB は PostgreSQL

### 関連ファイルの調整

```yml:docker-compose.yml
version: '3'
services:
  datastore:
    image: busybox
    volumes:
      - db_data:/var/lib/postgresql/data
      - bundle_install:/usr/local/bundle
      - node_modules:/app/node_modules
  db:
    image: postgres:12.2-alpine
    ports:
      - 5432:5432
    volumes:
      - db_data:/var/lib/postgresql/data
    env_file:
      - .env.dev
    stdin_open: true
    tty: true
  app:
    build:
      context: .
      dockerfile: ./docker/ruby/Dockerfile.dev
      args:
        BUNDLER_VERSION: "2.1.4"
        RUBY_VERSION: "2.6.6-alpine3.11"
        RAILS_VERSION: "6"
    ports:
      - 3000:3000
    depends_on:
      - db
    volumes:
      - bundle_install:/usr/local/bundle
      - node_modules:/app/node_modules
      - ./:/app:cached
    env_file:
      - .env.dev
    stdin_open: true
    tty: true
volumes:
  db_data:
  bundle_install:
  node_modules:
```

### プロジェクトを生成

```bash:ash(コンテナ内)
$ rails new .
```

### 関連ファイルの調整

- database.yml_postgresql をリネームして置換
- .env.dev に DB 名を追加

```diff:app/assets/config/manifest.js
...
+ //= link default/application.css
```

```.env.dev
...
APP_DATABASE_NAME=rails_spina
```

### Spina のインストール

```bash:ash
$ bundle add spina
$ rails g spina:install
> `all click enter`
```

```bash:結果
Restart your server and visit http://localhost:3000 in your browser!
The admin backend is located at http://localhost:3000/admin.

Site name      :  MySite
Active theme   :  default
User email     :  admin@domain.com
User password  :  password
```

### アプリケーションを起動

```bash:ash
$ rails s -b 0.0.0.0 -p 3000

$ open http://localhost:3000/admin/login
```
