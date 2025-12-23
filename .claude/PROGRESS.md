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

## 🚀 次にやること（フェーズ2: 公開機能とWebデプロイ）

### 現在の状況
- フェーズ1（MVP機能）完了 ✅
- ローカル環境で記事のCRUD操作が動作中
- 次はフェーズ2に進む

### フェーズ2の目標
1. 公開/下書きの切り替え機能を改善
2. 公開記事のみ表示するフィルター機能
3. Webへのデプロイ（本番環境公開）

---

### ステップ1: 公開機能の改善

**現状:**
- `published`カラムは既に実装済み（true/false）
- フォームでチェックボックスで切り替え可能

**実装する内容:**
1. **記事一覧での公開記事フィルター**
   - デフォルトでは全記事表示
   - 公開記事のみ表示するオプション追加（将来の一般公開に備えて）

2. **コントローラの修正**
   - `ArticlesController#index` に公開記事のみ表示するスコープ追加（オプション）

**ファイル:**
- `app/models/article.rb`: スコープ追加
- `app/controllers/articles_controller.rb`: フィルター機能追加（オプション）

---

### ステップ2: 本番環境用の設定

**実装する内容:**
1. **本番環境用データベースの設定**
   - SQLiteからPostgreSQLへの移行準備
   - `config/database.yml`の確認・調整

2. **環境変数の設定**
   - `SECRET_KEY_BASE`などの機密情報管理
   - `config/credentials.yml.enc`の確認

3. **静的アセットの設定**
   - Propshaftの設定確認
   - アセットプリコンパイルの確認

**ファイル:**
- `config/database.yml`
- `config/environments/production.rb`
- `Gemfile` (pg gemの追加)

---

### ステップ3: デプロイ先の選定と準備

**候補サービス:**

1. **Render（推奨）**
   - 無料プランあり
   - PostgreSQL無料プラン含む
   - GitHubと連携して自動デプロイ
   - 設定が比較的簡単

2. **Fly.io**
   - 無料枠あり
   - グローバルCDN対応
   - PostgreSQL対応

3. **Heroku**
   - 有料（月額$5〜）
   - 実績豊富だが無料プランなし

**推奨: Render を使用**

---

### ステップ4: Renderへのデプロイ手順

#### 4-1. Renderアカウント作成
1. https://render.com/ にアクセス
2. GitHubアカウントで登録

#### 4-2. PostgreSQL gem追加

**Gemfileの編集:**
```ruby
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '>= 2.1'
end
```

**実行:**
```bash
bundle install
```

#### 4-3. database.ymlの調整

**production環境の設定を確認:**
```yaml
production:
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  url: <%= ENV['DATABASE_URL'] %>
```

#### 4-4. GitHubへプッシュ

```bash
git add .
git commit -m "本番環境用の設定を追加"
git push origin main
```

#### 4-5. Renderでデプロイ設定

1. Renderダッシュボードで「New Web Service」を選択
2. GitHubリポジトリを接続
3. 設定:
   - **Name**: devlog（任意）
   - **Environment**: Ruby
   - **Build Command**: `bundle install; bundle exec rake assets:precompile; bundle exec rake db:migrate`
   - **Start Command**: `bundle exec puma -C config/puma.rb`
4. 「Create Web Service」をクリック

#### 4-6. PostgreSQLデータベース作成

1. Renderダッシュボードで「New PostgreSQL」を選択
2. 無料プランを選択
3. 作成後、DATABASE_URLをコピー
4. Web ServiceにDATABASE_URL環境変数を設定

#### 4-7. デプロイ確認

- RenderがデプロイURLを発行
- `https://devlog-xxxx.onrender.com` 形式
- アクセスして動作確認

---

### ステップ5: デプロイ後の確認事項

**チェックリスト:**
- [ ] トップページが表示される
- [ ] 記事の作成・表示・編集・削除が動作する
- [ ] Markdownが正しく表示される
- [ ] シンタックスハイライトが動作する
- [ ] スタイルが適用されている
- [ ] サンプルデータを投入（`rails db:seed`）

---

## 📊 Gitコミット履歴

1. `ad57188` - 初回コミット: DevLogプロジェクト作成
2. `342713e` - MVP実装: 記事のCRUD機能とMarkdown表示を追加
3. `a1786ad` - デザイン改善: CSSとシンタックスハイライトを追加
4. `0a35545` - 記事一覧ページを簡素化

**現在のブランチ:** main
**リモート:** origin/main より3コミット先行中

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

### フェーズ2: 公開機能とWebデプロイ ← 次回ここから
- 下書き/公開の切り替え機能の改善
- 公開記事のみ表示するフィルター
- Webへのデプロイ（Render推奨）

### フェーズ3: コメント機能
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
   - 「フェーズ2（公開機能とWebデプロイ）から始める」
4. **PROGRESS.mdの「次にやること」を参照しながら進める**

---

**現在の状況:** フェーズ1（MVP機能）完了 ✅
**次回の作業:** フェーズ2（公開機能とWebデプロイ）
