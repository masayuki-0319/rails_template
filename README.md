# 概要
- 実験及び練習用のリポジトリ

# 手順例
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

### 方法2: オリジナル
#### 通常モード
#### APIモード

## 各設定ファイルの調整
### database.yml の調整
`db`ディレクトリに SQLite、PostgreSQL、MySQL 用の database.yml を用意しているため、使用する DB に応じたファイルをご使用ください。
