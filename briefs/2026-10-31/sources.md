# AI 早报 2026-10-31 · 来源清单（第 005 期）

> 检索窗口：2026-10-30 07:00 – 2026-10-31 07:00（Asia/Shanghai）｜72 小时补收见第 7 条
> 分级说明：**官方已确认** = 一级源原文已取到；**多源交叉** = 两个及以上独立来源一致；**单一来源** = 只见于一个来源，正文已标明

| # | 条目 | 来源链接 | 分级 | 抓取状态 |
|---|---|---|---|---|
| 1 | robots.txt AI 训练偏好标准 | https://openai.com/index/helping-websites-express-ai-training-preferences | 官方已确认（标题+摘要） | 正文 403，标记需人工打开 |
| 1 | robots.txt 标准（The Verge 聚合） | https://www.techmeme.com/261030/p26 | 多源交叉 | 200，标题+摘要已取 |
| 2 | Project Suncatcher 官方博客 | https://blog.google/innovation-and-ai/models-and-research/google-research/project-suncatcher-satellite-response/ | 官方已确认 | 200，正文全文已取 |
| 2 | Suncatcher 工程细节（TechCrunch） | https://techcrunch.com/2026/10/30/googles-first-data-center-satellite-is-online-and-writing-poetry/ | 多源交叉 | 200，正文已取 |
| 3 | Anthropic 套餐与额度 | https://www.anthropic.com/pricing | 官方已确认 | 200，正文已取 |
| 3 | Max 套餐说明（帮助中心） | https://support.anthropic.com/en/articles/11049741-what-is-the-max-plan | 官方已确认 | 200，正文已取 |
| 4 | OpenAI 社区安全报告与青少年保护 | https://openai.com/index/community-safety-report-and-new-protections-for-teens | 官方已确认（标题+摘要） | 正文 403，标记需人工打开 |
| 4 | OpenAI 官方 RSS（条目确认） | https://openai.com/news/rss.xml | 官方已确认 | 200，条目与摘要已取 |
| 5 | llama.cpp Releases | https://github.com/ggml-org/llama.cpp/releases | 官方已确认 | 200，b12007–b12017 条目已取 |
| 6 | transformers Releases | https://github.com/huggingface/transformers/releases | 官方已确认 | 200，v5.22.0 / v5.22.1 条目已取 |
| 6 | v5.22.1 移除 WIP 文档 PR | https://github.com/huggingface/transformers/pull/50124 | 官方已确认 | 200 |
| 7 | Gemini 4 Carbon 官方发布文（72h 补收） | https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-carbon/ | 官方已确认 | 200，正文全文已取 |
| 7 | Artificial Analysis 榜单 | https://artificialanalysis.ai/ | 官方提供方 | 未逐页抓取（正文引官方数字） |
| 8 | DoorDash 代理订单数 | https://techcrunch.com/2026/10/30/doordash-said-its-only-received-several-hundred-orders-from-ai-agents/ | 多源交叉（Q3 电话会） | 200，正文已取 |
| 9 | Ollie 关停 | https://techcrunch.com/2026/10/30/ollie-a-privacy-focused-ai-assistant-is-shutting-down/ | 多源交叉 | 200，正文已取 |
| 10 | AI 资本开支与市场反应 | https://techcrunch.com/2026/10/30/cracks-are-emerging-in-the-ai-spending-boom/ | 多源交叉 | 200，正文已取 |
| 10 | Bloomberg 3 万亿支出汇总 | https://www.techmeme.com/261030/p22 | 单一来源（线索雷达） | 200，摘要已取 |
| 11 | Salesforce 收购 Rune（Axios + Resilience） | https://www.techmeme.com/261030/p17 | 多源交叉 | 200，标题+摘要已取 |
| 12 | Anthropic 垃圾债评级预期（FT 转述） | https://techcrunch.com/2026/10/30/anthropic-expected-to-receive-high-junk-rating-from-credit-agencies-following-ipo-report-says/ | 单一来源 | 200，正文已取 |
| 12 | Anthropic S-1 官方公告 | https://www.anthropic.com/news/s1-sec | 官方已确认 | 链接见 Anthropic 官网新闻列表；正文未逐字取 |
| 雷达 | Google 与美国防务部磋商 | https://www.techmeme.com/261030/p28 | 单一来源 | 200，摘要已取 |
| 雷达 | Powerlattice 8600 万美元融资 | https://www.techmeme.com/261030/p27 | 单一来源 | 200，摘要已取；SEC 原文 403 |
| 雷达 | 伦敦高院驳回 Meta/TikTok/X 挑战 | https://www.techmeme.com/261030/p15 | 单一来源 | 200，摘要已取 |

## 待人工打开（发布前需逐条访问）

- https://openai.com/index/helping-websites-express-ai-training-preferences （本次环境 403）
- https://openai.com/index/community-safety-report-and-new-protections-for-teens （本次环境 403）

## 采集限制说明

- `openai.com/index/*` 正文 HTTP 403（直连与 firecrawl 双路径均失败；firecrawl 返回 `status=replayed`、`result=null`）。
- `sec.gov` EDGAR、`investor.redditinc.com`、`investor.doordash.com` 返回 403 / 404 / 空响应。
- Techmeme 单篇页正文由 JS 渲染，仅取到标题与摘要行。
- 第 10、12 条的财务数字为媒体转述口径，未取到各公司一手财报或评级机构原文。
