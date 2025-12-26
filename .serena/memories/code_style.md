# DevLog - コードスタイルと規約

## コーディング規約
このプロジェクトは **rubocop-rails-omakase** スタイルに従っています。

## Ruby スタイル
- **インデント**: スペース2つ
- **引用符**: ダブルクォート `"` を使用
- **命名規則**:
  - メソッド名: `snake_case`
  - クラス名: `PascalCase`
  - 定数: `UPPER_CASE`
  - ファイル名: `snake_case.rb`

## Rails 規約
- **コントローラー**:
  - アクション前に`before_action`でコールバック設定
  - プライベートメソッドは`private`セクション内に配置
  - Strong Parametersを使用（`params.expect`）
- **モデル**:
  - バリデーションはクラスの上部に記述
  - スコープを活用（例: `scope :published`）
  - アソシエーションは明確に定義
- **ビュー**:
  - ERBテンプレート使用
  - パーシャルの活用

## コメント
- コメントは英語または日本語
- 複雑なロジックには説明コメントを追加
- ユーザー向けメッセージは英語（例: "Article was successfully created."）

## Git コミット
- **コミットメッセージ**: 日本語で記述
- **フッター**: Claude Codeによる自動生成フッターを含む

## テストスタイル
- **フレームワーク**: Minitest
- **並列実行**: 有効（`parallelize(workers: :number_of_processors)`）
- **フィクスチャ**: `test/fixtures/*.yml`を使用

## コード品質チェック
- **RuboCop**: `bin/rubocop`で実行
- **Brakeman**: セキュリティチェック（`bin/brakeman`）
- **Bundler Audit**: Gem脆弱性チェック（`bin/bundler-audit`）

## 設定ファイル
- `.rubocop.yml`: RuboCop設定（rubocop-rails-omakaseを継承）
- `.gitignore`: Git除外ファイル
- `.dockerignore`: Docker除外ファイル
