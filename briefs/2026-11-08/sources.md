# EP013 来源清单 · AI 早报 2026-11-08（第 013 期）

- 检索执行窗口：2026-11-07 07:00 – 2026-11-08 07:00 CST（24 小时主窗口），重要遗漏补至 72 小时（2026-11-05 07:00 起）
- 起稿时间：2026-11-08 07:02 CST（例程 07:00 触发）
- 证据分级：官方已确认 / 多源交叉 / 单一来源 · 未核实（线索雷达）
- 说明：每条来源均为本次实际访问或经官方 API 取得的链接；未实际取到原文的条目不标注「官方已确认」。

## 1. Claude Code「Don't Ask Again」凭据暴露（多源交叉 · 二级源原文已读 + 官方 issue 已取）

- https://thehackernews.com/2026/11/claude-codes-dont-ask-again-file.html — The Hacker News 原文已读（Swati Khandelwal，2026-11-07）：104,185 份 `.claude/settings.local.json` 副本、约 1.1%（1,122 份）含至少一个密钥、合计 1,379 个密钥、539/1,105 仓库由 Claude 作为共同作者提交改动、379 个数据库口令 / 43 个 SSH 登录 / 42 个 GitHub·GitLab·npm 令牌 / 23 个 AWS 密钥、63 家组织、历史版本另 734 个密钥分布在 509 个仓库、211 个 fork、含共享 `settings.json` 与 agent 日志共 2,539 个密钥 / 1,994 个仓库、16 个编码 agent 对比、Opus 5.5 与 Fable 5.1 复现、gitleaks 命中 564 / TruffleHog 命中 643 / 两者均漏 215、先轮换后清理、git 历史与 fork 无法靠删文件消除。
- https://apiiro.com/blog/coding-agents-leaking-secrets-github-dont-ask-again — 研究方 Apiiro 原始研究页（前端渲染，本次仅取到导航结构，标注需人工打开）。
- https://github.com/anthropics/claude-code/issues/5544 — Anthropic 官方仓库 issue 正文已取：「[BUG] approved bash commands containing credentials are stored as is with plain text credentials in settings.local.json」，创建于 2025-08-11T14:25:35Z，状态 closed，末次更新 2026-01-10T14:09:40Z；正文含 `permissions.allow` 数组明文凭据复现步骤。
- https://code.claude.com/docs/en/settings 与 https://code.claude.com/docs/en/permissions — Anthropic 官方文档（本次由报道引用，未逐页取正文）。

## 2. llama.cpp b12182 – b12192（官方已确认 · GitHub Releases API 与 release 正文已取）

- https://github.com/ggml-org/llama.cpp/releases — Releases 列表已取：b12192（2026-11-07T21:28:25Z）、b12191（21:11:11Z）、b12189（12:15:59Z）、b12188（11:58:44Z）、b12187（11:42:33Z）、b12186（11:11:18Z）、b12185（10:52:05Z）、b12184（09:47:07Z）、b12183（09:17:47Z）、b12182（03:30:52Z）。
- https://github.com/ggml-org/llama.cpp/releases/tag/b12185 — release 正文已取：CUDA lightning indexer 共享内存 bank conflict 修复（#31803）。
- https://github.com/ggml-org/llama.cpp/releases/tag/b12191 — release 正文已取：llama_moe_cache 未命中专家在 CPU 执行、`--moe-cache-cpu-share F`、调优脚本（#30966）。
- https://github.com/ggml-org/llama.cpp/releases/tag/b12192 — release 正文已取：mtmd 支持 MageVL-Cowork 模型（#31819）。

## 3. LiteLLM v1.108.3 (LTS)（官方已确认 · GitHub Releases API 与 release 正文已取）

- https://github.com/BerriAI/litellm/releases/tag/v1.108.3 — release 正文已取：11 个 PR、3 项修复、官方称无需升级操作；Bedrock `api_base: ""` 全量 500/400（#50449）、MCP 工具结果 >1 MiB 报 `SSE stream ended without a response` 且自 v1.103.0 起存在（#47034）、模型级 `post_call` 护栏重复检查并重复调用审核服务（#50463）。
- 发布时间：2026-11-07T22:29:58Z（GitHub Releases API 已取）。
- https://github.com/BerriAI/litellm/compare/v1.108.2...v1.108.3 — release 正文所引版本对比链接。

## 4. MCP C# SDK v2.4.0（官方已确认 · GitHub Releases API 与 release 正文已取）

- https://github.com/modelcontextprotocol/csharp-sdk/releases/tag/v2.4.0 — release 正文已取：实验性 MCP Skills 扩展包 `ModelContextProtocol.Extensions.Skills`（#1856、#1993）、遗留 OAuth 元数据回退需显式选择加入（#1952）、刷新无替换值时保留刷新令牌（#1968）、保留规范化 OAuth 资源标识符（#1967）、取消被误报为缺少 OAuth 元数据（#1891）、传输停止时取消订阅与监听（#1933）、修复取消时通知丢失（#1917）、探测不提交已协商协议版本（#1956）、AutoDetect 收到 405 回退 SSE、MCP Apps 属性名大小写敏感。
- 发布时间：2026-11-07T04:18:06Z（GitHub Releases API 已取）。

## 5. Microsoft Agent Framework python-1.25.0（官方已确认 · GitHub Releases API 与 release 正文已取）

- https://github.com/microsoft/agent-framework/releases/tag/python-1.25.0 — release 正文已取：agent-framework-core 与 agent-framework-foundry-hosting 支持 callable MCP discovery approval policies，遵循 Foundry Toolbox 审批元数据（工具名过滤、只读过滤）、调用方显式覆盖、保留工具的策略刷新（#10136）。
- 发布时间：2026-11-07T15:52:42Z（GitHub Releases API 已取）。

## 6. OpenAI 与指数时间假设（多源交叉 · 媒体转述，官方公告直链未取得）

- https://www.nytimes.com/2026/11/06/science/ai-exponential-time-hypothesis.html — 纽约时报原文页（需 JavaScript，本次仅取到拦截页，标注需人工打开）：标题与作者 Cade Metz 经 Techmeme 汇总页确认。
- https://www.techmeme.com/261107/p12 — Techmeme 汇总条目已读：Russell Impagliazzo（ETH 共同提出者）称 OpenAI 的反驳为 "shocking news"；可能影响芯片设计与加密；并列 WSJ 报道《How A.I. Just Blew Up a Key Tenet of Computer Science》与《Quantum Computers Are Poised to Crack Encryption. AI Could Beat Them to It.》；该条聚合时间为 2026-11-08 02:01 CST。
- 未解决：本期未定位到可访问的 OpenAI 官方公告页面；报道所称结果的技术细节与同行评审状态未确认，正文按媒体转述口径表述。

## 7. Ocient 1 亿美元 C 轮（多源交叉 · 官方新闻稿已取 + 二级源已读）

- https://ocient.com/newsroom/press-releases/ocient-raises-100m-in-series-c-funding/ — Ocient 官方新闻稿已取：标题「Ocient Announces $100M Series C」；OcientAIQ 统一数据平台定位（AI 直连 PB 级企业数据、数据不跨碎片化系统迁移）、数据摄取与治理化接入、PB 级查询优化、非结构化数据处理、面向广告科技/消费者服务/金融/国家安全的行业方案。
- https://siliconangle.com/2026/11/05/ocient-raises-100-million-as-agentic-ai-drives-growth-in-large-scale-analytics/ — SiliconANGLE 报道（Paul Gillin）：1 亿美元 C 轮、Boka Capital 与 OCA Ventures 领投、用于 agentic AI 分析业务扩张。
- https://www.techmeme.com/261107/p10 — Techmeme 汇总条目已读，聚合时间 2026-11-07 23:30 CST。

## 8. 美国中期选举与 AI 资本开支（多源交叉 · 媒体观察，无官方公告）

- https://www.techmeme.com/261107/p11 — Techmeme 汇总条目已读（Bloomberg，Cecile Daurat）：民主党胜选可能放缓 AI 投资并以「按时间摊开」缓冲下行；德意志银行观察到 "shaky" 项目被砍掉；聚合时间 2026-11-08 00:35 CST。
- https://techcrunch.com/2026/11/07/after-the-midterms-things-are-looking-rocky-for-elon-musk-and-data-centers/ — TechCrunch 报道（标题与摘要已取）：选举后数据中心相关企业处境更艰难。

## 已核实但未立条的条目（按价值门槛排除，保留可追溯性）

- https://github.com/openai/codex/releases/tag/rust-v0.169.0-alpha.3 — 2026-11-07T19:31:41Z 发布，release 正文仅含「Release 0.169.0-alpha.3」，无变更清单，未达收录门槛。
- https://github.com/BerriAI/litellm/releases/tag/v1.108.2 — EP012 已收录（2026-11-06T22:07:59Z）。
- https://github.com/crewAIInc/crewAI/releases — 最新 1.15.37（2026-11-07）EP012 已收录。
- https://huggingface.co/blog/feed.xml — 本期最新条目为 2026-11-06 22:00 的 ToyBlocks，EP012 已收录。
- https://status.openai.com/api/v2/summary.json — 最新事件仍为 2026-11-06T18:38:43Z「Elevated error rates with some U.S. business Mastercards」，EP012 已收录；本期无新增事件。
- https://api.github.com/advisories?per_page=100 — 最新 advisory 为 2026-11-06T19:51:26Z（GHSA-47w9-6r3f-938g），本窗口无新增。
- https://docs.x.ai/developers/release-notes — 最新条目为 11 月 2 日（grok-imagine-image-quality 退役），本窗口无新增。
- https://cloud.google.com/blog/products/ai-machine-learning/gemini-4-argon-available-on-google-cloud — 原文标注 2026-10-13，非当期事件，已排除。
- https://www.anthropic.com/sitemap.xml — 2026-11-06 之后的最近更新为 11-06 的研究页；Anthropic 在 11-07 / 11-08 无新公告页。
- https://openai.com/news/rss.xml — 该 RSS 含大量旧文重发且日期失真（如《Spinning Up in Deep RL》被标为 11-08），按打开原始页面核对后判定非当期事件。

## 采集与工具说明

- 线索发现：NotebookLM research fast 模式三轮，共 30 条来源（`notebooklm-research-start` / `notebooklm-research-status`）。
- 一级源直采：41 个订阅源（RSS 与 GitHub Releases API），原始文件留存于工作区 `ep013/raw/`。
- 逐条核实：对入选条目逐条打开原始页面或调用官方 API 取 release 正文；未取到原文的一律不标注「官方已确认」。
