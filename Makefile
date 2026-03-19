.PHONY: init fmt validate lint security review plan clean

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

# セキュリティスキャン（checkov）
security:
	checkov -d . --framework terraform --skip-check CKV2_AZURE_31 --compact

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
