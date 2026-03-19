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
