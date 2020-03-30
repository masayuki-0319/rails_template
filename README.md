# 概要
- 実験及び練習用のリポジトリ

# 手順例
## Git の初期化
1. 本リポジトリとの関係を削除
  - $ rm -rf .git
2. 初期化実行
  - $ git init
  - $ git add .
  - $ git commit -m "first commit"


## 各設定ファイルの調整
### database.yml の調整

```yml:config/database.yml
# MySQL の場合
default: &default
  adapter: mysql2
  charset: utf8mb4
  collation: utf8mb4_bin
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: <%= ENV.fetch("APP_DATABASE_HOST") { '127.0.0.1' } %>
  port: <%= ENV.fetch("APP_DATABASE_PORT") { '3306' } %>
  username: <%= ENV.fetch("APP_DATABASE_USERNAME") { 'root' } %>
  password: <%= ENV.fetch("APP_DATABASE_PASSWORD") { 'pass' } %>

development:
  <<: *default
  database: rails_template_development

test:
  <<: *default
  database: rails_template_test

production:
  <<: *default
  database: rails_template_production

# PostgreSQL の場合
default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: <%= ENV.fetch("APP_DATABASE_HOST") { '127.0.0.1' } %>
  port: <%= ENV.fetch("APP_DATABASE_PORT") { '5432' } %>
  username: <%= ENV.fetch("APP_DATABASE_USERNAME") { 'root' } %>
  password: <%= ENV.fetch("APP_DATABASE_PASSWORD") { 'pass' } %>

development:
  <<: *default
  database: rails_template_development

test:
  <<: *default
  database: rails_template_test

production:
  <<: *default
  database: rails_template_production

# SQLite3 の場合
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

test:
  <<: *default
  database: db/test.sqlite3

production:
  <<: *default
  database: db/production.sqlite3
```
