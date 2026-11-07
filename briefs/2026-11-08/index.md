# AI 早报 2026-11-08

> 检索时间窗：2026-11-07 07:00 ~ 2026-11-08 07:00（Asia/Shanghai，24 小时），重要遗漏补至 72 小时（2026-11-05 07:00 起）。
> 目标读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者。

## 今日概览

**要闻**

1. Claude Code 的「Don't Ask Again」把明文密钥写进项目设置文件，研究者在 GitHub 公开仓库中找到 1,122 份含密钥的副本

**开发生态**

2. llama.cpp 一晚连发 11 个构建：修复 lightning indexer 共享内存冲突，MoE 缓存未命中可由 CPU 分担，新增 MageVL-Cowork 支持
3. LiteLLM v1.108.3 (LTS)：修复 Bedrock 部署全量失败、MCP 工具结果超 1 MiB 断流、护栏重复调用
4. MCP C# SDK v2.4.0：实验性 MCP Skills 支持，OAuth 刷新令牌保留，传输层取消与订阅清理修复
5. Microsoft Agent Framework python-1.25.0：可调用 MCP 发现审批策略与 Foundry Toolbox 审批元数据

**技术与洞察**

6. 据纽约时报与华尔街日报报道，OpenAI 的结果被指数时间假设共同提出者称为「震惊消息」

**行业动态**

7. Ocient 宣布完成 1 亿美元 C 轮融资，用于扩张 agentic AI 分析业务
8. 美国中期选举结果成为 AI 资本开支的新变量，数据中心审批与项目节奏放缓

## 要闻

### 1. Claude Code 的「Don't Ask Again」把明文密钥写进项目设置文件，研究者在 GitHub 公开仓库中找到 1,122 份含密钥的副本

**导语**

安全公司 Apiiro 的研究显示，GitHub 上共有 104,185 份 `.claude/settings.local.json` 副本，其中约 1.1%（1,122 份）至少含一个明文密钥，合计 1,379 个不同密钥。The Hacker News 于 2026-11-07 报道该研究；Anthropic 官方 issue 追踪器中同类报告已被自动关闭。

**详细内容**

Claude Code 默认在执行大多数 shell 命令前询问权限。当用户选择「Yes, and don't ask again」，它会把被批准的命令逐字写入项目内 `.claude/settings.local.json` 的 allow 规则。若批准的是一条完整命令，命令里的密码或令牌会一并以明文保存。研究者用最新的 Opus 5.5 与 Fable 5.1 复现了该行为。

泄露面大于单个文件。Apiiro 追踪的 1,105 个仓库中，有 539 个存在由 Claude 作为共同作者提交、对该文件的改动。Claude Code 只把文件写进用户全局 git excludes，不会写进项目自身的 `.gitignore`，因此该保护不随仓库流转，对已被提交的文件无效。密钥类型包括 379 个数据库口令、43 个公开服务器 SSH 登录、42 个 GitHub / GitLab / npm 令牌与 23 个 AWS 密钥，涉及 63 家组织；含历史版本、共享 `.claude/settings.json` 与 agent 日志在内，总计 2,539 个密钥分布在 1,994 个仓库。研究者比较的 16 个编码 agent 中，只有 Claude Code 被确认默认在项目文件里保存完整批准命令。

处置顺序上，研究者建议先轮换全部历史凭据再清理文件：从项目移除文件并不能消除泄露，旧版本仍留在 git 历史与 fork 中。常规扫描器覆盖不足——对 1,122 个含密钥文件，gitleaks 命中 564 个、TruffleHog 命中 643 个，两者都漏掉 215 个，多数漏报是命令中的普通口令。

**相关链接**

- Apiiro 研究原文：https://apiiro.com/blog/coding-agents-leaking-secrets-github-dont-ask-again （前端渲染，需人工打开）
- The Hacker News 报道：https://thehackernews.com/2026/11/claude-codes-dont-ask-again-file.html
- Anthropic 官方 issue（2025-08-11 提交，2026-01-10 以 not planned 关闭）：https://github.com/anthropics/claude-code/issues/5544
- Anthropic 官方文档：https://code.claude.com/docs/en/settings ；https://code.claude.com/docs/en/permissions

## 开发生态

### 2. llama.cpp 一晚连发 11 个构建：修复 lightning indexer 共享内存冲突，MoE 缓存未命中可由 CPU 分担，新增 MageVL-Cowork 支持

**导语**

2026-11-07 11:30 至 2026-11-08 05:28（CST），llama.cpp 依次发布 b12182 至 b12192 共 11 个构建。其中 b12185 修复了 CUDA 后端 lightning indexer 的共享内存 bank conflict，b12191 新增把 MoE 缓存未命中专家放到 CPU 执行的调优开关。

**详细内容**

b12185 修复 CUDA lightning indexer 的共享内存 bank conflict（#31803），直指上一期报道的 Kimi-K3.1-Pro 所用结构。b12191 让 llama_moe_cache 可在 CPU 上运行未命中专家，并附带调优脚本，可用 `--moe-cache-cpu-share F` 指定由 CPU 分担的比例（#30966）。b12192 为 mtmd 增加 MageVL-Cowork 模型支持（#31819）。

其余构建覆盖后端与调度：b12189 修复 Metal 后端 GROUP_NORM 忽略批次维度（ne03>1）与非连续输入的问题（#31852）；b12187 为 WebGPU 实现 group norm kernel（#31490）；b12188 调整 server 槽位调度，父槽先于等待中的子槽被访问（#30779）；b12186 为 Vulkan 的 decodeBuf 声明增加 readonly（#31833）；b12183 为 OpenCL 增加 arange 算子（#31829）；b12184 补上 pthread 链接（#31785）；b12182 提高少张量缓冲区的 compute view 上限（#31447）。

**相关链接**

- llama.cpp Releases：https://github.com/ggml-org/llama.cpp/releases
- b12185（CUDA lightning indexer 修复）：https://github.com/ggml-org/llama.cpp/releases/tag/b12185
- b12191（MoE 缓存 CPU 分担）：https://github.com/ggml-org/llama.cpp/releases/tag/b12191
- b12192（MageVL-Cowork 支持）：https://github.com/ggml-org/llama.cpp/releases/tag/b12192

### 3. LiteLLM v1.108.3 (LTS)：修复 Bedrock 部署全量失败、MCP 工具结果超 1 MiB 断流、护栏重复调用

**导语**

LiteLLM 于 2026-11-08 06:29（CST）发布 v1.108.3 LTS。官方说明该版本含 11 个 PR、3 项修复，并称无需升级操作。三项修复分别指向线上可用性问题、网关协议限制与审核调用成本。

**详细内容**

第一项修复 AWS Bedrock：当部署配置 `api_base` 为空字符串时，所有请求返回 500 或 400（#50449）。第二项修复 MCP：自 v1.103.0 起，工具结果超过 1 MiB 时报 `SSE stream ended without a response`（#47034），该问题影响以 LiteLLM 承载 MCP 工具的大结果场景。第三项修复 Guardrails：模型级 `post_call` 护栏会对同一响应检查两次，并重复调用审核服务（#50463）。

**相关链接**

- LiteLLM v1.108.3 (LTS) 发布说明：https://github.com/BerriAI/litellm/releases/tag/v1.108.3
- 版本对比：https://github.com/BerriAI/litellm/compare/v1.108.2...v1.108.3

### 4. MCP C# SDK v2.4.0：实验性 MCP Skills 支持，OAuth 刷新令牌保留，传输层取消与订阅清理修复

**导语**

modelcontextprotocol/csharp-sdk 于 2026-11-07 12:18（CST）发布 v2.4.0。官方说明该版本新增实验性的 MCP Skills 扩展包，并集中加固 OAuth 与传输可靠性：刷新响应未返回新令牌时保留旧刷新令牌，传输停止时取消已打开的订阅。

**详细内容**

新增能力方面，v2.4.0 引入实验性 MCP Skills 支持，通过新包 `ModelContextProtocol.Extensions.Skills` 提供，并把 Skills 与服务端原语及类型化请求处理器对齐（#1856、#1993）。

OAuth 加固包括：遗留 OAuth 元数据回退改为需显式选择加入（#1952）；刷新响应未返回替换值时保留原刷新令牌（#1968）；刷新过程保留规范化的 OAuth 资源标识符（#1967）；取消请求被误报为缺少 OAuth 元数据（#1891）。传输与发现方面：传输停止投递消息时取消已打开的订阅与监听请求（#1933）；修复请求取消时的通知丢失与取消处理（#1917）；避免 server/discover 探测提交已协商的协议版本（#1956）；AutoDetect 收到 405 时回退到 SSE。官方同时说明 MCP Apps 的属性名改为大小写敏感匹配。

**相关链接**

- csharp-sdk v2.4.0 发布说明：https://github.com/modelcontextprotocol/csharp-sdk/releases/tag/v2.4.0
- Skills 扩展包：https://nuget.org/packages/ModelContextProtocol.Extensions.Skills

### 5. Microsoft Agent Framework python-1.25.0：可调用 MCP 发现审批策略与 Foundry Toolbox 审批元数据

**导语**

microsoft/agent-framework 于 2026-11-07 23:52（CST）发布 python-1.25.0。官方发布说明中，agent-framework-core 与 agent-framework-foundry-hosting 新增对可调用 MCP 发现审批策略的支持，并遵循 Foundry Toolbox 的审批元数据。

**详细内容**

按官方说明，本次变更为 agent-framework-core 与 agent-framework-foundry-hosting 增加对 callable MCP discovery approval policies 的支持，并在处理 Foundry Toolbox 审批元数据时遵循其中的工具名过滤与只读过滤（tool-name and read-only filters），同时支持调用方显式覆盖（explicit caller overrides），以及为保留的工具执行策略刷新（policy refresh for retained tools），对应 PR #10136。

**相关链接**

- agent-framework python-1.25.0 发布说明：https://github.com/microsoft/agent-framework/releases/tag/python-1.25.0
- 对应 PR #10136：https://github.com/microsoft/agent-framework/pull/10136

## 技术与洞察

### 6. 据纽约时报与华尔街日报报道，OpenAI 的结果被指数时间假设共同提出者称为「震惊消息」

**导语**

据纽约时报 2026-11-06 报道与华尔街日报相关报道，OpenAI 公布的一项结果被指数时间假设（Exponential Time Hypothesis）共同提出者 Russell Impagliazzo 称为「shocking news」。Techmeme 于 2026-11-08 02:01（CST）聚合该条报道。

**详细内容**

指数时间假设是复杂度理论中的猜想，认为某些问题对计算机而言将始终难以快速求解。纽约时报的报道将其放在算力与密码学的交叉点上：该结果若被确认成立，长期来看可能影响芯片设计速度，也可能动摇密码学假设；华尔街日报另有以「How A.I. Just Blew Up a Key Tenet of Computer Science」为题的报道，另有报道讨论量子计算机与 AI 在破解加密上的时间表变化。

需要说明的采集限制：本期未定位到可访问的 OpenAI 官方公告页面，因此本条按媒体转述口径表述，不展开技术细节，也不写入原文未支持的性能或影响判断；相关报道页需 JavaScript 才能打开，链接标注「需人工打开」。

**相关链接**

- 纽约时报（2026-11-06，需人工打开）：https://www.nytimes.com/2026/11/06/science/ai-exponential-time-hypothesis.html
- Techmeme 聚合页：https://www.techmeme.com/261107/p12

## 行业动态

### 7. Ocient 宣布完成 1 亿美元 C 轮融资，用于扩张 agentic AI 分析业务

**导语**

数据分析公司 Ocient 于 2026-11-07（CST）宣布完成 1 亿美元 C 轮融资，由 Boka Capital 与 OCA Ventures 领投。官方新闻标题为「Ocient Announces $100M Series C」，公司将资金用途指向 agentic AI 分析业务的扩张。

**详细内容**

Ocient 的产品为 OcientAIQ 统一数据平台，官方定位是把 AI 直接接入 PB 级企业数据，让 agent、分析师与应用在数据不跨碎片化系统迁移的前提下得到可信答案。按官方页面描述，平台覆盖数据持续摄取与治理化企业数据接入、PB 级数据的查询优化与非结构化数据处理，并提供面向广告科技、消费者服务、金融服务与国家安全等行业的解决方案版本。

该轮融资由 Boka Capital 与 OCA Ventures 领投，SiliconANGLE 等媒体跟进报道。发行规模、估值与资金用途以公司官方新闻稿口径为准，本期未获取独立第三方核实。

**相关链接**

- Ocient 官方新闻稿：https://ocient.com/newsroom/press-releases/ocient-raises-100m-in-series-c-funding/
- SiliconANGLE 报道：https://siliconangle.com/2026/11/05/ocient-raises-100-million-as-agentic-ai-drives-growth-in-large-scale-analytics/
- Techmeme 聚合页：https://www.techmeme.com/261107/p10

### 8. 美国中期选举结果成为 AI 资本开支的新变量，数据中心审批与项目节奏放缓

**导语**

据彭博社 2026-11-07/11-08 报道，美国中期选举结果正改变 AI 基础设施的资本节奏：民主党胜选州的数据中心扩建面临更多约束，德意志银行观察到「不稳固」的项目被取消。TechCrunch 同日以开发者媒体视角跟进。

**详细内容**

彭博社报道的核心是双向影响：一方面，民主党胜选带来的数据中心扩建护栏会拖慢 AI 投资；另一方面，这种约束也可能把投资摊到更长时间，从而在经济下行中形成缓冲。德意志银行在相关观察中提到部分项目因「shaky」而被砍掉。TechCrunch 的报道则把同一变化落到具体企业身上，指出选举之后数据中心相关企业的处境变得更为艰难。

本条属市场与政策预期，不含官方公告；涉及的具体州别政策、审批清单与企业动作本期未逐条核实，读者应视作媒体观察而非既成政策结论。

**相关链接**

- Techmeme 聚合页（彭博社报道）：https://www.techmeme.com/261107/p11
- TechCrunch 报道：https://techcrunch.com/2026/11/07/after-the-midterms-things-are-looking-rocky-for-elon-musk-and-data-centers/

## 后续追踪

- **Kimi-K3.1-Pro 在 llama.cpp 的落地**：此前已确认 b12180 加入 Kimi-K3.1-Pro 文本模型支持（93 层中 24 层携带 lightning indexer）→ 本期 b12185 修复 CUDA lightning indexer 共享内存 bank conflict、b12191 支持把 MoE 缓存未命中分给 CPU → 下一步关注该模型的实际吞吐、显存占用与是否有其他后端跟进支持。
- **LiteLLM LTS 修复节奏**：此前已确认 v1.108.2（12 个 PR、11 项修复、1 项变更）→ 本期 v1.108.3（11 个 PR、3 项修复），修复 Bedrock `api_base` 空值导致全量失败、MCP 工具结果超 1 MiB 断流、post_call 护栏重复调用 → 下一步关注 MCP 工具结果 1 MiB 上限在其他网关实现中是否同样存在。
- **Claude Code 凭据暴露**：此前已确认官方 issue #5544（2025-08-11 提交、2026-01-10 以 not planned 关闭）→ 本期 Apiiro 给出全量统计与处置建议，含先轮换后清理、命令中改用变量引用、批准模式而非单条命令 → 下一步关注 Anthropic 是否给出官方修复或文档说明，以及 `.claude/` 目录是否进入默认忽略模板。

## 编辑备注

- **本期真实检索时间窗**：2026-11-07 07:00 ~ 2026-11-08 07:00 CST（24 小时）。因窗口内官方博客更新稀少，重要遗漏补检至 72 小时（2026-11-05 07:00 起），补检项在条目中标注原始日期。
- **采集方式**：NotebookLM research 三轮检索（fast 模式，共 30 条来源）用于线索发现；一期源直采覆盖 41 个 RSS 与 GitHub Release API 订阅源；入选条目均逐条打开原始页面核实。
- **链接可用性**：纽约时报 ETH 报道页与 Apiiro 研究原文为前端渲染，需人工打开；两个链接均已保留，未做替换猜测。
- **来源缺口**：本期未定位到可访问的 OpenAI 官方公告页面以支撑第 6 条，故该条按媒体转述口径表述，并标注未核实部分。
- **已排除**：EP012（2026-11-07 期）已收录的 18 条不重复报道；GitHub Advisory 本窗口内无新增（最新为 2026-11-06 19:51 UTC）；OpenAI 状态页无新增事件（最新仍为 2026-11-06 18:38 UTC 的美国商务 Mastercard 支付事件，已在 EP012 收录）；xAI 官方 release notes 最新条目为 11 月 2 日，无当期更新；Hugging Face 博客与 OpenAI RSS 的若干条目日期失真（旧文重发），核实后判定非当期事件；OpenAI Codex CLI 的 rust-v0.169.0-alpha.3（2026-11-08 03:31 CST）已核实，但发布说明仅含版本号、无变更清单，按价值门槛未单独立条。
- **数量说明**：本窗口为周末，官方发布稀少，本期条目数量少于日常水平，未为凑数收录低价值内容。
