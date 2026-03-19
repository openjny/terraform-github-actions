# Terraform GitHub Actions

Azure インフラストラクチャを Terraform + GitHub Actions で管理するリポジトリです。  
[Azure-Samples/terraform-github-actions](https://github.com/Azure-Samples/terraform-github-actions) をベースにしています。

## アーキテクチャ

1. ブランチを作成し、Terraform コードを変更
2. PR を作成すると GitHub Actions が自動で `terraform plan` を実行し、結果を PR コメントに投稿
3. レビュー・承認後に main マージ → `terraform apply` が実行
4. 毎晩の Drift Detection で構成ドリフトを検出 → Issue を自動作成

## ワークフロー

| ワークフロー | トリガー | 内容 |
|---|---|---|
| [Terraform Unit Tests](.github/workflows/tf-unit-tests.yml) | 全 push | `fmt` → `validate` → Checkov セキュリティスキャン |
| [Terraform Plan/Apply](.github/workflows/tf-plan-apply.yml) | PR / main push | `plan` → PR コメント → 承認後 `apply` |
| [Terraform Drift Detection](.github/workflows/tf-drift.yml) | cron（毎日 3:41 UTC） | `plan` で差分検出 → Issue 自動作成/クローズ |

## 前提条件

- [Terraform](https://www.terraform.io/) >= 1.0
- [Azure CLI](https://docs.microsoft.com/cli/azure/) (`az`)
- [GitHub CLI](https://cli.github.com/) (`gh`)
- [Checkov](https://www.checkov.io/) （ローカルレビュー用）

## ローカル開発

```bash
# 初期化（backend なし）
terraform init -backend=false

# フォーマットチェック
terraform fmt -check -recursive

# バリデーション
terraform validate

# セキュリティスキャン
checkov -d . --framework terraform

# ローカルレビュー（Copilot Chat）
# /terraform-review
```

## ディレクトリ構成

```
.
├── main.tf                  # プロバイダー・バックエンド設定、リソース定義
├── variables.tf             # 変数定義
├── terraform.tfvars         # 変数値（サンプル）
├── modules/
│   └── networking/          # VNet・サブネット管理モジュール
├── .github/
│   ├── workflows/           # GitHub Actions ワークフロー
│   ├── copilot-instructions.md  # Copilot カスタマイズルール
│   ├── instructions/        # ファイル種別ごとの Copilot ルール
│   ├── prompts/             # Copilot プロンプトファイル
│   ├── agents/              # Copilot カスタムエージェント
│   └── pull_request_template.md
└── .vscode/
    └── mcp.json             # GitHub MCP Server 設定
```

## GitHub 環境設定

### Secrets（リポジトリレベル / read-only）

| Secret | 説明 |
|---|---|
| `AZURE_CLIENT_ID` | Read-only App Registration のクライアント ID |
| `AZURE_TENANT_ID` | Azure AD テナント ID |
| `AZURE_SUBSCRIPTION_ID` | Azure サブスクリプション ID |

### Secrets（production 環境 / read-write）

| Secret | 説明 |
|---|---|
| `AZURE_CLIENT_ID` | Read-write App Registration のクライアント ID（リポジトリ Secret をオーバーライド） |

### 認証方式

OIDC（Federated Credentials）を使用。Terraform State は Azure Storage Account に保管。

## Copilot プロンプト

| コマンド | 説明 |
|---|---|
| `/add-module` | 新しい Terraform モジュールの雛形を生成 |
| `/terraform-review` | ローカルでのセルフレビュー |
| `/create-pr` | PR を作成 |
| `/list-issues` | 自分にアサインされた Issue を一覧表示 |

## 参考リンク

- [Azure-Samples/terraform-github-actions](https://github.com/Azure-Samples/terraform-github-actions)
- [Deploy to Azure with GitHub Actions - Microsoft Learn](https://learn.microsoft.com/devops/deliver/iac-github-actions)
