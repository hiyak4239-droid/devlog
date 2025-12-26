# DevLog - プロジェクト概要

## プロジェクトの目的
DevLogは、プログラミング学習内容を記事として記録・公開するためのQiita風の技術ブログアプリケーションです。

## 基本情報
- **アプリ名**: DevLog
- **参考アプリ**: Qiita (https://qiita.com/)
- **対象ユーザー**: 
  - 記事作成: 自分のみ
  - 記事閲覧: 第三者も可能
  - コメント: 第三者も可能（将来実装）
- **公開URL**: https://devlog-gm30.onrender.com/articles
- **プロジェクトパス**: /home/hiyak3/projects/devlog/

## 現在の状態
- ✅ フェーズ1（MVP機能）完了
- ✅ フェーズ2（公開機能とWebデプロイ）完了
- 🚀 次: フェーズ3（コメント機能）

## 主な機能
### 実装済み
- 記事のCRUD操作（作成、表示、編集、削除）
- Markdown表示（GitHub Flavored Markdown対応）
- シンタックスハイライト（highlight.js）
- 公開/下書きフィルター機能
- カード型デザイン
- レスポンシブ対応
- 本番環境への公開（Render）

### 今後の予定
- フェーズ3: コメント機能
- フェーズ4: タグ検索、カテゴリ別表示、いいね機能など

## 関連ドキュメント
- 要件定義書: `DevLog_requirements.md`
- 進捗メモ: `.claude/PROGRESS.md`
- アーカイブ: `.claude/ARCHIVE.md`
