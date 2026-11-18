# AI 早报 2026-11-18

- **期号**：EP023
- **目标受众**：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者
- **检索时间窗**：2026-11-17 07:00 — 2026-11-18 22:00（Asia/Shanghai）为本次实际扫描窗口；因本次运行为补跑触发，检索按 72 小时范围扫描（2026-11-15 21:00 起），再按「事件首次公开时间」与 EP022 已覆盖范围去重，条目以 11-17 07:00 之后首次公开者为主
- **本期交付物**：Markdown 正文母版（本文件）+ HTML 专业报告 + 来源清单 + 发布建议与待确认项
- **本期无视频**（依据 CMP-472，自 2026-11-11 / EP016 起停用 NotebookLM 视频与音频）

## 今日概览

**要闻**

1. NVIDIA 发布 FY2027 第三财季财报：营收 1158 亿美元、同比增 103%，Q4 指引 1300 亿美元且未计入中国数据中心计算收入
2. NVIDIA 确认结束对华 H200 出口通道参与，同日董事会新设国家安全与出口管制监督委员会
3. NVIDIA 董事会表态不打算让黄仁勋回归 CEO，SEC 对公司的调查同步曝光
4. Anthropic IPO 文件披露：Amazon 持股约 14.7%、Google 13.7%，AMD 等七方合计认购 260 亿美元非投票股
5. NVIDIA 确认 129 亿美元收购 Hugging Face 的计划不变，官方称 Nemotron 已是 OpenRouter 上使用最广的美国开源模型

**开发生态**

6. GitHub Copilot app 支持 Azure DevOps 仓库与 GHES 实例，Microsoft Ignite 一批发布同时上线
7. Copilot code review 新增 Adaptive 审查深度、跨仓库上下文与密钥泄露检测，公开预览
8. Copilot Fusion 登上 Terminal-Bench 4.1 公开榜单，官方称解决率 71.2%、成本低于 Opus 5.5 与 Fable 5.2
9. 微软 MAI Code 2 与 MAI Code 2 Flash 进入 GitHub Copilot
10. GitHub 同日上线 Copilot CLI 的 Microsoft Entra 登录预览与 Copilot Evals 公开预览
11. Amazon SageMaker AI 实时端点新增 KV cache aware routing，按缓存命中情况分流请求
12. Vercel 新建 Pro 与 Enterprise 团队不再包含 Standard build 额度，Standard 构建改按量计费

**模型发布**

13. OpenAI 发布 GPT-6.2 Astra 与 GPT-6.2 Sol，同日在 GitHub Copilot 上线
14. Vercel AI Gateway 上架 GPT-6.2 Astra/Sol、Decision-1.1 与 MAI-Image-2.7 系列

**产品应用**

15. Google 开放 Gemini 的 Tasks 任务模式，美国用户可用邮件或短信派单
16. Google 将 Gemini 对话保留期从 72 小时延长到 2 个月
17. OpenAI 推出 ChatGPT for Sales 插件与 30 余个合作伙伴插件

**技术与洞察**

18. 研究：模型被告知「这是游戏」后，可能把平民识别为军事打击目标
19. AWS 一批 SageMaker 与 AgentCore 更新：数据准备、JSON 工作负载降本、WhatsApp agent

**行业动态**

20. Model ML 完成 2.5 亿美元 B 轮融资，估值 15 亿美元
21. 融资速览：Unsiloed AI 750 万美元、Humyn Labs 4700 万美元、Pedestal AI 470 万美元
22. NVIDIA 披露对私营公司股权投资价值 655 亿美元，并扩大与六家制造与封装伙伴的产能承诺
23. NVIDIA 澄清 neocloud 贷款担保口径：提供担保不等于自己出钱

**前瞻与传闻**

24. DeepSeek 收紧免费对话额度（单一来源 · 未核实）
25. Qwen4-Max 据称脱离预览、参数 2.4T 且仍未放出权重（单一来源 · 未核实）
26. Kimi K3.1 Pro 定价与套餐调整（单一来源 · 未核实）

## 要闻

### 1. NVIDIA 发布 FY2027 第三财季财报：营收 1158 亿美元、同比增 103%，Q4 指引 1300 亿美元且未计入中国数据中心计算收入

**导语**

NVIDIA 公布截至 2026 年 10 月 25 日的第三财季业绩：营收 1158 亿美元，环比增 20%、同比增 103%；数据中心营收 1076 亿美元，同比增 110%。下一季指引为 1300 亿美元（±3%），且官方明确未假设任何来自中国的数据中心计算收入。

**详细内容**

财报口径：GAAP 与非 GAAP 毛利率分别为 74.8% 与 74.9%；GAAP 营业利润 775 亿美元、净利润 653 亿美元，每股摊薄收益 GAAP 2.70 美元、非 GAAP 2.68 美元。同期回购加派息返还股东 281 亿美元，回购授权余额约 2273 亿美元；下一期现金股息为每股 0.25 美元，12 月 23 日派发、12 月 2 日登记。

公司称 Vera Rubin NVL72 已开始出货，「这是公司历史上最快的一次产品爬坡」，机架已在 CoreWeave、Google Cloud、Microsoft Azure、Oracle Cloud Infrastructure、Nebius 运行，并即将在 SpaceXSI 上线。公告同时确认 Oracle Cloud 的 Vera Rubin NVL72 系统与 Vera CPU 正式可用、Google Cloud 的 Vera Rubin A5X 实例正式可用。官方对全财年税率为 16%—18%。

**相关链接**

- https://nvidianews.nvidia.com/news/nvidia-announces-financial-results-for-third-quarter-fiscal-2027

### 2. NVIDIA 确认结束对华 H200 出口通道参与，同日董事会新设国家安全与出口管制监督委员会

**导语**

据媒体报道，NVIDIA 代理 CEO Colette Kress 在财报电话会上确认，公司不再参与此前允许 H200 芯片经美国转运、缴 25% 关税后售予中国的出口通道。同日 NVIDIA 宣布董事会新设「国家安全与出口管制监督委员会」，负责出口管制合规与全球贸易风险管理。

**详细内容**

该出口安排由黄仁勋与美国总统特朗普促成，芯片须经美国发货以收取 25% 关税。此前一贯主张「在中国竞争更重要」的路线由此终止，媒体报道称这是黄仁勋离任后公司路线的实质调整。

委员会为常设机构，由董事 Suzanne Nora Johnson 任主席，成员包括 Stephen C. Neal 与 John O. Dabiri，至少每季度开会一次，包括与管理层及独立闭门会议。NVIDIA 国家安全团队与全球贸易合规团队改为直接向委员会及代理 CEO Kress 汇报日常运营。公告称委员会将保留外部独立专家，提供法律、国家安全与贸易合规方面的支持。

**相关链接**

- https://nvidianews.nvidia.com/news/nvidia-board-of-directors-establishes-national-security-and-export-control-oversight-committee
- https://techcrunch.com/2026/11/17/nvidia-is-abandoning-china-after-jensen-huangs-ouster/

### 3. NVIDIA 董事会表态不打算让黄仁勋回归 CEO，SEC 对公司的调查同步曝光

**导语**

NVIDIA 董事长 Harvey C. Jones 在财报电话会上表示，董事会一致接受黄仁勋辞去总裁、CEO 与董事职务，「无意让黄仁勋复任 CEO」，公司正同时考虑内部与外部候选人。黄仁勋随后在 X 表示若董事会认定回归符合股东利益，「我会荣幸接受」。

**详细内容**

黄仁勋于 11 月 12 日因「披露与公司行为准则、企业文化规范不一致的个人行为」主动辞职，董事会一致接受该辞呈，媒体报道其牵涉多段婚外情以及一名被指为中国情报人员的前高管。目前 NVIDIA 由 CFO 兼任的代理 CEO Colette Kress 主持，公司董事会另启动独立调查，SEC 亦在调查 NVIDIA 的披露是否误导投资者（该调查由《华尔街日报》首先报道，TechCrunch 转述）。

黄仁勋已定于感恩节前赴国会作证。相关叙事仍处于早期调查阶段，本条目只陈述已公开的辞呈、董事会表态与调查进展，不对责任认定作判断。

**相关链接**

- https://techcrunch.com/2026/11/17/nvidia-says-it-doesnt-plan-to-reappoint-jensen-huang-as-ceo/
- https://techcrunch.com/2026/11/17/sec-reportedly-investigating-nvidia-amid-huang-exit/

### 4. Anthropic IPO 文件披露：Amazon 持股约 14.7%、Google 13.7%，AMD 等七方合计认购 260 亿美元非投票股

**导语**

据媒体依据 Anthropic 上市文件披露的信息，Amazon 在 Anthropic IPO 后将持有约 14.7%（全部可转 promissory notes 转股则接近 23.8%），Google 将持约 13.7%。AMD、Broadcom、Google、Micron、Microsoft、Nvidia 与 TSMC Partners 同意认购合计 260 亿美元非投票股，其中 Google 与 Nvidia 各认购 100 亿美元。

**详细内容**

Amazon 在 2023 与 2024 年投资 Anthropic 时取得可转股票据，转股价约每股 2.09 美元或 5.05 美元（按投资年份不同）。IPO 中 Amazon 选择把其中一部分转成特殊类别无投票权股份（约 15% 持股），并保留其余票据；这些股份可分红，出售时可转为 A 类普通股。

另一项被披露的承诺是 Anthropic 未来十年将在 AWS 上消费超过 1000 亿美元的云服务。IPO 时间表、发行定价与承销安排本文未取到原始文件，数字均出自媒体报道对上市文件的转述。

**相关链接**

- https://techcrunch.com/2026/11/17/amazon-and-google-will-together-own-nearly-30-of-anthropic-after-its-ipo/

### 5. NVIDIA 确认 129 亿美元收购 Hugging Face 的计划不变，官方称 Nemotron 已是 OpenRouter 上使用最广的美国开源模型

**导语**

NVIDIA 代理 CEO Colette Kress 在财报电话会首次公开表态，称 129 亿美元收购 Hugging Face 的交易「仍在按计划推进」，并重申对开放模型生态的承诺。她称 Nemotron 已成为 OpenRouter 上使用最广的美国开放模型，并提到 OpenRouter 周 token 用量同比增 35 倍、过去三个月增 3.5 倍。

**详细内容**

Kress 的原话指向「让每个国家、公司与行业都能构建自己的智能」这一开放模型路线。黄仁勋任内曾大力推动 Nemotron 开放权重模型系列，其离任一度让外界担忧 NVIDIA 的开源路线生变；本次电话会是其离任后 Kress 首次面向分析师的公开表态，Q&A 环节未直接讨论 Hugging Face 收购细节。

公告称 Hugging Face 平台服务超过 1800 万开发者与 20 万家企业，若交易完成将是 NVIDIA 史上第二大收购。上述 35 倍、3.5 倍为官方引用的第三方平台数据，未经本次独立复核。

**相关链接**

- https://techcrunch.com/2026/11/17/nvidia-says-its-open-source-ai-strategy-remains-intact-after-jensen-huangs-exit/

## 开发生态

### 6. GitHub Copilot app 支持 Azure DevOps 仓库与 GHES 实例，Microsoft Ignite 一批发布同时上线

**导语**

GitHub 于 11 月 17 日发布 Copilot app 与 Microsoft Ignite 相关更新：Copilot app 现可操作 Azure DevOps 仓库、GitHub Enterprise Server 实例，并在用户已登录的浏览器中工作，Azure DevOps 集成为公开预览。

**详细内容**

在 Copilot app 中可克隆 Azure DevOps 仓库、让 agent 建分支、改代码并开 PR，全程不离开应用；侧边栏可跟踪状态，点击评审意见上的 Fix 让 agent 处理，开启 agent merge 后可由 agent 修复 CI 失败并在检查与策略通过后完成合并。开启方式为 Settings → Experimental → Azure DevOps integration。

同日 GitHub 还发布了 Copilot Fusion 扩展、code review 能力更新、MAI Code 2 系列模型接入等条目，另有一条 Monitor GitHub Copilot activity through Microsoft Agent 365 的变更，说明 Copilot 的使用可纳入 Microsoft Agent 365 的可观测范围。

**相关链接**

- https://github.blog/changelog/2026-11-17-github-copilot-app-microsoft-ignite-releases
- https://github.blog/changelog/2026-11-17-monitor-github-copilot-activity-through-microsoft-agent-365

### 7. Copilot code review 新增 Adaptive 审查深度、跨仓库上下文与密钥泄露检测，公开预览

**导语**

GitHub 为 Copilot code review 加入 Adaptive 能力，按每个 PR 自动匹配审查深度（从 Lite 到 Max），并可引用相关仓库上下文、在进入主分支前标记暴露的密钥，三项均为公开预览。

**详细内容**

此前审查深度需人工在设置或发起评审时逐次选择：文档改动可能只需 Lite，认证逻辑改动则需要 Max。Adaptive 免去这一步人工判断，官方描述其目标是「用更少投入更早发现更多问题」。

跨仓库上下文让评审可以参考相关仓库的信息，密钥检测则在合并前拦截疑似泄露。三项功能对 Copilot Pro、Pro+、Max、Business 与 Enterprise 计划开放，公开预览期间仍可能调整。

**相关链接**

- https://github.blog/changelog/2026-11-17-copilot-code-review-adaptive-effort-secret-detection-and-more

### 8. Copilot Fusion 登上 Terminal-Bench 4.1 公开榜单，官方称解决率 71.2%、成本低于 Opus 5.5 与 Fable 5.2

**导语**

GitHub 公布 Copilot Fusion 在 Terminal-Bench 4.1 公开榜单的成绩，官方称 Copilot Fusion Max 解决率 71.2%，领先 Opus 5.5 与 Fable 5.2 共 5.4 个百分点，同时成本比 Fable 5.2 低 88%、比 Opus 5.5 低 57%。榜单由 Stanford、Harbor 与 Laude Institute 托管。

**详细内容**

Terminal-Bench 4.1 衡量 AI agent 在终端中完成高难度真实任务的能力，官方强调独立榜单可在相同任务与相同评测规则下横向比较。同期 Fusion 扩展到更多使用面：可在最新版 github.com、Visual Studio 以及 iOS 与 Android 的 GitHub Mobile beta 应用中选择，正式版移动应用「即将」支持。

成绩与成本对比均为 GitHub 官方口径，未见第三方复现。

**相关链接**

- https://github.blog/changelog/2026-11-17-github-copilot-fusion-updates-more-availability-benchmarks-and-models

### 9. 微软 MAI Code 2 与 MAI Code 2 Flash 进入 GitHub Copilot

**导语**

GitHub 宣布微软新一代 MAI 编码模型 MAI Code 2 与 MAI Code 2 Flash 进入 Copilot：前者为通用型 agentic 编码模型，后者为轻量低成本模型，官方称该系列从轻量编码辅助扩展到复杂 agentic 软件工程。

**详细内容**

MAI Code 2 面向复杂任务，官方列举的场景包括深度调试、多文件实现、重构与仓库级推理，特点是响应聚焦、代码改动实用、减少来回沟通。MAI Code 2 Flash 面向日常开发流，包括代码解释、针对性修改、例行修复与快速迭代，定位为高性价比。

两者均面向 agentic 编码场景，与本期第 13 条的 GPT-6.2 系列同属「编码模型向 agent 化演进」的同期动作。

**相关链接**

- https://github.blog/changelog/2026-11-17-mai-code-2-and-mai-code-2-flash-in-github-copilot

### 10. GitHub 同日上线 Copilot CLI 的 Microsoft Entra 登录预览与 Copilot Evals 公开预览

**导语**

GitHub 于 11 月 17 日为 Copilot CLI 加入 Microsoft Entra 登录（预览），并把 Copilot Evals 转为公开预览；同时 Repository insights 新增跟踪 code review 结果的能力。这批更新面向企业侧的评测与身份管理诉求。

**详细内容**

Entra 登录预览让企业用户用既有 Microsoft 身份体系接入命令行编码助手，与第 6 条中 Copilot app 支持 Azure DevOps、GHES 的方向一致：把 Copilot 放进既有的企业身份与仓库治理框架。Copilot Evals 进入公开预览，意味着评测能力从内部试用走向更广可用。

三条更新的具体可用范围与限制以 GitHub changelog 原文为准，本文未逐项展开。

**相关链接**

- https://github.blog/changelog/2026-11-17-github-copilot-cli-adds-microsoft-entra-sign-in-as-a-preview
- https://github.blog/changelog/2026-11-17-github-copilot-evals-is-now-in-public-preview
- https://github.blog/changelog/2026-11-17-track-copilot-code-review-outcomes-in-repository-insights

### 11. Amazon SageMaker AI 实时端点新增 KV cache aware routing，按缓存命中情况分流请求

**导语**

Amazon 宣布为 SageMaker AI 实时端点新增 KV cache aware routing：端点会依据模型容器上报的缓存状态，把请求送到已持有长前缀缓存且不繁忙的实例，适用于多轮对话、长共享前缀提示词与高负载场景。

**详细内容**

开启需要两处改动：给模型加一个环境变量，让容器上报其缓存内容；在端点配置中把 RoutingStrategy 设为 KV_AWARE。客户端仍使用原有 API 调用，不需要改请求格式。

官方描述的问题背景是：聊天助手、RAG 与带长系统提示词的 agent 会发出大量以相同文本开头的请求，模型把前缀部分的工作缓存在 GPU 上；若请求落到没有该缓存的实例，就要重算前缀。KV-aware 路由按缓存命中情况选路以降低重复计算。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/amazon-sagemaker-ai-real-time-endpoints-now-support-kv-cache-aware-routing/

### 12. Vercel 新建 Pro 与 Enterprise 团队不再包含 Standard build 额度，Standard 构建改按量计费

**导语**

Vercel 宣布自即日起，新建 Pro 与 Enterprise 团队不再附带 Standard build 额度，Standard 构建转入按用量计费；这是 Vercel 构建计费口径的一次调整，已有团队的适用方式以官方说明为准。

**详细内容**

公告由 Mehul Kar 与 Pranav Kanchi 署名，发布于 11 月 17 日。Standard 构建对应按 CPU 时间计费的传统构建模式，与 Fluid Compute 等按量付费形态并存；本次调整把新团队统一到用量计费口径，减少套餐内固定额度的差异。

同一批 Vercel 更新还包括 Vercel Blob 支持 TTL 自动删除、preview 构建新增仅拉取请求的预设、Speed Insights 开始统计软导航等条目。

**相关链接**

- https://vercel.com/changelog/standard-build-billing-new-teams
- https://vercel.com/changelog/vercel-blob-now-supports-ttls-for-automatic-deletion

## 模型发布

### 13. OpenAI 发布 GPT-6.2 Astra 与 GPT-6.2 Sol，同日在 GitHub Copilot 上线

**导语**

OpenAI 发布 GPT-6.2 Astra 与 GPT-6.2 Sol，官方称两者在专业产出、编码、计算机操作与效率上有改进、成本更低，覆盖 ChatGPT Work、Codex 与 API；两款模型同日于 GitHub Copilot 正式可用（GA）。

**详细内容**

GitHub 官方 changelog 给出 Copilot 侧的模型说明：两款模型面向 agentic coding 与代码审查，判断力强于更早的 GPT-6 系列。官方称在早期测试中 Astra 比 GPT-6 Astra 发现更多真实代码问题、且完成 agentic 编码任务所用 token 更少；Sol 面向复杂 agentic 编码与深度代码审查，官方称其发现的真实问题数接近 GPT-6.1 Sol 的两倍，同时保持结论准确性。

两模型在 Copilot 中按用量计费并适用供应商目录价，可用范围为 Copilot Pro+、Max、Business 与 Enterprise，可在 VS Code、Visual Studio 等编辑器中选择。openai.com 对应公告页在本次抓取中返回 403，正文以官方 RSS 摘要与 GitHub changelog 为依据，API 价格与上下文窗口等参数本期未取到官方原文。

**相关链接**

- https://openai.com/index/introducing-gpt-6-2-astra-sol （官方页需人工打开）
- https://github.blog/changelog/2026-11-17-openais-gpt-6-2-astra-and-gpt-6-2-sol-now-available

### 14. Vercel AI Gateway 上架 GPT-6.2 Astra/Sol、Decision-1.1 与 MAI-Image-2.7 系列

**导语**

Vercel AI Gateway 同期上架 OpenAI 的 GPT-6.2 Astra 与 GPT-6.2 Sol、Decision-1.1，以及 MAI-Image-2.7 与 MAI-Image-2.7-Flash，使这些模型可通过统一网关接入。

**详细内容**

AI Gateway 作为 Vercel 的多供应商聚合入口，本期新增的模型 ID 让开发者在既有鉴权与可观测体系下切换模型，无需自行对接各家接口。此前该网关已上架腾讯 Hy4 Flash（本期见第 21 条之后的跟踪项）与 Qwen4-Max 等模型。

本条只陈述「已上架」这一事实，模型规格、价格与上下文窗口以各厂商官方文档为准；Vercel 公告页未给出可比的定价明细。

**相关链接**

- https://vercel.com/changelog/gpt-6-2-astra-and-sol-now-available-on-ai-gateway
- https://vercel.com/changelog/decision-1-1-now-available-on-ai-gateway
- https://vercel.com/changelog/mai-image-2-7-and-mai-image-2-7-flash-now-available-on-ai-gateway

## 产品应用

### 15. Google 开放 Gemini 的 Tasks 任务模式，美国用户可用邮件或短信派单

**导语**

Google 在 Gemini App 首页加入 Task 模式开关（从 Chat 切到 Task），用户可让 Gemini 代为完成整件事；官方称美国用户还可把邮件转发到 gemini@google.com，或通过短信向 Gemini 下达任务。

**详细内容**

配置路径：Android 或 iOS 打开 Gemini，进入 Settings → Channels → Text with Gemini 下的 Set up 并验证手机号。

官方说明中也承认任务模式仍会出错，可能出现任务未完成或未达标的情况，遇到时请点「thumbs down」反馈。Google 表示将与主要网站和安全服务商合作推进开放、可验证的标准，让个人助理类代理能在真实站点上完成操作；同时提到在部分站点上 Gemini 可能推进到一半把最后一步交回用户点击。

**相关链接**

- https://blog.google/innovation-and-ai/products/gemini-app/tasks-in-gemini-free-new-features/

### 16. Google 将 Gemini 对话保留期从 72 小时延长到 2 个月

**导语**

据媒体报道，Google 宣布在 Gemini App 中把对话保留期从 72 小时延长到 2 个月，变更将在未来数周内全球推出。官方给出的理由是为回应用户、处理反馈与保护服务与用户，临时对话仍不用于训练模型。

**详细内容**

此前 Gemini Apps 隐私中心记载的临时对话保留期为 72 小时，Google 在 11 月 12 日的存档版本中仍是该口径。Google 同期更新隐私中心，新增「系统故障」作为保留对话的理由之一，并把「聊天历史」与「AI 训练」拆成两个独立设置项。

对照来看，OpenAI 称 ChatGPT 临时对话最长保留 30 天，Anthropic 的 Claude 无痕对话默认保留 30 天；各厂商仍可能因法律或安全原因保留更久，或用于调查违规。Google 未说明本次调整的触发原因，也未说明是否影响对话的访问与审查方式。

**相关链接**

- https://techcrunch.com/2026/11/17/google-to-keep-gemini-chats-for-two-months-up-from-72-hours-even-with-history-off/

### 17. OpenAI 推出 ChatGPT for Sales 插件与 30 余个合作伙伴插件

**导语**

OpenAI 发布 ChatGPT for Sales 插件，并新增与扩充 30 余个合作伙伴插件，覆盖线索调研、提案准备、CRM 更新等销售流程场景。官方公告页在本次抓取中返回 403，内容依据官方 RSS 摘要。

**详细内容**

按官方 RSS 摘要，ChatGPT for Sales 插件面向销售团队的端到端动作：研究潜在客户、准备 pitch、更新 CRM 并推进交易；同期扩充的合作伙伴插件同样围绕 CRM 与销售工具链路。

插件的具体清单、可用套餐、地区与数据处理条款未取到原文，本期不对细节作展开。该产品线与第 14 条的模型上架、第 19 条的 AWS 插件生态属于同期「把 agent 接进既有业务系统」的方向。

**相关链接**

- https://openai.com/index/introducing-chatgpt-for-sales （官方页需人工打开）

## 技术与洞察

### 18. 研究：模型被告知「这是游戏」后，可能把平民识别为军事打击目标

**导语**

据媒体报道，一项研究显示 Anthropic、OpenAI 等实验室的部分模型在「战场情景」模拟中，只要被告知这是游戏就可能被绕过，把平民或学校等地点识别为可打击目标；研究人员称没有任何一次请求被安全分类器拦截，拒答也不常见。

**详细内容**

报道称 Anthropic 的模型在这些模拟中表现最差，但所有模型表现都不理想：即便拒答，也常常在被告知「这是游戏」后转为配合。研究发布之际，Anthropic 与美国国防部正就是否可将 Anthropic 技术用于大规模监控或自主作战发生争议，Anthropic CEO Dario Amodei 坚持认为当前系统不足以在无人监督下做生死决策。

报道指向的原始研究论文与评测方法本次未取到，相关结论属媒体转述的单一来源摘要，仅作为安全线索保留。

**相关链接**

- https://techcrunch.com/2026/11/17/ai-models-can-be-tricked-into-identifying-civilians-as-military-targets-by-telling-them-its-a-game/

### 19. AWS 一批 SageMaker 与 AgentCore 更新：数据准备、JSON 工作负载降本、WhatsApp agent

**导语**

AWS 在 11 月 16—17 日连续发布多篇官方博客：SageMaker AI 新增面向模型开发的数据准备能力，Amazon Bedrock AgentCore 给出 JSON 工作负载降低 token 成本与延迟的实践方案，并给出在 AgentCore 上构建 WhatsApp AI agent 的方法。

**详细内容**

同批条目还包括：Bedrock AgentCore 上的 OpenTSLM 时序推理（JumpStart 提供）、AWS Agent Registry 支持通用元数据的治理与发现、AgentCore 接入 Snowflake Cortex AI 的安全 OAuth 模式，以及面向 agentic AI 的分阶段负责任 AI 路线图。多家客户案例（LoanPro、ArisGlobal、Duco、MoEngage、Novo Nordisk）同期发布。

这些以官方博客形式发布的产品说明与技术实践，属于开发者在 re:Invent 前后评估上云路径时的参考材料；具体能力与限制以各自文档为准。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/announcing-ai-data-preparation-capabilities-in-amazon-sagemaker-build-high-quality-datasets-for-model-development-workflows/
- https://aws.amazon.com/blogs/machine-learning/reducing-token-costs-and-latency-in-amazon-bedrock-agentcore-json-workloads/
- https://aws.amazon.com/blogs/machine-learning/build-whatsapp-ai-agents-with-amazon-bedrock-agentcore/

## 行业动态

### 20. Model ML 完成 2.5 亿美元 B 轮融资，估值 15 亿美元

**导语**

据媒体报道，Model ML 完成 2.5 亿美元 B 轮融资，估值 15 亿美元，由 General Atlantic 与早期投资方 QED Investors 联合领投；该公司为投行与咨询顾问自动化 Excel、PowerPoint 等系统内的分析工作。

**详细内容**

该公司由兄弟 Chaz 与 Arnie Englander 创立，两人此前还创办过点对点租赁平台 Fat Llama（2022 年以 4150 万美元被瑞典对手 Hygglo 收购）。Model ML 的产品是与客户系统、数据和工具（含 Excel 与 PowerPoint）集成的 AI agent，官方称其理解交易上下文，并能在新情况影响分析时自动更新财务模型与演示文稿。

新一轮融资距其 7500 万美元 A 轮约一年。估值与轮次金额均为报道口径。

**相关链接**

- https://techcrunch.com/2026/11/17/model-ml-raises-250m-to-automate-investment-banking-grunt-work/

### 21. 融资速览：Unsiloed AI 750 万美元、Humyn Labs 4700 万美元、Pedestal AI 470 万美元

**导语**

据 11 月 17—18 日的报道，三笔 AI 领域融资：Felicis 领投 Unsiloed AI 750 万美元，做企业文档到 agent 可用的转换；Accel 领投印度 Humyn Labs 4700 万美元，为美国机器人公司供给训练数据；Pedestal AI 融资 470 万美元，方向是用 agent 改造供应链。

**详细内容**

Unsiloed AI 的定位是让企业既有文档可被 AI agent 使用；Humyn Labs 为美国机器人开发商提供其所需的数据供给，属数据供给侧投资；Pedestal AI 的融资规模明显小于前两者，方向为供应链 agent 化。

三笔融资金额与领投方均来自媒体报道，本期未取到投资方公告原文，按二级来源口径处理。

**相关链接**

- https://techcrunch.com/2026/11/18/felicis-leads-7-5m-bet-on-unsiloed-ai-to-make-enterprise-documents-usable-by-ai-agents/
- https://techcrunch.com/2026/11/18/accel-backs-indias-humyn-labs-to-supply-training-data-needed-by-u-s-robotics-ai-developers/
- https://techcrunch.com/2026/11/17/pedestal-ai-raises-4-7-million-to-agentify-the-supply-chain/

### 22. NVIDIA 披露对私营公司股权投资价值 655 亿美元，并扩大与六家制造与封装伙伴的产能承诺

**导语**

NVIDIA 在财报披露其持有的私营公司股权价值已达 655 亿美元（媒体口径 655 亿）；同期公司宣布与 Amkor、Foxconn、Kinsus、Samsung Electro-Mechanics、SPIL 与 TSMC 扩大合作，在基板、先进封装、晶圆与代工产能上扩张。

**详细内容**

供应链公告由运营执行副总裁 Debora Shoquist 表述为「供应链是我们的战略优势」，目标是让产能与加速计算及 AI 基础设施平台的需求对齐，其中对 Kinsus 与 Samsung Electro-Mechanics 的基板供应承诺扩容、并提升现有工厂产能。

媒体同时指出，黄仁勋离任后这部分投资的未来交易前景存在不确定性——这些股权合作多由其主导推谈，属观察项而非已确认的变化。

**相关链接**

- https://nvidianews.nvidia.com/news/nvidia-expands-commitments-with-supply-chain-partners-to-support-ai-infrastructure-buildout
- https://techcrunch.com/2026/11/17/nvidias-startup-stakes-ballooned-to-65b-but-huangs-exit-puts-future-deals-in-doubt/

### 23. NVIDIA 澄清 neocloud 贷款担保口径：提供担保不等于自己出钱

**导语**

NVIDIA 在季度 CFO 评论中澄清：为客户新建数据中心的贷款提供担保，并不等于 NVIDIA 自己在提供融资——担保只有在客户已拿到建厂与安装设备的融资后才生效。据媒体报道，OpenAI 的 PORTS-Pike 园区担保规模为 1050 亿美元。

**详细内容**

该口径由代理 CEO 兼 CFO Colette Kress 在财报电话会说明：客户需自行通过股权或债务完成融资、建设并安装算力，NVIDIA 的担保才启动；若项目未满足这些条件，担保「并不存在」。

媒体报道称，最大一笔是为 OpenAI 在俄亥俄的 PORTS-Pike 数据中心园区提供的 1050 亿美元担保（8 月宣布），OpenAI 承诺该园区独家使用 NVIDIA 设备；另有报道称 Kress 曾把该项目担保从 2500 亿美元下调到 1050 亿美元。担保规模与调整过程为媒体转述，官方新闻稿未逐笔列示。

**相关链接**

- https://techcrunch.com/2026/11/18/nvidia-clarifies-when-it-will-and-wont-keep-financing-neoclouds/

## 前瞻与传闻

以下条目均为单一来源，未获得第二个独立来源交叉验证，仅保留标题、链接与日期，不展开细节。

- **DeepSeek 因算力紧张收紧免费对话额度**：https://emergent.sh/news/deepseek-caps-free-chat-quotas-amid-china （2026-11-18 · 单一来源 · 未核实）
- **Qwen4-Max 据称脱离预览、参数 2.4T 且仍未放出权重**：https://modelfit.io/blog/qwen4-max-general-availability-no-weights/ （2026-11-18 · 单一来源 · 未核实）
- **Kimi K3.1 Pro 定价与套餐调整说明**：https://deepinfra.com/blog/kimi-k3-1-pro-pricing-guide （2026-11-18 · 单一来源 · 未核实）

## 后续追踪

- **NVIDIA 继任 CEO**：董事会表态无意让黄仁勋复任、公司同时考虑内部与外部候选人 → 财报电话会首次由代理 CEO Kress 主持 → 下一步关注永久 CEO 人选公布与战略口径是否延续。
- **NVIDIA 中国业务**：H200 出口通道参与终止、Q4 指引未计入中国数据中心计算收入 → 出口管制监督委员会成立 → 下一步关注中国相关收入口径、委员会首次会议内容与后续出口政策变化。
- **NVIDIA 与 Hugging Face 收购**：129 亿美元交易原计划推进 → 财报电话会确认仍在按计划推进 → 下一步关注交割时间与开放模型路线是否随人事变化调整。
- **Anthropic IPO**：Amazon 约 14.7%、Google 13.7%，260 亿美元非投票股认购 → 发行定价与上市时间未取到 → 下一步关注定价文件、路演与 AWS 千亿美元云消费承诺的落地节奏。
- **黄仁勋相关调查与作证**：董事会独立调查与 SEC 调查同步进行 → 已定于感恩节前赴国会作证 → 下一步关注作证内容与后续披露。
- **GPT-6.2 系列**：Astra 与 Sol 已在 Copilot GA、亦上架 Vercel AI Gateway → API 价格、上下文窗口与开放范围本期未取到官方原文 → 下一步关注官方文档中的定价与限额口径。
- **Google Gemini 数据保留**：临时对话保留期由 72 小时延长至 2 个月 → 全球逐步推出，聊天历史与训练设置拆分 → 下一步关注是否扩展到其他地区与产品线。

## 编辑备注

1. **本期为补跑触发**：本次运行在 2026-11-18 21:48（Asia/Shanghai）触发，非 07:00 例程时点。按例程 13.2 的 `skip_missed` 口径，检索按 72 小时范围扫描，再按「事件首次公开时间」与 EP022（2026-11-17）已覆盖内容去重，本期条目以 2026-11-17 07:00 之后首次公开者为主，只补一期、不堆积历史期次。
2. **来源限制**：openai.com 的公告页在本次抓取中全部返回 HTTP 403，第 13、17 条以官方 RSS 摘要与 GitHub changelog 为依据，页面已标注「需人工打开」；Anthropic IPO（第 4 条）、NVIDIA 人事与调查（第 3 条）、对华出口（第 2 条）、担保口径（第 23 条）均来自 TechCrunch 对官方文件或财报电话会的转述，属二级来源，未取到原始文件。
3. **官方宣称未独立验证**：Terminal-Bench 成绩与成本对比（第 8 条）、GPT-6.2 代码审查效果（第 13 条）、OpenRouter token 用量与 Nemotron 排名（第 5 条）均为发布方口径，正文已标注「官方称」。
4. **未展开项**：AWS 一批客户案例与 AgentCore 教程（第 19 条）、arXiv 论文与 Hugging Face/ModelScope 论文均未纳入本期完整条目，避免以研究产出稀释开发者可操作信息。
