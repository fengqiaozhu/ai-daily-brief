# AI 早报 2026-11-19

- **期号**：EP024
- **目标受众**：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者
- **检索时间窗**：2026-11-18 22:00 — 2026-11-19 21:00（Asia/Shanghai）为主窗口；按 72 小时范围补扫 2026-11-17 之后的一手源更新，按「事件首次公开时间」与 EP023 已覆盖范围去重
- **本期交付物**：Markdown 正文母版（本文件）+ HTML 专业报告 + 来源清单 + 发布建议与待确认项
- **本期无视频**（依据 CMP-472，自 2026-11-11 / EP016 起停用 NotebookLM 视频与音频）

## 今日概览

**要闻**

1. Anthropic IPO 定价 83 美元/股，高于 70–78 美元初始区间，募资 813 亿美元创 IPO 募资纪录
2. 微软 CEO 纳德拉解释 6 万名员工买断安排：不是用 AI 取代工程师，而是重组为「人人用 AI 管理 AI」
3. 纳德拉：关键基础设施中大量固件与控制系统「无法打补丁」，在 AI 助力攻击下风险上升
4. NVIDIA 推迟提交 10-Q：管理层称与黄仁勋相关调查及是否追加风险因素有关

**开发生态**

5. GitHub CLI v2.105.0 支持 Event Streams，`gh event listen` 可等待 PR 事件替代轮询
6. Copilot 新增 8 个 GitHub 验证 MCP 连接器（Box、Buildkite、Calendly、ClickUp、Mixpanel、Supabase、Webflow、Wix），公开预览
7. GitHub Enterprise Cloud（GHE.com）支持用 OIDC 把企业审计日志流式写入 Amazon S3
8. Amazon SageMaker JumpStart 上线模型排行榜，在 Studio 内横向对比 70+ 基础模型
9. Amazon Bedrock AgentCore Identity 新增私有 CA 支持，面向自建 IdP 的 agent 身份接入
10. Exa 称在 AWS Neuron 上把嵌入吞吐提升 50%，用于索引数十亿网页文档

**模型发布**

11. Gemini 4 Neon 在 GitHub Copilot 正式可用
12. Reson8 开源 Rumble-2-Flash：0.5B 语音识别模型，覆盖 40+ 语言（72 小时补收）

**产品应用**

13. NVIDIA RTX Spark 紧凑型桌面机上市，最高 128GB 统一内存，面向本地 agent 与模型微调
14. Gemini 应用扩展到低内存 Android 设备，支持 Gemini Live 与自定义图像生成
15. Snapchat 推出 Easy Lens CLI，可用 Claude Code、Cursor、Codex 等助手创建 AR Lens
16. Vercel：Parallel 快速网页搜索在 AI Gateway 限时免费至 2027-01-31（72 小时补收）

**技术与洞察**

17. SageMaker AI Serverless 模型定制新增全参数微调（FFT），并给出与 LoRA 的基准对比
18. SageMaker HyperPod 新增工作负载恢复与扩展基础设施检查，捕捉「节点正常但任务已停」的故障
19. 社区实践：在 32GB 内存的 Mac 上流式运行 180B MoE 模型（72 小时补收）

**行业动态**

20. 花旗更新在线用户协议：使用第三方 AI 代理的个人理财客户自行承担交易风险

**前瞻与传闻**

21. Palmer Luckey 称 AI 驱动的网络攻击增速超过防御能力（观点性发言 · 未经证实的技术判断）

## 要闻

### 1. Anthropic IPO 定价 83 美元/股，高于 70–78 美元初始区间，募资 813 亿美元创 IPO 募资纪录

**导语**

据 TechCrunch 报道，Anthropic 将 IPO 价格定在每股 83 美元，高于此前 70–78 美元的初始区间。本次发行卖出 9.8 亿股（原计划 8.25 亿股），按定价计算募资约 813 亿美元，超过 SpaceX 的 750 亿美元纪录。公司周四开始在纳斯达克交易，代码「ANT」。

**详细内容**

按该定价，Anthropic 全稀释估值约 1.5 万亿美元，高于今年 5 月完成 650 亿美元融资时的 9650 亿美元，但低于此前市场传闻的 2 万亿美元目标。报道指出，Anthropic 的各家风投机构持股比例均未超过 5%，本次 IPO 对早期投资方构成大额兑现。

上市首日表现被视为 AI 板块的定价参考，也会影响尚未公布上市计划的同行的私募估值口径。截至发稿，官方定价公告与招股文件原文未取到，上述数字均以该媒体报道为准。

**相关链接**

- https://techcrunch.com/2026/11/18/anthropic-reportedly-prices-ipo-at-83-a-share-above-projected-range/

### 2. 微软 CEO 纳德拉解释 6 万名员工买断安排：不是用 AI 取代工程师，而是重组为「人人用 AI 管理 AI」

**导语**

微软 CEO 萨提亚·纳德拉在 DealBook Summit 表示，10 月向 6 万名员工提供买断，是为了让每个人在岗位调整中保有选择权，而不是以大规模裁员替代 AI。他强调软件工程岗位依然存在，但团队组织方式与工作内容已经改变。

**详细内容**

纳德拉称微软的转变路径是「从『AI 永远做不了软件』，到『AI 能做全部软件，为什么还需要工程师』，再到重新发现软件工程仍然活着、并且会蓬勃发展，只是团队组织方式和工作方式换了一个新的工作点」。

他以 Microsoft 365 内的 AI agent 团队 Cowork 为例：该团队只有 11 名开发者，纳德拉称他们的定位是「构建一个生产产品的软件工厂，而不是自己生产产品」。这是本期可核查的微软「AI 优先重组」叙事中最具体的口径之一。

**相关链接**

- https://techcrunch.com/2026/11/18/microsoft-ceo-satya-nadella-explains-why-he-asked-60k-employees-to-quit/

### 3. 纳德拉：关键基础设施中大量固件与控制系统「无法打补丁」，在 AI 助力攻击下风险上升

**导语**

纳德拉在同场 DealBook 活动上表示，美国关键基础设施中存在大量「无法打补丁」的软件系统，举例包括固件、数据中心冷水机组与各类暖通空调系统，而这些设备都已接入互联网。在 AI 辅助攻击的背景下，这类资产成为明显的暴露面。

**详细内容**

纳德拉谈到的背景是一系列大规模服务中断，其中包括涉及 Microsoft Outlook 的故障；同期还涉及 NSA、FFA 与 Apple 的相关事件，官方均否认将其归因为网络攻击。他把 Outlook 故障描述为一个「潜在缺陷」引发的「完美风暴」，并表示公司已启动事件响应、后续会公开复盘经验。

本期未取得该场活动的官方文字稿，以上表述以该媒体报道中的直接引述为准。

**相关链接**

- https://techcrunch.com/2026/11/18/amidst-fears-of-ai-cyberattacks-satya-nadella-says-lots-of-critical-infrastructure-is-unpatchable/

### 4. NVIDIA 推迟提交 10-Q：管理层称与黄仁勋相关调查及是否追加风险因素有关

**导语**

NVIDIA 代理 CEO 兼 CFO Colette Kress 在季度电话会上表示，公司不会立即向 SEC 提交季度报告 10-Q，「将在未来几周内提交」，且未当场说明原因。NVIDIA 历来在发布财报当天提交 10-Q，本次延迟因此被广泛注意。

**详细内容**

10-Q 比财报新闻稿包含更细的经营信息，包括「法律诉讼」与「风险因素」等章节。投资分析师 Edward Dowd 在 X 上称此举是「红旗」。UBS 分析师 Timothy Arcuri 在财报电话会后提问，其研究笔记记录称，管理层表示延迟与正在进行的调查有关，需要判断是否在申报文件中追加额外的风险因素；Arcuri 同时维持「买入」评级，但把目标价从 240 美元下调至 220 美元。

该事项与 EP023 报道的 NVIDIA 人事变动、SEC 调查曝光属同一条持续事件线，本期只报告新增的申报时间口径变化。

**相关链接**

- https://techcrunch.com/2026/11/18/nvidia-created-a-weird-bit-of-intrigue-by-not-filing-a-routine-sec-report/

## 开发生态

### 5. GitHub CLI v2.105.0 支持 Event Streams，`gh event listen` 可等待 PR 事件替代轮询

**导语**

GitHub CLI 在 v2.105.0 中接入 GitHub Event Streams：开发者与 agent 可用一条命令等待 pull request 的状态变化，取代在循环中反复轮询。命令会把每个事件按一行 JSON 打印出来，默认收到第一个事件即退出，便于嵌进脚本与 agent 循环。

**详细内容**

命令形式为 `gh event listen <PR URL> <事件类型>`，可等待评审提交、PR 状态与 head 变更、合并冲突以及 check suite 完成等事件。`--count` 用于等待多个事件，`--follow` 持续监听，`--timeout` 设定等待上限，`--jq` 与 `--template` 用于抽取需要的字段。订阅本身可通过 `gh event subscription create`、`list`、`view`、`delete` 管理。

对 agent 工作流的直接意义是把「等 PR 状态」从轮询改为事件驱动，减少无效请求与上下文占用。

**相关链接**

- https://github.blog/changelog/2026-11-18-wait-for-pull-request-events-with-github-cli

### 6. Copilot 新增 8 个 GitHub 验证 MCP 连接器（Box、Buildkite、Calendly、ClickUp、Mixpanel、Supabase、Webflow、Wix），公开预览

**导语**

GitHub 宣布可通过 GitHub 验证的 MCP 服务器（连接器）把另外 8 个服务接入 Copilot，目前为公开预览。加上此前已支持的 25 个以上服务（如 Slack、Figma、Sentry），Copilot 可连接的服务数量进一步扩大。

**详细内容**

本期新增连接器包括 Box（检索与管理内容、使用 Box AI）、Buildkite（流水线与构建）、Calendly（日程与会议）、ClickUp（任务与项目）、Mixpanel（产品分析）、Supabase（项目与数据库）、Webflow 与 Wix（站点与内容管理）。

官方给出的用法示例是：在同一会话里让 Copilot 说明最近一次 Buildkite 构建失败的原因并直接修复代码，或在写迁移前先检查 Supabase schema。完整列表可在 Copilot 应用的 Customize 中查看。

**相关链接**

- https://github.blog/changelog/2026-11-18-connect-supabase-box-calendly-and-more-to-copilot

### 7. GitHub Enterprise Cloud（GHE.com）支持用 OIDC 把企业审计日志流式写入 Amazon S3

**导语**

GitHub 宣布，在带数据驻留的 GitHub Enterprise Cloud（GHE.com）上，企业可用 OpenID Connect（OIDC）把审计日志流式写入 Amazon S3，把此前只在 github.com 上可用的能力扩展到 GHE.com 域。

**详细内容**

本次改进的核心是鉴权方式：用 OIDC 完成鉴权后，GitHub 侧无需保存长期有效的 AWS 凭据，可直接向 S3 流式写入企业审计日志。官方同时给出了「用 OIDC 配置 S3 审计日志流」的设置指引链接。

对有数据驻留要求的企业而言，这减少了长期凭据在 GitHub 与 AWS 两侧的分布面。

**相关链接**

- https://github.blog/changelog/2026-11-19-s3-audit-log-streaming-with-openid-connect-expands-to-ghe-com

### 8. Amazon SageMaker JumpStart 上线模型排行榜，在 Studio 内横向对比 70+ 基础模型

**导语**

AWS 上线 Amazon SageMaker JumpStart Model Leaderboard，可在 SageMaker Studio 内并排比较 JumpStart 上的 70 多个开放权重基础模型，比较维度为质量、速度与成本。

**详细内容**

官方给出的动机是选型成本：逐一阅读模型卡、拼接不同来源、不同测试条件下的基准分数，既难对齐，也难以推断模型在具体用例中的表现与实际花费。

排行榜按官方描述直接集成在 SageMaker Studio 中，提供从候选清单到部署的路径。本期未取得完整榜单内容与各模型具体分数，条目只收录能力本身，不对具体模型排名做转述。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/introducing-the-amazon-sagemaker-jumpstart-model-leaderboard/

### 9. Amazon Bedrock AgentCore Identity 新增私有 CA 支持，面向自建 IdP 的 agent 身份接入

**导语**

Amazon Bedrock AgentCore Identity 现已支持私有证书颁发机构（private CA），使 agent 可以连接使用私有 CA 签发 TLS 证书的自建身份提供方（IdP），例如部署在内网中的 Keycloak 或 PingFederate。

**详细内容**

按官方说明，CA 证书以 PEM 编码形式存放在 AWS Secrets Manager 或 Amazon S3 中，再从 IdP 侧引用，从而让 agent 在访问内网身份系统时信任组织已有的私有 CA。

这是本期 AgentCore 方向两项更新中偏基础设施的一条，面向有强合规与内网隔离要求的 agent 落地场景。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/private-certificate-authority-support-in-amazon-bedrock-agentcore-identity

### 10. Exa 称在 AWS Neuron 上把嵌入吞吐提升 50%，用于索引数十亿网页文档

**导语**

搜索公司 Exa 在 AWS 官方博客中介绍其嵌入推理优化：使用 AWS Neuron 硬件（Inferentia2 与 Trainium）后，嵌入吞吐提升 50%，用于支撑数十亿级网页文档的索引。

**详细内容**

Exa 的技术背景是自研向量数据库承载真实网络索引：抓取并聚合公网、私有与合成来源，用多塔语义模型把网页数据与查询数据嵌入同一向量空间，支持自然语言复杂查询与关键词检索并行。

「吞吐提升 50%」为 Exa 与 AWS 在官方博客中的口径，未见第三方复测，本期按官方宣称标注，不表述为已独立验证的结果。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/exa-boosts-embedding-throughput-by-50-to-index-billions-of-documents-on-aws-ai-chips/

## 模型发布

### 11. Gemini 4 Neon 在 GitHub Copilot 正式可用

**导语**

GitHub 公告 Gemini 4 Neon 在 GitHub Copilot 中正式可用（generally available）。GitHub 称该模型面向 agentic 编码、多步工具调用与知识工作场景设计，具体能力对比为 Google 官方口径。

**详细内容**

本期未取到该 changelog 正文（页面抓取受限），条目事实依据为 GitHub 官方 changelog 的公告摘要：GA 状态、适用场景（agentic coding、multistep tool use、knowledge work）以及「据 Google，Gemini 4 Neon 在质量上……」的表述，后半句官方比较基准未取到，本期不转述具体比较对象与幅度。

同日晚间，Vercel 公告 Gemini 4 Neon 上架 AI Gateway（见后续追踪），说明该模型当日已进入分发通道。

**相关链接**

- https://github.blog/changelog/2026-11-18-gemini-4-neon-in-github-copilot
- https://vercel.com/changelog/gemini-4-neon-now-available-on-ai-gateway

### 12. Reson8 开源 Rumble-2-Flash：0.5B 语音识别模型，覆盖 40+ 语言（72 小时补收）

**导语**

Reson8 以 Apache 2.0 协议开源 Rumble-2-Flash：一个 0.5B 参数的语音识别模型，覆盖 40 多种语言并支持自动语种识别。发布方称其体量只有同类模型的 1/3 到 1/60，性能对标大 3–60 倍的模型。

**详细内容**

官方给出的能力清单包括：原生支持 🤗 Transformers 与 vLLM，无需自定义代码；输出控制支持数字以单词或数字形式输出、填充词、逐字重复与强制语种；速度上「一小时音频约需半秒」，批量处理时 RTFx 超过 7000。

性能口径方面，发布方称在 302 小时的呼叫中心基准上，其表现与 NVIDIA 的 Nemotron 3.5 Transcribe（30B）相当——这是发布方自测结论，本期未做独立复测。

**相关链接**

- https://huggingface.co/blog/rumble-2-flash

## 产品应用

### 13. NVIDIA RTX Spark 紧凑型桌面机上市，最高 128GB 统一内存，面向本地 agent 与模型微调

**导语**

NVIDIA 宣布 RTX Spark 紧凑型桌面机正式开售，ASUS、Dell、MSI 三家机型已上市，Acer、GIGABYTE、HP 与 Microsoft 的机型后续推出。整机最高提供 128GB 统一内存，定位是本地 AI agent、图像与视频生成以及模型微调。

**详细内容**

NVIDIA 称这类专用桌面机可在笔记本外出差或处理其他工作时，仍让 agent 与定时任务在机器上持续运行。软件生态方面，官方提到 Adobe 的原生 Windows on Arm 应用、Blender 中的 NVIDIA DLSS 射线重建，以及本地生成式工作流在既有 RTX Spark 笔记本与桌面机上的扩展。

本期未取得各厂商具体机型型号、价格与上市地区，条目只收录官方公告给出的品类与规格上限。

**相关链接**

- https://blogs.nvidia.com/blog/rtx-spark-desktop-local-ai-available-now/

### 14. Gemini 应用扩展到低内存 Android 设备，支持 Gemini Live 与自定义图像生成

**导语**

Google 宣布 Gemini 应用开始支持低内存 Android 设备，用户可在这些机型上使用 Gemini Live 与自定义图像生成功能。此前该能力受设备内存限制，覆盖机型范围有限。

**详细内容**

官方公告本身较短，核心信息是可用设备范围的下探——把 Gemini 应用的主要交互能力（含实时语音与图像创作）带到内存更小的 Android 设备上，面向无法承载高端机型的用户群。

本期未取得具体机型清单与最低内存门槛，条目不做推测性补充。

**相关链接**

- https://blog.google/innovation-and-ai/products/gemini-app/gemini-lower-memory-devices/

### 15. Snapchat 推出 Easy Lens CLI，可用 Claude Code、Cursor、Codex 等助手创建 AR Lens

**导语**

Snapchat 发布 Easy Lens CLI，把 Lens 创建带入开发者现有的 AI 助手工作流：创作者可用 Claude Code、Cursor、Codex 等工具，以自然语言描述想要的 AR 效果，由助手完成从生成到实现的全部技术工作。

**详细内容**

Easy Lens CLI 建立在已有的 Easy Lens 工具之上，后者可在网页与移动端用一句提示生成 Lens；CLI 版本面向已经用 AI 助手的开发者，让创作者专注于 Lens 的构思本身，而不必先掌握 Snapchat 自有的开发工具链。

分账方面，官方称加入 Lens+ Payouts 计划的开发者可以从通过 Easy Lens CLI 制作的 Lens 获得收益，Snapchat 称上月向 Lens+ 社区创作者支付了 180 万美元。

**相关链接**

- https://techcrunch.com/2026/11/18/snapchat-now-lets-developers-build-ar-lenses-with-ai-coding-assistants-like-claude-code-and-cursor/

### 16. Vercel：Parallel 快速网页搜索在 AI Gateway 限时免费至 2027-01-31（72 小时补收）

**导语**

Vercel 公告，Parallel 的快速模式网页搜索在 AI Gateway 上限时免费至 2027 年 1 月 31 日，同时 Parallel 成为 eve agent 的默认网页搜索工具。该工具适用于任何 AI Gateway 模型，无需单独申请 Parallel API key。

**详细内容**

按官方说明，Parallel 会找出相关网页并返回带链接的结果（快模式）。限时免费期明确到具体日期（2027-01-31），属于本期例程需要重点跟进的「限时免费能力」一类信息；到期后是否收费、是否调整额度，官方未在公告中说明。

「限时免费」适用于 fast mode 搜索调用，slow mode 或其他 Parallel 用法的计价本期未取到明确口径。

**相关链接**

- https://vercel.com/changelog/parallel-web-search-is-free-on-ai-gateway-and-eve-through-january-31

## 技术与洞察

### 17. SageMaker AI Serverless 模型定制新增全参数微调（FFT），并给出与 LoRA 的基准对比

**导语**

Amazon SageMaker AI 的 Serverless 模型定制新增全参数微调（Full Fine-Tuning，FFT）支持。AWS 官方博客给出 FFT 与 LoRA 在关键基准上的对比，并分析了两者质量差距背后的权重矩阵谱性质。

**详细内容**

官方给出的业务前提是微调的双重收益：领域任务的准确率提升，以及用更小的专用模型在特定任务上达到或超过前沿模型、从而显著降低单 token 推理成本；成本优势在百万级请求上会持续累积。

博客还分享了实践性调参建议。FFT 与 LoRA 的基准对比数字为 AWS 官方口径，本期未逐项复测。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/full-fine-tuning-fft-on-sagemaker-ai-serverless-model-customization/

### 18. SageMaker HyperPod 新增工作负载恢复与扩展基础设施检查，捕捉「节点正常但任务已停」的故障

**导语**

Amazon SageMaker HyperPod 新增工作负载恢复（workload recovery）与扩展的基础设施检查（infrastructure checks），用于更早发现训练任务的隐性故障，提升训练工作负载的有效产出（goodput）。

**详细内容**

官方描述的典型故障包括：GPU 存在轻微缺陷、压力测试通过但返回错误结果；作业卡在 NCCL 超时上，GPU 仍被占用、Slurm 仍显示任务运行中；单个节点上的 device plugin 崩溃，但报错信息完全不提 plugin。这类问题通常要等 loss 发散或作业失败之后才被发现，此时算力已经消耗掉。

新增能力的价值在于把「作业没在推进但看起来一切正常」变成可被主动捕获的事件。

**相关链接**

- https://aws.amazon.com/blogs/machine-learning/introducing-workload-recovery-and-expanded-infrastructure-checks-on-amazon-sagemaker-hyperpod/

### 19. 社区实践：在 32GB 内存的 Mac 上流式运行 180B MoE 模型（72 小时补收）

**导语**

Hugging Face 社区作者撰文记录了在 32GB 内存的 Mac 上让 Qwen3.8-Flash-Next 这类 180B 规模 MoE 模型可用的实验：通过让专家层（experts）从 SSD 流式加载，在 token 生成上与 Strata 相差在 6% 以内。

**详细内容**

作者的做法是在 Transformers 侧开启专家卸载（experts_offload），把约 121GB 的专家权重放到 SSD 上按需读取，从而把「需要常驻的 180B 参数」压缩为「32GB 内存 + SSD 流式读取」。

性能差距 6% 以内为作者本人实测口径，涉及的具体硬件与测试设置本期未逐项核对，不作为已独立验证的结论。这类「用消费级内存跑超大 MoE」的路径对本地部署的读者有参考价值。

**相关链接**

- https://huggingface.co/blog/moe-expert-streaming

## 行业动态

### 20. 花旗更新在线用户协议：使用第三方 AI 代理的个人理财客户自行承担交易风险

**导语**

花旗本周更新在线用户协议，明确告知使用第三方 AI 工具管理个人财务的客户：由此产生的交易风险由客户自行承担，即使账户因此被入侵。报道称，这是美国第三大商业银行继摩根大通、美国银行之后的又一家采取同类立场。

**详细内容**

背景是 AI 代理可以被授予银行账户与在线金融门户的凭据，用于分析消费与投资、给出建议，甚至处理交易与账单支付。花旗发言人向 TechCrunch 表示，此举是为了让客户理解共享银行凭据或授权第三方工具访问账户的相关风险，并强调选择授权的客户需对经由这些代理进行的活动负责。

报道还提到，JPMorgan 与 Bank of America 已于上月宣布类似政策，排名第八的 PNC 同日更新条款；花旗的措辞被认为比同行更进一步。本期未取到各行协议原文，涉及具体条款的表述以该媒体报道为准。

**相关链接**

- https://techcrunch.com/2026/11/18/more-banks-says-customers-using-ai-agents-are-on-their-own-even-if-they-get-hacked/

## 前瞻与传闻

### 21. Palmer Luckey 称 AI 驱动的网络攻击增速超过防御能力（观点性发言 · 未经证实的技术判断）

**导语**

Anduril 联合创始人 Palmer Luckey 表示，AI 驱动的网络攻击在速度上已经超过防御方能力，并称「是时候开始跑了」。报道同时提到，他的判断针对的是大量系统仍在使用过时技术、留下可被利用的脆弱面。

**详细内容**

这是行业高管的观点性表态，不是经过验证的技术结论，本期不将其作为已确认事实收录，也不据此推断具体攻击事件或产品能力。其中「中国会乐于看到黄仁勋出局、因此应让其复任」属于同一场访谈中的政治观点，与本期技术生态监测相关性较低，不展开。

**相关链接**

- https://techcrunch.com/2026/11/18/palmer-luckey-warns-ai-powered-cyberattacks-are-outpacing-defenses-its-time-to-start-running/

## 后续追踪

* **Anthropic IPO**：11-19 定价 83 美元/股、募资 813 亿美元 → 下一步关注首日交易表现，以及首份 10-Q 中披露的持股结构与风险因素。
* **NVIDIA 10-Q 申报**：管理层称「未来几周内」提交 → 下一步关注是否在文件中追加与黄仁勋相关调查的风险因素，以及是否出现对 EP023 已报道事项的新增事实。
* **NVIDIA 人事与出口管制**：董事会表态不打算让黄仁勋回归、Kress 任代理 CEO → 下一步关注 Kress 任期安排与对华出口通道后续公告。
* **银行对 AI 代理的免责条款**：花旗更新协议，摩根大通、美国银行、PNC 跟进 → 下一步关注是否扩展到更多机构，以及监管层是否对此类条款表态。
* **Gemini 4 Neon 分发**：在 GitHub Copilot GA 并上架 Vercel AI Gateway → 下一步关注各渠道的定价、配额与第三方实测数据。
* **Vercel / Parallel 限时免费**：fast mode 网页搜索免费至 2027-01-31 → 下一步关注到期后的计价口径与额度变化。
* **Rumble-2-Flash 复现**：0.5B 语音模型称在 302 小时呼叫中心基准上对标 Nemotron 3.5 Transcribe（30B）→ 下一步关注第三方复测与真实延迟数据。

## 编辑备注

* 本期实际检索窗口为 2026-11-18 22:00 — 2026-11-19 21:00（Asia/Shanghai），并按 72 小时范围补扫 11-17 之后未覆盖的一手源更新；与 EP023（覆盖至 11-18 22:00）去重后保留本期条目。
* 条目 12、16、19 标注「72 小时补收」：事件首次公开时间为 11-18 白天或更早，落在主窗口之前，但 EP023 未收录，故本期补入并标明时间口径。
* 本期采集的一手源 RSS 中，Anthropic、Microsoft AI、Meta AI、Mistral 四个 feed 返回 404/410 或空响应，DeepMind feed 解析失败，相关官方更新本期无法直接核对。
* Anthropic IPO 定价与 NVIDIA 10-Q 推迟两项目前均为二级媒体（TechCrunch）单一来源，官方定价公告与 SEC 文件原文未取到，正文已保留「据报道」限定语。
* TechCrunch 原文在介绍 Anthropic IPO 时提及 OpenAI 估值写作「$1.25 billion」，与同段落语境明显不符，本期不引用该数字。
* 原计划收录的 DaisyRose-27B（RadixArk）条目在发布前链接复核时返回 HTTP 404，按链接门槛撤下，模型发布栏目改收 Rumble-2-Flash。
* 本期未调用 NotebookLM 视频与音频能力（CMP-472 口径），交付物为 Markdown 正文母版 + HTML 专业报告 + 来源清单 + 发布建议与待确认项。
