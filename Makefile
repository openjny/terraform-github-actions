.PHONY: setup init fmt validate lint security review plan clean help

# デフォルトターゲット
.DEFAULT_GOAL := help

# ツールのセットアップ（mise で terraform, tflint, trivy をインストール）
setup:
	@command -v mise >/dev/null 2>&1 || { echo "❌ mise が見つかりません: https://mise.jdx.dev"; exit 1; }
	mise install
	@echo "✅ セットアップ完了"

# 初期化（ローカル開発用、backend なし）
init:
	terraform init -backend=false

# フォーマットチェック
fmt:
	terraform fmt -check -recursive

# フォーマット自動修正
fmt-fix:
	terraform fmt -recursive

# バリデーション
validate: init
	terraform validate

# tflint
lint: init
	tflint --recursive

# セキュリティスキャン（trivy）
security:
	trivy fs --scanners misconfig --misconfig-scanners terraform --exit-code 1 .

# ローカルレビュー（fmt + validate + lint + security）
review: fmt validate lint security
	@echo "✅ ローカルレビュー完了"

# terraform plan（要 backend 接続）
plan:
	terraform init
	terraform plan

# クリーンアップ
clean:
	rm -rf .terraform .terraform.lock.hcl tfplan

# ヘルプ
help:
	@echo "使い方: make <ターゲット>"
	@echo ""
	@echo "セットアップ:"
	@echo "  setup     ツールのインストール（mise install）"
	@echo "  init      Terraform 初期化（backend なし）"
	@echo ""
	@echo "開発:"
	@echo "  fmt       フォーマットチェック"
	@echo "  fmt-fix   フォーマット自動修正"
	@echo "  validate  バリデーション"
	@echo "  lint      tflint 実行"
	@echo "  security  セキュリティスキャン（trivy）"
	@echo "  review    ローカルレビュー（fmt + validate + lint + security）"
	@echo ""
	@echo "デプロイ:"
	@echo "  plan      terraform plan（要 backend 接続）"
	@echo ""
	@echo "その他:"
	@echo "  clean     一時ファイルの削除"
	@echo "  help      このヘルプを表示"
