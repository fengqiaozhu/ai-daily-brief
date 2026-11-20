# AI 早报 2026-11-21

- **期号**：EP026
- **目标受众**：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者
- **检索时间窗**：2026-11-20 07:00 — 2026-11-21 07:05（Asia/Shanghai）为主窗口；按 72 小时范围补扫 2026-11-18 之后的一手源更新，按「事件首次公开时间」与 EP025（已覆盖至 11-20 07:00）去重
- **本期交付物**：Markdown 正文母版（本文件）+ HTML 专业报告 + 来源清单 + 发布建议与待确认项
- **本期无视频**（依据 CMP-472，自 2026-11-11 / EP016 起停用 NotebookLM 视频与音频）

## 今日概览

**要闻**

1. OpenAI 公布对抗性蒸馏防护方案：在 GPT‑6.2 Astra 与 GPT‑6.2 Sol 上强化「受保护推理」提取防护，内部自适应红队评测的攻击成功率从 54.0% 降至 0.2%
2. Anthropic 研究员 Levent Alpöge 宣布找到黎曼假设的 Lean 可编译解法，同期与 NYU 的 Tristan Buckmaster 释出纳维-斯托克斯方程相关证明，多位数学家已确认可编译
3. Anthropic IPO 资金与股权结构披露：合计募资 813 亿美元，七位创始人套现 19.5 亿美元；Google 持股 13.4%、Amazon 持股 14.6%，两家云厂商合计 28%

**开发生态**

4. Kimi Code CLI v2.7.0 新增原生 Amazon Bedrock provider，可用标准 AWS 凭据链（含 SSO 与具名 profile）调用，示例模型为 Kimi K3.1 Pro Highspeed
5. Amazon Bedrock AgentCore payments 打通 AWS Marketplace 的 x402 交易：agent 可按请求用美元结算并计入开发者 AWS 账单，无需稳定币钱包或独立 API key
6. GitHub 自定义仓库角色新增 4 项安全公告权限并正式可用，可把私有漏洞报告与安全公告的处理权限下放到单个仓库
7. GitHub Enterprise Server 3.23 RC 发布：GHES 本地 AI 密钥检测（无需 GPU／外部 LLM／出网）、GitHub Advisory Database 扩展到 6 个新生态、Dependabot 引入 3 天冷却期
8. Hugging Face 推出 harness adapters：用 RL 训练的 LoRA 适配器把模型对齐到指定 harness，Qwen3.8-27B 在 Terminal-Bench 2.1 上官方称由 39% 提升至 55% pass@1

**模型发布**

9. Thinking Machines Lab 发布 Inkling 2 Mini：循环式 MoE，约 26B 物理参数 / 3B 激活参数，24 物理层循环为 48 逻辑层，支持 1M token 上下文与图像输入

**产品应用**

10. Amazon SageMaker HyperPod 上线 Global Inference Gateway：跨集群、跨区域共用一个托管端点，自动选点与故障转移
11. Amazon Textract Insights 正式可用（GA）：用自然语言定义字段，每个返回值带置信分与页面级 grounding，无需自行训练模型
12. Amazon SageMaker HyperPod 增强基础设施可观测性：按 GPU 汇总利用率、显存、温度、功耗与 SM 时钟偏差，覆盖 EKS 与 Slurm 编排
13. OpenAI 客户案例：Hebbia 称 GPT‑6 Astra 在来源引用与演示稿格式两项上领先其测试过的其他模型

**技术与洞察**

14. OpenAI 发布 MedChemBench 药物发现基准：99 题、117 篇论文与专利、761 个分子结构，官方称 GPT‑6.2 Astra 在 xhigh 推理档拿到 84.5% 可得分数
15. 论文：编码 agent 成功运行中约 80% 的 token 生成在「没有改动所请求变更」的调用上，作者把这部分成本定义为「热」
16. 论文：AnyS1 用一个 4B 指针模型统一接管 agent 工作流的例行决策点，官方称在三个未见基准上把单次 episode 成本压到 75% 以上
17. 论文：BOS Summary 在推理阶段放开 BOS 查询行的因果约束，让注意力汇点携带输入上下文，跨 8 个多模态与纯文本基准优于直接提示与思维链提示
18. 论文：ARISE 用 agent 自身失败驱动的可检索微记忆与宏规则实现自我进化，官方称在 14 个企业工作流域上较基线提升 10.9 与 5.8 个百分点

**行业动态**

19. NVIDIA 最新财报交出增长，同时宣布停止向中国销售 H200 芯片，并驳回让黄仁勋回归 CEO 的呼声
20. 媒体披露：SpaceX 400 亿美元芯片融资的贷款方要求所购芯片不得用于其轨道数据中心计划
21. Spotify 创始人 Daniel Ek 投资核聚变创业公司 Europa Fusion，创始人此前在 Google DeepMind 与 Pacific Fusion 任职

**前瞻与传闻**

22. 苹果或自研可操作整机的 AI agent：招聘岗位被曝后彭博报道，Apple 未回应，macOS 27.3 同期将警告用户勿向第三方 agent 授予完全控制权

## 要闻

### 1. OpenAI 公布对抗性蒸馏防护方案：GPT‑6.2 Astra 上「受保护推理」提取攻击成功率从 54.0% 降至 0.2%

**导语**

OpenAI 于 11 月 20 日发布对抗性蒸馏（adversarial distillation）防护说明，称已将模型训练、分类器、API 层防护与红队评测组合使用，重点加固 GPT‑6.2 Astra 与 GPT‑6.2 Sol 的「受保护推理」提取防护，内部自适应红队评测的攻击成功率由 GPT‑6 Astra 原防护下的 54.0% 降至 0.2%。

**详细内容**

OpenAI 在文中把「受保护推理」定义为模型在得出答案过程中生成的中间思维链痕迹，并称这类痕迹可能包含最终答案没有呈现的信息，因此对攻击者而言是价值更高的训练数据，可用于绕过原模型的拒答与安全护栏，例如蒸馏出网络攻击能力。官方称此次加固有三项具体结果：GPT‑6.2 Astra 与 GPT‑6.2 Sol 的推理提取防护已强化；防护体系向生物与网络安全领域的既有做法靠拢；对外共享检测与干扰对抗性蒸馏的方法，以帮助全行业加固。

需要区分的是，54.0% → 0.2% 是 OpenAI 内部自适应红队评测下的数字，属发布方自测口径，尚无第三方独立复现；文中也未公布评测集构成、攻击者算力预算与误报率。该方案不改变模型 API 的对外价格与速率限制，官方也未宣布面向开发者的新接口或封禁策略。

**相关链接**

- https://openai.com/index/combatting-adversarial-distillation

### 2. Anthropic 研究员称找到黎曼假设的 Lean 可编译解法，同期释出纳维-斯托克斯方程相关证明

**导语**

据 TechCrunch 报道，Anthropic 的数学家 Levent Alpöge 于 11 月 20 日发文称找到了 1859 年提出、属千禧年 Prize 难题之一的黎曼假设的一个可 Lean 编译解法；该文同时提到他与纽约大学数学家 Tristan Buckmaster 释出了另一个与纳维-斯托克斯方程相关的重要证明。

**详细内容**

报道称，Alpöge 上周日深夜向 Anthropic CEO Dario Amodei 询问如何公布该结果，并自述是在与 Claude 的「意识流式摸索」中找到了论证的全部拼图。多名数学家在 Zulip 聊天组中公开拆解该证明：东英吉利大学数论学家 Chris Birkbeck 认为上同调界「看起来由一个自同态提升论证给出」，并列出 Galois 表示、Jacquet–Shalika、Clozel 纯性、CM 主定理等工具；MIT 数学家 Andrew Sutherland 等人表示已成功编译 Alpöge 的解法。

按报道，数学界多数人认为形式化的 Lean 结果可以成立，但「要等人类真正理解这个结果并能互相讲清楚，还需要相当长时间」。因此本期将其收录为「形式化结果已被多方确认可编译、但数学意义层面的评审尚未完成」，不表述为黎曼假设已被证明解决。

**相关链接**

- https://techcrunch.com/2026/11/20/ai-claimed-a-solution-to-the-167-year-old-riemann-hypothesis-and-a-human-did-too/

### 3. Anthropic IPO 资金与股权结构披露：合计募资 813 亿美元，七位创始人套现 19.5 亿美元，两家云厂商合计持股 28%

**导语**

据 TechCrunch 报道，Anthropic 于 11 月 19 日成为公众公司，IPO 合计募资 813 亿美元，其中 19.5 亿美元流向七位创始人；计入 260 亿美元无投票权 Class N 股票后公司口径募资为 1,048 亿美元，Google 与 Amazon 分别持股 13.4% 与 14.6%，合计 28%。

**详细内容**

报道披露的关键数字包括：七位创始人在发行价 83 美元/股下各出售约 340 万股，每人套现约 2.8 亿美元（承销费与税费前），合计 19.5 亿美元，比其按发行价区间中位 74 美元测算的约 2.5 亿美元人均目标多出约 3,000 万美元；公司在 IPO 文件中称每位创始人承诺将个人持股的 80% 投入慈善，但同时指出该承诺是「自愿的、可撤销的意向表达，不构成有法律约束力的义务」。资金端，除出售 Class A 普通股外，公司还向业内头部公司出售了 260 亿美元无投票权 Class N 股票，其中 NVIDIA 与 Google 各认购 100 亿美元，AMD、Broadcom、Micron、Microsoft 与 TSMC 分得其余部分。

支出端，报道称 Anthropic 截至 2026 年 9 月 30 日季度，未来 12 个月的算力与基础设施承诺约需 707 亿美元，到 2030 年底前累计需 4,516 亿美元；叠加既有资金后可用营运资金约 2,300 亿美元，但仍被指远不足以覆盖长期需求。持股方面，Amazon 将其早期可转股本票的一部分在 IPO 中转为股权，持股 14.6%；若全部转股其持股可接近 24%。这些数字均为媒体报道口径，SEC 上市文件原文与公司定价公告本期未取到。

**相关链接**

- https://techcrunch.com/2026/11/19/anthropics-7-founders-cashed-out-nearly-2b-in-record-breaking-ipo/

## 开发生态

### 4. Kimi Code CLI v2.7.0 新增原生 Amazon Bedrock provider：走标准 AWS 凭据链，示例模型为 Kimi K3.1 Pro Highspeed

**导语**

Moonshot AI 的开源编码 agent Kimi Code 在 v2.7.0 中加入原生 `bedrock` provider，开发者可用标准 AWS 凭据链（含默认链、具名 profile 与 SSO）连接 Amazon Bedrock，无需再单独申请与保管 Bedrock API key；AWS 官方博客以 Kimi K3.1 Pro Highspeed 为示例。

**详细内容**

官方说明此前把 Kimi Code 接到 Bedrock 的方式是配置 `type = "openai"` 或 `type = "openai_responses"` 的通用 provider，需要手工设置区域 `base_url` 并提供短期或长期的 Bedrock API key。新路径改为由 provider 自行处理凭据与路由：先解析 AWS 凭据（可用 `AWS_PROFILE` 指定具名 profile），再用 `@aws/bedrock-token-generator` 生成短时效 Bedrock API bearer token；provider 会依据模型 ID 推断 API 格式与区域端点，也可按需覆盖端点与协议。官方同时提示，模型 ID 推断出的 API 格式与区域端点并非对全部模型都成立。

该文给出的示例模型 Kimi K3.1 Pro Highspeed 支持流式输出、可配置推理强度、图像输入与客户端侧工具调用。官方也提示该改动减少了对手工管理 API key 的依赖，但不改变开发者保护 AWS 凭据与最小化权限范围的责任。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/use-kimi-code-cli-with-models-on-amazon-bedrock/

### 5. Amazon Bedrock AgentCore payments 打通 AWS Marketplace 的 x402 交易：agent 按请求用美元结算并计入开发者 AWS 账单

**导语**

Amazon Bedrock AgentCore payments 本次新增 AWS Marketplace 支付通道，agent 可发现并购买支持 x402 的软件、API、数据与内容，按请求以美元计价并记入开发者本人的 AWS 账单，无需稳定币钱包或独立 API key；交易可经 CloudTrail 与 Cost Explorer 审计。

**详细内容**

官方回顾，AgentCore payments 于 2026 年 8 月正式可用时已支持 agent 通过 x402、MPP 等开放协议自主购买付费 API、MCP server 与网页内容，并带支付上限与可观测性；本次扩展到 AWS Marketplace。流程上，当 Marketplace 卖家返回 402 Payment Required 时会附带签名报价，agent 将该 x402 响应转交 AgentCore payments，后者校验会话预算并返回支付 token，agent 携带 token 重试请求即可拿到结果，费用计入设置了 Payment Manager 的 AWS 账户账单。开发者需创建一个带 AWS Billing 连接器的 Payment Manager，并为访问 AWS Marketplace 建立 service-linked role。

护栏方面沿用 AgentCore policy：可设消费上限与许可卖家清单，支付会话上限由 AgentCore payments 强制执行以防超支。官方在文中引用 Tavily 创始人兼 CEO Rotem Weiss 说明合作，Tavily 为首批接入的实时搜索类卖家之一。文章未公布 x402 目录卖家的完整名单与各家定价。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/enable-ai-agents-to-pay-for-aws-marketplace-x402-products-with-amazon-bedrock-agentcore-payments/

### 6. GitHub 安全公告权限正式可用：自定义仓库角色新增 4 项权限，可下放到单个仓库

**导语**

GitHub 于 11 月 20 日宣布「安全公告权限」正式可用（generally available），组织所有者可在自定义仓库角色中授予查看、创建编辑管理、接收私有漏洞报告并关闭或重开公告、发布公告并申请 CVE 等 4 项权限，无需再把协作者提升为仓库管理员或组织级安全管理员。

**详细内容**

官方列出的 4 项权限及其依赖关系为：View security advisories（查看草稿公告、状态与评论）；Create, Edit, and Manage security advisories（包含 View，可创建与编辑公告、评论、管理协作者并创建临时私有 fork）；Accept private vulnerability reports and close or reopen security advisories（依赖前两项）；Publish security advisories and request CVEs（依赖 View 与 Create/Edit/Manage）。权限可按用户与团队授予，且只在其负责的仓库范围内生效，官方称这样可以让团队访问所维护的仓库而不必暴露整个组织的公告。

官方同时列出三条限制：从临时私有 fork 合并改动仍需仓库管理员或安全经理；拥有这些权限的人不能删除临时私有 fork；机密评论只对同时具备仓库写权限的 Create/Edit/Manage 持有者开放。该功能适用于支持自定义仓库角色的组织方案，含 GitHub Enterprise Cloud。

**相关链接**

- https://github.blog/changelog/2026-11-20-security-advisory-permissions-are-now-generally-available

### 7. GitHub Enterprise Server 3.23 RC 发布：GHES 本地 AI 密钥检测、Advisory Database 扩展 6 个生态、Dependabot 三天冷却期

**导语**

GitHub Enterprise Server 3.23 发布候选版于 11 月 20 日上线，官方列出若干重点能力：GitHub Secret Protection 可在 GHES 设备本地用 CPU 上的自托管精调模型做非结构化密钥检测，无需 GPU、托管 LLM 或出网（公开预览）；GitHub Advisory Database 覆盖范围由 npm 扩展到 PyPI、Maven、RubyGems、NuGet、Go、Rust 与 Composer。

**详细内容**

除上述两项外，官方还列明：GitHub Projects 支持用逻辑 AND、显式 OR 与括号组合过滤条件以生成更精确的视图；Dependabot 默认等包版本在 registry 上架至少三天后才提版本升级 PR，以给维护者与社区留出发现被投毒或有缺陷版本的时间；OAuth 应用可选择签发 8 小时过期的访问令牌并配合 refresh token 续期，该选项对既有应用为可选、对新建应用为默认（公开预览，官方要求在强制过期前先更新客户端）；GHES 集群中 Redis 主节点可迁移到不再混跑 MySQL 等服务的独立节点。RC 版本供提前试用与反馈，正式发布节奏官方未在本文中给出。

**相关链接**

- https://github.blog/changelog/2026-11-20-github-enterprise-server-3-23-release-candidate

### 8. Hugging Face 推出 harness adapters：用 RL 训练的 LoRA 适配器把模型对齐到指定 harness 与任务分布

**导语**

Hugging Face 于 11 月 20 日发布 harness adapters，思路是模型权重固定、只训练一个 RL LoRA 适配器去适配具体 harness 与任务分布。官方给出的例子是 Qwen3.8-27B 在 pi harness 上的 Terminal-Bench 2.1 成绩由 39% 提升到 55% pass@1，平均 token 用量从 2.9K 降到 1.5K。

**详细内容**

官方给出的动机是：通用模型并未针对所有 harness 与任务做优化，把模型和某个 harness 组合使用会同时损失效果与效率；此前多 harness RL 与 harness adapters 的工作在数据分析与代码构建任务上已验证过「在自己的任务分布、自己的 harness 内做 RL」能同时提升准确率与效率，本次把方向推进到更多 harness 组合与更复杂的任务。

官方对数字的归因是明确的：39% → 55% pass@1 的增益主要来自模型推理更少、工具调用更少、一次做对的概率更高；1.5K 的平均 token 用量对应更短的执行轨迹。这组数字为 Hugging Face 自测口径，官方未披露评测的题目子集、重复次数与置信区间，也未说明结果在不同 harness 上的迁移程度。

**相关链接**

- https://huggingface.co/blog/harness-adapters-at-scale

## 模型发布

### 9. Thinking Machines Lab 发布 Inkling 2 Mini：循环式 MoE，约 26B 物理参数 / 3B 激活参数，支持 1M token 上下文

**导语**

Thinking Machines Lab 发布 Inkling 2 Mini，Hugging Face 博客将其描述为一款循环式（looped）Transformer 多模态 MoE 模型，约 26B 物理总参数、每 token 激活 3B 参数，支持 1M token 上下文并接受图像与文本输入，以混合精度格式提供 NVFP4 与 MXFP8 专家权重。

**详细内容**

架构上，模型有 24 个解码层，其中第 6–17 层共 12 层循环三次，第 0–5 层与第 18–23 层各执行一次，因此每 token 实际执行 48 次层访问，官方以「48 逻辑层 / 24 物理层」描述这一结构；隐藏维度 2,304（Inkling 2 Small 为 4,608）。每次层访问都把 token 路由到 8 个专家，Mini 在每层的 128 个专家中选取，Small 则在 384 个中选取。每六个一层的 block 中含 5 个滑动窗口层与 1 个全注意力层，局部窗口最多 1,024 token；注意力使用 24 个查询头与 8 个 KV 头。

循环层之间通过 cross-pass messages 传递信息：每一轮循环从第 6 层输出重新开始，小型门控控制器根据当前输入与上一轮消息决定「遗忘多少、加多少」，从而让每一轮修正上一轮的计算结果。发布方同时提供 transformers、llama.cpp（Llama App）与 MLX 支持，SGLang 提供面向数据中心硬件的首日推理支持；另附一个 DSpark drafter 以少量显存换取额外加速。Hugging Face 的初评称其至少可与 Qwen 3.8 27B 相当，并明确表示「仍需更多验证」。

**相关链接**

- https://huggingface.co/blog/inkling2mini

## 产品应用

### 10. Amazon SageMaker HyperPod 上线 Global Inference Gateway：跨集群跨区域共用一个托管端点

**导语**

Amazon SageMaker HyperPod 于 11 月 21 日推出 Global Inference Gateway，把路由能力从单个 HyperPod 集群扩展到多个集群乃至多个区域，客户端只需调用一个由 SageMaker 托管的端点，网关负责挑选集群、走 AWS 骨干网传输、自动故障转移并以 SigV4 与 IAM 完成鉴权。

**详细内容**

官方描述的架构分两层：Inference Gateway 为每个 HyperPod 集群提供单个 GPU 感知的端点，读取 KV cache 占用率、队列深度等实时信号把请求放到最合适的 pod，解决集群内路由；Global Inference Gateway 是第二层，把跨集群、跨区域的调度统一起来，集群内部的选 pod 逻辑保持不变。

官方给出的典型场景是：某团队用 5 个 HyperPod 集群、跨 2 个区域服务 4 个模型。没有 Inference Gateway 时客户端要维护 20 个端点（每模型每集群一个），有 Inference Gateway 后降为 5 个，但仍需客户端自己选集群——由此产生负载不均、故障需人工改配置、以及自建负载均衡／DNS／跨区域网络三项运维负担。官方称新网关可在峰值时把请求溢出到同区域或其他区域有空闲容量的集群，并在集群故障时自动把流量切到次优集群。官方未在本文中公布配额、计费口径与对既有端点的兼容性，这些仍待确认。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/introducing-amazon-sagemaker-hyperpod-global-inference-gateway-one-endpoint-across-regions-and-clusters/

### 11. Amazon Textract Insights 正式可用：自然语言定义字段，每个返回值带置信分与页面级 grounding

**导语**

Amazon 宣布 Textract Insights 正式可用（GA），这是 Amazon Textract 的新生成式 AI 功能，可用自然语言描述需要的字段后提交单份文档或混合多文档包，每个返回值都带置信分与页面级定位，且无需自行训练模型。

**详细内容**

官方描述的问题是混合文档包场景：一份抵押贷款文件往往把 W‑2、工资单、银行对账单和手写便条扫描在同一个文件里，各自版式不同、顺序不固定；理赔与开户材料同样混合表格、扫描票据和自由文本信函。常见做法有两条路——自建 OCR、拆分、分类、基础模型提示与人工复核的定制流水线，运维成本高；或直接用通用大模型，答案流畅但不能稳定引用来源页、也不给置信分，导致团队难以判断哪些值可自动采信、哪些必须人工复核。

Textract Insights 把这条链路收敛成 Textract 内部的单次异步请求：用 blueprint（一份 JSON Schema，每个字段带自然语言描述）定义要抽取什么，每个字段还有 inference type，用于区分「逐字读取」与「推断得出」。官方称该功能从 AWS 公共 blueprint（如 W‑2、Form 1040）起步。官方未在本文中公布该功能的支持区域、单次请求页数上限与按页计费口径。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/announcing-amazon-textract-insights-verifiable-generative-ai-for-documents/

### 12. Amazon SageMaker HyperPod 增强基础设施可观测性：按 GPU 汇总利用率、显存、温度、功耗与 SM 时钟偏差

**导语**

Amazon 宣布 SageMaker HyperPod 的增强可观测性能力，用于更快定位 GPU 训练问题：其诊断摘要基于 Amazon CloudWatch 的 DetectGroupOutliers API，把训练任务中每块 GPU 的利用率、显存、温度、功耗与 SM 时钟做横向比较并标出离群卡，覆盖 EKS 与 Slurm 两种编排。

**详细内容**

官方的出发点是大型训练是最昂贵的 GPU 负载之一，单个不健康加速器就可能拖住整个分布式作业；真正耗时的往往不是发现变慢，而是判断慢在哪里——是 GPU 被限流、网络链路饱和，还是主机上的数据管道停滞。静态诊断规则用于识别常见故障模式，包括 GPU 硬件故障（XID 错误、ECC 内存错误）、EFA 吞吐下降、热降频与过热，目标是让退化在影响训练前被发现。

该能力面向 EKS 与 Slurm 编排下的训练负载，把诊断与剖析集中到一处。官方未在本文中给出具体的诊断延迟指标、采样频率与对现有 HyperPod 用户的启用方式。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/introducing-enhanced-observability-in-amazon-sagemaker-hyperpod-to-diagnose-gpu-training-issues/

### 13. OpenAI 客户案例：Hebbia 称 GPT‑6 Astra 在来源引用与演示稿格式两项上领先其测试过的其他模型

**导语**

OpenAI 发布客户案例称，Hebbia 的 Matrix 产品在预发布评测中测试 GPT‑6 Astra，在「所需来源类型是否被引用」一项上引用相关率为 99.5%、领先其测试过的最佳替代方案 13.6 个百分点，在「演示要求满足率」一项为 97.9%、领先 14.4 个百分点。

**详细内容**

官方描述的场景是投行场景：银行家在向客户推荐并购标的之前，需要消化财务报表、客户合同与管理层演示文稿，Hebbia 的 Matrix 用于把这类研究材料关联起来并把答案锚定到原始文档。Hebbia 对 GPT‑6 Astra 的测试聚焦两块：找出问题所需的来源，以及生成符合银行家 brief 的演示稿。案例中给出的具体例子是：一家客户评估收购一家工业软件公司，需要审阅约 2,000 份文件，测试关注其收入可持续性以及与同业的对比。

需要明确的是，上述百分比全部来自 Hebbia 的自有测试（OpenAI 页面标注为 prerelease evaluations），既非公开基准也未经第三方复现；官方未披露对照模型的名单、题量与人工评分口径。

**相关链接**

- https://openai.com/business/customer-stories/hebbia

## 技术与洞察

### 14. OpenAI 发布 MedChemBench 药物发现基准：99 题、117 篇论文与专利、761 个分子结构

**导语**

OpenAI 于 11 月 20 日发布 MedChemBench，用于评估 AI 模型在药物化学研究推理任务上的表现。官方称在 xhigh 推理档下 GPT‑6.2 Astra 拿到 84.5% 的可得分数，GPT‑6 Astra 为 83.3%、GPT‑6.1 Sol 为 82.0%、GPT‑5.6 Sol 为 58.2%。

**详细内容**

基准取自 117 篇已发表论文与专利，包含 761 个不同分子结构，共 99 道题；对多数题目，模型会拿到选定研究节点上的上下文，包括生物学靶点、研究目标、此前研究过的化合物以及部分实验结果。评测分四部分：分子结构（从给定图示与化学基团组装分子时的原子连接与立体化学）、科学推理（给出有证据支撑的解释，例如选择某个化合物而非另一个的理由）、排序与选择（符合既定要求的化合物排序与取舍）、性质预测（与原文报告的数值与类别一致，包括实测与计算性质）。

官方举了一个 PRMT5 抑制剂的例子：模型需预测三个相关化合物在细胞内阻断 PRMT5 的强度、跨细胞屏障的能力以及在实验室测定中肝脏酶的降解速度，而后续实验显示这些性质之间存在权衡——化合物 23 在细胞内阻断所需浓度更低，化合物 24 则更易穿透细胞屏障、降解更慢。官方把这类「属性间相互制约」的推理视为药物化学的核心难点。

全部分数均为发布方口径，且系预发布模型在特定推理档位下的结果，官方未说明评测的提示模板、重复次数与是否为单次作答。

**相关链接**

- https://openai.com/index/introducing-medchembench

### 15. 论文：编码 agent 成功运行中约 80% 的 token 生成在「没有改动所请求变更」的调用上

**导语**

论文《Where the Tokens Go: Heat, Entropy and Error in Agentic Coding》提出一套「软件热力学」理论，把编码 agent 生成的 token 分为「功」与「热」两部分；作者称一次成功运行中约 80% 的 token 生成在那些没有改变所请求变更的模型调用上，这部分被定义为热。

**详细内容**

作者把 agent 生成的 token 计为成本，再把成本划分为功与热，类比经典与随机热力学。测试集被当作一个「软件麦克斯韦妖」，对每次代码改动作出判决。验证方法采用类似「拉起并让分子重新折叠」的实验：agent 对仓库做一次改动（编码）再撤销（反编码），反复多轮，统计每次模型调用的 token；每一轮都从存储的参考树出发，重复循环的成本离散程度定义出「软件温度」，而该温度随模型采样温度上升。

作者据此认为，按 token 计费的编码 agent 计费方式与软件工程的实际价值并不对应，的大部分开销并未转化为代码改动。论文编号 arXiv:2611.23375，作者为 Alán Aspuru-Guzik 与 Varinia Bernales。论文为预印本，上述结论与数字为作者自述，未见独立复现。

**相关链接**

- https://arxiv.org/abs/2611.23375

### 16. 论文：AnyS1 用一个 4B 指针模型统一接管 agent 工作流的例行决策点

**导语**

论文《Thinking Fast, Anywhere: One System-1 for the Decision Points of Any Agent Workflow》提出 AnyS1 框架，把人工编写的流程技能中隐含的「此处需要做选择」统一抽取为跨领域通用的决策点集合，并训练一个 4B 指针式 System‑1 模型接管这些例行决策，官方称在三个未见基准上把单次 episode 成本压低 75% 以上。

**详细内容**

作者的出发点是：自主 LLM agent 在每一步都调用大模型（System‑2）会造成显著的成本与延迟，即便很多中间动作只是在少量已知候选中做选择。已有的双系统 agent 方案会把这类决策下放给轻量 System‑1，但依赖为每个环境手写的 workflow 钩子。

AnyS1 的做法是：离线阶段从 1,000 多个公开技能中挖掘有依据、可枚举的决策点，并在隔离容器内采集执行轨迹状态构建 Any‑DP 数据集，用标签平滑训练一个校准过的 4B 指针 System‑1；运行时，编译后的工作流用一次前向传播解决常规决策，仅当置信度低于校准阈值时回退到 System‑2。论文编号 arXiv:2611.23751，数字为作者自述，阈值与成本降幅依赖具体基准与 System‑2 模型家族，尚未见独立复现。

**相关链接**

- https://arxiv.org/abs/2611.23751

### 17. 论文：BOS Summary 在推理阶段放开 BOS 查询行的因果约束，让注意力汇点携带输入上下文

**导语**

论文《BOS Summary: The First Token Matters》提出一种免训练、仅在推理期生效的方法：在 prefill 阶段只对 BOS 查询行放开因果约束，让序列开头的注意力汇点把全部视觉与文本输入聚合进自身的上下文表示，其余 token 仍保持标准因果注意力。

**详细内容**

作者指出，大型视觉语言模型与语言模型普遍存在注意力汇点现象，序列开始（BOS）等特定位置会承接远超比例的注意力；而在标准因果掩码下，BOS 查询只能注意到自己，因此后续 token 反复访问的那个表示并不携带输入信息。BOS Summary 的做法是在某一层 transformer 的 prefill 阶段只对 BOS 查询行解除因果约束，使 BOS 把所有视觉与文本输入 token 聚合为一个自生成的上下文表示，该表示在后续解码过程中持续可被访问，且不增加参数、不加辅助模块、不增加解码期开销。

作者称在多个 VLM 与 LLM 家族、8 个多模态与纯文本基准上，该方法优于直接提示与思维链提示，并在多步推理任务上超过近期的「汇点干预」类方法。论文编号 arXiv:2611.23508，结论与数字为作者自述。

**相关链接**

- https://arxiv.org/abs/2611.23508

### 18. 论文：ARISE 用 agent 自身失败驱动的记忆实现自我进化，官方称在 14 个企业工作流域上提升 10.9 与 5.8 个百分点

**导语**

论文《ARISE: Practical Self-Evolving Memory for Accurate and Cost-Efficient Enterprise Agents》提出一套可实用的记忆架构：agent 的记忆从自身失败中演化，不更新模型权重、工具或工作流逻辑。官方称在 SOP-Bench 上较基线提升 10.9 个百分点、在 τ²-bench 上提升 5.8 个百分点。

**详细内容**

作者设定的背景是企业 LLM agent 运行在动态环境中：基础模型快速演进、工作流频繁更新，部署需同时满足准确率与成本要求。ARISE（Agent Refinement through Iterative Self-Evaluation）的机制是：用模型自身或教师模型对失败做归因并提出修正，把修正保存为可检索的微记忆，再整合成宏规则，且只有在留出集准确率上升时才接受一次规则更新——这相当于给规则更新加了回归门。

实验使用 SOP-Bench 与 τ²-bench 的 14 个企业工作流域、5 个模型；其中使用 Claude Opus 4.6 做归因与整合的 ARISE‑Teacher 变体取得上述增益。论文编号 arXiv:2611.23588，数字为作者自述，作者同时说明该架构以记忆与检索层改动为主，不涉及权重更新。

**相关链接**

- https://arxiv.org/abs/2611.23588

## 行业动态

### 19. NVIDIA 最新财报交出增长，同时宣布停止向中国销售 H200 芯片并驳回让黄仁勋回归的呼声

**导语**

TechCrunch 的 Equity 播客最新一期（11 月 20 日）提到，NVIDIA 在本周交出的最新财报显示增长稳健并称好时候仍将持续；同一时期该公司宣布停止向中国销售 H200 芯片，并驳回了让黄仁勋回归 CEO 的呼声。

**详细内容**

按该期节目的描述，NVIDIA 是在处理其CEO 被免职后续影响的同时交出财报，业绩保持增长并对前景给出乐观表述；出口管制方面，公司确认将停止向中国市场销售 H200 芯片；对董事会的复任呼吁，公司层面予以驳回。节目把这一系列事件与 Anthropic 上市、行业「循环融资」模式受到的检验放在同一语境下讨论。

本期未取到 NVIDIA 财报原文与出口管制公告原文（NVIDIA 新闻室 RSS 窗口内无对应条目），因此不引用具体营收、利润或出货量数字；节目标注的受访者为 Kirsten Korosec、Anthony Ha 与 Tim De Chant，其余同期话题（Waymo 暂停全美高速载客、Tesla Cybercab 开放个人预订、电池创业公司 Our Next Energy 上市、Plural 设立欧洲新基金）属同一期节目内容，不计入本期条目。

**相关链接**

- https://techcrunch.com/podcast/the-fallout-from-nvidias-jensen-huang-scandal-continues/

### 20. 媒体披露：SpaceX 400 亿美元芯片融资的贷款方要求所购芯片不得用于其轨道数据中心计划

**导语**

据《金融时报》报道（TechCrunch 转述），SpaceX 400 亿美元芯片融资交易背后的贷款方提出要求：该交易采购的芯片不得用于 SpaceX 的轨道数据中心计划；报道指出，贷款方能否就相关条款达成一致尚不清楚。

**详细内容**

报道的推理起点是太空数据中心的融资结构问题。当前数据中心生态依赖债务融资，云厂商借款建设并以收入份额还款，这类交易通常以芯片作为抵押——一旦数据中心违约，贷款方可以收回并转售芯片，这一后盾让芯片融资成本更低。据 Compute Credit Index Research 的数据，H100 的二手价格约为 2023 年原始成本的一半，而部分 H200 配置的转售价仍与 2024 年上市时相当。

但芯片一旦装在 300 英里高空、时速 1.75 万英里的卫星上就无法被收回，因此抵押逻辑在轨道场景失效。报道同时称，短期内这未必影响公司，因为 SpaceX 在地面站部署算力的业务已被证明有利可图，埃隆·马斯克在最近一次财报电话会上介绍了火箭团队工程师被派往地面站的情况。FT 原文与 SpaceX 的融资条款本期未取到，本条为二手转述，未作违约或违规认定。

**相关链接**

- https://techcrunch.com/2026/11/20/chips-can-survive-the-space-environment-can-their-financing/

### 21. Spotify 创始人 Daniel Ek 投资核聚变创业公司 Europa Fusion，创始人此前在 Google DeepMind 与 Pacific Fusion 任职

**导语**

据 TechCrunch 报道，Spotify 创始人 Daniel Ek 正在投资核聚变发电创业公司 Europa Fusion。该公司由一位有 AI 研究背景的创始人于 2026 年 2 月在英国创办，主张核聚变创业公司应更偏重仿真与数据路线，而非以物理装置为主。

**详细内容**

报道给出的背景是：创始人 Nantas Nardelli 此前在 Google DeepMind、Facebook AI Research 与 Microsoft Research Cambridge 任职，最近担任核聚变创业公司 Pacific Fusion 的机器学习负责人；Pacific Fusion 近期在新墨西哥州为其示范设施破土动工，而 Pacific Fusion 这类规模的聚变创业公司普遍高度依赖物理装置来验证理论与改进仿真。Nardelli 据称不同意这种对硬件的重度依赖，认为聚变创业公司应转向更偏仿真与数据的路径。Europa Fusion 与 Pacific Fusion 一样走脉冲功率路线，即用大规模精确时序的电流脉冲压缩燃料靶丸直至原子聚变释放能量。

报道称该投资由 Bloomberg 首先披露，融资金额未披露，公司处于隐身状态，TechCrunch 方面的信息来自未具名消息人士。

**相关链接**

- https://techcrunch.com/2026/11/20/daniel-ek-backs-ai-researchers-fusion-power-startup-heres-what-theyre-building/

## 前瞻与传闻

### 22. 苹果或自研可操作整机的 AI agent：招聘岗位被曝后彭博报道，Apple 未回应

**导语**

据 TechCrunch 转述彭博报道，苹果近期发布的一份高级工程经理岗位要求其主导一个「能使用计算机的 AI agent」，可浏览网页、跨应用操作、执行命令、编写与调试代码并调用服务。TechCrunch 称已向苹果求证但未获回应；该线索目前只有彭博一家媒体来源，苹果未作确认。

**详细内容**

据报道，该岗位描述提到希望实现「像有能力的人一样使用计算机」的 agent，可跨越应用、浏览器、命令行、代码与 API 之间流动完成多步任务，并强调这一切是私密进行的。报道同时提到，苹果在推进自有 agent 的同时，正在让第三方 agent 更难获得对其电脑的完全控制权：即将发布的 macOS 27.3 将部署警告，劝阻用户向第三方 agent 授予完全访问权限；苹果在 10 月曾通知开发者，计划「引入额外控制措施，确保真正希望授予应用如此高权限的用户只能通过非常明确的用户操作完成」。彭博称苹果「最快可能在明年底」推出该服务，但其自研 agent 仍处早期阶段。

本条为单一来源线索（彭博首报、TechCrunch 转述），苹果官方未确认岗位内容、发布时间表或产品形态，按例程 13.4 只作线索收录，不展开推断。

**相关链接**

- https://techcrunch.com/2026/11/19/apple-may-be-developing-its-own-ai-agent-that-runs-your-mac/

## 后续追踪

* **Anthropic IPO**：11-19 定价 83 美元/股并挂牌（EP025 已报）→ 本期披露合计募资 813 亿美元、公司口径 1,048 亿美元（含 260 亿美元 Class N）、创始人套现 19.5 亿美元、Google 13.4% 与 Amazon 14.6% 合计 28%、未来 12 个月算力承诺 707 亿美元 → 下一步关注首份 10-Q 对持股结构与风险因素的正式披露、SEC 上市文件原文口径与媒体数字的差异，以及 4,516 亿美元长期算力承诺的融资安排。
* **Anthropic 创始人慈善承诺**：公司称七位创始人承诺将个人持股 80% 用于慈善，同时声明该承诺为自愿且可撤销 → 下一步关注承诺的具体执行机制、PBF 治理结构与首次拨款披露。
* **NVIDIA 人事与出口管制**：董事会表态无意让黄仁勋复任、Kress 任代理 CEO（EP025 已报）→ 本期确认公司停售 H200 于中国、驳回复任呼声并交出增长稳健的财报 → 下一步关注 12 月 1 日第 30 届 UBS 全球科技与 AI 会议上的管理层口径，以及 10-Q 是否追加出口管制相关风险因素。
* **Meta Muse 隐私问题**：员工称 Muse 跨账号混用对话并显示他人银行余额，Meta 称员工版与公开版不同（EP025 已报）→ 本期未见新增可核查进展 → 下一步关注公开版同类问题报告、Meta 官方说明或修复，以及隐私影响评估结论。
* **Gemini API Tool Retrieval**：以 preview 形式上线 Interactions API，适用于 Gemini 3.6 及之后模型（EP025 已报）→ 本期未见 GA 或更多模型版本的官方更新 → 下一步关注是否正式发布以及官方是否公布 token 节省与延迟的具体数值。
* **SageMaker AI 跨区域推理路由**：新增 inference router 资源（EP025 已报）→ 本期 HyperPod 侧再进一步，Global Inference Gateway 把路由能力提升到跨集群跨区域、单一托管端点 → 下一步关注配额、计费口径、对既有端点的兼容性，以及与 HyperPod Inference Gateway 两层结构的分工边界。
* **Apple 自研 AI agent**：彭博报道岗位要求，Apple 未回应（本期线索）→ 下一步关注官方岗位页面、macOS 27.3 对第三方 agent 权限提示的具体措辞，以及「最快明年底」服务时间表是否被官方确认。
* **NotebookLM 工具网关**：EP025 全期不可用（`tool_not_found`）→ 本期 07:01 恢复可用，`notebooklm-server-info` 与 `notebooklm-notebook-create` 成功，首 3 个来源添加成功（OpenAI 两条与一条客户案例），随后整个 notebooklm 工具族从网关目录消失，后续 24 次添加与 `source_wait` 全部返回 `tool_not_found` → 下一步关注网关侧工具目录稳定性；若连续多期在批量添加阶段熔断，建议由工程侧（丁仪）核查 app-gallery 连接的工具目录与限流策略。

## 编辑备注

* 本期实际检索窗口为 2026-11-20 07:00 — 2026-11-21 07:05（Asia/Shanghai），并按 72 小时范围补扫 2026-11-18 之后的一手源更新；与 EP025（覆盖至 11-20 07:00）去重后仅保留新增事实，EP025 已报道的 Anthropic 挂牌交易、Gemini Tool Retrieval、Meta Muse 两篇、NVIDIA 与微软 Ignite 发布、AWS 五条、GitHub 两条、Everful 融资等内容本期不重复收录。
* **本期采集限制（重要）**：NotebookLM 工具网关本期先恢复后再次熔断。07:01 建立会话成功，`notebooklm-server-info`（`include_account: false`）返回服务版本 0.8.5，`notebooklm-notebook-create` 成功建立 EP026 笔记本（id `790462b8-41d5-4f88-b308-2eb7cf70bdb6`），前 3 次 `source_add` 返回 ready；第 4 次起全部返回 `tool_not_found`，07:20 复查网关工具目录，notebooklm 系列工具数已降为 0，`source_wait` 亦不可用。按例程 13.5 的熔断口径降级为「直接检索 + 人工草拟 + 逐条原文核读」，本期未使用任何 NotebookLM 归纳结论。加入笔记本的均为可公开检索的一手页面 URL，不含任何内部业务信息、账号凭据或敏感数据。
* 一手源 RSS 本期可用：AWS ML、GitHub changelog、Google AI、Hugging Face、OpenAI、TechCrunch AI、arXiv cs.AI/cs.CL、NVIDIA Newsroom（窗口内无新条目）、Ollama。
* 一手源 RSS 本期不可用或解析失败：Anthropic（空响应）、Microsoft AI（空响应）、Meta AI（空响应）、Mistral（空响应）四个 feed；DeepMind feed 本期返回非 XML 内容解析失败；Vercel feed 抓取超时未取到。这几家的官方更新本期无法通过官方 feed 直接核对，涉及 Anthropic 的条目已改以 TechCrunch 报道并保留限定语。
* 第 2、3、19、20、21、22 条为二级媒体（TechCrunch）来源，其中第 22 条为单一来源线索、只作「前瞻与传闻」收录；相关官方文件（SEC 上市文件、NVIDIA 财报与出口管制公告、FT 报道原文、苹果岗位页面）本期均未取到，已在正文保留限定语，未做原文推断。
* 第 14 条的分数、第 8 条的 39%→55% 与第 13 条的 99.5%／97.9% 均为发布方自测口径，本期未获得独立第三方复现，数字均按「官方称」归属。
* 第 15–18 条为 arXiv 预印本（编号 2611.23375 / 2611.23751 / 2611.23508 / 2611.23588），结论与数字均为作者自述，未见独立复现；本期只引用摘要中明确给出的数值，不做外推。
* 本期未调用 NotebookLM 视频与音频能力（CMP-472 口径），交付物为 Markdown 正文母版 + HTML 专业报告 + 来源清单 + 发布建议与待确认项。
