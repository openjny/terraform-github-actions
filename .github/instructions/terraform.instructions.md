# Terraform Instructions

## ファイル構成
- `main.tf`: プロバイダー設定とリソース定義
- `variables.tf`: 変数定義
- `outputs.tf`: 出力定義
- `terraform.tfvars`: 変数値（サンプル）

## コーディングルール
- `terraform fmt` に準拠したフォーマットを使用すること
- `terraform validate` を通過すること
- 変数には `description` と `type` を必ず定義すること
- sensitive な変数には `sensitive = true` を設定すること
- モジュールはバージョンを固定すること
