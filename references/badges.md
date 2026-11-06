# 徽章与多语言导航规范

> 本文件是 `awujiana-readme-style` 的徽章细则：居中对齐、语言切换徽章、文档导航、脚本与配置。
> 规范正文见 `我的readme输出规范.md` §4 与 §19。

## 1. 位置与分组

|<div align="center"> 内自上而下 | 内容 | 生成方式 |
| --- | --- | --- |
| 1 | 核心徽章：协议 / 平台 / 作者 / 状态 / AI 辅助生成 | `update_badges.py` |
| 2 | 动态徽章：Release / Stars / Issues / Forks / PRs（按需） | `update_badges.py` |
| 3 | 中文标题 `<h1>`、英文标题 `<h2>`（GitHub 仓库名） | 手写 |
| 4 | 一句话简介 `<strong>` | 手写 |
| 5 | 语言切换徽章 + 文档导航 | `update_badges.py` |

## 2. 居中对齐（强制）

必须用 `<p align="center">` 包裹**纯 HTML** 的 `<a><img></a>`：

```html
<p align="center">
  <a href="../LICENSE"><img alt="协议 AGPL-3.0" src="https://img.shields.io/badge/协议-AGPL--3.0-blue?style=flat"></a>
  <a href="https://github.com/awujiana"><img alt="作者 awujiana" src="https://img.shields.io/badge/作者-awujiana-orange?style=flat"></a>
</p>
```

不要写成：

```markdown
<!-- 错误：HTML 块内的 Markdown 在部分渲染器不解析，会左对齐 -->
<div align="center">

[![协议](https://img.shields.io/badge/协议-AGPL--3.0-blue)](../LICENSE)

</div>
```

- 每组徽章独立一个 `<p align="center">`。
- 徽章之间换行即可，浏览器自动换行，不要写 `<br>`。
- 徽章较多时最多 3 行：核心 / 动态 / 语言。

## 3. 颜色与数量

| 用途 | 颜色 | 说明 |
| --- | --- | --- |
| 协议、正式信息 | `blue` | 静态徽章默认色 |
| 平台 | `black` | 可配 `logo`（如 `markdown`） |
| 作者 | `orange` | 与 AI 声明区分 |
| 维护状态 | `green` | 维护中 / 活跃 |
| 当前语言 | `2ea44f` | 绿色，表示当前文档 |
| 可切换语言 | `blue` | 已有译文 |
| 待补语言 | `lightgrey` | 未提供译文，**不加链接** |
| 预发布 | `orange` | beta / rc |
| 警示 | `red` | 慎重使用 |

核心徽章 3–8 个（不含语言切换徽章）。

## 4. 语言切换徽章

多语言项目在标题与一句话简介之下放置语言切换，三态固定：

| 状态 | 显示 | 颜色 | 链接 |
| --- | --- | --- | --- |
| 当前语言 | `简体中文 · 当前` | `2ea44f` | 指向当前文件 |
| 已有译文 | `繁體中文 · 切換` / `English · Switch` | `blue` | 指向译文文件 |
| 未提供 | `繁體中文 · 待补` | `lightgrey` | **无链接**，避免 404 |

文件命名：

| 语言 | 文件 |
| --- | --- |
| 简体中文 | `README.md` |
| 繁體中文 | `README.zh-TW.md` |
| English | `README.en.md` |
| 其他 | `README.<BCP-47>.md` |

## 5. 文档导航

语言徽章下方单独一行、居中，固定四入口：

```html
<p align="center">
  <sub>文档 / Docs：<a href="#-文档">文档索引</a> · <a href="../CONTRIBUTING.md">贡献指南</a> · <a href="../CHANGELOG.md">更新日志</a> · <a href="#-多语言支持">多语言支持</a></sub>
</p>
```

- 分隔符统一 `·`；`语言 / Language：`、`文档 / Docs：` 中英并列。
- 顺序固定，不插入中间；额外入口追加在末尾。
- 数据仓库可把「文档索引」换成「数据字典」。

## 6. 标记与脚本

README 中保留两对标记，脚本只改写标记之间：

```markdown
<!-- badges:start -->
<!-- badges:end -->

<!-- language-nav:start -->
<!-- language-nav:end -->
```

脚本：仓库根 `scripts/update_badges.py`；配置：`scripts/badges.config.json`。

```bash
python scripts/update_badges.py           # 就地更新
python scripts/update_badges.py --check   # 提交前 / CI 门禁，过期返回 1
python scripts/update_badges.py --print   # 只打印，不写文件
```

## 7. 配置字段

```json
{
  "owner": "awujiana",
  "repo": "my-readme-style",
  "project": "我的 README 风格",
  "license": "AGPL-3.0",
  "badge_profile": "code",
  "platform": "Markdown",
  "platform_logo": "markdown",
  "status": "维护中",
  "ai_assisted": true,
  "badge_style": "flat",
  "dynamic_badges": ["release", "stars", "issues"],
  "languages": [
    { "name": "简体中文", "file": "输出readme/README.md", "current": true },
    { "name": "繁體中文", "file": "输出readme/README.zh-TW.md", "message": "切換" },
    { "name": "English", "file": "输出readme/README.en.md", "message": "Switch" }
  ],
  "docs": [
    { "label": "文档索引", "href": "#-文档" },
    { "label": "贡献指南", "href": "../CONTRIBUTING.md" },
    { "label": "更新日志", "href": "../CHANGELOG.md" },
    { "label": "多语言支持", "href": "#-多语言支持" }
  ],
  "readme": "输出readme/README.md"
}
```

- `badge_profile`：`code`（协议 / 平台 / 作者 / 状态 / AI）或 `data`（协议 / 类型 / 更新 / 作者）。
- 数据仓库额外字段：`dataset_type`（默认 `数据集`）、`update_frequency`（默认 `不定期`）；`ai_assisted` 必须为 `false`。
- `languages` 中必须且只能有一项 `current: true`。
- `file` 相对仓库根；不存在时自动降级为「待补」。
- `dynamic_badges` 为空数组时省略动态徽章（仓库未上 GitHub 时避免 `repo not found` 破图）。
- 数据仓库：`license` 设 `CC BY-SA 4.0`。

## 8. 文本转义

shields.io 静态徽章路径中：

| 字符 | 写法 |
| --- | --- |
| `-` | `--` |
| `_` | `__` |
| 空格 | `_` 或 `%20` |
| 中文 / 其他 | 脚本统一 URL 编码 |

脚本已处理，不要手写未转义文本。

## 9. 自检

- [ ] 徽章用 `<p align="center">` + 纯 HTML，渲染后居中
- [ ] 核心徽章含协议 / 平台 / 作者
- [ ] 多语言项目有语言切换徽章，三态正确、待补无链接
- [ ] 文档导航四入口齐全、顺序正确
- [ ] `python scripts/update_badges.py --check` 通过
- [ ] 未上 GitHub 时 `dynamic_badges` 为空
