# DevLog 開発進捗メモ

**作成日:** 2025-12-23
**最終更新:** 2025-12-25

---

## 📋 プロジェクト概要

- **アプリ名:** DevLog
- **目的:** プログラミング学習内容を記事として記録・公開
- **技術:** Ruby on Rails 8.1.1 + PostgreSQL（本番）/ SQLite（開発）
- **参考:** Qiita風の技術ブログ
- **公開URL:** https://devlog-gm30.onrender.com/articles

**関連ファイル:**
- 要件定義書: `/home/hiyak3/projects/devlog/DevLog_requirements.md`
- アーカイブ: `/home/hiyak3/projects/devlog/.claude/ARCHIVE.md`（完了作業の詳細）
- プロジェクトパス: `/home/hiyak3/projects/devlog/`

---

## ✅ 完了したフェーズ

### フェーズ1: MVP機能 ✅
- 記事のCRUD機能
- Markdown表示（GitHub Flavored Markdown対応）
- シンタックスハイライト（highlight.js）
- カード型デザイン
- レスポンシブ対応

### フェーズ2: 公開機能とWebデプロイ ✅
- 公開/下書きフィルター機能
- Renderへのデプロイ（PostgreSQL使用）
- 本番環境で公開中

> 詳細は `.claude/ARCHIVE.md` を参照

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

## 🎯 今後の拡張予定

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

## 💡 次回セッション開始時の手順

1. **この進捗メモ（PROGRESS.md）を確認**
2. **要件定義書（DevLog_requirements.md）を確認**（必要に応じて）
3. **Claude Codeに伝える:**
   - 「DevLogの開発を続けたい」
   - 「フェーズ3（コメント機能）から始める」
4. **PROGRESS.mdの「次にやること」を参照しながら進める**

---

**現在の状況:** フェーズ2（公開機能とWebデプロイ）完了 ✅
**次回の作業:** フェーズ3（コメント機能）
