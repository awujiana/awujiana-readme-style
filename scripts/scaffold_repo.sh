#!/usr/bin/env bash
# 初始化符合「awujiana README 风格」的仓库结构。
# 用法: scaffold_repo.sh <目标目录> ["项目名"] [code|data] ["GitHub仓库名"] ["作者"]
#   code: 代码仓库（AGPL-3.0，含 AI 声明）
#   data: 数据仓库（CC BY-SA 4.0，无 AI 声明）
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "用法: $0 <目标目录> [\"项目名\"] [code|data] [\"GitHub仓库名\"] [\"作者\"]" >&2
  exit 1
fi

TARGET="$1"
PROJECT="${2:-我的开源项目}"
REPOSITORY_TYPE="${3:-code}"
REPO_SLUG="${4:-my-project}"
OWNER="${5:-awujiana}"
SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

case "$REPOSITORY_TYPE" in
  code)
    TEMPLATE="$SKILL_DIR/references/readme-template.md"
    LICENSE_NAME="AGPL-3.0"
    STRIP_WARNING="no"
    ;;
  data)
    TEMPLATE="$SKILL_DIR/references/readme-template-data.md"
    LICENSE_NAME="CC BY-SA 4.0"
    STRIP_WARNING="yes"
    ;;
  *)
    echo "未知仓库类型: $REPOSITORY_TYPE（应为 code 或 data）" >&2
    exit 1
    ;;
esac

mkdir -p "$TARGET/输出readme/assets" "$TARGET/样式readme" "$TARGET/规范" "$TARGET/scripts"

for asset in showcase.svg ui-example.svg sponsor-qrcode.jpg; do
  if [ -f "$SKILL_DIR/assets/$asset" ]; then
    cp "$SKILL_DIR/assets/$asset" "$TARGET/输出readme/assets/$asset"
  fi
done

cp "$SKILL_DIR/scripts/update_badges.py" "$TARGET/scripts/update_badges.py"

cat > "$TARGET/.gitignore" <<'EOF'
# 从 GitHub 下载的原生 README 参考样例（学习用），不纳入版本控制
样式readme/

# 智能体内部数据
.workbuddy-ai/

# 编辑器与系统临时文件
.DS_Store
Thumbs.db
*.log
EOF

# 数据仓库：生成指向官方 legalcode 的许可说明文件（不内嵌全文）
if [ "$REPOSITORY_TYPE" = "data" ]; then
  cat > "$TARGET/LICENSE" <<'EOF'
Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

Copyright (c) [YEAR] [AUTHOR]

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
International License. To view a copy of this license, visit:

  https://creativecommons.org/licenses/by-sa/4.0/legalcode

You are free to share and adapt the material, provided that you:
  - give appropriate credit and indicate if changes were made (Attribution);
  - distribute your contributions under the same license (ShareAlike).

This is a human-readable summary, not a substitute for the license text.
EOF
fi

python_bin=""
if command -v python3 >/dev/null 2>&1; then python_bin="python3"; elif command -v python >/dev/null 2>&1; then python_bin="python"; fi

copy_template() {
  local source_file="$1"
  local target_file="$2"
  local strip_warning="$3"
  if [ -n "$python_bin" ]; then
    "$python_bin" - "$source_file" "$target_file" "$PROJECT" "$strip_warning" "$REPO_SLUG" "$OWNER" <<'PY'
import sys

source_file, target_file, project, strip_warning, repo, owner = sys.argv[1:7]
text = open(source_file, encoding="utf-8").read()
text = text.replace("[PROJECT]", project).replace("[REPO]", repo).replace("AUTHOR", owner)

if strip_warning == "yes":
    output_lines = []
    skipping = False
    for line in text.splitlines():
        if line.strip() == "> [!WARNING]":
            skipping = True
            continue
        if skipping:
            if line.startswith(">"):
                continue
            skipping = False
        output_lines.append(line)
    text = "\n".join(output_lines).lstrip("\n") + "\n"

open(target_file, "w", encoding="utf-8", newline="\n").write(text)
PY
  else
    sed -e "s/\[PROJECT\]/$PROJECT/g" -e "s/\[REPO\]/$REPO_SLUG/g" -e "s/AUTHOR/$OWNER/g" "$source_file" > "$target_file"
  fi
}

copy_template "$TEMPLATE" "$TARGET/输出readme/README.md" "no"
copy_template "$SKILL_DIR/references/release-notes-template.md" "$TARGET/输出readme/Release-Notes.md" "$STRIP_WARNING"

# CONTRIBUTING.md（必含命名规范；数据仓库去掉 AI 声明）
copy_template "$SKILL_DIR/references/contributing-template.md" "$TARGET/CONTRIBUTING.md" "$STRIP_WARNING"

# AGENTS.md（给 AI 协作 agent 看的内容）
copy_template "$SKILL_DIR/references/agents-template.md" "$TARGET/AGENTS.md" "no"

# CHANGELOG.md（更新日志）
copy_template "$SKILL_DIR/references/changelog-template.md" "$TARGET/CHANGELOG.md" "no"

# 徽章配置 + 首次生成（居中徽章 / 语言切换 / 文档导航）
if [ -n "$python_bin" ]; then
  if [ "$REPOSITORY_TYPE" = "data" ]; then
    BADGE_LICENSE="CC BY-SA 4.0"
    BADGE_PROFILE="data"
    DOCS_LABEL="数据字典"
    DOCS_HREF="#-数据字典"
  else
    BADGE_LICENSE="AGPL-3.0"
    BADGE_PROFILE="code"
    DOCS_LABEL="文档索引"
    DOCS_HREF="#-文档"
  fi

  "$python_bin" - "$TARGET/scripts/badges.config.json" "$PROJECT" "$REPO_SLUG" "$OWNER" "$BADGE_LICENSE" "$BADGE_PROFILE" "$DOCS_LABEL" "$DOCS_HREF" <<'PY'
import json
import sys

path, project, repo, owner, license_name, profile, docs_label, docs_href = sys.argv[1:9]
config = {
    "owner": owner,
    "repo": repo,
    "project": project,
    "license": license_name,
    "platform": "Markdown",
    "platform_logo": "markdown",
    "platform_logo_color": "white",
    "status": "维护中",
    "ai_assisted": profile != "data",
    "ai_message": "是",
    "badge_style": "flat",
    "dynamic_badges": [],
    "languages": [
        {"name": "简体中文", "file": "输出readme/README.md", "current": True},
        {"name": "繁體中文", "file": "输出readme/README.zh-TW.md", "message": "切換"},
        {"name": "English", "file": "输出readme/README.en.md", "message": "Switch"},
    ],
    "docs": [
        {"label": docs_label, "href": docs_href},
        {"label": "贡献指南", "href": "../CONTRIBUTING.md"},
        {"label": "更新日志", "href": "../CHANGELOG.md"},
        {"label": "多语言支持", "href": "#-多语言支持"},
    ],
    "readme": "输出readme/README.md",
}
if profile == "data":
    config["badge_profile"] = "data"
    config["dataset_type"] = "数据集"
    config["update_frequency"] = "不定期"
else:
    config["badge_profile"] = "code"

with open(path, "w", encoding="utf-8", newline="\n") as handle:
    json.dump(config, handle, ensure_ascii=False, indent=2)
    handle.write("\n")
PY

  if ! "$python_bin" "$TARGET/scripts/update_badges.py" --repo-root "$TARGET" >/dev/null; then
    echo "⚠ 徽章生成失败，请检查 scripts/badges.config.json 与 README 标记。" >&2
  fi
else
  echo "⚠ 未找到 python，已跳过 badges.config.json 与徽章生成。"
fi

if [ ! -d "$TARGET/.git" ]; then
  git -C "$TARGET" init -q
  git -C "$TARGET" branch -m main 2>/dev/null || true
fi

echo "✅ 已生成仓库结构: $TARGET"
echo "   类型: $REPOSITORY_TYPE  协议: $LICENSE_NAME  仓库名: $REPO_SLUG  作者: $OWNER"
echo "   已生成：README、Release-Notes、CONTRIBUTING（含命名规范）、AGENTS（给 AI 看）、CHANGELOG、scripts（徽章脚本与配置）。"
echo "   徽章已按配置生成并居中（含语言切换与文档导航）；改徽章请改 scripts/badges.config.json 后重跑："
echo "     python scripts/update_badges.py"
echo "   新增译文：创建 README.<locale>.md 并在 languages 登记，重跑后「待补」自动升级。"
echo "   别忘了把 assets/sponsor-qrcode.jpg 换成你自己的赞赏码（不需要赞助则删除该章节）。"
if [ "$REPOSITORY_TYPE" = "data" ]; then
  echo "   已生成 LICENSE（CC BY-SA 4.0 说明文件，指向官方 legalcode）。"
else
  echo "   还需补充 LICENSE（AGPL-3.0 全文）。"
fi
