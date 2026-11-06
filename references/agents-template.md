# AGENTS.md

> 本文件供 **AI 编码 / 写作 agent**（如 WorkBuddy、Copilot、Claude）阅读，用于了解本仓库的结构、约定与禁忌，从而在自动改动时保持风格一致。
> 人类贡献者请阅读 [`CONTRIBUTING.md`](CONTRIBUTING.md)（含完整命名规范）。

## 项目概述

- **名称**：[PROJECT]（中文名）
- **GitHub 仓库名（英文名）**：[REPO]
- **类型**：[代码仓库（AGPL-3.0） / 数据仓库（CC BY-SA 4.0） / 文档仓库]
- **维护者**：AUTHOR
- **一句话**：[一句话说明这个项目做什么、解决什么问题]

## 仓库结构

| 路径 | 用途 | 是否发布 |
| --- | --- | --- |
| `输出readme/` | 对外发布内容：README、规范、Release Notes、assets | ✅ |
| `输出readme/assets/` | 图片资源：展示图、UI 示例图、赞助码 | ✅ |
| `样式readme/` | 从 GitHub 下载的原生 README 参考样例（学习用） | ❌ gitignore |
| `规范/` | 代码类规范（如 Lua 适配脚本命名规范与缩写扫描器） | ✅ |
| `scripts/` | `update_badges.py`（徽章 / 语言导航生成）、`badges.config.json`（唯一数据源） | ✅ |
| `CONTRIBUTING.md` | 贡献指南（含完整命名规范） | ✅ |
| `AGENTS.md` | 本文件（给 AI 看的内容） | ✅ |
| `CHANGELOG.md` | 更新日志（按版本累积记录） | ✅ |
| `LICENSE` | 协议文件 | ✅ |
| `.gitignore` | 排除参考样例与内部数据 | ✅ |

> 按实际项目裁剪 / 增补；务必把**项目特有的核心模块、单一入口与禁止改动区**写清楚，不要只留通用套话。

## 必须遵守的约定

1. **命名规范（不缩写）**：项目 `kebab-case`、文件 / 函数 / 组件一律全拼无缩写、名称不重复、组件名 = 文件名。详见 `CONTRIBUTING.md` 的「命名规范（不缩写）」与技能 `awujiana-readme-style` 的 `references/naming-conventions.md`。
2. **项目核心不变量**：[写清最关键、最容易改坏的约定，例如「展示名统一走 `format_display_title`」「搜索与展示分离」「所有数据读取走单一入口」；历史上踩过的坑要点名，避免 AI 重复犯错]。
3. **技术禁令**：[写清语言 / 框架层面的硬性禁令，例如「Lua 禁止非 ASCII 字符类」「禁止在组件里直接读原始字段拼显示名」]。
4. **README 风格**：顶部 shields.io 徽章（`<p align="center">` 纯 HTML 居中）→ 双名标题 → 语言切换徽章 + 文档导航 → `[!WARNING]` AI 声明（**数据仓库不加**）→ 目录 → 正文 → 可选赞助 → 底部三节（关联仓库 / 作者联系方式 / 开源协议）。
5. **双名标题**：README 顶部**中文名 `<h1>` 在上、GitHub 仓库名 / 英文名 `<h2>` 在下**，两者都要有。
6. **协议**：代码 AGPL-3.0，数据 CC BY-SA 4.0；`LICENSE` 不许改动。
7. **文档索引**：「文档」节只列**操作文档**；测试文档 / 测试文件不进索引，最多一句话提示。
8. **提交信息**：说明「做了什么 / 为什么」；从 `main` 切特性分支（单人仓库可直接提交）。
9. **提交身份**：`git config user.name` 必须是 `AUTHOR`，`user.email` 必须是 `[EMAIL]`。旧邮箱一旦进了提交元数据，「改文件」和 `force push` 都清不掉——普通仓库要靠删库重建，fork 仓库只能请 GitHub Support 做 GC。
10. **维护**：每次改动同步 `CHANGELOG.md`（Keep a Changelog，语义化版本）；规范文档改动同步版本号。
11. **徽章由脚本生成**：顶部徽章用 `<!-- badges:start -->` / `<!-- badges:end -->`，语言切换与文档导航用 `<!-- language-nav:start -->` / `<!-- language-nav:end -->` 包裹；改徽章 / 语言 / 文档入口只改 `scripts/badges.config.json`，再跑 `python scripts/update_badges.py`。禁止手改标记内内容，提交前 `--check` 必须通过。
12. **徽章必须居中**：用 `<p align="center">` 包纯 HTML `<a><img></a>`，不要用 Markdown 图片语法（部分渲染器会左对齐）；语言徽章三态为当前绿 / 可切换蓝 / 待补灰（无链接）。

## 改动前检查

- **改代码**：先过语法检查（如 `luajit -e "assert(loadfile('文件.lua'))"`），涉及解析 / 展示逻辑的跑对应回归测试。
- **改 README / 规范**：对照 `输出readme/我的readme输出规范.md`（若仓库附带）或技能 `awujiana-readme-style`；核对徽章、锚点、底部三节、双名标题。
- **改徽章**：只改 `scripts/badges.config.json`，跑 `python scripts/update_badges.py`，再跑 `--check` 确认区块与配置一致。
- **改 Lua**：`luacheck` + `规范/probe-naming.lua`，**0 error** 才提交。
- **改文档**：正文与代码不一致时以代码为准，并同步 `CHANGELOG.md`。
- **提交**：`git status` 确认不含 `样式readme/`、`.workbuddy-ai/`、临时文件。

## 不要做的事

- 不要手写 `⚠️ Warning` 代替 GitHub 警示块 `> [!WARNING]`。
- 不要在数据仓库加 AI 辅助生成声明。
- 不要缩写命名、不要同名文件（含仅大小写不同）、不要用数字后缀解决冲突（`UserCard2` ❌）。
- 不要在标题用 VS16 变体 emoji（`⚠️` / `🖼️`），会破坏自动锚点。
- 不要把 `样式readme/` 纳入发布或当成正文引用。
- 不要把赞助码放进 Release Notes。
- 不要删除 `AGENTS.md` / `CONTRIBUTING.md` / `CHANGELOG.md`；它们承载协作与 AI 约定。
- 不要手改 `<!-- badges:start -->` / `<!-- language-nav:start -->` 之间的内容，也不要绕过脚本直接改徽章链接。
