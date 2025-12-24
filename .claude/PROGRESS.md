# DevLog 開発進捗メモ

**作成日:** 2025-12-23
**最終更新:** 2025-12-24

---

## 📋 プロジェクト概要

- **アプリ名:** DevLog
- **目的:** プログラミング学習内容を記事として記録・公開
- **技術:** Ruby on Rails 8.1.1 + PostgreSQL（本番）/ SQLite（開発）
- **参考:** Qiita風の技術ブログ
- **公開URL:** https://devlog-gm30.onrender.com/articles

**関連ファイル:**
- 要件定義書: `/home/hiyak3/projects/devlog/DevLog_requirements.md`
- プロジェクトパス: `/home/hiyak3/projects/devlog/`

---

## ✅ 完了した作業

### フェーズ1: MVP機能（完了）

#### 1. 開発環境の確認・整備
- ✓ Ruby 3.3.6 確認
- ✓ Rails 8.1.1 確認
- ✓ Node.js v20.19.6 確認
- ✓ SQLite 3.45.1 インストール
- ✓ Git改行コード設定 (`core.autocrlf = input`)
- ✓ WSL2環境の確認（問題なし）

#### 2. 要件定義書の作成
- ✓ プロジェクト概要の整理
- ✓ MVP機能の定義（記事のCRUD操作）
- ✓ データ設計（記事テーブルの詳細設計）
- ✓ 画面一覧の整理（4画面）
- ✓ 操作フローの定義
- ✓ 今後の拡張計画（フェーズ2〜4）

#### 3. Railsプロジェクトの作成
- ✓ `/home/hiyak3/projects/devlog/` にプロジェクト作成
- ✓ SQLiteをデータベースとして設定
- ✓ Gitリポジトリ自動初期化
- ✓ 要件定義書をプロジェクト内に移動

#### 4. Article機能の実装（CRUD）
- ✓ Markdown用gem（redcarpet）をGemfileに追加
- ✓ bundle install実行
- ✓ Articleモデルをscaffoldで作成
  - title (string, 必須)
  - content (text, 必須)
  - summary (text)
  - category (string)
  - tags (string)
  - published (boolean, デフォルト: false)
- ✓ データベースマイグレーション実行
- ✓ バリデーション追加（title, content必須）
- ✓ ルート設定（/articlesをトップページに）

#### 5. Markdown表示機能の実装
- ✓ ApplicationHelperにMarkdownレンダリングメソッド追加
- ✓ 記事詳細ページでMarkdown表示を適用
- ✓ GitHub Flavored Markdown対応
  - テーブル
  - コードブロック
  - 取り消し線
  - 自動リンク

#### 6. サンプルデータの作成
- ✓ seeds.rbにサンプル記事3件追加
  - Railsブログアプリ作成方法
  - Markdown記法チートシート
  - プログラミング学習の記録（下書き）

#### 7. デザイン改善
- ✓ シンプルで見やすいCSSを追加
- ✓ 全体レイアウト（最大幅800px、中央寄せ）
- ✓ タイポグラフィ（見出し、段落、リスト）
- ✓ フォーム・ボタンのスタイリング
- ✓ 通知メッセージのスタイリング
- ✓ Markdownコンテンツの整形
  - 見出しの階層的デザイン
  - リスト、引用のスタイリング
  - テーブルの見やすい表示
- ✓ コードブロックをターミナル風デザインに変更（黒背景）
- ✓ レスポンシブデザイン対応

#### 8. シンタックスハイライトの実装（フェーズ4の機能を先行実装）
- ✓ highlight.jsを導入（CDN経由）
- ✓ Atom One Darkテーマを適用
- ✓ 200以上の言語に対応
- ✓ Markdownでの言語指定に対応

#### 9. 記事一覧ページの改善
- ✓ カード型デザインに変更
- ✓ 本文（Content）の表示を削除
- ✓ タイトル・要約・メタ情報のみ表示
- ✓ 新しい順（作成日時降順）で表示
- ✓ 公開/下書きステータスを視覚的に表示
- ✓ ホバー時のアニメーション追加
- ✓ 「続きを読む」リンクで詳細ページへ遷移

---

### フェーズ2: 公開機能とWebデプロイ（完了）

#### 1. 公開記事フィルター機能の実装
- ✓ Articleモデルに`published`スコープと`draft`スコープを追加
- ✓ ArticlesController#indexで公開記事のみを新しい順で表示
- ✓ 下書き記事は一覧に表示されない（直接URLでアクセス可能）

#### 2. 本番環境用の設定
- ✓ Gemfile: 本番環境用にpg gem追加、開発/テスト環境用にsqlite3を移動
- ✓ config/database.yml: 本番環境をPostgreSQLに変更（DATABASE_URL使用）
- ✓ config/environments/production.rb: キャッシュとジョブキューをシンプルなインメモリ設定に変更
  - solid_cacheからmemory_storeに変更
  - solid_queueからasyncアダプターに変更
- ✓ config/cable.yml: solid_cableからasyncアダプターに変更
- ✓ config/cache.yml: cacheデータベース指定を削除

#### 3. Renderへのデプロイ
- ✓ Renderアカウント作成（GitHubアカウントで連携）
- ✓ PostgreSQLデータベース作成（無料プラン）
- ✓ Web Service作成とGitHubリポジトリ連携
- ✓ 環境変数設定（DATABASE_URL、RAILS_MASTER_KEY）
- ✓ デプロイ成功
- ✓ サンプルデータ投入（一時的なエンドポイント経由）

#### 4. デプロイ後の動作確認
- ✓ トップページ表示確認
- ✓ 公開記事のみ表示（フィルター機能動作確認）
- ✓ 記事詳細ページ表示確認
- ✓ Markdown表示確認
- ✓ シンタックスハイライト動作確認

#### 5. トラブルシューティング（発生した問題と解決）
- **問題1:** `cable`データベース接続エラー
  - **原因:** solid_cableがcableデータベースに接続しようとしたが、database.ymlから削除していた
  - **解決:** config/cable.ymlをsolid_cableからasyncアダプターに変更
- **問題2:** `cache`データベース接続エラー
  - **原因:** config/cache.ymlでcacheデータベースへの接続が指定されていた
  - **解決:** config/cache.ymlから`database: cache`の行を削除

---

## 🚀 次にやること（フェーズ3: コメント機能）

### 現在の状況
- ✅ フェーズ1（MVP機能）完了
- ✅ フェーズ2（公開機能とWebデプロイ）完了
- 🌐 本番環境で公開中: https://devlog-gm30.onrender.com/articles
- 次はフェーズ3に進む

### フェーズ3の目標
1. 記事へのコメント投稿機能
2. コメント一覧表示
3. コメント削除機能

### 実装予定の内容

#### 1. Commentモデルの作成
- テーブル設計:
  - `article_id` (integer, 外部キー)
  - `author_name` (string, 必須)
  - `content` (text, 必須)
  - `created_at`, `updated_at`
- アソシエーション: `Article has_many :comments`

#### 2. コメント投稿機能
- 記事詳細ページにコメントフォームを追加
- バリデーション追加（author_name、content必須）
- コメント投稿後は記事詳細ページにリダイレクト

#### 3. コメント一覧表示
- 記事詳細ページでコメント一覧を表示
- 新しい順または古い順で表示
- コメント数の表示

#### 4. コメント削除機能
- 各コメントに削除ボタンを追加
- 削除確認ダイアログの実装
- 削除後は記事詳細ページにリダイレクト

---

## 📊 Gitコミット履歴

### フェーズ1
1. `ad57188` - 初回コミット: DevLogプロジェクト作成
2. `342713e` - MVP実装: 記事のCRUD機能とMarkdown表示を追加
3. `a1786ad` - デザイン改善: CSSとシンタックスハイライトを追加
4. `0a35545` - 記事一覧ページを簡素化
5. `b0b07fb` - 進捗メモを更新: フェーズ1完了とフェーズ2の準備

### フェーズ2
6. `d766313` - 公開記事フィルター機能を追加
7. `d8eb136` - 本番環境用の設定を追加（PostgreSQL対応）
8. `716b515` - 本番環境のAction Cable設定を修正
9. `346349a` - 本番環境のキャッシュ設定を修正
10. `77d7b33` - 一時的なサンプルデータ投入エンドポイントを追加
11. `d0e41ef` - 一時的なサンプルデータ投入エンドポイントを削除

**現在のブランチ:** main
**リモート:** origin/main と同期済み

---

## 📝 開発時の注意点

### 初学者向けのポイント

1. **コマンド実行は必ずプロジェクトディレクトリで:**
   ```bash
   cd /home/hiyak3/projects/devlog
   ```

2. **エラーが出たら:**
   - エラーメッセージを確認
   - Claude Codeに質問する
   - ログファイル (`log/development.log`) を確認

3. **変更後は必ずサーバー再起動:**
   - `Ctrl + C` でサーバー停止
   - `rails server` で再起動

4. **Gitコミットのタイミング:**
   - 機能実装完了時
   - バグ修正完了時
   - 作業の区切りがついたとき
   - Claude Codeが自動的に提案してくれます

### 計画の進め方のポイント

1. **MVPの原則を守る:**
   - 完璧な80%より、動く60%を早くリリース
   - デプロイしてから改善する

2. **スコープクリープに注意:**
   - 新しいアイデアは要件書の「今後の拡張予定」に追記
   - 現在のフェーズを完了させてから検討

3. **フェーズごとに進める:**
   - フェーズ1（MVP）→ フェーズ2（公開）→ フェーズ3（コメント）→ フェーズ4（その他）
   - 計画からの逸脱は記録しておく（例: シンタックスハイライトは先行実装）

---

## 🔧 開発環境情報

### インストール済みツール
- Ruby: 3.3.6
- Rails: 8.1.1
- Node.js: v20.19.6
- npm: 10.8.2
- SQLite: 3.45.1
- Git: 2.43.0
- Bundler: 4.0.1

### プロジェクト情報
- プロジェクト名: devlog
- データベース: SQLite3（開発）/ PostgreSQL（本番）
- 作成場所: `/home/hiyak3/projects/devlog/`

### 使用中のGem
- redcarpet: Markdown処理
- highlight.js: シンタックスハイライト（CDN）

---

## 📚 参考リンク

- Rails公式ガイド: https://railsguides.jp/
- Railsチュートリアル: https://railstutorial.jp/
- Qiita（参考アプリ）: https://qiita.com/
- Render（デプロイ先）: https://render.com/
- highlight.js: https://highlightjs.org/

---

## 🎯 今後の拡張予定（要件書より）

### ~~フェーズ2: 公開機能とWebデプロイ~~ ✅ 完了
- ✅ 下書き/公開の切り替え機能の改善
- ✅ 公開記事のみ表示するフィルター
- ✅ Webへのデプロイ（Render）

### フェーズ3: コメント機能 ← 次回ここから
- 記事へのコメント投稿
- コメント一覧表示
- コメント削除

### フェーズ4: その他機能
- タグ検索・フィルター
- カテゴリ別表示
- いいね機能
- 閲覧数カウント
- アイキャッチ画像
- 目次の自動生成
- ~~シンタックスハイライト~~ ✅ 実装済み

---

## 💡 次回セッション開始時の手順

1. **この進捗メモ（PROGRESS.md）を確認**
2. **要件定義書（DevLog_requirements.md）を確認**（必要に応じて）
3. **Claude Codeに伝える:**
   - 「DevLogの開発を続けたい」
   - 「フェーズ3（コメント機能）から始める」
4. **PROGRESS.mdの「次にやること」を参照しながら進める**

---

## 📌 本番環境情報

**公開URL:** https://devlog-gm30.onrender.com/articles
**ホスティング:** Render（無料プラン）
**データベース:** PostgreSQL（Render - 無料プラン）
**環境変数:**
- `DATABASE_URL`: PostgreSQL接続URL（Renderが自動設定）
- `RAILS_MASTER_KEY`: Rails暗号化キー（`config/master.key`の値）

**デプロイ設定:**
- Build Command: `bundle install; bundle exec rake assets:precompile; bundle exec rake db:migrate`
- Start Command: `bundle exec puma -C config/puma.rb`
- Auto-Deploy: 有効（GitHubのmainブランチへのpush時に自動デプロイ）

---

**現在の状況:** フェーズ2（公開機能とWebデプロイ）完了 ✅
**次回の作業:** フェーズ3（コメント機能）
