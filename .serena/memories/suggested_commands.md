# DevLog - 推奨コマンド一覧

## プロジェクトディレクトリ
すべてのコマンドは以下のディレクトリで実行してください：
```bash
cd /home/hiyak3/projects/devlog
```

## 開発サーバー
```bash
# 開発サーバー起動（標準）
bin/rails server
# または
rails s

# 開発サーバー起動（bin/dev使用）
bin/dev
```

## データベース操作
```bash
# マイグレーション実行
bin/rails db:migrate

# データベースリセット
bin/rails db:reset

# シードデータ投入
bin/rails db:seed

# スキーマロード
bin/rails db:schema:load

# データベース作成
bin/rails db:create
```

## テスト
```bash
# 全テスト実行
bin/rails test

# 特定のテストファイル実行
bin/rails test test/models/article_test.rb

# システムテスト実行
bin/rails test:system
```

## コード品質チェック
```bash
# RuboCop（コードスタイルチェック）
bin/rubocop

# RuboCop自動修正
bin/rubocop -a

# Brakeman（セキュリティチェック）
bin/brakeman

# Bundler Audit（Gem脆弱性チェック）
bin/bundler-audit

# CIスクリプト実行（すべてのチェック）
bin/ci
```

## Rails コンソール
```bash
# Railsコンソール起動
bin/rails console
# または
rails c
```

## ルーティング確認
```bash
# ルート一覧表示
bin/rails routes

# 特定のコントローラーのルート表示
bin/rails routes -c articles
```

## アセット管理
```bash
# アセットプリコンパイル
bin/rails assets:precompile

# アセットクリーンアップ
bin/rails assets:clobber
```

## ジェネレーター
```bash
# モデル作成
bin/rails generate model ModelName field:type

# コントローラー作成
bin/rails generate controller ControllerName action1 action2

# マイグレーション作成
bin/rails generate migration MigrationName

# スキャフォールド作成
bin/rails generate scaffold ResourceName field:type
```

## Bundler
```bash
# Gem インストール
bundle install

# Gem アップデート
bundle update
```

## デプロイ（Kamal）
```bash
# Kamal セットアップ
bin/kamal setup

# Kamal デプロイ
bin/kamal deploy

# Kamal ログ確認
bin/kamal logs
```

## Git
```bash
# ステータス確認
git status

# 差分確認
git diff

# コミット
git add .
git commit -m "コミットメッセージ"

# プッシュ
git push origin main
```

## その他
```bash
# プロジェクトセットアップ
bin/setup

# Rake タスク一覧
bin/rake -T

# Importmap 管理
bin/importmap
```

## Linux システムコマンド
```bash
# ファイル一覧
ls -la

# ディレクトリ移動
cd /path/to/directory

# ファイル検索
find . -name "pattern"

# テキスト検索
grep -r "pattern" .
```
