# Copilot Instructions

## 一般ルール
- 日本語でコメントを書くこと
- Terraform コードは HashiCorp のベストプラクティスに従うこと

## 命名規則
- リソース名は `<種別>-<プロジェクト>-<環境>` パターンを使用すること
  - 例: `sql-myproject-prod`, `kv-myproject-prod`
- Terraform リソースのローカル名は `main` または用途を示す名前を使用すること

## タグ
- すべてのリソースに以下のタグを付与すること:
  - `environment`: デプロイ環境（dev, staging, prod）
  - `managed_by`: "terraform"
  - `project`: プロジェクト名

## セキュリティ
- パブリックアクセスはデフォルトで無効にすること
- TLS 1.2 以上を強制すること
- Key Vault の `network_acls` は `default_action = "Deny"` を設定すること
- SQL Server は `public_network_access_enabled = false` を設定すること

## Git ワークフロー
- GitHub Flow に従うこと（main ブランチから feature ブランチを切って PR で戻す）
- ブランチ名は `feature/<issue番号>-<簡潔な説明>` パターンを使用すること
- コミットメッセージは Conventional Commits に従うこと（`feat:`, `fix:`, `chore:`, `docs:` など）
- PR の説明に関連する Issue へのリンク（`Closes #XX`）を含めること

## テスト・検証
- コードの変更後は `make review` を実行してローカルレビューをパスさせること
- `make review` は `terraform fmt` → `terraform validate` → `tflint` → `checkov` を実行する
- 新しいモジュールを追加した場合、`terraform validate` が通ることを確認すること
