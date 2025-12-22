# DevLog 開発進捗メモ

**作成日:** 2025-12-23
**最終更新:** 2025-12-23

---

## 📋 プロジェクト概要

- **アプリ名:** DevLog
- **目的:** プログラミング学習内容を記事として記録・公開
- **技術:** Ruby on Rails 8.1.1 + SQLite
- **参考:** Qiita風の技術ブログ

**関連ファイル:**
- 要件定義書: `/home/hiyak3/projects/devlog/DevLog_requirements.md`
- プロジェクトパス: `/home/hiyak3/projects/devlog/`

---

## ✅ 完了した作業

### 1. 開発環境の確認・整備
- ✓ Ruby 3.3.6 確認
- ✓ Rails 8.1.1 確認
- ✓ Node.js v20.19.6 確認
- ✓ SQLite 3.45.1 インストール
- ✓ Git改行コード設定 (`core.autocrlf = input`)
- ✓ WSL2環境の確認（問題なし）

### 2. 要件定義書の作成
- ✓ プロジェクト概要の整理
- ✓ MVP機能の定義（記事のCRUD操作）
- ✓ データ設計（記事テーブルの詳細設計）
- ✓ 画面一覧の整理（4画面）
- ✓ 操作フローの定義
- ✓ 今後の拡張計画（フェーズ2〜4）

**記事（Article）の項目:**
- タイトル (title)
- 本文 (content) - Markdown形式
- 要約/概要 (summary)
- カテゴリ (category)
- タグ (tags)
- 公開状態 (published)
- 作成日時 (created_at)
- 更新日時 (updated_at)

### 3. Railsプロジェクトの作成
- ✓ `/home/hiyak3/projects/devlog/` にプロジェクト作成
- ✓ SQLiteをデータベースとして設定
- ✓ Gitリポジトリ自動初期化
- ✓ 要件定義書をプロジェクト内に移動

---

## 🚀 次にやること（優先順位順）

### ステップ1: 記事モデルの作成

**実行コマンド:**
```bash
cd /home/hiyak3/projects/devlog
rails generate model Article title:string content:text summary:text category:string tags:string published:boolean
```

**説明:**
- 記事（Article）のデータ構造を定義
- マイグレーションファイル（DB設計書）が自動生成される
- `title`: 記事タイトル（文字列）
- `content`: 本文（長文テキスト、Markdown形式）
- `summary`: 要約（長文テキスト）
- `category`: カテゴリ（文字列）
- `tags`: タグ（文字列、後で配列化を検討）
- `published`: 公開状態（真偽値、デフォルト: false）

---

### ステップ2: マイグレーションの実行

**実行コマンド:**
```bash
cd /home/hiyak3/projects/devlog
rails db:migrate
```

**説明:**
- マイグレーションファイルを実行してデータベースにテーブルを作成
- `db/schema.rb` が自動生成される

---

### ステップ3: コントローラの作成

**実行コマンド:**
```bash
cd /home/hiyak3/projects/devlog
rails generate controller Articles index show new edit
```

**説明:**
- 記事用のコントローラとビューを作成
- `index`: 記事一覧
- `show`: 記事詳細
- `new`: 新規作成
- `edit`: 編集

---

### ステップ4: ルーティングの設定

**編集ファイル:** `config/routes.rb`

**追加内容:**
```ruby
Rails.application.routes.draw do
  root "articles#index"
  resources :articles
end
```

**説明:**
- トップページを記事一覧に設定
- 記事のCRUD操作用のルートを自動生成

---

### ステップ5: CRUD機能の実装

1. **コントローラ実装** (`app/controllers/articles_controller.rb`)
   - index, show, new, create, edit, update, destroy アクションを実装

2. **ビュー実装** (`app/views/articles/`)
   - index.html.erb: 記事一覧
   - show.html.erb: 記事詳細
   - new.html.erb: 新規作成フォーム
   - edit.html.erb: 編集フォーム
   - _form.html.erb: フォーム共通パーツ

---

### ステップ6: Markdown対応

**Gemfile に追加:**
```ruby
gem 'redcarpet'
```

**実行コマンド:**
```bash
bundle install
```

**実装:**
- ヘルパーメソッドでMarkdownをHTMLに変換
- 記事詳細ページで使用

---

### ステップ7: 動作確認

**サーバー起動:**
```bash
cd /home/hiyak3/projects/devlog
rails server
```

**アクセス:**
- ブラウザで `http://localhost:3000` を開く
- 記事の作成・表示・編集・削除をテスト

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
   - 各ステップ完了後にコミット推奨
   - 例: モデル作成後、コントローラ作成後など

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
- データベース: SQLite3
- 作成場所: `/home/hiyak3/projects/devlog/`

---

## 📚 参考リンク

- Rails公式ガイド: https://railsguides.jp/
- Railsチュートリアル: https://railstutorial.jp/
- Qiita（参考アプリ）: https://qiita.com/

---

## 🎯 今後の拡張予定（参考）

### フェーズ2: 公開機能
- 下書き/公開の切り替え
- 公開記事のみ表示フィルター
- Webデプロイ（Render、Fly.io等）

### フェーズ3: コメント機能
- 記事へのコメント投稿
- コメント一覧表示

### フェーズ4: その他機能
- タグ検索・フィルター
- カテゴリ別表示
- いいね機能
- 閲覧数カウント
- シンタックスハイライト

---

## 💡 次回セッション開始時の手順

1. この進捗メモ（PROGRESS.md）を読む
2. 要件定義書（DevLog_requirements.md）を確認
3. Claude Codeに「DevLogの開発を続けたい」と伝える
4. 「次にやること」のステップ1から開始

---

**作業状況:** プロジェクト作成完了、次は記事モデル作成
