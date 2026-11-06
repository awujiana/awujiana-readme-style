# Git 仓库工作流

## 目录结构

| 路径 | 用途 | 是否发布 |
| --- | --- | --- |
| `输出readme/` | 对外发布内容：`README.md`、`我的readme输出规范.md`、`Release-Notes.md`、`assets/` | ✅ 是 |
| `输出readme/assets/` | 图片资源：展示图、UI 示例图、赞助码（`sponsor-qrcode.jpg`） | ✅ 是 |
| `样式readme/` | 从 GitHub 下载的原生 README 参考样例（学习用） | ❌ 否（gitignore） |
| `规范/` | 代码类规范（如 Lua 适配脚本命名规范） | ✅ 是 |
| `scripts/` | 徽章生成脚本与配置（`update_badges.py`、`badges.config.json`） | ✅ 是 |
| `CONTRIBUTING.md` | 贡献指南（**必含完整命名规范**） | ✅ 是 |
| `AGENTS.md` | 给 AI 协作 agent 看的项目说明 | ✅ 是 |
| `CHANGELOG.md` | 更新日志（按版本累积） | ✅ 是 |
| `LICENSE` | 协议文件（代码 AGPL-3.0 全文 / 数据 CC BY-SA 4.0 说明文件） | ✅ 是 |
| `.gitignore` | 排除参考样例与内部数据 | ✅ 是 |

> 若项目只有一个 README，可省略 `输出readme/` 分层，直接放仓库根；分层适用于「规范 + 模板 + 参考样例」并存的仓库。

## 仓库类型与协议

| 类型 | 判定 | 协议 | AI 声明 |
| --- | --- | --- | --- |
| 代码仓库 | 含可执行代码 / 脚本 / 应用 | **AGPL-3.0** | 必须有（有 AI 参与） |
| 数据仓库 | 以数据集 / 语料 / 标注为主 | **CC BY-SA 4.0** | **不需要** |
| 文档 / 规范仓库 | 以文档为主 | AGPL-3.0（或另行约定） | 视 AI 参与 |

- 代码仓库：`LICENSE` 写入 AGPL-3.0 全文。
- 数据仓库：`LICENSE` 放一份指向 <https://creativecommons.org/licenses/by-sa/4.0/legalcode> 的**说明文件**（脚手架已自动生成，不内嵌全文）。
- 数据仓库**不得**在 README 中添加 AI 辅助生成声明。

## .gitignore 基线

```gitignore
# 从 GitHub 下载的原生 README 参考样例（学习用），不纳入版本控制
样式readme/

# 智能体内部数据（项目记忆等不随仓库发布）
.workbuddy-ai/

# 编辑器与系统临时文件
.DS_Store
Thumbs.db
*.log
```

## 初始化步骤

```bash
mkdir -p 输出readme/assets 样式readme 规范 scripts
git init
git branch -m main
git add -A
git commit -m "初始化仓库：README 输出规范与 AGPL-3.0 发布模板"
```

初始化后先改 `scripts/badges.config.json` 的 `owner` / `repo` / `languages`，再运行 `python scripts/update_badges.py` 生成徽章区块；提交前用 `--check` 验证。

## 提交约定

- 分支：`main`；特性分支 `fix/<topic>`、`feat/<topic>`。
- 提交信息说明「做了什么 / 为什么」，必要时分点列出改动文件。
- 提交前确认 `git status` 不含 `样式readme/`、`.workbuddy-ai/`、临时文件。
- 工作副本为 CRLF 时，提交后若仍有残留 `M`，用 `git checkout -- <file>` 归一化。

## 命名规范

项目、文件、函数、组件命名详见 `references/naming-conventions.md`：一律全拼、禁止缩写；项目名与文件名不重复；组件名与文件名一致。

若项目包含 Lua 适配脚本，另见《Lua 适配脚本命名规范》：门禁为 `luacheck` + 自定义 `probe-naming.lua` 双轨。

## 常见坑

1. **`.workbuddy-ai/` 被误提交**：`git add -A` 前先确认 `.gitignore` 生效；已误提交用 `git rm --cached -r .workbuddy-ai`。
2. **`样式readme/` 被提交**：它只作本地参考，必须排除。
3. **README 图片路径**：`输出readme/README.md` 引用本地图时应写 `assets/xxx.png`（相对该文件）。
4. **规范文档位置**：`我的readme输出规范.md` 放在 `输出readme/`，随仓库发布，不要放进 `样式readme/`。
5. **赞助码是占位图**：脚手架复制的是通用占位图，发布前须替换为作者自己的赞赏码，或删除该章节。
6. **`CONTRIBUTING.md` / `AGENTS.md` / `CHANGELOG.md` 必须存在**：三者由脚手架自动生成；`CONTRIBUTING.md` 内联完整命名规范，`AGENTS.md` 供 AI agent 阅读，`CHANGELOG.md` 维护版本变更历史，缺一则结构不完整。
7. **徽章区块不要手改**：`<!-- badges:start -->` 与 `<!-- language-nav:start -->` 之间由脚本生成；改配置后忘记重跑会导致 `--check` 失败，手改则会在下次运行时被覆盖。
8. **语言文件缺失**：`languages[].file` 不存在时徽章会显示灰色「待补」，这是预期行为；补齐译文后重跑脚本即可，不要手写死链。
