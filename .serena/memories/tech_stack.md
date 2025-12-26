# DevLog - 技術スタック

## 言語とフレームワーク
- **Ruby**: 3.3.6
- **Ruby on Rails**: 8.1.1

## データベース
- **開発環境**: SQLite3 (>= 2.1)
- **本番環境**: PostgreSQL (~> 1.1)

## フロントエンド
- **JavaScript**: importmap-rails（ESM import maps）
- **Hotwire**:
  - Turbo Rails: SPA風のページ遷移
  - Stimulus Rails: JavaScript framework
- **CSS**: Propshaft（アセットパイプライン）

## Markdown処理
- **Markdown レンダラー**: redcarpet
- **シンタックスハイライト**: highlight.js（CDN経由）

## Webサーバー
- **開発・本番**: Puma (>= 5.0)

## デプロイ・インフラ
- **ホスティング**: Render（無料プラン）
- **デプロイツール**: Kamal
- **コンテナ**: Docker対応（Dockerfile、docker-entrypoint）
- **CI/CD**: GitHub連携による自動デプロイ

## 開発ツール
- **コードスタイル**: rubocop-rails-omakase
- **セキュリティチェック**: 
  - brakeman（静的解析）
  - bundler-audit（Gem脆弱性チェック）
- **テスト**: 
  - Minitest（Rails標準）
  - Capybara（システムテスト）
  - Selenium WebDriver

## その他の主要Gem
- **jbuilder**: JSON API構築
- **solid_cache**: データベースベースのキャッシュ
- **solid_queue**: データベースベースのジョブキュー
- **solid_cable**: データベースベースのAction Cable
- **bootsnap**: 起動時間短縮
- **thruster**: HTTP圧縮・キャッシング
- **image_processing**: 画像変換

## 環境変数（本番）
- `DATABASE_URL`: PostgreSQL接続URL（Renderが自動設定）
- `RAILS_MASTER_KEY`: Rails暗号化キー（config/master.keyの値）
