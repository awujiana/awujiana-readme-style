---
name: awujiana-readme-style
description: This skill should be used when creating, rewriting, or reviewing a Chinese open-source project's README, CONTRIBUTING, AGENTS.md, or Release Notes; when choosing a license (AGPL-3.0 for code repositories, CC BY-SA 4.0 for data repositories); when applying strict project/file/function/component naming conventions (full spelling, no abbreviations, no duplicate names); when placing a sponsor QR code (赞赏码); when adding a bilingual title (Chinese name on top, GitHub repo name below); when centering badges, adding language-switch badges (简体中文 / 繁體中文 / English), or generating badges with a script; when initializing a Git repository with the awujiana README style; or when designing / reviewing product or interface UX — usability heuristics (Nielsen H1–H10), Refactoring UI, and practical walkthrough checklists (务实走查六大模块 / 表单校验四道防线与三个坑 / 占位文字正确用法 / 返回行为专项). Trigger keywords include README、贡献指南、CONTRIBUTING、AGENTS、给 AI 看、更新日志、CHANGELOG、双名标题、中英文标题、Release Notes、发布说明、徽章(bagae)、徽章居中、语言徽章、多语言、badge 更新脚本、update_badges、badges.config、目录/TOC、AI 辅助生成声明、数据仓库、CC BY-SA 4.0、命名规范、文件命名、组件命名、赞助码、赞赏码、打赏、sponsor、.gitignore、仓库初始化、UX设计、用户体验、可用性、界面走查、UI评审、设计评审、交互设计、表单校验、占位文字、报错、防错、防手滑、防想错、尼尔森、Refactoring UI、返回行为.
agent_created: true
---

# Awujian README Style

## Overview

把「我的 README 风格」仓库的方法论固化为可复用流程：按仓库类型产出结构统一的中文开源 README / CONTRIBUTING / Release Notes，按严格命名规范组织项目、文件、函数与组件，并按约定初始化 Git 仓库；另内置 UX 设计规范（`references/ux-design-spec.md`，含务实走查六大模块、表单校验防错、占位文字等章节），可支撑产品 / 界面设计与评审。

核心骨架：顶部 shields.io 徽章（**用 `<p align="center">` + 纯 HTML 居中**）→ **双名标题（中文名在上、GitHub 仓库名 / 英文名在下）** → 语言切换徽章 + 文档导航（多语言项目）→ （代码仓库）AI 辅助生成 `[!WARNING]` 声明 → 目录 → 正文 → （可选）赞助码 → 底部强制三节（关联仓库 / 作者联系方式 / 开源协议）。徽章、语言切换与文档导航由 `scripts/update_badges.py` 按 `scripts/badges.config.json` 生成。作者署名默认 **awujiana**。每个仓库**必须**附带 `CONTRIBUTING.md`（含命名规范）与 `AGENTS.md`（给 AI 看的内容），并维护 `CHANGELOG.md`（更新日志）。

## 仓库类型与协议（先判定）

| 类型 | 判定依据 | 开源协议 | AI 声明 |
| --- | --- | --- | --- |
| **代码仓库** | 含可执行代码、脚本、应用、插件 | **AGPL-3.0** | ✅ 必须有（有 AI 参与时） |
| **数据仓库** | 以数据集、语料、标注、表格为主 | **CC BY-SA 4.0** | ❌ **不需要** |
| **文档 / 规范仓库** | 以文档、规范、模板为主 | AGPL-3.0（或另行约定） | 视是否 AI 参与 |

> 判定不清时，看仓库的**主要产出物**：能运行的是代码仓库，能下载使用的是数据仓库，只能阅读的是文档仓库。数据仓库**不得**添加 AI 辅助生成声明。

## When to Use

- 新建或重写中文开源项目的 `README.md` / `CONTRIBUTING.md`。
- 生成某个版本的 `Release Notes`（发布说明 / 打包文档）。
- 判定仓库类型并选择协议（代码 AGPL-3.0 / 数据 CC BY-SA 4.0）。
- 制定或校验项目、文件、函数、组件命名规范。
- 设计或评审产品界面，检查可用性、视觉一致性、无障碍、响应式适配和用户测试验收。
- 初始化仓库结构（`输出readme/`、`样式readme/`、`规范/`、`.gitignore`、`main` 分支）。

## Workflow

### A. 代码仓库 README

1. 复制 `references/readme-template.md` 为目标 `README.md`（或 `输出readme/README.md`）。
2. 替换占位符：`[PROJECT]`、`AUTHOR`、`REPO`、`[一句话定位]`。
3. 保留 `[!WARNING]` AI 声明（有 AI 参与时）。
4. 协议填 **AGPL-3.0**，底部三节齐全。
5. 对照「自检清单」检查。

### B. 数据仓库 README

1. 复制 `references/readme-template-data.md`。
2. 替换 `[PROJECT]`、`AUTHOR`、`REPO`、数据规模与更新频率。
3. **不要添加** AI 辅助生成声明。
4. 协议填 **CC BY-SA 4.0**，并补「数据字典」。
5. 底部三节的「开源协议」改为「许可协议（CC BY-SA 4.0）」。

### C. Release Notes

1. 复制 `references/release-notes-template.md`。
2. 替换 `[VERSION]`、`[DATE]`、`[COMMIT]`、`[RELEASE_TYPE]`、`[SIZE]`、`[SHA256]`。
3. 按发布规模裁剪（patch / minor / major）。
4. 数据仓库的 Release Notes 删除顶部 AI 声明段。

### D. 初始化 Git 仓库

1. 执行 `scripts/scaffold_repo.sh <目标目录> "<项目名>" [code|data] [repo]`（`repo` = GitHub 仓库名 / 英文名）。
2. 确认 `.gitignore` 排除 `样式readme/` 与 `.workbuddy-ai/`。
3. `git init` → `main` 分支 → 首次提交。
4. 详见 `references/git-workflow.md`。

> `scaffold_repo.sh` 会一并生成 `CONTRIBUTING.md`（含命名规范）、`AGENTS.md`（给 AI 看）、`CHANGELOG.md`（更新日志）与 `scripts/`（徽章脚本 + 配置），并立即生成徽章区块；数据仓库生成的 CONTRIBUTING 会自动去掉 AI 声明段。

### E. UX 设计与界面走查

1. 阅读 references/ux-design-spec.md，把它作为本技能的 UX 设计基线。
2. 先按 H1–H10 评估任务可用性，再按 Refactoring UI 七视角检查视觉层级、间距、排版、色彩、深度、图像和收尾。
3. 使用液态玻璃时，检查背景层、半透明填色、边缘、高光、阴影与纯色回退；对比度要按实际组合背景验收。
4. 为核心流程列出默认、加载、成功、失败、空态、无权限和离线等适用状态，检查键盘、触控、屏幕阅读器、缩放和窄视口。
5. 使用代表性用户任务验证可用性；记录问题位置、规则、严重度、证据、建议和复验结果。
6. 发布前按规范的发布自检清单验收；不能只用静态截图或自动扫描代替真实交互检查。

> 规范的详细规则、可访问性基线、指标定义和来源见 references/ux-design-spec.md；其第 21 章「务实走查清单 · 六大模块」是可直接用于评审与走查的实战清单（报错 / 美观简约 / 组块 / 峰终定律 / 泰斯勒定律 / 即时反馈 六大模块 + 验收清单 + 返回行为专项），第 22 章「表单校验与防错（输入防错四法）」覆盖表单校验四道防线（让它选不上 / 替人改过来 / 按下前摆出来 / 最后才报错漏网的）与三个坑（别挡过头 / 灰着不说原因 / 报得太早），第 23 章「占位文字（Placeholder）的正确用法」覆盖占位灰字的三条规则（框上加标题 / 要求写框下 / 说明与示例区分）与「填满后灰字消失」走查法。更新工作区的 规范/UX设计规范.md 时，应同步这份技能参考文件。

### F. 徽章与多语言

1. 编辑仓库根 `scripts/badges.config.json`：`owner` / `repo` / `license` / `platform` / `status` / `ai_assisted` / `languages` / `docs`。
2. 运行 `python scripts/update_badges.py`，生成居中的核心徽章、语言切换徽章与文档导航。
3. 提交前运行 `python scripts/update_badges.py --check`，确认生成区块与配置一致。
4. 新增译文后重跑脚本，对应语言徽章自动从「待补」升级为可点击切换。
5. 细则与反例见 `references/badges.md`。

## 命名规范（严格）

> 完整规则与反例见 `references/naming-conventions.md`。以下为硬性摘要。

### 总则

1. **一律全拼，禁止缩写**（`usr`→`user`、`cfg`→`config`、`btn`→`button`、`img`→`image`）。
2. **名称不重复**：项目名全局唯一；同目录文件名唯一（大小写不敏感）；同模块导出名唯一；组件名全局唯一。
3. **名称即语义**：看到名字能判断用途，不使用 `utils`、`common`、`misc`、`temp`、`data1` 等泛化名。

### 项目命名

- `kebab-case`，全小写，2–5 个单词，例如 `user-profile-manager`。
- 不含版本号、日期、作者名；不与同账号下已有仓库重名。
- 禁止 `test`、`demo`、`new-project`、`untitled` 等无信息量名称。

### 文件命名

| 文件类型 | 规则 | 示例 |
| --- | --- | --- |
| 文档 | `kebab-case.md` | `release-notes.md`、`naming-conventions.md` |
| 页面 / 组件 | `PascalCase.tsx`，与组件名一致 | `UserProfileCard.tsx` → `UserProfileCard` |
| Hook | `use` + PascalCase，`camelCase.ts` | `useUserProfile.ts` → `useUserProfile` |
| 工具函数 | `camelCase.ts` 或 `kebab-case.ts` | `format-date.ts` → `formatDate` |
| 常量 | `UPPER_SNAKE_CASE` 导出 | `MAX_RETRY_COUNT` |
| Lua 脚本 | `snake_case.lua` 或 `camelCase.lua`（同项目统一） | `probe_naming.lua` |

- **同一目录内不得出现同名文件**（含仅大小写不同）。
- 避免用 `index.ts` 作为唯一出口导致同名歧义；需要桶文件时显式命名。

### 函数与组件命名

- **函数**：`camelCase`，**动词开头**，全拼，例如 `fetchUserProfile`、`calculateTotalPrice`。
- **组件**：`PascalCase`，**名词**，全拼，例如 `UserProfileCard`、`SettingsPanel`。
- **文件名即符号名**：组件文件 `UserProfileCard.tsx` 导出 `UserProfileCard`；函数文件 `fetch-user-profile.ts` 导出 `fetchUserProfile`。
- 同一模块内不得出现同名导出；不同模块的组件名也不得重复。

## README 结构（代码仓库）

| 顺序 | 区块 | 必选 |
| --- | --- | --- |
| 1 | 顶部徽章区（shields.io） | ✅ |
| 2 | 项目图标 + 标题 + 一句话简介（居中） | ✅ |
| 3 | 语言切换徽章 + 文档导航（居中） | 多语言项目 ✅ |
| 4 | AI 辅助生成声明 `[!WARNING]` | ✅（有 AI 参与） |
| 5 | 目录 TOC | 推荐（≥6 节） |
| 6 | 项目简介 | ✅ |
| 7 | 核心特色 / 功能 | ✅ |
| 8 | 展示图 / 界面预览 | UI 项目必选 |
| 9 | 安装 / 快速开始 | ✅ |
| 10 | 注意事项 | 推荐 |
| 11 | 文档（仅操作文档；测试默认不索引） | 可选 |
| 12 | 反馈建议 | 推荐 |
| 13 | 参考与致谢 | 推荐 |
| 14 | 赞助 / 赞赏码 | 可选（见「赞助与赞赏码」） |
| 15 | Stargazers / 镜像仓库 | 可选 |
| 16 | 底部信息区（关联仓库 / 作者联系方式 / 开源协议） | ✅ |

## README 结构（数据仓库）

| 顺序 | 区块 | 必选 |
| --- | --- | --- |
| 1 | 顶部徽章区（协议 CC BY-SA 4.0 / 类型 / 更新频率 / 作者） | ✅ |
| 2 | 标题 + 一句话简介 | ✅ |
| 3 | 语言切换徽章 + 文档导航（居中） | 多语言项目 ✅ |
| 4 | 目录 TOC | 推荐 |
| 5 | 数据简介（内容 / 覆盖范围 / 规模） | ✅ |
| 6 | 数据字典（字段 / 类型 / 说明 / 示例） | ✅ |
| 7 | 数据来源与采集方法 | ✅ |
| 8 | 使用方式（下载 / 加载示例） | ✅ |
| 9 | 更新记录 | 推荐 |
| 10 | 引用与致谢 | 推荐 |
| 11 | 赞助 / 赞赏码 | 可选 |
| 12 | 底部信息区（关联仓库 / 作者联系方式 / **许可协议 CC BY-SA 4.0**） | ✅ |

> 数据仓库**不设** AI 辅助生成声明。

> 不论代码 / 数据仓库，仓库根**都必须附带**：`CONTRIBUTING.md`（含命名规范）、`AGENTS.md`（给 AI 看的内容）、`CHANGELOG.md`（更新日志）、`LICENSE`。`scaffold_repo.sh` 已自动生成前三者。

## 徽章规则

- 代码仓库必含：协议（AGPL-3.0）、平台、作者。
- 数据仓库必含：协议（CC BY-SA 4.0）、数据类型、更新频率、作者。
- 动态徽章（stars / release / issues / forks）按需添加；仓库未上 GitHub 时留空，避免 `repo not found` 破图。
- 颜色语义：正式 `blue/green`，预发布 `orange`，警示 `red`；当前语言 `2ea44f`，待补语言 `lightgrey`。
- 数量 3–8 个，分「核心信息」与「动态统计」两组；语言切换另起一组。

### 徽章必须居中（强制）

- 用 `<p align="center">` 包裹**纯 HTML** `<a><img></a>`，不要依赖 `<div align="center">` 内的 Markdown 图片语法——部分渲染器不解析 HTML 块内的 Markdown，会退化成左对齐。
- 每组独立一个 `<p align="center">`；徽章之间换行即可，不要写 `<br>`。
- 完整示例与反例见 `references/badges.md`。

### 徽章脚本（唯一数据源）

- 脚本 `scripts/update_badges.py`，配置 `scripts/badges.config.json`。
- README 顶部用两对标记包裹，脚本只改标记之间：
  - `<!-- badges:start -->` / `<!-- badges:end -->`：核心 + 动态徽章
  - `<!-- language-nav:start -->` / `<!-- language-nav:end -->`：语言切换 + 文档导航
- 改徽章 / 语言 / 文档入口只改配置，再跑 `python scripts/update_badges.py`；提交前 `--check` 必须通过。
- 配置字段、转义规则、三态语言徽章见 `references/badges.md`。

## 多语言支持

- **语言切换徽章**：位于双名标题与一句话简介之下、`[!WARNING]` 之前，居中。三态固定：
  - 当前语言：绿色 `2ea44f`，消息 `当前`，链接当前文件；
  - 已有译文：蓝色，消息 `切換` / `Switch`，链接译文；
  - 未提供：灰色 `lightgrey`，消息 `待补`，**不加链接**（避免 404）。
- **文件命名**：`README.md`（简体中文）、`README.zh-TW.md`（繁體中文）、`README.en.md`（English）、其他 `README.<BCP-47>.md`。
- **文档导航**：语言徽章下方一行 `<sub>文档 / Docs：文档索引 · 贡献指南 · 更新日志 · 多语言支持</sub>`，四入口顺序固定，分隔符 `·`。
- 语言徽章与文档导航均由脚本按配置生成；补齐译文文件后重跑脚本，自动从「待补」升级为可点击徽章。
- 数据仓库把「文档索引」入口换成「数据字典」。

## AI 辅助生成声明（仅代码仓库）

位置：徽章区之后、首个正文章节之前，与顶部以 `---` 分隔。

```markdown
> [!WARNING]
> 本项目的相当一部分代码由 AI 辅助生成，并经过持续的人工作业、联调和重构，但它仍然可能存在遗漏、边界情况处理不足或行为与预期不完全一致的问题。如果你在使用过程中发现 Bug、兼容性问题、异常行为或文档缺失，欢迎积极提交 Issue。最好附上复现步骤、日志、截图和系统版本信息，这会非常有帮助。
```

- 必须用 `[!WARNING]`，禁止手写 `⚠️ Warning`。
- 单行撰写，中间不插空行。
- **数据仓库不得添加**；代码仓库实际无 AI 参与也不得添加。

## 目录与锚点

- 标题干净（无标点 / 括号 / 斜杠）→ 用 GitHub 自动锚点 `#-章节名`。
- 标题含标点或需长期稳定 → 标题前插入 `<a id="sec-N"></a>`，TOC 指向 `#sec-N`。
- emoji 标题避免 VS16 变体（`⚠️`、`🖼️`），否则自动锚点混入不可见字符。

## emoji 章节（推荐）

代码仓库：`📚 目录`、`🚀 项目简介`、`✨ 核心特色`、`🧩 功能`、`📦 安装`、`📷 展示图`、`⚠️ 注意事项`、`💬 反馈建议`、`🙏 参考与致谢`、`📄 License`。

数据仓库：`📚 目录`、`📊 数据简介`、`🗂 数据字典`、`🔍 数据来源`、`📦 使用方式`、`🕒 更新记录`、`🙏 引用与致谢`、`📄 许可协议`。

## 图片

- 本地 `assets/` 或稳定图床外链均可。
- 含界面项目 ≥1 张主界面截图；数据仓库配数据结构示意或字段示例截图。
- 外链须可匿名访问、未开防盗链；关键图保留本地备份。
- 可用 `assets/showcase.svg`、`assets/ui-example.svg` 作为占位。

## 赞助 / 赞赏码（可选）

- **位置**：`🙏 参考与致谢` 之后、底部强制三节之前；不得插入三节之间。章节数 ≥6 时 TOC 同步加条目。
- **图片**：本地 `assets/sponsor-qrcode.jpg`（推荐）或稳定图床外链；建议正方形、宽 200–260px，用 `width` 属性限宽。
- **写法**：`<div align="center">` 包裹 `<img>` + 文字说明（图片加载失败时仍可理解），示例见 `references/sponsor-qrcode.md`。
- **措辞**：必须说明**自愿**性质——赞赏不影响功能使用，也不提供额外优先支持；不得写「赞助即会员 / 永久支持」等无法兑现的承诺。
- **禁止**：不得放入 Release Notes（该文档要求短小精悍）。
- 模板已内置该章节与占位图，用户替换自己的赞赏码即可。

## 文档索引（可选，仅操作文档）

- 「文档」节（结构表第 11 项）是**开发文档索引**，默认**只承载项目操作文档**（安装 / 配置 / 使用 / API），集中于 `docs/` 并逐条列出，面向「会用这个项目」的人。
- **测试文档与测试文件默认不写入索引**，也不单独成节；仅在「文档」节用**一句话**带过位置（如 `> 测试见 \`tests/\` 目录`），需要时再补测试文档条目。
- 模板已内置精简的「📖 文档」章节（仅操作文档 + 一句测试提示），删改自便。

## 双名标题（中文在上、英文仓库名在下）

每个 README 标题区**必须同时给出中文名与英文名（GitHub 仓库名）**，且**中文名在上、英文名在下**：

```markdown
<div align="center">

[徽章区]

<h1>我的 README 风格</h1>
<h2>my-readme-style</h2>

<strong>一句话说明这个项目解决什么问题</strong>

</div>
```

- `<h1>`：中文项目名（对外展示名），居中。
- `<h2>`：英文名 = **该仓库在 GitHub 上使用的仓库名**（即远程 `git remote` 对应的 slug，如 `my-readme-style`），居中，位于中文名之下。
- 两者都要有，缺一不可；英文名不是翻译，而是 GitHub 真实的仓库标识。
- 模板占位符：`[PROJECT]` = 中文名，`[REPO]` = GitHub 仓库名（英文名）。

## CONTRIBUTING.md（必含命名规范）

**每个仓库都必须生成 `CONTRIBUTING.md`**，且其中**必须内联完整命名规范**（不缩写、全拼、不重复、组件名 = 文件名）。

- 位置：仓库根 `CONTRIBUTING.md`。
- 必含：参与方式、提交 Issue / PR 前检查、**[命名规范（不缩写）](#) 完整小节**、代码与文档约定、行为准则、许可证。
- 命名规范小节要自包含：项目 `kebab-case`、文件/函数/组件全拼、名称不重复、组件名 = 文件名；Lua 脚本加双轨缩写门禁。
- 模板：`references/contributing-template.md`（已内置命名规范，scaffold 自动生成）。

## AGENTS.md（给 AI 看的内容）

**每个仓库都必须生成 `AGENTS.md`**，作为 AI 编码 / 写作 agent 的入口说明，确保自动改动保持风格一致。写法要**具体、可执行**，不要只留通用套话。

- 位置：仓库根 `AGENTS.md`。
- **五段结构**（参考 `awujiana/uosc-staff-credits` 的 AGENTS.md）：
  1. `## 项目概述`：中文名、GitHub 仓库名（英文名）、类型、维护者、一句话。
  2. `## 仓库结构`：路径 / 用途 / 是否发布三列表格，写清发布区与不发布区。
  3. `## 必须遵守的约定`：编号列表，至少含 **命名规范 / 项目核心不变量 / 技术禁令 / README 风格 / 双名标题 / 协议 / 文档索引 / 提交信息 / 提交身份 / 维护**。其中「项目核心不变量」「技术禁令」必须写本项目的真实模块名与历史踩坑，不能空泛。
  4. `## 改动前检查`：写**真实命令**（如 `luajit -e "assert(loadfile('文件.lua'))"`、`luacheck`、回归测试），并注明「改文档同步 CHANGELOG」。
  5. `## 不要做的事`：具体禁忌（手写 `⚠️ Warning`、缩写命名、数字后缀、VS16 标题 emoji、数据仓库加 AI 声明、提交 `样式readme/` 等）。
- **提交身份**：明确 `git config user.name` / `user.email` 要求；说明旧邮箱进了提交元数据后「改文件 + force push」都清不掉（普通仓库删库重建、fork 需 GitHub Support GC）。
- 与 `CONTRIBUTING.md` 互补：人类读 CONTRIBUTING，AI agent 读 AGENTS。
- 模板：`references/agents-template.md`（scaffold 自动生成）。

## 更新日志 CHANGELOG

- 文件：`CHANGELOG.md`（仓库根），按版本**累积记录**所有重要变更（区别于按单次发布打包说明的 `Release-Notes.md`）。
- **格式**（参考 Keep a Changelog）：
  - 标题 `# 更新日志`，正文首句写「本文件记录 `PROJECT` 的重要变更，版本号遵循语义化版本 `MAJOR.MINOR.PATCH`」。
  - 最新版本在上；先放 `## [未发布]` 收纳已合并但未发布的改动。
  - 版本条目 `## [VERSION] - DATE`，小节用**纯中文**：`### 新增` / `### 改进` / `### 修复` / `### 破坏性变更` / `### 已知限制`（不要写「新增（Added）」这类中英并列）。
  - 末尾 `## 更早的版本`：诚实说明何时才引入 CHANGELOG，更早变更**不做追溯编造**。
  - 只追加、不改历史；每条尽量写清涉及文件与「为什么」。
- 模板：`references/changelog-template.md`（scaffold 自动生成）。
- 与 Release Notes 的关系：CHANGELOG 看「历史全貌」，Release Notes 看「本次发布如何升级」，二者互补、不重复。

## 底部强制三节

1. **关联仓库**：名称 + 可点击链接。
2. **作者联系方式**：GitHub + 邮箱。
3. **开源协议 / 许可协议**：代码仓库 AGPL-3.0；数据仓库 CC BY-SA 4.0，均链接 `LICENSE`。

## Release Notes 规范（极简）

- 不设徽章、标题、目录、底部三节；文档直接从 `[!WARNING]`（代码仓库）或版本信息开始。
- 章节：版本信息 → 更新亮点 → 新增功能 → 问题修复 → 性能优化 → 改进与调整 → 破坏性变更 → 打包产物与校验 → 升级指南 → 致谢。
- 裁剪：patch 留「版本信息 / 问题修复 / 升级指南」；minor 加「更新亮点 / 新增功能 / 改进与调整」；major 用全量。
- 底线：版本信息与升级指南必留；不兼容变更时破坏性变更不得省略。

## Git 仓库约定

- 目录：`输出readme/`（发布）、`样式readme/`（原生参考，gitignore）、`规范/`（代码规范）。
- `.gitignore`：排除 `样式readme/`、`.workbuddy-ai/`、系统临时文件。
- 分支 `main`；提交信息说明「做了什么 / 为什么」。
- 详见 `references/git-workflow.md`。

## 自检清单

- [ ] 已判定仓库类型（代码 / 数据 / 文档）
- [ ] 协议正确：代码 AGPL-3.0、数据 CC BY-SA 4.0
- [ ] 代码仓库有 AI `[!WARNING]`；数据仓库没有
- [ ] 徽章含 协议 / 平台（或数据类型）/ 作者
- [ ] 徽章用 `<p align="center">` + 纯 HTML `<a><img></a>` 居中，未使用 HTML 块内 Markdown 图片
- [ ] 多语言项目有语言切换徽章（当前绿 / 可切换蓝 / 待补灰且无死链）
- [ ] 文档导航四入口齐全（文档索引 / 贡献指南 / 更新日志 / 多语言支持）
- [ ] `python scripts/update_badges.py --check` 通过，生成区块未被手改
- [ ] 目录锚点可正常跳转
- [ ] 项目名、文件名、函数名、组件名全拼无缩写
- [ ] 无重名（项目 / 文件 / 导出 / 组件）
- [ ] 组件名与文件名一致
- [ ] 底部三节齐全，协议链接 `LICENSE`
- [ ] 赞助章节位置正确（致谢之后、底部三节之前）且含自愿性质说明
- [ ] 标题区为**双名**：中文名在上（`<h1>`）、GitHub 仓库名 / 英文名在下（`<h2>`），两者都有
- [ ] 仓库根有 `CONTRIBUTING.md`，且内联完整命名规范（不缩写 / 全拼 / 不重复 / 组件名 = 文件名）
- [ ] 仓库根有 `AGENTS.md`（五段式：项目概述 / 仓库结构 / 必须遵守的约定 / 改动前检查 / 不要做的事，且含项目核心不变量与提交身份）
- [ ] 仓库根有 `CHANGELOG.md`（`# 更新日志` + `[未发布]` + 纯中文小节 + 「更早的版本」诚实说明）
- [ ] 文档索引仅含项目操作文档；测试文档 / 文件默认不写入，仅一句简介（需要时再补）

## Resources

- `references/readme-template.md`：代码仓库 README 骨架（AGPL-3.0 + AI 声明）。
- `references/readme-template-data.md`：数据仓库 README 骨架（CC BY-SA 4.0，无 AI 声明）。
- `references/release-notes-template.md`：Release Notes 极简骨架。
- `references/naming-conventions.md`：项目 / 文件 / 函数 / 组件命名规范（全拼、不重复）。
- `references/contributing-template.md`：CONTRIBUTING 骨架（**内联完整命名规范**）。
- `references/agents-template.md`：AGENTS.md 骨架（五段式、项目核心不变量 / 技术禁令 / 提交身份，参考 uosc-staff-credits 写法）。
- `references/changelog-template.md`：CHANGELOG 骨架（`[未发布]` + 纯中文小节 + 更早版本说明）。
- `references/git-workflow.md`：目录结构、gitignore、协议映射、提交约定。
- `references/badges.md`：徽章居中对齐、三态语言徽章、文档导航、脚本与配置、转义规则。
- `references/ux-design-spec.md`：UX 设计规范（尼尔森 H1–H10 + Refactoring UI 七视角 + 务实走查六大模块 / 表单校验四道防线与三个坑 / 占位文字正确用法 / 返回行为专项），设计 / 评审 / 走查基线；第 21–23 章为实战清单，可直接用于评审与走查。
- `assets/showcase.svg`、`assets/ui-example.svg`：展示图 / UI 示例图占位。
- `assets/sponsor-qrcode.jpg`：赞赏码占位图（用户替换为自己的）。
- `references/sponsor-qrcode.md`：赞助码位置、图片规格与推荐写法。
- `scripts/scaffold_repo.sh`：按仓库类型一键初始化结构（含 README / CONTRIBUTING / AGENTS / CHANGELOG，以及 `scripts/` 徽章脚本与配置）。
- `scripts/update_badges.py`：按 `badges.config.json` 生成居中徽章、语言切换徽章与文档导航，支持 `--check`。

