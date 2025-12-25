# DevLog 開発アーカイブ

**作成日:** 2025-12-25
**目的:** 完了した作業の詳細記録

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

---

## 📚 参考リンク

- Rails公式ガイド: https://railsguides.jp/
- Railsチュートリアル: https://railstutorial.jp/
- Qiita（参考アプリ）: https://qiita.com/
- Render（デプロイ先）: https://render.com/
- highlight.js: https://highlightjs.org/
