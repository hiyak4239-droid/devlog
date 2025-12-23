# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# サンプル記事を作成
Article.create!(
  title: "Railsでブログアプリを作成する方法",
  summary: "Ruby on Railsを使って、簡単なブログアプリケーションを作成する手順を解説します。",
  category: "バックエンド",
  tags: "Ruby, Rails, Web開発",
  published: true,
  content: <<~MARKDOWN
    # Railsでブログアプリを作成

    Ruby on Railsを使って、シンプルなブログアプリケーションを作成しました。

    ## 使用した技術

    - Ruby 3.3.6
    - Rails 8.1.1
    - SQLite（開発環境）
    - Redcarpet（Markdown処理）

    ## 実装した機能

    1. 記事の作成
    2. 記事の表示
    3. 記事の編集
    4. 記事の削除

    ### Scaffoldコマンド

    以下のコマンドでモデルとCRUD機能を一括生成しました：

    ```bash
    bin/rails generate scaffold Article title:string content:text summary:text category:string tags:string published:boolean
    ```

    ## データベース設計

    | カラム名 | 型 | 説明 |
    |---------|-----|------|
    | title | string | 記事のタイトル |
    | content | text | Markdown形式の本文 |
    | summary | text | 記事の要約 |
    | category | string | カテゴリ |
    | tags | string | タグ（カンマ区切り） |
    | published | boolean | 公開状態 |

    ## コードの例

    Markdownヘルパーの実装例：

    ```ruby
    def markdown(text)
      return "" if text.blank?

      renderer = Redcarpet::Render::HTML.new(
        filter_html: false,
        hard_wrap: true,
        link_attributes: { target: "_blank" }
      )

      markdown = Redcarpet::Markdown.new(
        renderer,
        autolink: true,
        tables: true,
        fenced_code_blocks: true
      )

      markdown.render(text).html_safe
    end
    ```

    ## まとめ

    Railsのscaffold機能を使うことで、**短時間で基本的なCRUD機能**を実装できました。

    今後の課題：
    - スタイリングの改善
    - タグ機能の強化
    - 検索機能の追加

    参考リンク：
    - [Rails公式ガイド](https://railsguides.jp/)
    - [Redcarpet GitHub](https://github.com/vmg/redcarpet)
  MARKDOWN
)

Article.create!(
  title: "Markdown記法のチートシート",
  summary: "よく使うMarkdown記法をまとめました。",
  category: "フロントエンド",
  tags: "Markdown, 記法, チートシート",
  published: true,
  content: <<~MARKDOWN
    # Markdown記法チートシート

    ## 見出し

    ```markdown
    # H1見出し
    ## H2見出し
    ### H3見出し
    ```

    ## テキスト装飾

    - **太字**は `**太字**`
    - *イタリック*は `*イタリック*`
    - ~~取り消し線~~は `~~取り消し線~~`

    ## リスト

    ### 順序なしリスト

    - 項目1
    - 項目2
      - ネストした項目
      - ネストした項目
    - 項目3

    ### 順序ありリスト

    1. 最初
    2. 次
    3. 最後

    ## リンク

    [Googleへのリンク](https://google.com)

    ## コードブロック

    インラインコード：`const x = 10;`

    複数行のコード：

    ```javascript
    function greet(name) {
      console.log(`Hello, ${name}!`);
    }

    greet("World");
    ```

    ## 引用

    > これは引用文です。
    > 複数行にわたって書くことができます。

    ## テーブル

    | 項目 | 説明 |
    |------|------|
    | Markdown | 軽量マークアップ言語 |
    | HTML | マークアップ言語 |
    | CSS | スタイルシート言語 |

    ## 水平線

    ---

    以上がよく使うMarkdown記法です！
  MARKDOWN
)

Article.create!(
  title: "プログラミング学習の記録",
  summary: "今日学んだことをメモしておきます。",
  category: "学習記録",
  tags: "学習, メモ",
  published: false,
  content: <<~MARKDOWN
    # 今日の学習内容

    ## 学んだこと

    - Railsのscaffold機能
    - Markdownの基本的な使い方
    - データベースのマイグレーション

    ## 感想

    思ったより簡単に実装できた！
    次はCSSでデザインを改善したい。

    ## TODO

    - [ ] スタイリングの改善
    - [ ] タグ機能の実装
    - [ ] 検索機能の追加
  MARKDOWN
)
