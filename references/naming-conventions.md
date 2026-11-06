# 项目、文件、函数与组件命名规范

> 适用范围：本技能生成或评审的所有仓库（代码 / 数据 / 文档）。
> 核心原则：**全拼、唯一、语义明确、文件即符号**。

## 1. 总则（硬性）

1. **一律全拼，禁止缩写**：`usr`→`user`、`cfg`→`config`、`btn`→`button`、`img`→`image`、`msg`→`message`、`err`→`error`、`idx`→`index`。
2. **名称不重复**：项目名全局唯一；同目录文件名唯一（大小写不敏感）；同模块导出名唯一；组件名全局唯一。
3. **名称即语义**：只看名字即可判断用途；禁止 `utils`、`common`、`misc`、`temp`、`data1`、`file2` 等泛化名。
4. **同一项目内形态统一**：同一类文件/符号只用一种命名风格，不混用 `camelCase` 与 `snake_case`。

## 2. 项目（仓库）命名

| 规则 | 要求 |
| --- | --- |
| 形态 | `kebab-case`，全小写，单词间用 `-` |
| 长度 | 2–5 个单词，能表达用途 |
| 唯一性 | 同一账号下不得与已有仓库重名 |
| 禁止 | 版本号、日期、作者名、`test`/`demo`/`new-project`/`untitled` |

| ✅ 正确 | ❌ 错误 | 原因 |
| --- | --- | --- |
| `user-profile-manager` | `UserProfileMgr` | 含大写与缩写 |
| `bangumi-data-archive` | `bgm-data` | `bgm` 缩写 |
| `release-notes-toolkit` | `project-v2-2026` | 含版本号与日期 |

## 3. 文件命名

| 文件类型 | 规则 | 示例 |
| --- | --- | --- |
| 文档 | `kebab-case.md` | `release-notes.md`、`naming-conventions.md` |
| 多语言 README | `README.<BCP-47>.md` | `README.zh-TW.md`、`README.en.md` |
| 页面 / 组件 | `PascalCase.tsx`，与组件名完全一致 | `UserProfileCard.tsx` → `UserProfileCard` |
| Hook | `use` + PascalCase，文件名 `camelCase.ts` | `useUserProfile.ts` → `useUserProfile` |
| 工具函数 | `camelCase.ts` 或 `kebab-case.ts`（同项目统一） | `format-date.ts` → `formatDate` |
| 常量文件 | `kebab-case.ts`，导出 `UPPER_SNAKE_CASE` | `max-retry-count.ts` → `MAX_RETRY_COUNT` |
| 类型定义 | `kebab-case.ts`，类型 `PascalCase` | `user-profile.ts` → `UserProfile` |
| 测试 | `<被测文件>.test.ts` | `format-date.test.ts` |
| 静态资源 | `kebab-case` | `ui-example.svg`、`user-avatar.png`、`sponsor-qrcode.jpg` |
| Lua 脚本 | `snake_case.lua` 或 `camelCase.lua`（同项目统一） | `probe_naming.lua` |

### 唯一性规则

- **同一目录内不得出现同名文件**，包括仅大小写不同的情况（`UserCard.tsx` 与 `usercard.tsx` 视为冲突）。
- 避免用 `index.ts` 作为唯一出口造成同名歧义；需要桶文件时显式命名（如 `user-components.ts`）。
- 移动/重命名文件时，同步更新所有引用与测试文件名。

## 4. 函数命名

- 形态：`camelCase`。
- 结构：**动词开头 + 名词**，如 `fetchUserProfile`、`calculateTotalPrice`、`renderSettingsPanel`。
- 全拼：`getUsr` ❌ → `getUser` ✅；`calcTtl` ❌ → `calculateTotal` ✅。
- 唯一：同一模块内不得出现同名函数；不同模块的同名函数应加限定词（`fetchUserProfile` / `fetchTeamProfile`）。

| ✅ 正确 | ❌ 错误 |
| --- | --- |
| `fetchUserProfile` | `getUsrProf` |
| `calculateTotalPrice` | `calcTtlPrc` |
| `initializePanel` | `initPanel` |

## 5. 组件命名

- 形态：`PascalCase`。
- 结构：**名词**，如 `UserProfileCard`、`SettingsPanel`、`OrderDetailTable`。
- **文件名即组件名**：`UserProfileCard.tsx` 必须导出 `UserProfileCard`。
- **页面组件**同样遵循：`UserProfilePage.tsx` → `UserProfilePage`。
- 全拼：`UsrCard` ❌ → `UserCard` ✅；`BtnGroup` ❌ → `ButtonGroup` ✅。
- 全局唯一：不同模块不得出现同名组件；需要区分时加业务限定词（`UserProfileCard` / `TeamProfileCard`）。

## 6. 不重复（冲突处理）

| 作用域 | 唯一性要求 |
| --- | --- |
| 仓库 / 项目 | 同一账号下全局唯一 |
| 目录内文件 | 同名（含大小写）不得共存 |
| 模块导出 | 同一模块内唯一 |
| 组件 | 全局唯一 |
| 函数 | 同一模块内唯一；跨模块同名须加限定词 |

**冲突处理**：加**语义限定词**，而不是加数字后缀。`UserCard` 与 `UserCard2` ❌；应为 `UserProfileCard` 与 `UserSettingsCard` ✅。

## 7. 高频缩写对照

| 缩写 | 全拼 | 缩写 | 全拼 |
| --- | --- | --- | --- |
| `usr` | user | `cfg` | config |
| `btn` | button | `img` | image |
| `msg` | message | `err` | error |
| `idx` | index | `len` | length |
| `val` | value | `num` | number |
| `col` | column | `row` | row |
| `fn` | function | `obj` | object |
| `arr` | array | `str` | string |
| `tmp` | temporary | `src` | source |
| `dest` | destination | `res` | response |
| `req` | request | `param` | parameter |
| `init` | initialize | `attr` | attribute |
| `prop` | property | `prev` | previous |
| `cur` | current | `dir` | directory |
| `pkg` | package | `ver` | version |

> 公认缩略词（`id`、`url`、`api`、`json`、`xml`、`http`、`ui`）视为独立单词，不在此列。

## 8. 自检清单

- [ ] 项目名 `kebab-case`、全拼、2–5 词、全局唯一
- [ ] 同目录无同名文件（含大小写）
- [ ] 组件文件名 = 组件名
- [ ] 函数动词开头、`camelCase`、全拼
- [ ] 组件名词、`PascalCase`、全拼
- [ ] 无同名导出 / 组件
- [ ] 冲突用语义限定词解决，未用数字后缀
