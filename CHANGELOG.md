# 更新日志

本文件记录 `awujiana-readme-style`（我的 README 风格技能）的重要变更，版本号遵循语义化版本 `MAJOR.MINOR.PATCH`。
格式参考 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)。

## [未发布]

### 新增

- （暂无）

### 改进

- 在 `AGENTS.md` 增加「仓库与安装副本」说明：本仓库为唯一真相，安装副本通过 `git pull` 同步。

## [1.0.0] - 2026-11-06

### 新增

- 首次公开发布 WorkBuddy 技能 `awujiana-readme-style`：把「我的 README 风格」方法论固化为可复用流程。
- `SKILL.md`：技能定义、触发条件与 Workflow A–F（代码 / 数据 README、Release Notes、Git 初始化、UX 设计与走查、徽章与多语言）。
- 模板与规范：`references/` 下 README（代码 / 数据）、Release Notes、CONTRIBUTING、AGENTS、CHANGELOG、命名规范、徽章、Git 工作流、赞助码、UX 设计规范。
- `references/ux-design-spec.md`：尼尔森 H1–H10 + Refactoring UI 七视角 + 实战清单（务实走查六大模块 / 表单校验四道防线与三个坑 / 占位文字正确用法 / 返回行为专项）。
- 脚本：`scripts/scaffold_repo.sh`（按仓库类型一键初始化结构）、`scripts/update_badges.py`（居中徽章 / 语言切换 / 文档导航生成，支持 `--check`）。
- 仓库协作文件：README（awujiana 风格）、CONTRIBUTING（含命名规范）、AGENTS（五段式）、CHANGELOG、LICENSE（AGPL-3.0 全文）。

### 已知限制

- 仅提供简体中文文档；繁體中文 / English 待补（顶部语言徽章已预留「待补」态）。
- `assets/showcase.svg` 与 `assets/ui-example.svg` 为脚手架占位图，非本仓库界面截图。

## 更早的版本

本仓库直到 `2026-11-06` 才随首次公开发布引入 `CHANGELOG.md`，更早的变更没有可靠记录，此处不做追溯编造。
