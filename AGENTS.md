# AGENTS.md

> 本文件供 **AI 编码 / 写作 agent**（如 WorkBuddy）阅读，用于了解本仓库（技能 `awujiana-readme-style`）的结构、约定与禁忌，从而在自动改动时保持风格一致。
> 人类贡献者请阅读 [CONTRIBUTING.md](CONTRIBUTING.md)（含完整命名规范）。

## 项目概述

- **名称**：我的 README 风格技能（中文名）
- **GitHub 仓库名（英文名）**：awujiana-readme-style
- **类型**：技能 / 文档仓库（随附 Shell + Python 脚本）
- **维护者**：awujiana
- **一句话**：把中文开源 README 方法论固化为可复用 WorkBuddy 技能，人和 AI 都能照着产出统一文档。

## 仓库结构

| 路径 | 用途 | 是否发布 |
| --- | --- | --- |
| `SKILL.md` | 技能定义：frontmatter（name / description / agent_created）、Overview、仓库类型与协议、When to Use、Workflow A–F、命名规范、README 结构、徽章规则、多语言、AI 声明、目录与锚点等 | ✅ |
| `references/` | 模板与规范：`readme-template.md`、`readme-template-data.md`、`release-notes-template.md`、`contributing-template.md`、`agents-template.md`、`changelog-template.md`、`naming-conventions.md`、`badges.md`、`git-workflow.md`、`sponsor-qrcode.md`、`ux-design-spec.md` | ✅ |
| `assets/` | `showcase.svg`、`ui-example.svg`（脚手架给目标仓库用的占位图）、`sponsor-qrcode.jpg`（赞赏码占位） | ✅ |
| `scripts/` | `scaffold_repo.sh`（一键脚手架）、`update_badges.py`（徽章 / 语言导航生成，支持 `--check`） | ✅ |
| `README.md` | 本仓库的对外说明（GitHub 展示页），遵循「我的 README 风格」 | ✅ |
| `CONTRIBUTING.md` | 贡献指南（含完整命名规范） | ✅ |
| `AGENTS.md` | 本文件（给 AI 看的内容） | ✅ |
| `CHANGELOG.md` | 更新日志（按版本累积记录） | ✅ |
| `LICENSE` | AGPL-3.0 全文 | ✅ |
| `.gitignore` | 忽略 `__pycache__/`、Python 缓存、OS / 编辑器临时文件 | ✅ |

> 注意：本仓库**自身**没有 `输出readme/` `样式readme/` `规范/` 目录——那是技能所生成**目标仓库**的结构，不是本仓库的结构。本仓库就是技能本身。

## 仓库与安装副本（单一真相）

- 本仓库是技能的**唯一真相（source of truth）**。
- 安装副本位于 `~/.workbuddy-ai/skills/awujiana-readme-style/`（Windows：`C:\Users\<你的用户名>\.workbuddy-ai\skills\awujiana-readme-style\`），是本仓库的 **git 克隆**。
- 修改流程：**先改本仓库 → 提交并推送 → 在安装副本执行 `git pull` 同步**。不要直接改安装副本，否则会漂移。
- 安装副本无需手动复制文件，`git pull` 即可对齐。

## 必须遵守的约定

1. **命名规范（不缩写）**：项目 `kebab-case`、文件 / 函数 / 组件一律全拼无缩写、名称不重复、组件名 = 文件名。详见 `CONTRIBUTING.md` 的「命名规范（不缩写）」与 `references/naming-conventions.md`。
2. **项目核心不变量**：
   - `SKILL.md` 的 frontmatter `description` 必须覆盖技能全部能力，**新增任何模块（如 UX）都要同步更新 `description` 触发词、Overview、Resources 与对应 Workflow 小节**，否则技能无法被对应请求触发。
   - `references/ux-design-spec.md` 是本仓库**单一真相**；若日后需要与其他仓库双向同步，必须显式约定并保持逐字节一致。
   - README / CONTRIBUTING / AGENTS / CHANGELOG 四大协作文件**必须同时存在**，且 CONTRIBUTING 含命名规范、AGENTS 为五段式。
3. **技术禁令**：
   - 禁止手写 `⚠️ Warning` 代替 GitHub 警示块 `> [!WARNING]`。
   - 禁止缩写命名、同名文件（含仅大小写不同）、数字后缀解决冲突（`UserCard2` ❌）。
   - 禁止在标题用 VS16 变体 emoji（`⚠️` / `🖼️`），会破坏自动锚点。
   - 禁止把赞助码放进 Release Notes；禁止把 `样式readme/` 纳入发布（本仓库本就没有）。
4. **README 风格**：顶部 shields.io 徽章（`<p align="center">` 纯 HTML 居中）→ 双名标题 → 语言切换徽章 + 文档导航 → `[!WARNING]` AI 声明 → 目录 → 正文 → 可选赞助 → 底部三节（关联仓库 / 作者联系方式 / 开源协议）。
5. **双名标题**：README 顶部**中文名 `<h1>` 在上、GitHub 仓库名 / 英文名 `<h2>` 在下**，两者都要有。
6. **协议**：AGPL-3.0；`LICENSE` 不许改动（含全文）。
7. **文档索引**：「文档」节只列**操作 / 参考文档**；本仓库无独立测试套件，最多一句话提示脚本可自测。
8. **提交信息**：说明「做了什么 / 为什么」；从 `main` 切特性分支（单人仓库可直接提交）。
9. **提交身份**：`git config user.name` 必须是 `awujiana`，`user.email` 必须是 `bingshanlengtie@qq.com`。旧邮箱一旦进了提交元数据，「改文件」和 `force push` 都清不掉。
10. **维护**：每次改动同步 `CHANGELOG.md`（Keep a Changelog，语义化版本）；规范文档改动同步版本号。
11. **徽章必须居中**：用 `<p align="center">` 包纯 HTML `<a><img></a>`，不要用 Markdown 图片语法；语言徽章三态为当前绿 / 可切换蓝 / 待补灰（无链接）。
12. **锚点稳定**：README 标题用显式 `<a id="sec-N"></a>` + TOC `#sec-N`，保证长文档链接不失效。

## 改动前检查

- **改 `SKILL.md`**：运行技能校验脚本（与 skill-creator 同目录的 `quick_validate.py`），确认输出 `Skill is valid!`；并核对 `description` ↔ Overview ↔ Resources ↔ 对应 Workflow 小节一致。
- **改 `scripts/*.sh`**：`bash -n scripts/scaffold_repo.sh` 检查语法。
- **改 `scripts/*.py`**：`python -m py_compile scripts/update_badges.py` 检查语法。
- **改 `references/*.md` / README / CONTRIBUTING / AGENTS**：对照本仓库既有风格与 `SKILL.md`；核对徽章居中、锚点、底部三节、双名标题。
- **改文档**：正文与技能行为不一致时以行为为准，并同步 `CHANGELOG.md`。
- **提交**：`git status` 确认不含 `__pycache__/`、`.pyc`、OS / 编辑器临时文件。

## 不要做的事

- 不要手写 `⚠️ Warning` 代替 `> [!WARNING]`。
- 不要缩写命名、不要同名文件（含仅大小写不同）、不要用数字后缀解决冲突（`UserCard2` ❌）。
- 不要在标题用 VS16 变体 emoji（`⚠️` / `🖼️`）。
- 不要把赞助码放进 Release Notes（本仓库无 Release Notes，但规范仍禁止）。
- 不要删除 `AGENTS.md` / `CONTRIBUTING.md` / `CHANGELOG.md` / `SKILL.md`；它们承载协作与 AI 约定。
- 不要让 `SKILL.md` 的 `description` 落后于实际能力（尤其漏掉已加入的 UX 模块）。
- 不要把 `assets/` 里的占位图（showcase.svg / ui-example.svg / sponsor-qrcode.jpg）误认为本仓库界面截图。
