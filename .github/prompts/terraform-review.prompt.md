---
name: terraform-review
description: Terraform コードのローカルセルフレビューを実行するプロンプト
---

現在のブランチの変更内容に対して、以下の観点でレビューを実施してください。

## レビュー観点

### 1. フォーマットとバリデーション
- `terraform fmt -check` を実行して結果を確認
- `terraform validate` を実行して結果を確認

### 2. セキュリティ
- パブリックアクセスが無効化されているか
- TLS 1.2 以上が強制されているか
- Key Vault の `network_acls` が適切に設定されているか
- sensitive な変数に `sensitive = true` が設定されているか

### 3. 命名規則
- リソース名が `<種別>-<プロジェクト>-<環境>` パターンに従っているか
- `.github/copilot-instructions.md` の命名規則に準拠しているか

### 4. モジュール設計
- モジュール構成が既存パターン（networking）と一貫しているか
- 変数に `description` と `type` が定義されているか
- 出力が適切に定義されているか

### 5. タグ
- 必須タグ（environment, managed_by, project）が設定されているか

問題が見つかった場合は、修正方法を具体的に提案してください。
