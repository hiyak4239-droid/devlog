# DevLog - コードベース構造

## ディレクトリ構成

```
/home/hiyak3/projects/devlog/
├── app/                    # アプリケーションコード
│   ├── assets/            # CSS、画像などのアセット
│   ├── controllers/       # コントローラー
│   │   ├── application_controller.rb
│   │   ├── articles_controller.rb
│   │   └── concerns/
│   ├── helpers/           # ビューヘルパー
│   ├── javascript/        # JavaScriptファイル
│   ├── jobs/              # バックグラウンドジョブ
│   ├── mailers/           # メール送信
│   ├── models/            # モデル
│   │   ├── application_record.rb
│   │   ├── article.rb
│   │   └── concerns/
│   └── views/             # ビューテンプレート
│       └── articles/      # 記事関連ビュー
├── bin/                   # 実行可能スクリプト
│   ├── rails              # Railsコマンド
│   ├── rake               # Rakeタスク
│   ├── setup              # プロジェクトセットアップ
│   ├── dev                # 開発サーバー起動
│   ├── rubocop            # コードスタイルチェック
│   ├── brakeman           # セキュリティチェック
│   ├── bundler-audit      # Gem脆弱性チェック
│   ├── ci                 # CIスクリプト
│   └── kamal              # デプロイツール
├── config/                # 設定ファイル
│   ├── application.rb     # アプリケーション設定
│   ├── routes.rb          # ルーティング定義
│   ├── database.yml       # データベース設定
│   ├── puma.rb            # Puma設定
│   ├── environments/      # 環境別設定
│   ├── initializers/      # 初期化処理
│   └── locales/           # 国際化ファイル
├── db/                    # データベース関連
│   ├── migrate/           # マイグレーションファイル
│   ├── schema.rb          # データベーススキーマ
│   └── seeds.rb           # シードデータ
├── lib/                   # ライブラリコード
├── log/                   # ログファイル
│   └── development.log    # 開発環境ログ
├── public/                # 静的ファイル
├── storage/               # Active Storage用
├── test/                  # テストファイル
│   ├── controllers/       # コントローラーテスト
│   ├── models/            # モデルテスト
│   ├── system/            # システムテスト
│   ├── fixtures/          # テストデータ
│   └── test_helper.rb     # テストヘルパー
├── tmp/                   # 一時ファイル
├── vendor/                # サードパーティコード
├── .claude/               # Claude関連ドキュメント
│   ├── PROGRESS.md        # 開発進捗メモ
│   └── ARCHIVE.md         # 完了作業アーカイブ
├── .github/               # GitHub Actions設定
├── Gemfile                # Gem依存関係
├── Gemfile.lock           # Gem固定バージョン
├── Rakefile               # Rakeタスク定義
├── config.ru              # Rack設定
├── Dockerfile             # Docker設定
├── .rubocop.yml           # RuboCop設定
├── .ruby-version          # Rubyバージョン指定
├── .gitignore             # Git除外ファイル
├── README.md              # プロジェクトREADME
└── DevLog_requirements.md # 要件定義書
```

## 主要ファイルの説明

### モデル
- `app/models/article.rb`: 記事モデル
  - バリデーション: title、content必須
  - スコープ: published（公開済み）、draft（下書き）

### コントローラー
- `app/controllers/articles_controller.rb`: 記事コントローラー
  - CRUD操作（index, show, new, create, edit, update, destroy）
  - JSON対応
  - Strong Parameters使用

### ルーティング
- `config/routes.rb`:
  - `resources :articles`: 記事のRESTfulルート
  - `root "articles#index"`: ルートパスは記事一覧

### データベース
- `db/schema.rb`: articlesテーブル定義
  - title (string, 必須)
  - content (text, 必須)
  - summary (text)
  - category (string)
  - tags (string)
  - published (boolean, デフォルト: false)
  - created_at, updated_at

### 設定
- `.rubocop.yml`: rubocop-rails-omakaseスタイル継承
- `.ruby-version`: Ruby 3.3.6
- `Gemfile`: Gem依存関係（Rails 8.1.1、redcarpet等）

## アーキテクチャの特徴

### Rails 8.1の新機能使用
- Solid Cache: データベースベースのキャッシュ
- Solid Queue: データベースベースのジョブキュー
- Solid Cable: データベースベースのAction Cable

### Hotwire統合
- Turbo Rails: SPA風のページ遷移
- Stimulus Rails: JavaScriptフレームワーク

### モダンなアセット管理
- Propshaft: アセットパイプライン
- importmap-rails: ESM import maps

## 開発フロー
1. モデル作成（`bin/rails generate model`）
2. マイグレーション実行（`bin/rails db:migrate`）
3. コントローラー作成（`bin/rails generate controller`）
4. ルーティング設定（`config/routes.rb`）
5. ビュー作成（`app/views/`）
6. テスト作成（`test/`）
7. コードチェック（`bin/rubocop`、`bin/brakeman`）
8. Git コミット
