# AI 早报 2026-11-10

> 检索时间窗：2026-11-09 07:00 ~ 2026-11-10 07:00（Asia/Shanghai，24 小时），重要遗漏补至 72 小时（2026-11-07 07:00 起）。
> 目标读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者。

## 今日概览

**要闻**

1. Anthropic 发布 Claude Fable 5.2 与 Mythos 5.2：每百万输入 token 8 美元、输出 40 美元，fast mode 16/80 美元；官方称输出比 5.1 快最多 30%
2. Fireworks AI 扩大披露 10 月安全事件影响范围：部分客户数据集、不完整模型权重与账单信息被访问，官方称与「LLMJacking」转卖 token 有关

**开发生态**

3. Claude Code v2.1.321：新增 Claude Fable 5.2 为默认 Fable 模型（1M 上下文），并修复 MCP OAuth 重定向时向其他主机发送刷新令牌的问题
4. llama.cpp 在 11 月 9 日一天内发布 b12212 至 b12236 共 11 个构建：OpenAI 兼容端点修复顶层 json_schema 被静默忽略，另新增外部 PLE 文件加载
5. LiteLLM v1.108.4（LTS 线）：Docker 镜像启用 cosign 签名，回合并 8 项修复到 lts/1.108.x
6. Open WebUI v0.13.3：自动化任务可调用编码 agent，聊天中可切换终端与工作目录，并修复明文 HTTP 下复制按钮失效
7. openai-python v3.48.0：beta Responses 识别 gpt-6-rosalind，并为 agent 会话增加流选项

**模型发布**

8. Meta 发布 Muse Ember：输入每百万 token 0.10 美元、输出 0.50 美元，1M 上下文，最大输入 1,048,576 token、最大输出 524,288 token

**产品应用**

9. ChatGPT Enterprise 上线 AWS Marketplace；OpenAI 同日发布 Control Room，用于追踪并停止研究基础设施上的模型工作负载
10. GitHub Copilot 上线 Claude Fable 5.2
11. Automattic 发布 Spacefast 部署平台，面向 vibe-coding 应用；Medium 发布写作助手应用 TK

**技术与洞察**

12. Anthropic 称 Fable 5.2 用约 1,000 个 agent 在 30 小时内完成费马大定理证明形式化，并称 Mythos 5.2 的 CVE 复现能力高于 Opus 5.5 与 Mythos 5.1

**行业动态**

13. Anthropic 采购价值 34 亿美元的燃气轮机；SpaceX 在德州 Starbase 公示建设燃气电厂与超算设施，首期投资约 240 亿美元

**前瞻与传闻**

- Meituan（美团）发布 1.6 万亿参数新模型（中文科技媒体，单一来源 · 未核实）https://tech.ifeng.com/c/8xjHpT7wJEN
- Moonshot 的 Kimi K3.1 Pro 进入 Microsoft Foundry，并发布模型权重（中文科技媒体转述 Microsoft 技术社区博客，单一来源 · 未核实）https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/moonshot-ai%E2%80%99s-kimi-k3-1-pro-comes-to-microsoft-foundry/4570292

## 要闻

### 1. Anthropic 发布 Claude Fable 5.2 与 Mythos 5.2：每百万输入 token 8 美元、输出 40 美元，fast mode 16/80 美元；官方称输出比 5.1 快最多 30%

**导语**

Anthropic 于 2026 年 11 月 9 日发布 Claude Fable 5.2 与 Claude Mythos 5.2。官方称两者为同一底层模型，Fable 面向全部用户开放，Mythos 需通过网络安全与生命科学验证项目申请。价格方面，输入每百万 token 8 美元、输出每百万 token 40 美元，可选 fast mode 价格为 16 美元与 80 美元。

**详细内容**

官方博客给出的差异点集中在三处。一是速度与价格：官方称相较 Claude Fable 5.1 与 Claude Mythos 5.1，新版本输出速度最高提升 30%，且价格更低；fast mode 可将 token 生成速度再提升最多 2.5 倍。二是能力分布：官方列出的基准中，Fable 5.2 在 FrontierCode 2.0（agentic coding，Xhigh 档）得分 49.1%，官方称为其测试过的已发布模型中最高分；在 Humanity's Last Exam（带工具）上为 74.2%；在 RoboDojo Sim 上为 64.9%，官方称超过同一运行条件下 GPT-6 Astra 的 29.8%。三是安全防护：官方称 Fable 5.2 相对 Fable 5.1 在 claude.ai、Claude Code 与 Cowork 上误拦截次数减少约 55%（网络安全方向约 60%，生物方向约 40%）。

可用性方面，官方称 Claude Fable 5.2 当日在全部平台上线，包含 AWS、Google Cloud 与 Microsoft Azure，开发者可使用模型 ID `claude-fable-5-2`；fast mode 可用于 Claude Code、Claude Platform、Google Cloud 上的 Claude 模型与 Microsoft Foundry。Claude Code v2.1.321 的发布说明补充了该模型为 1M 上下文、每 Mtok 输入 8 美元与输出 40 美元、缓存读取 0.20 美元/Mtok。官方同时说明，Anthropic 训练阶段对加速器内核优化与大模型架构改进等能力做了限制，使这两款模型在这些方向上的表现与 Opus 5.5 相当。

**相关链接**

- Anthropic 官方发布页：https://www.anthropic.com/claude-fable-and-mythos-5-2
- Claude Code v2.1.321 发布说明（含模型 ID、上下文与价格）：https://github.com/anthropics/claude-code/releases/tag/v2.1.321
- 价格与速度报道（The New Stack，经 Techmeme 聚合）：https://www.techmeme.com/261109/p40

### 2. Fireworks AI 扩大披露 10 月安全事件影响范围：部分客户数据集、不完整模型权重与账单信息被访问，官方称与「LLMJacking」转卖 token 有关

**导语**

Fireworks AI 于 2026 年 11 月 9 日更新其 10 月安全事件公告，称此前只知道被访问的是 Fireworks 自身存储的密钥（如评测作业使用），此后发现部分账号的账单与账户信息、以及部分账号的密钥、数据集和不完整模型权重也受影响。官方称证据指向一个以牟利为目的的网络犯罪团伙，其手法是把非法获取的大语言模型 token 卖给出价方路由网关，即「LLMJacking」。

**详细内容**

官方公告称，事件响应中已通知执法部门，并聘请 Palo Alto Networks Unit 42 协助取证。公告称第三方云服务商托管的 Fireworks 研发机器在 10 月 23 日发生安全事件，10 月 24 日该未授权第三方借此到达 Fireworks 开发机器并运行非授权工作负载，造成额外客户数据影响；Fireworks 当日即检测到该活动，截至 10 月 25 日未再发现针对客户所使用平台的成功未授权访问。

受影响的内部应用可访问的信息类别包括：资源元数据（Fireworks 资源标识、显示名、描述、创建时间等）；账单信息（账单与收货地址、发票与支付记录、账户余额与额度消耗），官方明确说明不存储支付卡号、支付卡号未受影响；以及部分客户的模型权重与数据集，其中被访问的是不完整模型权重与数据集的子集。官方称未检测到 Inference、Training SDK 与 Nexus 受到影响，这三者默认均为零数据保留（ZDR）。处置方面，官方已吊销并更换凭据与服务账号、收紧网络隔离、复核数据存储与分析系统访问控制；调查期间已停用 Batch Inference 与数据集训练使用的自助数据集上传与下载，Training SDK 仍可用且为 ZDR。

**相关链接**

- Fireworks AI 官方安全公告（2026-11-09 更新）：https://fireworks.ai/security/bulletins/october-2026-security-incident-update
- Fireworks AI 安全公告列表：https://fireworks.ai/security/bulletins
- Forbes 报道（Anna Tong，经 Techmeme 聚合）：https://www.forbes.com/sites/annatong/2026/11/09/fireworks-cyberattack-exposes-customer-data-and-ai-models-as-fallout-widens/

## 开发生态

### 3. Claude Code v2.1.321：新增 Claude Fable 5.2 为默认 Fable 模型（1M 上下文），并修复 MCP OAuth 重定向时向其他主机发送刷新令牌的问题

**导语**

anthropics/claude-code 于 2026 年 11 月 9 日 19:22 UTC 发布 v2.1.321。发布说明首条即新增 Claude Fable 5.2（`claude-fable-5-2`）并将其设为默认 Fable 模型，标注 1M 上下文、每 Mtok 输入 8 美元与输出 40 美元、缓存读取 0.20 美元/Mtok；同批修复了 MCP OAuth 请求在服务器重定向时把刷新令牌等机密发送到另一主机的问题。

**详细内容**

除模型接入外，本次发布还包含若干行为变更与修复。功能方面，新增 `claude remote-control --settings <file>`，该设置文件会应用到它启动的每个会话；文件变更后需重启 `claude remote-control` 才会有新会话启动。安全方面，修复了只读 Bash 命令在沙箱外执行且未弹权限提示的情形，修复了 Bash 权限检查把文件写入判到错误目录而未提示的情形，以及 deny 规则与受保护文件提示未覆盖 `cp` / `mv` 写入目标文件的问题。行为方面，修复了 `/config` 在新会话以 auto 模式启动时把 Manual 显示为默认权限模式的问题，并修复了 `/compact` 在 Web 与移动端 Remote Control 中显示两次的问题。官方还修复了 `NotebookEdit` 在未指定单元格时删除或覆盖首个单元格的问题，以及在 UNC 共享、WSL 目录、`/net` 挂载等网络路径上的 Edit 与 NotebookEdit 行为差异。

**相关链接**

- Claude Code v2.1.321 发布说明：https://github.com/anthropics/claude-code/releases/tag/v2.1.321
- Claude Code 仓库：https://github.com/anthropics/claude-code

### 4. llama.cpp 在 11 月 9 日一天内发布 b12212 至 b12236 共 11 个构建：OpenAI 兼容端点修复顶层 json_schema 被静默忽略，另新增外部 PLE 文件加载

**导语**

llama.cpp 于 2026 年 11 月 9 日一天内连续发布 b12212 至 b12236 共 11 个构建。其中 b12229 修复 OpenAI 兼容 chat completions 端点：`response_format` 直接以 `schema` 提供时会被静默忽略，生成过程不受约束；b12233 支持加载外部 PLE 文件。

**详细内容**

b12229（#28697）说明，旧实现只在 schema 嵌套于 `response_format.json_schema.schema` 时才应用；按服务器 README 文档说明直接在 `response_format.schema` 提供时会被忽略，导致生成不受约束。本次改动按 `response_format` 是否含 `json_schema` 键来选择 schema 来源，错误信息中补充 `json_schema`，并在 README 中说明 OpenAI 包装形式。

其余构建覆盖后端正确性与新能力。b12220（#30711）把 Metal 的 `ggml_tri` 从「与 0/1 比较结果相乘」改为 select，原因是相乘会把三角区域外的 ±inf 变成 NaN，而 CPU 内核写入的是普通的 0；改动同时新增 `test_tri_special` 用例覆盖四种三角类型。b12221（#31662）修复 Metal FA 输出缓冲区的越界写。b12224（#31419）停止上传没有被读取的输入。b12228（#30712）为 TRI 补上反向传播，`GGML_OP_TRI` 此前在反向 switch 中没有分支，含该算子的可训练图会直接中止。b12233（#31185）支持加载外部 PLE 文件：`--ple` 成为 `--shard` 的别名，两者都接受逗号分隔列表且可多次给出，编号分片仍会自动发现并严格校验。b12223（#31449）为 Granite 各架构附加 NVFP4 权重 scale。b12212（#31905）与 b12230（#31824）为 IBM 的 ggml-zdnn 后端修复发布二进制未检测后端库、以及接受非 zdnn 张量并在每次算子后失效计算张量。b12219（#31935）为 OpenCL 引入 climits。b12236（#31964）新增 `mtmd_helper_resampler`。

**相关链接**

- llama.cpp Releases：https://github.com/ggml-org/llama.cpp/releases
- b12229（response_format json_schema 修复）：https://github.com/ggml-org/llama.cpp/releases/tag/b12229
- b12233（外部 PLE 文件加载）：https://github.com/ggml-org/llama.cpp/releases/tag/b12233
- b12220（Metal ggml_tri 改用 select）：https://github.com/ggml-org/llama.cpp/releases/tag/b12220

### 5. LiteLLM v1.108.4（LTS 线）：Docker 镜像启用 cosign 签名，回合并 8 项修复到 lts/1.108.x

**导语**

BerriAI/litellm 于 2026 年 11 月 9 日 23:00 UTC 发布 v1.108.4。发布说明的主线是镜像供应链：所有 LiteLLM Docker 镜像开始用 cosign 签名，本版使用 commit `e82a3c6` 引入的公钥，官方给出按固定 commit 哈希与按版本标签两种校验方式。

**详细内容**

官方给出的校验命令为 `cosign verify --key <公钥地址> ghcr.io/berriai/litellm:v1.108.4`，并说明 commit 哈希方式最强、标签方式依赖仓库的标签保护规则。变更清单为 8 项往 lts/1.108.x 线的回合：回合并视频相关 PR #48490 与 #44614；回合并 SDK 修复 #45961；回合并 Bedrock 的 `guardrailConfig` 透传守卫与集成测试修复 #47429；回合并 Anthropic 加密推理往返 #49076；回合并 Vertex AI 上 Anthropic 行格式的 Claude batches #45715；回合并 Bedrock #50073；回合并 `/v1/messages` Responses 桥接的后台拒绝 #49076 之外的后台拒绝处理；以及把 litellm 版本提升到 1.108.4。

**相关链接**

- LiteLLM v1.108.4 发布说明：https://github.com/BerriAI/litellm/releases/tag/v1.108.4
- LiteLLM 仓库：https://github.com/BerriAI/litellm

### 6. Open WebUI v0.13.3：自动化任务可调用编码 agent，聊天中可切换终端与工作目录，并修复明文 HTTP 下复制按钮失效

**导语**

open-webui 于 2026 年 11 月 8 日 23:48 UTC 发布 v0.13.3。主要新增是自动化编辑器可以指定终端与工作目录并选择该终端上可用的编码 agent，定时运行会使用保存的终端与目录，并在启动前检查终端与 agent 是否仍可用。

**详细内容**

新增功能还包括：聊天中发出消息后可更换终端或工作目录，临时聊天同样适用，回复生成过程中两个控件保持禁用。官方同时记录了一组回退与限制：连接终端不再把其编码 agent 加入 Admin Models、基础模型选择器、Arena 候选、任务模型设置、组默认值、子 agent 设置、频道提及或 Playground，笔记也不再为生成标题选择终端 agent；agent 不能被保存或导入为自定义模型，其聊天菜单也不再提供 Edit。修复部分包含：切换聊天终端后 Files 标签跟随该终端更新（#33954）、在局域网明文 HTTP 地址下复制评论链接、搜索链接、共享聊天链接、webhook URL、聊天 ID、Git 分支名、commit 与表格单元格恢复可用（#33939）、使用剪贴板占位符的提示词在浏览器拦截剪贴板时改为插入并说明无法读取、以及在 Provider 设为 `llama.cpp` 时 DeepSeek 思考模式不再报缺少推理错误（#33950）。

**相关链接**

- open-webui v0.13.3 发布说明：https://github.com/open-webui/open-webui/releases/tag/v0.13.3
- open-webui 仓库：https://github.com/open-webui/open-webui

### 7. openai-python v3.48.0：beta Responses 识别 gpt-6-rosalind，并为 agent 会话增加流选项

**导语**

openai/openai-python 于 2026 年 11 月 9 日 16:12 UTC 发布 v3.48.0。两条功能变更分别是：为 agent 会话增加流选项（#4251），以及在 beta Responses 中识别 `gpt-6-rosalind`（#4257）。

**详细内容**

其余条目属于维护性变更：保留 agent 调度支持的 chore（#4255）、锁定 multidict 由 6.9.1 升至 7.1.0（#4259）、开发依赖组 5 项更新（#4258）、types-requests 由 2.33.0.20261006 升至 2.33.0.20261030（#4260），以及整合 AGENTS.md 文档（#4254）。

**相关链接**

- openai-python v3.48.0 发布说明：https://github.com/openai/openai-python/releases/tag/v3.48.0
- openai-python 仓库：https://github.com/openai/openai-python

## 模型发布

### 8. Meta 发布 Muse Ember：输入每百万 token 0.10 美元、输出 0.50 美元，1M 上下文，最大输入 1,048,576 token、最大输出 524,288 token

**导语**

Meta 超级智能实验室于 2026 年 11 月 9 日发布 Muse Ember，Meta 称其为该实验室至今最轻量、成本效率最高的模型，定位是「复杂推理执行与 agent 全天重复的工作」：工具调用、编码子任务、路由、信息抽取与长文档解析。据 TechCrunch 报道，Ember 的输入价格为每百万 token 0.10 美元；OpenRouter 的模型接口记录为输入每百万 token 0.10 美元、输出每百万 token 0.50 美元，上下文 1,048,576 token。

**详细内容**

Meta 在公告中的表述是：该模型为高吞吐量的 agent 场景设计，通常与更大的 Muse Wonder 搭配使用——重模型先确定处理规则，再由轻量模型把规则应用到成千上万条用例上，官方概括为「Muse Wonder plans, Muse Ember handles the volume」。官方还称 Ember 跨文本、图像与音频训练，可直接读截图、图表与扫描文档，或处理语音备忘、会议录音与视频，无需额外模型。按 TechCrunch 报道，Meta 用 Artificial Analysis 的综合基准分数说明 Ember 的单任务成本，并称其在成本与智能程度上优于 Anthropic 的 Haiku 与 OpenAI 的 Luna，且与 DeepSeek V4.1 Flash、GLM 5.3 Flash 等开源竞争者成本相当。

Google Cloud 官方文档已收录该模型：模型 ID 为 `meta/muse-ember-1.0`，上线阶段为 Preview，支持文本与图像输入、文本输出，最大输入 token 1,048,576、最大输出 token 524,288，支持函数调用、结构化输出与推理，按量付费可用。OpenRouter 模型接口给出的 `meta/muse-ember` 定价为输入每百万 token 0.10 美元、输出每百万 token 0.50 美元，上下文 1,048,576 token；同接口下 `meta/muse-wonder` 为输入 4 美元、输出 20 美元每百万 token。Muse Ember 是 Meta Muse 品牌下的第四款模型，此前依次为 4 月发布的中端 Spark、8 月发布的 Spark 开源孪生模型 Glimmer 与 10 月发布的前沿模型 Wonder。

**相关链接**

- Meta AI Research 官方发布页：https://research.meta.ai/blog/muse-ember （本次采集环境对该域名的 DNS 解析不可达，未能自动核验，需人工打开确认）
- Google Cloud 官方模型文档：https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/partner-models/meta/muse-ember-1-0
- OpenRouter 模型接口（定价与上下文）：https://openrouter.ai/meta/muse-ember
- TechCrunch 报道（Russell Brandom）：https://techcrunch.com/2026/11/09/meta-releases-muse-ember-a-new-lightweight-model-for-agent-execution/

## 产品应用

### 9. ChatGPT Enterprise 上线 AWS Marketplace；OpenAI 同日发布 Control Room，用于追踪并停止研究基础设施上的模型工作负载

**导语**

OpenAI 官方新闻页于 2026 年 11 月 9 日 19:00 UTC 发布 ChatGPT Enterprise 现已在 AWS Marketplace 上线。同日 13:00 UTC，OpenAI 发布 Control Room，官方描述其为一套用于跨研究基础设施追踪并停止模型工作负载的集中系统。

**详细内容**

ChatGPT Enterprise 进入 AWS Marketplace 属于企业采购渠道变更：企业客户可在 AWS 侧完成订阅与计费流程。同日的 Control Room 属于研究基础设施侧的能力说明，官方将其定位为「一套追踪并停止模型工作负载的集中系统」，指向对内部研究算力调度的集中管控。

本期未从官方页面取得 Control Room 的具体功能清单与接入方式，因此这些参数不予补写。

**相关链接**

- ChatGPT Enterprise 上线 AWS Marketplace：https://openai.com/index/chatgpt-enterprise-aws-marketplace
- Control Room 官方说明：https://openai.com/index/control-room

### 10. GitHub Copilot 上线 Claude Fable 5.2

**导语**

GitHub 官方 Changelog 于 2026 年 11 月 9 日发布 Claude Fable 5.2 in GitHub Copilot。Anthropic 同日发布 Fable 5.2 与 Mythos 5.2，GitHub Copilot 成为该模型的首批接入渠道之一。

**详细内容**

Changelog 标题明确为 Claude Fable 5.2 in GitHub Copilot。本期未从该 Changelog 页面取得具体的模型选择路径、可用套餐与限制说明，故这些细节不予补写；模型的上下文长度与价格以 Anthropic 官方发布页与 Claude Code 发布说明为准（见第 1 条）。

**相关链接**

- GitHub Changelog 原文：https://github.blog/changelog/2026-11-09-claude-fable-5-5-in-github-copilot
- Anthropic 官方发布页：https://www.anthropic.com/claude-fable-and-mythos-5-2

### 11. Automattic 发布 Spacefast 部署平台，面向 vibe-coding 应用；Medium 发布写作助手应用 TK

**导语**

Automattic 于 2026 年 11 月 9 日发布 Spacefast，一个用于部署 vibe-coding 应用的平台，TechCrunch 报道称其目标是在这一变化中的互联网环境中与 Lovable 等同类产品竞争。同日 Medium 发布写作助手应用 TK，把 AI 辅助直接放进写作流程。

**详细内容**

TechCrunch 对 Automattic 的描述是「在互联网环境变化的背景下推出部署 vibe-coding 应用的平台」，并称 Automattic 的目标竞争对手包括 Lovable。对 Medium 的 TK 应用，报道提到该应用把 AI 辅助直接纳入写作过程，而同期关于 AI 在出版中角色的争议仍在持续。本期未从官方来源取得 Spacefast 的定价、上架渠道与 TK 的功能清单，因此这些细节不予补写。

**相关链接**

- TechCrunch：Automattic 发布 Spacefast：https://techcrunch.com/2026/11/09/automattic-debuts-a-platform-to-deploy-vibe-coding-apps-amid-a-changing-internet/
- TechCrunch：Medium 的 TK 应用：https://techcrunch.com/2026/11/09/mediums-new-tk-app-brings-ai-assistance-directly-into-the-writing-process/

## 技术与洞察

### 12. Anthropic 称 Fable 5.2 用约 1,000 个 agent 在 30 小时内完成费马大定理证明形式化，并称 Mythos 5.2 的 CVE 复现能力高于 Opus 5.5 与 Mythos 5.1

**导语**

Anthropic 在官方发布页中给出两项技术声明。其一，官方称由约 1,000 个 Fable 5.2 agent 组成的团队在 30 小时内完成了费马大定理证明的形式化，而首次形式化（由未发布的研究版本 Claude 完成）耗时 11 天。其二，官方称在内部的 CVE Rediscovery 评测中，Claude Mythos 5.2 发现的漏洞比 Opus 5.5 多 10.2%、比 Mythos 5.1 多 14.4%。

**详细内容**

形式化方面，官方说明 Fable 5.2 从最少提示出发，自行建立协作方式，未使用数学参考资料，只用一份中间定理陈述清单来衡量进展；官方称其动作 token 用量为首次形式化的三分之一，证明长度短 7 倍。官方同时给出对照：Opus 5.5 在相同的 1,000 agent 配置下，18 小时完成 26%，30 小时后几乎没有更多进展。安全侧，官方称 2026 年 10 月针对 1,829 个 CVE 的测试中，Mythos 5.2 在每个 effort 档位都优于 Mythos 5.1 与 Opus 5.5。

这些均为发布方自述结果，尚未见独立复现，本期按官方口径表述，不作为已独立验证的结论。相关基准的第三方评测另有报道可对照：CNBC 与 VentureBeat 等媒体同日报道了 Anthropic 的相关发布。

**相关链接**

- Anthropic 官方发布页（科学与工程、数学形式化、CVE Rediscovery 章节）：https://www.anthropic.com/claude-fable-and-mythos-5-2
- TechCrunch 报道：https://techcrunch.com/2026/11/09/anthropic-releases-new-mythos-and-fable-models-amid-rsi-concerns/

## 行业动态

### 13. Anthropic 采购价值 34 亿美元的燃气轮机；SpaceX 在德州 Starbase 公示建设燃气电厂与超算设施，首期投资约 240 亿美元

**导语**

Anthropic 被报道已采购价值 34 亿美元的燃气轮机，加入科技公司自建电源的行列。据彭博社报道，SpaceX 计划在德州 Starbase 建设燃气电厂与超算设施，依据一份公示听证文件，首期投资规模约 240 亿美元。

**详细内容**

TechCrunch 对 Anthropic 一事的表述是：Anthropic 在一笔可能让其产生购买后悔的交易中买入了价值数十亿美元的燃气轮机。这条线索与本期更早的报道同源——2026-10-28 期早报已记录据《金融时报》报道 Anthropic 向 OnePWR 采购 1.7GW 燃气发电机承诺、金额 34 亿美元（经 Techmeme 聚合），本期为该事件的进展补充：金额与主体由另一家媒体报道。

SpaceX 一侧，彭博社援引公示听证文件称，SpaceX 计划在其位于得州的公司城 Starbase 建设、持有并运营燃气电厂与超算设施。相关公示文件由得州 Starbase 市发布，文件主题为税收减免听证。本期未从公示文件原文逐项核对装机容量与分期结构，故不补写相关数字。

**相关链接**

- TechCrunch：Anthropic 采购 34 亿美元燃气轮机：https://techcrunch.com/2026/11/09/anthropic-joins-ais-natural-gas-frenzy-buys-3-4b-worth-of-turbines/
- Techmeme 聚合页（彭博社报道）：https://www.techmeme.com/261109/p41
- Starbase 市公示听证通知：https://cdn.prod.website-files.com/67fcab04e05680343de9ea4e/6aee00848f7bbe0cdee604da_6aee005cf2854ef8fc7713ed_Public_Hearing_Notice_Tax_Abatement_Dec9_2026.pdf

## 后续追踪

* **Anthropic 费马大定理形式化**：官方称 1,000 个 Fable 5.2 agent 用 30 小时完成形式化，首次形式化耗时 11 天 → 本期无新增进展 → 下一步关注预印本是否公开、证明是否被独立校验，以及官方称「未使用数学参考资料」的方法学争议。

* **Fireworks AI 安全事件**：10 月 9 日首份公告称仅评测作业密钥被访问 → 本期（11 月 9 日）公告扩大披露至账单与账户信息、部分密钥、数据集与不完整模型权重，并首次指向 LLMJacking 团伙，自助数据集上传与下载已停用 → 下一步关注是否再更新受影响范围、被停用的数据集能力何时恢复，以及是否有后续的补偿或客户迁移公告。

* **Nvidia 董事会调查（黄仁勋涉外国情报）**：EP014 已报道董事会启动内部调查并称没有理由相信机密外泄 → 本期新增进展为彭博社/AP 报道特朗普称联邦调查局正在调查此事、纽约时报报道商务部对 Megaspeed 的调查在 Nvidia 介入后被移交司法部、Nvidia 股价随之下跌、黄仁勋退出 ElevenLabs 峰会、另有报道称卖空机构 Culper Research 早在半年前就公开标记过相关关系 → 下一步关注国会三个委员会要求黄仁勋出席作证、股东诉讼进展与 NVIDIA 官方公告口径变化。

* **Anthropic 燃气轮机采购**：2026-10-28 期早报记录其向 OnePWR 采购 1.7GW 承诺、金额 34 亿美元 → 本期新增 TechCrunch 报道其已实际买入价值 34 亿美元的燃气轮机 → 下一步关注发电机组交付时间表、选址与 Anthropic 是否披露对应的电力协议。

* **开源推理栈**：EP014 已报道 llama.cpp b12207 的 SSM_SCAN d_state=64 GPU 快路径与 b12208 的 radix Top-K 确定性改动 → 本期新增 b12229 修复 OpenAI 兼容端点顶层 `json_schema` 被静默忽略（此前生成不受约束）、b12233 支持外部 PLE 文件加载、b12220 把 Metal `ggml_tri` 从相乘改为 select 以避免 ±inf 变 NaN → 下一步关注这些改动进入稳定版的时间与 vLLM、sglang 侧是否跟进。

## 编辑备注

1. **本期真实检索时间窗**：2026-11-09 07:00 至 2026-11-10 07:00（Asia/Shanghai），共 24 小时；个别条目（如第 13 条 Anthropic 燃气轮机）回溯至 72 小时内的早期报道，并已在条目内说明来源关系。
2. **官方宣称与独立验证的区分**：第 1、8、12 条中的基准分数、成本对比与「30 小时完成形式化」等均为发布方自述，本期按「官方称」表述，未写成已独立验证的事实。第 8 条的 Muse Ember 定价与定位来自 Meta 公告经 TechCrunch 转述，1M 上下文与 token 上限以 Google Cloud 官方模型文档为准。
3. **未补写的参数**：Muse Ember 的参数量、输出 token 价格、许可协议与权重下载入口，Anthropic 官方发布页与 Google Cloud 文档均未给出，本期不予推测；SpaceX 公示文件的装机容量与分期结构未从原文逐项核对；Spacefast 与 TK 的定价与功能清单未取得官方原文。
4. **单一来源条目**：概览「前瞻与传闻」小节的两条线索均为单一来源（中文科技媒体与 Microsoft 技术社区博客转述），未取得一手公告，按例程 13.4 只保留标题、来源链接与标注，不展开细节、不写入推断。
5. **来源级别分布**：本期共 13 条完整条目，其中 8 条含官方一手来源（Anthropic 官方发布页、Fireworks AI 官方安全公告、GitHub 官方 Changelog、OpenAI 官方新闻页、Google Cloud 官方模型文档、GitHub Release 发布说明、Starbase 市公示文件），其余为专业媒体报道经 Techmeme 聚合或直接引用。
