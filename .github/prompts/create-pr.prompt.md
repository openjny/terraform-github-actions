---
name: create-pr
description: ブランチの変更で PR を作成するプロンプト
---

GitHub MCP Server の `create_pull_request` ツールを呼び出して、現在のブランチの変更で PR を作成してください。
利用するテンプレートは `pr_template.md` で、テンプレートに沿って変更内容の要約と、関連する Issue へのリンクを自動生成してください。

## 前提条件

PR を作成するために、以下を満たしている必要があります。

- Git ワークフローが GitHub Flow に従っている
- ブランチがリモートにプッシュされている
- pr_template の内容で指示されている情報がそろっている
- ローカルでのテストにパスしている（`make review` が全チェック通過）
