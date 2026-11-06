<div align="center">

<p align="center">
  <a href="LICENSE"><img alt="协议 AGPL-3.0" src="https://img.shields.io/badge/协议-AGPL--3.0-blue?style=flat"></a>
  <a href="CONTRIBUTING.md"><img alt="PRs welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat"></a>
  <a href="https://github.com/awujiana"><img alt="AI辅助生成 是" src="https://img.shields.io/badge/AI辅助生成-是-orange?style=flat"></a>
</p>

<h1>贡献指南</h1>

<strong>欢迎参与「我的 README 风格技能」的共建</strong>

</div>

---

> [!WARNING]
> 本项目的相当一部分代码由 AI 辅助生成，并经过持续的人工作业、联调和重构，但它仍然可能存在遗漏、边界情况处理不足或行为与预期不完全一致的问题。如果你在使用过程中发现 Bug、兼容性问题、异常行为或文档缺失，欢迎积极提交 Issue。最好附上复现步骤、日志、截图和系统版本信息，这会非常有帮助。

感谢你关注 **awujiana-readme-style** 并愿意贡献。本协议与流程用于确保协作顺畅、输出风格统一、许可证一致。

> 维护者：awujiana ｜ 开源协议：以仓库 `LICENSE` 为准（AGPL-3.0）

## 📚 目录

- [我能如何参与](#我能如何参与)
- [提交 Issue 前](#提交-issue-前)
- [提交 Pull Request 前](#提交-pull-request-前)
- [命名规范（不缩写）](#命名规范不缩写)
- [代码与文档约定](#代码与文档约定)
- [行为准则](#行为准则)
- [许可证](#许可证)

## 🤝 我能如何参与

- **提交 Issue**：反馈技能漏洞、模板错误、排版建议或新场景需求。
- **完善规范 / 文档**：修改随仓库发布的规范或说明文件。
- **改进模板**：优化对外发布 README / Release Notes 等模板。
- **补充示例**：在 `references/` 增加样式参考或测试资源。

## 🐞 提交 Issue 前

1. 先搜索确认问题未被重复提出。
2. 说明场景：你正在编写哪类项目的文档、卡在哪一步。
3. 若为规范冲突，引用具体章节编号。
4. 可附上当前 Markdown 片段，便于复现。

## 🔀 提交 Pull Request 前

1. 从 `main` 分支切出特性分支，命名如 `fix/badge-style` 或 `feat/contributing`。
2. 遵循本仓库的 README 输出规范：
   - 顶部使用 shields.io 徽章表示协议 / 平台 / 作者等元信息，徽章必须用 `<p align="center">` + 纯 HTML 居中；
   - 正文含项目简介、核心功能、快速开始；
   - 代码仓库顶部须有 AI 辅助生成声明的 `> [!WARNING]` 警示块；
   - 命名一律全拼、禁止缩写、名称不重复（见下文「命名规范（不缩写）」）；
   - 底部必须包含「关联仓库」「作者联系方式」「开源协议」。
3. 中文表述准确，链接有效，占位内容明确标注「待补充」。
4. 提交信息清晰说明「做了什么 / 为什么」。

## 📝 命名规范（不缩写）

> 本节为**硬性命名规范**，所有改动都必须遵守。完整对照表与反例见 `references/naming-conventions.md`。

### 总则

- **一律全拼，禁止缩写**：`usr`→`user`、`cfg`→`config`、`btn`→`button`、`img`→`image`、`msg`→`message`、`err`→`error`、`idx`→`index`。
- **名称不重复**：项目名全局唯一；同目录文件名唯一（大小写不敏感）；同模块导出名唯一；组件名全局唯一。
- **名称即语义**：只看名字即可判断用途；禁止 `utils`、`common`、`misc`、`temp`、`data1`、`file2` 等泛化名。
- **同一项目内形态统一**：同类文件 / 符号只用一种命名风格，不混用 `camelCase` 与 `snake_case`。

### 项目（仓库）命名

- `kebab-case`，全小写，单词间用 `-`，2–5 个单词，能表达用途。
- 同一账号下不得与已有仓库重名。
- 禁止含版本号、日期、作者名，以及 `test` / `demo` / `new-project` / `untitled` 等无信息量名称。

### 文件命名

| 类型 | 规则 | 示例 |
| --- | --- | --- |
| 文档 | `kebab-case.md` | `release-notes.md`、`naming-conventions.md` |
| 页面 / 组件 | `PascalCase.tsx`，与组件名完全一致 | `UserProfileCard.tsx` → `UserProfileCard` |
| Hook | `use` + PascalCase，文件名 `camelCase.ts` | `useUserProfile.ts` → `useUserProfile` |
| 工具函数 | `camelCase.ts` 或 `kebab-case.ts`（同项目统一） | `format-date.ts` → `formatDate` |
| 常量文件 | `kebab-case.ts`，导出 `UPPER_SNAKE_CASE` | `max-retry-count.ts` → `MAX_RETRY_COUNT` |
| 类型定义 | `kebab-case.ts`，类型 `PascalCase` | `user-profile.ts` → `UserProfile` |
| 测试 | `<被测文件>.test.ts` | `format-date.test.ts` |
| 静态资源 | 小写英文 + 连字符 | `ui-example.svg`、`sponsor-qrcode.jpg` |
| Lua 脚本 | `snake_case.lua` 或 `camelCase.lua`（同项目统一） | `probe_naming.lua` |

- **同一目录内不得出现同名文件**，包括仅大小写不同（`UserCard.tsx` 与 `usercard.tsx` 视为冲突）。
- 避免用 `index.ts` 作为唯一出口造成同名歧义；需要桶文件时显式命名（如 `user-components.ts`）。

### 函数与组件命名

- **函数**：`camelCase`，**动词开头 + 名词**，全拼，如 `fetchUserProfile`、`calculateTotalPrice`、`renderSettingsPanel`。
- **组件**：`PascalCase`，**名词**，全拼，如 `UserProfileCard`、`SettingsPanel`、`OrderDetailTable`。
- **文件名即符号名**：`UserProfileCard.tsx` 必须导出 `UserProfileCard`；`fetch-user-profile.ts` 导出 `fetchUserProfile`。
- 同一模块内不得出现同名函数；不同模块同名须加限定词（`fetchUserProfile` / `fetchTeamProfile`）。
- 全局唯一：不同模块不得出现同名组件；需要区分时加业务限定词（`UserProfileCard` / `TeamProfileCard`）。

### 冲突处理

加**语义限定词**，而不是数字后缀。`UserCard` 与 `UserCard2` ❌；应为 `UserProfileCard` 与 `UserSettingsCard` ✅。

## 📋 代码与文档约定

- 正文以简体中文为主，专有名词保留英文原文。
- 命令行、配置片段使用围栏代码块并标注语言。
- 对比 / 参数类信息优先使用表格。
- 标题层级连续，不跳级。
- **徽章居中**：顶部徽章用 `<p align="center">` 包纯 HTML `<a><img></a>`，不要用 Markdown 图片语法。本仓库 README 的徽章为手写居中纯 HTML（遵循同一规范）；`scripts/update_badges.py` 是技能用于初始化**目标仓库**的工具，不在本仓库的自检流程中。
- **多语言**：新增译文时创建 `README.<locale>.md`；未提供的语言保留灰色「待补」徽章，不要放死链。

## 🤗 行为准则

请保持友善、专业、就事论事。尊重不同经验水平的贡献者，对规范分歧以讨论达成共识，不人身攻击、不贬低他人工作。

## 📄 许可证

向本仓库提交贡献，即表示你同意以仓库 `LICENSE` 所载协议（AGPL-3.0）发布你的贡献，并确认你拥有相应的授权。详见仓库内 [LICENSE](LICENSE)。

[![AGPL-3.0](https://img.shields.io/badge/License-AGPL--3.0-blue.svg)](LICENSE)
