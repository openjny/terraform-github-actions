# Module Instructions

## モジュール設計ルール
- 各モジュールは `modules/<モジュール名>/` ディレクトリに配置すること
- 各モジュールに `main.tf`, `variables.tf`, `outputs.tf` を含めること
- モジュール間の依存は出力変数を通じて行うこと
- モジュールは再利用可能な単位で設計すること

## 既存モジュール
- `modules/networking/`: VNet とサブネットの管理

## 新規モジュール追加時
- 既存モジュール（networking）と同じ設計パターンに従うこと
- `variables.tf` に `resource_group_name` と `location` を必ず含めること
- リソース名の命名規則に従うこと
