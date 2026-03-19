---
name: add-module
description: 新しい Terraform モジュールの雛形を生成するプロンプト
---

既存の `modules/networking/` モジュールと同じ設計パターンで、新しいモジュール `modules/$1/` を作成してください。

## 要件
- `main.tf`, `variables.tf`, `outputs.tf` を含めること
- `variables.tf` には `resource_group_name` と `location` を必ず含めること
- 命名規則 `<種別>-<プロジェクト>-<環境>` に従うこと
- セキュリティベストプラクティスを適用すること（パブリックアクセス無効、TLS 強制など）
- 日本語コメントを使用すること
