# AI 早报 2026-11-14

> 检索时间窗：2026-11-13 07:00 ~ 2026-11-14 07:00（Asia/Shanghai，24 小时）。本期无 72 小时补收条目。
> 目标读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者。
> 一手来源优先：官方博客与公告、GitHub Release、Hugging Face 官方博客；媒体口径逐条标注，官方宣称均标注「官方称」。

## 今日概览

**要闻**

1. OpenAI 发布 ChatGPT Wallet：dots 代理可代下单结账，初期限美国 Pro 订阅者
2. llama.cpp 与 ggml 发布 1.0.0 稳定版：公开 API 改语义化版本管理，不兼容只在主版本升级
3. 微软 365 故障官方定因：网络容量升级引起的技术问题，与网络攻击和 AI/agent 无关
4. Nvidia 董事会尚未选定 CEO 猎头公司；投资人称「失去盟友」，公司持有 229 家私营企业 480 亿美元股权

**开发生态**

5. transformers v5.23.0：接入 Inkling 2、JEV、LFM3、LFM3-VL、InternLM3、IQuestCoder，导出器改为统一 `ExportedModel` 接口
6. Codex 0.169.0 与 0.171.0-alpha.4/5：终端支持多侧栏会话、命令行内自建模型 provider
7. Claude Code v2.1.325：修复 zstd 压缩响应解码安全缺陷，修复子代理模型被误改等多项问题
8. OpenAI Python SDK v3.51.0：扩展 agent、图像、Live 与外部密钥支持
9. langchain-openai 1.8.0：放弃 Python 3.10，新增面向 GA Decisions API 的 `OpenAIClassifier`
10. GitHub Copilot 将于 12 月 14 日退役 6 个模型，含 Claude Fable 5、Gemini 3.8 Flash、Grok 4.6、Kimi K3
11. Vercel AI SDK ai@7.0.172/173：远程文件下载改为必须显式提供 `experimental_download` 钩子
12. LiteLLM 窗口内发布 v1.111.0-dev.2、1.108.8 LTS 与 v1.106.10

**模型发布**

13. Inkling 2 Small 随 transformers v5.23.0 接入：594B 总参数 / 17B 激活的 MoE 多模态模型
14. Liquid AI LFM3 与 LFM3-VL 接入 transformers：混合卷积与分组查询注意力架构

**产品应用**

15. GitHub Copilot 正式上线 Gemini 4 Hydrogen，覆盖 Pro、Pro+、Max、Business、Enterprise
16. ElevenLabs 发布实验性应用 ElevenAI：会议纪要、听写与 agent 集成合一
17. GitHub Copilot app 正式支持 GitHub Enterprise Server 账号

**技术与洞察**

18. Ai2 等发布 XYBench 基准：8,115 个真实问题测模型能否识别「XY 问题」式误解，并获 EMNLP 2026 最佳资源论文奖
19. NVIDIA 在 Hugging Face 发布 SimReady 机器人抓取放置仿真实践：UR17G 机械臂加 Robotiq 2F-140 夹爪

**行业动态**

20. LangChain 完成 3 亿美元 C 轮、估值 30 亿美元，CapitalG 领投，LangSmith 客户称达 7,000 家
21. FAA 把空管 AI 工具 SMART 推广至全美；同期全国性停飞，AI 工具开发商 ASI 公开否认与停飞有关

**安全事件**

22. AMD SEV-SNP 曝两条新攻击 Mior 与 Skyfall：Mior 可读取并改写机密虚拟机内存并伪造证明
23. PostgreSQL 一次性修复 52 个漏洞，含一个可导致已认证远程代码执行的 22 年老类型混淆缺陷
24. Check Point 披露 PHP2Shell 漏洞利用链：植入 TSGA 后门、窃取配置并擦除 ESXi 文件
25. FBI 与司法部公布朝鲜组织 FaceStealer：18 个月内以深度伪造视频通话盗走超 4 亿美元加密资产

**前瞻与传闻**

- Anthropic CEO Dario Amodei 称，一两年内需要多少算力是公司「最深的商业困境」，因收入不可预测（彭博社，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261113/p25
- Moonshot AI 正在注销其开曼群岛控股公司，将投资者股权迁入境内主要运营主体，为 IPO 铺路（华尔街日报，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261113/p31
- Meta 员工正在内测预测市场应用 Takes，用「cred」而非真实货币押注问题结果（华尔街日报，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261113/p26
- Nvidia 在华盛顿以「焦土式、对抗性态度」游说出口管制反对者，并援引特朗普名义加速审批（Semafor，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261113/p29

## 要闻

### 1. OpenAI 发布 ChatGPT Wallet：dots 代理可代下单结账，初期限美国 Pro 订阅者

**导语**

OpenAI 于 11 月 13 日（周五）为其代理体系「dots」推出 ChatGPT Wallet，允许用户让代理挑选商品并代为完成结账。官方发布页标题与发布时间已通过官方 RSS 核对（11-13 15:00 GMT），本期该页面在采集环境返回 403，正文未取到，功能细节以 TechCrunch 当日原创报道为准。功能初期仅向少量美国 ChatGPT Pro 订阅者开放，限年满 18 岁、持美国签发的 Visa、Mastercard 或 American Express 的用户。

**详细内容**

据 TechCrunch 报道，OpenAI 称购买行为完全由用户掌控：用户在下单前可核对商品、总额和将要使用的支付卡，并以 Face ID 或指纹完成安全校验，校验本身会生成一条交易记录。结账流程中，Wallet 使用支付令牌（payment token）替代用户真实卡号，卡号信息既不暴露给 dot 代理，也不暴露给商户；商户则能通过代理自动获得履约所需的收货地址与联系方式。官方称通过 dots 购物仍可累计信用卡积分并保留发卡行争议保护。

启动方式是：订阅者把符合条件的支付卡加入 ChatGPT Wallet，之后直接让 dot 代为购买，一次性绑定后无需每次重新输入卡信息。官方称后续会开放消费限额以及按品类或时间段的预授权配置，让预批准的购买由代理更自主地完成；并计划让该能力支持更多零售站点。OpenAI 同时发布了 Commerce Partner Playbook，为希望支持代理购物的站点提供工具与指南。

需要注意的是，本条与既有事件相互独立：本期 United Airlines 限制第三方 AI 助理订票（台账 EV-061）仍是另一方向的风控案例，而 Amazon 是已知对 AI 代理购物限制最严的大型零售商，OpenAI 自家则把代理导向自有助手 Alexa。

**相关链接**

- https://openai.com/index/introducing-chatgpt-wallet （OpenAI 官方发布页，本次环境 403，需人工打开；标题与发布时间经官方 RSS 核对）
- https://techcrunch.com/2026/11/13/chatgpts-new-wallet-lets-ai-agents-shop-and-check-out-for-you/ （TechCrunch 原创报道，功能细节来源）

### 2. llama.cpp 与 ggml 发布 1.0.0 稳定版：公开 API 改语义化版本管理，不兼容只在主版本升级

**导语**

llama.cpp 项目于 11 月 13 日发布 1.0.0 稳定版，同时把底层张量库 ggml 升到 1.0.0。官方博客说明，这是项目成立 3.5 年以来的首个正式主版本，标志是公开 C API 进入语义化版本管理：破坏性变更只在主版本升级时发生，向后兼容的功能、后端更新与新模型支持走次版本号，纯 bug 修复走修订号。官方同时称，llama.cpp 目前支持超过 150 种架构变体与全部主流的推测解码方法。

**详细内容**

1.0.0 的具体变更以 Release 正文为准：移除 `llama_set_warmup` 等 35 个已弃用函数、`defrag_thold` 与对应命令行开关，并把 NextN 推测解码 API 从 `llama-ext.h` 提升进 `llama.h`，`llama_set_embd_state_src` 更名为 `llama_set_ctx_state_src`；`llama_context_params` 新增 `moe_cache_size` 与 `moe_cache_cpu_share`；服务端新增 OpenAI 兼容的 `/v1/audio/speech` 端点。核心层面新增 OCP FP8 KV cache（`-ctk/-ctv f8_e4m3`，可配静态 per-tensor scale）、MoE 缓存的 CPU 共享与 LRFU/ClassLRU 替换，并支持通过 `--shard` / `--ple` 从独立 GGUF 分片加载外部 PLE。新增架构包括 Kimi-K3.1-Pro（K3 全注意力 MLA 层替换为 DSA）、Ripple-65B-Preview 稠密 65B 架构、xing4_0，以及 drama-3 TTS（fishaudio）。

官方博客同时把版本承诺写明为对下游开发者的责任表述：随着集成增多、更多开发者依赖其库接口，灵活但稳定的 API 是前提，此后 llama.cpp 与 ggml 都会在主版本升级时显式暴露 API 与 ABI 的不兼容边界；后端以动态库形式编译并可运行时加载。

**相关链接**

- https://github.com/ggml-org/llama.cpp/releases/tag/v1.0.0 （llama.cpp 官方 Release，正文已取）
- https://huggingface.co/blog/ggml-org/llama-cpp-v1 （Hugging Face 官方博客，发布方口径原文已取）

### 3. 微软 365 故障官方定因：网络容量升级引起的技术问题，与网络攻击和 AI/agent 无关

**导语**

11 月 12 日（周四）下午爆发的微软 365 大面积故障有了官方口径：微软公开致歉，称事故源于一次网络容量升级引起的技术问题，并明确表示与网络攻击或 AI/agent 无关，同时称服务已进入广泛恢复与稳定阶段。这补齐了上一期（EP018）留待确认的根因问题——当时微软仅称「多台服务器意外不可用、负载升高」。

**详细内容**

此前窗口内已确认的事实是：Outlook、Teams、Copilot、OneDrive 同时不可用，多家媒体（Engadget、Verge、BleepingComputer、PCWorld、Wired、路透社等）独立记录，Downdetector 显示美国境内大量用户报告不可用。本期新增的是微软官方的根因说明与否认口径，经科技媒体与 Techmeme 聚合页记录。

对使用 Copilot 的开发者而言，这条的价值在于排除了两类误判：一是不要把 Copilot 不可用归因于 agent 负载或模型侧问题，二是可以按容量升级类变更来评估影响面与恢复节奏。需要说明的是，微软此前公布的状态页时间线与逐服务恢复时间戳本期仍未取到原文，因此精确的起止时刻与受影响服务完整清单仍以媒体记录为准，本期不补全。

**相关链接**

- https://www.techmeme.com/261113/p28 （微软致歉与口径原文，经 Techmeme 聚合页可达）
- https://www.engadget.com/2315259/multiple-microsoft-365-services-are-experiencing-an-outage/ （故障首发报道，EP018 已取）

### 4. Nvidia 董事会尚未选定 CEO 猎头公司；投资人称「失去盟友」，公司持有 229 家私营企业 480 亿美元股权

**导语**

Nvidia 董事会向 CNBC 表示，正在「挑选一家猎头公司」以寻找黄仁勋的永久继任者，且尚未正式接触任何候选人。这是继 11 月 12 日董事会宣布黄仁勋辞任、CFO Colette Kress 出任临时 CEO 之后的最新进展。同日，多家媒体与聚合页记录了黄仁勋离任对产业侧的具体影响。

**详细内容**

据 Techmeme 聚合的报道，纽约时报统计称，截至 7 月底 Nvidia 持有 229 家私营企业的股权、价值 480 亿美元，其中包括 OpenAI 与 Anthropic，并曾提供 1,650 亿美元的云服务兜底承诺；部分投资人与创业者表示「失去了一位盟友」。TechCrunch 的原创报道则称，Nvidia 在黄仁勋任内向 AI 初创企业投入了数百亿美元，失去他之后创始人与风投正预期更小的融资额与更低的估值。另有报道称以色列风投机构正把这一局面视为挑战者的机会窗口。

同期 Techmeme 聚合的另一条 Semafor 报道称，Nvidia 在华盛顿以「焦土式、对抗性态度」针对出口管制反对者，并在争取许可时援引特朗普的名义。该条为单一来源、未经官方文件确认，本期只列入线索雷达，不在正文展开。

需要提示的是，以上均为媒体口径，本期未取得 Nvidia 官方新闻稿以外的补充声明，也未取得涉事机构（OpenAI、Anthropic 等）的独立确认。官方公告层面，本期无新增。

**相关链接**

- https://www.techmeme.com/261113/p27 （CNBC 口径，董事会挑选猎头公司，聚合页可达）
- https://www.techmeme.com/261113/p24 （纽约时报口径，Nvidia 持股与云兜底数据，聚合页可达）
- https://techcrunch.com/2026/11/13/jensen-huangs-departure-blasts-big-hole-in-ai-startup-funding-vcs-and-founders-say/ （TechCrunch 原创报道）

## 开发生态

### 5. transformers v5.23.0：接入 Inkling 2、JEV、LFM3、LFM3-VL、InternLM3、IQuestCoder，导出器改为统一 `ExportedModel` 接口

**导语**

Hugging Face transformers 于 11 月 13 日发布 v5.23.0，是本期变更量最大的一版。新增模型支持包括 Thinking Machines Lab 的 Inkling 2、Liquid AI 的 LFM3 与 LFM3-VL、上海人工智能实验室的 InternLM3、IQuest Lab 的 IQuestCoder，以及一个用于决策任务的 JEV 决策头。同时该版本把导出流程重写为统一的 `ExportedModel` 对象，并列入多项破坏性变更。

**详细内容**

新模型方面，Inkling 2 Small 是文本加图像输入、文本输出的多模态模型，语言骨干为 48 层 MoE 解码器，每层把 token 路由到 384 个专家中的 8 个，总参数 594B、激活 17B。LFM3 延续 LFM2 的混合架构，把门控短卷积与分组查询注意力结合，注意力层在全注意力与滑动窗口层之间切分。IQuestCoder 提供 7B、14B、40B 三档，每档含 base、instruct 与 thinking 变体，其架构与 Llama 相同，transformers 自动类可直接以 `LlamaModel` / `LlamaForCausalLM` 加载，但 `*-Loop-*` 检查点使用不同架构、不受支持。InternLM3 是 8B 指令微调模型，架构与 Llama 相同。JEV 决策头在提示末 token 用线性层对单 token 标签打分，可通过实验性的 `decision` 管线或 `decide` 直接调用，官方明确标注其 API 与行为可能变动。

导出器改动是本版最需要迁移注意的部分：现在每次导出都返回 `ExportedModel`，调用方式与原模型一致，可直接推送至 Hub 并在后端自身运行时加载回载，同一套 API 覆盖 Dynamo、ONNX Runtime、OpenVINO 与 ExecuTorch。官方称在 EmbeddingGemma2（8 × 128 tokens）上，ONNX Runtime 配 TensorRT EP 比 eager PyTorch 快 7.6 倍、比 `torch.compile` 快 1.4 倍；OpenVINO 在 Xeon Platinum 8570 上比 eager 快 4.1 倍、比 `torch.compile` 快 2.2 倍（int8 权重下分别为 4.9 倍与 2.6 倍）。这些为发布方口径，未见独立复现。

破坏性变更包括：移除 `ep_router` 专家并行风格、MXFP4 GPT-OSS 专家改走 `ep_dispatch_experts`、`[audio]` 精简为 torchaudio + soundfile + soxr（去掉 librosa 与 phonemizer）、废弃 `Wav2Vec2ProcessorWithLM` 与 pyctcdecode/kenlm 解码、`export()` 返回值改为 `ExportedModel`（ONNX program 改为 `onnx_ir.Model`）、`OnnxConfig` 与 `OnVINOConfig` 的 `output_path` 选项移除改用 `save_pretrained`、自定义后端改用 `register_backend` 注册。

**相关链接**

- https://github.com/huggingface/transformers/releases/tag/v5.23.0 （官方 Release 正文与时间戳已取）

### 6. Codex 0.169.0 与 0.171.0-alpha.4/5：终端支持多侧栏会话、命令行内自建模型 provider

**导语**

OpenAI Codex 在 11 月 13 日一天内发布 0.169.0 稳定版与 0.171.0-alpha.1 至 alpha.5 若干预发布版本。0.169.0 的主要变化集中在终端交互形态：可选的终端工作区支持多个侧栏会话标签、可跨重启恢复本地侧栏会话，并允许在终端内新增或编辑自定义模型 provider。

**详细内容**

0.169.0 的新功能还包括：在 agent 命令中心按名称、提示预览或工作目录搜索较早的任务；全屏 transcript 中开启「折叠轮次详情」可把已完成活动折到提示下方而保留答案与工具输出可搜索；开启自定义 gateway onboarding 后，可在登录流程中创建 provider，并在支持的 gateway 上通过设备码在 SSH 或无本地浏览器环境下完成认证；终端内 `Ctrl+S` 可把诊断 ZIP 存到本地（即使上传被禁用）；macOS 与 Linux 上开启可选的 Cloud connection 后，可在终端发送图片、选择模型与推理强度并归档或恢复 Cloud 会话。

修复方面值得注意的是：`codex exec` 在不可信目录下即使带 `--sandbox workspace-write` 也保持项目配置与 MCP 服务器禁用，需要显式使用 `--trust`；「是，清空上下文并实现」在交接失败时会保留当前会话；Windows 沙箱处理带引号的 `cmd.exe` 路径；macOS 粘贴图片保留正确方向；已保存的 `sonnet[1m]` 模型设置在新装环境不再被改写成 API 拒绝的模型 ID。

**相关链接**

- https://github.com/openai/codex/releases/tag/rust-v0.169.0 （官方 Release 正文与时间戳已取）
- https://github.com/openai/codex/releases （版本列表页）

### 7. Claude Code v2.1.325：修复 zstd 压缩响应解码安全缺陷，修复子代理模型被误改等多项问题

**导语**

Anthropic 于 11 月 14 日 04:40（CST）发布 Claude Code v2.1.325。该版本的首要条目是修复 zstd 压缩响应解码方式中的一个安全缺陷，其余为一批以稳定性与可预期性为主的修复，包括子代理模型被错误切换、多网关上下文长度报错无法压缩、恢复会话丢失近期轮次等。

**详细内容**

与模型相关的修复有三条：子代理自带模型时不再被 plan-mode 模型覆盖（此前在 `opusplan` 或 `haiku` 设置下触发）；子代理使用不同模型时，不再用主会话的模型来衡量文件读取与 MCP 结果大小；多个第三方 gateway 与 Foundry 上的会话此前每轮都以「context length error」失败，现已能正常压缩上下文。

其他实用修复包括：`/security-review` 与技能的内联 git 命令在裸仓库工作树、`--separate-git-dir` 检出与 Android `repo` 检出下报错；恢复会话时近期轮次偶尔缺失；沙箱内 `git checkout`、`git stash` 或 autostash pull 无法更新 `.claude` 等受保护文件时给出说明；`plansDirectory` 目录不可写导致已批准的计划修改丢失时改为存入默认计划目录并提示位置与原因；VS Code 等集成终端中在 Claude 读过或改过 Jupyter notebook 后提示重跑单元格。

**相关链接**

- https://github.com/anthropics/claude-code/releases/tag/v2.1.325 （官方 Release 正文与时间戳已取）

### 8. OpenAI Python SDK v3.51.0：扩展 agent、图像、Live 与外部密钥支持

**导语**

OpenAI Python SDK 于 11 月 14 日 05:12（CST）发布 v3.51.0。相比上一版 v3.50.0 暴露 Responses API 的 reasoning 输入变换，本版的主要变化是扩大了 agent、图像、Live（实时接口）与外部密钥的支持范围，对应上游 issue #4269 与提交 `59738a2`。

**详细内容**

本期未取得该版本随附的详细 API 变更清单全文，仅核对到 Release 页面与变更标题。按仓库既有节奏，SDK 的小版本通常以「新增 api 能力 + 依赖升级 + 文档调整」为主，本次依赖侧同步升级了 `astral-sh/setup-uv`（10.3.0 → 10.3.3）。

对使用方而言，agent 与 Live 相关字段的扩展通常意味着更多参数类型与更多可用字段，但具体新增哪些方法名与参数，本期没有可核对的完整清单，因此不做逐字段推断，建议按 Release 页对照升级。

**相关链接**

- https://github.com/openai/openai-python/releases/tag/v3.51.0 （官方 Release 页与时间戳已取）

### 9. langchain-openai 1.8.0：放弃 Python 3.10，新增面向 GA Decisions API 的 `OpenAIClassifier`

**导语**

LangChain 的 OpenAI 集成包 langchain-openai 于 11 月 14 日 00:48（CST）发布 1.8.0。该版本明确放弃 Python 3.10 支持，最低版本改为 Python 3.11、最低 `langchain-core` 改为 1.8.0，仍停留在 Python 3.10 的用户会继续解析到 1.7.x。同时新增了面向已进入 GA 的 Decisions API 的 `OpenAIClassifier`。

**详细内容**

具体变更包含四项：发布 openai 集成 1.8.0（#41841）、新增 `OpenAIClassifier` 以对接 GA Decisions API（#41787）、刷新模型档案数据（#41828）、以及从伙伴包中移除已 EOL 的 Python 3.10（#41268）。

这条与上期台账中的 Google Gemini Decisions API（EV-049）属于同一能力面：LangChain 现已把该 API 纳入官方集成包，意味着「不逐 token 解码、对候选打分并返回概率与置信度」的决策模型在 LangChain 侧有了一条现成路径，而不是只能直接调 HTTP 接口。该 API 的定价与延迟口径仍以 Google 官方发布为准，本期无变动。

**相关链接**

- https://github.com/langchain-ai/langchain/releases/tag/langchain-openai%3D%3D1.8.0 （官方 Release 正文与时间戳已取）

### 10. GitHub Copilot 将于 12 月 14 日退役 6 个模型，含 Claude Fable 5、Gemini 3.8 Flash、Grok 4.6、Kimi K3

**导语**

GitHub 于 11 月 13 日发布公告，将于 2026 年 12 月 14 日在全部 GitHub Copilot 体验中（Copilot Chat、行内编辑、ask 与 agent 模式、代码补全）退役 6 个模型：Claude Fable 5、Claude Haiku 4.5、Gemini 3.8 Flash、Gemini 4 Argon、Grok 4.6 与 Kimi K3。这对在 Copilot 里固化模型名的脚本、CI 与集成是硬期限。

**详细内容**

官方给出的替代映射分别是：Claude Fable 5 → Claude Fable 5.2，Claude Haiku 4.5 → Claude Haiku 5.5，Gemini 3.8 Flash → Gemini 4 Hydrogen，Gemini 4 Argon → Gemini 4 Carbon，Grok 4.6 → Grok 4.7；Kimi K3 的替代官方标注为「待公布」。

一个例外是：Claude Haiku 4.5 对年付个人订阅用户仍然可用，该退役不适用于这类客户。

在默认模型启用（default model enablement）下，Copilot Enterprise 与 Copilot Business 客户的建议替代模型会自动启用，除非管理员关闭了全局默认或显式禁用了该模型；已关闭全局默认的，可在 Copilot 设置的模型策略中手动开启。模型退役后不需要用户手动移除。

**相关链接**

- https://github.blog/changelog/2026-11-13-upcoming-deprecation-of-selected-github-copilot-models-in-december （GitHub 官方 Changelog 原文已取）

### 11. Vercel AI SDK ai@7.0.172/173：远程文件下载改为必须显式提供 `experimental_download` 钩子

**导语**

Vercel AI SDK 在 11 月 13 日至 14 日窗口内连续发布 ai@7.0.172、ai@7.0.173 与配套的 provider 包更新。其中 ai@7.0.172 的一项改动具有安全取向：`experimental_extract` 与 `experimental_decide` 处理远程文件 URL 时，不再允许经由全局 fetch 静默下载，必须由调用方显式提供 `experimental_download` 钩子。

**详细内容**

官方给出的用法是：调用方可用 `createDownload({ fetch })` 传入带 DNS 保护的传输层来处理不可信 URL；内联文件数据在没有该钩子的情况下仍可照常工作。这实质上是把「下载远程文件」这件事从库的隐式默认行为变成调用方的显式责任。

ai@7.0.173 的改动集中在工作流包：防止批准重放过程中就地 schema 校验或输入精炼改变已批准的工具参数；`WorkflowAgent.generate()` 达到默认步骤上限时记录告警；`WorkflowAgent` 的 `generate()` 与 `stream()` 现在像 `ToolLoopAgent` 一样把每次模型调用的告警写入 AI SDK 告警日志（由 `AI_SDK_LOG_WARNINGS` 全局开关控制）；对齐 `WorkflowAgent` 与 `ToolLoopAgent` 的 `prepareStep` 返回结构。窗口内配套发布的还有 `@ai-sdk/workflow@2.0.105`、`@ai-sdk/workflow-harness@1.0.184`、`@ai-sdk/xai@5.0.46`、`@ai-sdk/zai@3.0.55`、`@ai-sdk/vue@4.0.173`。

另需留意旧版本线的补丁：ai@5.0.290 修复了畸形 UI 消息校验导致的内存与 CPU 耗尽（该问题此前已在 ai@7.0.171 修复，此处为旧版本线跟进）。

**相关链接**

- https://github.com/vercel/ai/releases/tag/ai%407.0.173 （官方 Release 正文与时间戳已取）
- https://github.com/vercel/ai/releases （版本列表页）

### 12. LiteLLM 窗口内发布 v1.111.0-dev.2、1.108.8 LTS 与 v1.106.10

**导语**

LiteLLM 在 11 月 13 日至 14 日窗口内发布三个版本：预发布线 v1.111.0-dev.2、LTS 线 1.108.8、以及旧维护线 v1.106.10。其中 LTS 版 1.108.8 包含 4 个 PR、修复 3 项，官方明确标注「无需升级操作」。

**详细内容**

1.108.8（LTS）的具体修复包括：Azure 部署在 `/v1/decisions` 上返回 400 的问题（#51460）；文件所有权校验遗漏 Gemini 文件 ID 其他拼写形式的问题；以及另外两项修复。v1.106.10 修复了 Google MCP 服务器在访问令牌过期后要求用户重新登录的问题（#41197），为 #51731 的回合。

窗口内另有两条版本线值得留意：11 月 12 日（上一期已报道）的 1.108.7 LTS 要求 Responses API 设置 `drop_params: true` 或停止发送 `max_tool_calls`；本期 dev 版继续包含账号计费侧的修复，即不再扫描投递指标。所有 LiteLLM 镜像均以 cosign 签名，官方同时给出基于提交哈希与基于发布标签两种校验命令。

**相关链接**

- https://github.com/BerriAI/litellm/releases/tag/v1.108.8 （LTS 版 Release 正文已取）
- https://github.com/BerriAI/litellm/releases （版本列表页，含 dev 与旧维护线）

## 模型发布

### 13. Inkling 2 Small 随 transformers v5.23.0 接入：594B 总参数 / 17B 激活的 MoE 多模态模型

**导语**

Hugging Face transformers v5.23.0 首次支持 Inkling 2，这是 Thinking Machines Lab 的多模态模型，接受文本与图像输入、输出文本，面向英语及其他语言、并覆盖多种编程语言。其语言骨干为 48 层混合专家解码器，每层把 token 路由到 384 个专家中的 8 个，总参数 594B、激活参数 17B。

**详细内容**

架构上，该模型保留了 Inkling 解码器的三项设计：学习式相对注意力、短因果卷积与混合专家层，并在其上新增 block attention residuals、带学习式 sink 的门控注意力，以及动态键/值卷积。图像侧由基于 Perception Encoder 的视觉 Transformer 编码，再投影进语言模型嵌入，每 40×40 像素块对应一个嵌入。

本期未取得该模型的权重开放状态、许可证类型、上下文长度与定价口径的官方说明，因此这些参数本期不做推断，仅登记 transformers 侧的官方接入事实。官方文档入口与博客链接均在 Release 正文中给出。

**相关链接**

- https://github.com/huggingface/transformers/releases/tag/v5.23.0 （官方 Release 中 Inkling2 条目与参数原文已取）

### 14. Liquid AI LFM3 与 LFM3-VL 接入 transformers：混合卷积与分组查询注意力架构

**导语**

transformers v5.23.0 同时接入 Liquid AI 第三代 Liquid Foundation Models：文本版 LFM3 与视觉语言版 LFM3-VL。LFM3 延续 LFM2 的混合架构，把门控短卷积与分组查询注意力结合，注意力层在全注意力与滑动窗口层之间切分，并对 query 与 key 头施加 RMSNorm、用逐头 sigmoid 门控其输出。

**详细内容**

在残差相加之前，每一层都对算子输出与前馈输出施加 sandwich norm，这是该架构在实现层面明确写出的约束。

LFM3-VL 构建在 LFM3 语言模型之上，接受原生分辨率的图像与视频并与文本联合输入。其视觉侧是混合视觉编码器（线性 patchifier、门控深度可分离 2D 卷积层、带 2D 旋转位置嵌入的双向分组查询注意力层），再经一个投影器接入 LFM3；投影器把每 2×2 的 patch 特征块经层归一化与两层 MLP 合并为一个语言 token。

与 Inkling 2 条目同理，本期未取得权重开放状态、许可证、上下文长度与定价的官方说明，不做推断。

**相关链接**

- https://github.com/huggingface/transformers/releases/tag/v5.23.0 （官方 Release 中 LFM3 与 LFM3-VL 条目及架构描述原文已取）

## 产品应用

### 15. GitHub Copilot 正式上线 Gemini 4 Hydrogen，覆盖 Pro、Pro+、Max、Business、Enterprise

**导语**

GitHub 于 11 月 14 日 02:23（CST）发布 Changelog，宣布 Gemini 4 Hydrogen 在 GitHub Copilot 中正式可用（GA）。官方称这是 Google 最新的 Flash 模型，面向快速高效的 agentic 编码、工具使用与多步工作流，相对 Gemini 3.8 Flash 的指令遵循有所改进。

**详细内容**

计费方式明确：按 provider 标价（provider list pricing）在用量计费（usage-based billing）下结算，具体以 GitHub Copilot 的模型与定价文档为准。可选模型的编辑器包括 Visual Studio Code、Visual Studio、github.com、JetBrains IDE、Xcode 与 Eclipse。

可用范围是 Copilot Pro、Pro+、Max、Business 与 Enterprise 用户。官方说明灰度会逐步放开（rollout will be gradual），未看到模型的用户需稍后再查。

这条是上期已报道的 Gemini 4 Hydrogen 发布（台账 EV-056）在开发者侧的落地进展：11 月 12 日 Google 发布该模型时，同期已在 Gemini API、AI Studio、Gemini 应用与 Google 搜索上线，本期新增的是 GitHub Copilot 侧的 GA 可用性。上期官方给出的定价口径（每百万输入 token 1.50 美元、输出 7.50 美元、1M 上下文）本期未见变动。

**相关链接**

- https://github.blog/changelog/2026-11-13-gemini-4-hydrogen-in-github-copilot （GitHub 官方 Changelog 原文已取）

### 16. ElevenLabs 发布实验性应用 ElevenAI：会议纪要、听写与 agent 集成合一

**导语**

语音 AI 公司 ElevenLabs 在纽约举办的 11/11 峰会上发布实验性应用 ElevenAI，把会议纪要、听写与 agent 集成合到一个产品里，目前处于预览阶段，需要注册候补名单而非直接下载。TechCrunch 报道其估值已达 220 亿美元，公司明确把它定位为团队级产品，而非个人效率工具。

**详细内容**

功能上，ElevenAI 可在会议中记录纪要，并通知其他参会者对话正在被录制；用户可以跨会议查询数据，并在对话中获得实时辅助以回忆早期对话中的关键细节；企业可集成 ElevenAgent 并触发后续动作，例如根据纪要起草邮件。听写功能可在任意应用中把语音转成清理过的文本，官方称支持 90 多种语言，并称能理解听写与会议转写中的行业专属术语。

官方还提到同期发布 v3 系列 Scribe 语音转文本模型，具备实时转写能力，并允许企业用自有数据微调模型；另有按用例挑选语言模型的工具，以及基于转写自动执行任务的 routine  creator。与 Fireflies、Wispr Flow、Granola 等同品类产品的竞争背景由媒体给出。

**相关链接**

- https://techcrunch.com/2026/11/13/elevenlabs-new-app-combines-meeting-note-taking-and-dictation-for-teams/ （TechCrunch 原创报道，功能与估值口径来源）

### 17. GitHub Copilot app 正式支持 GitHub Enterprise Server 账号

**导语**

GitHub 于 11 月 14 日 02:27（CST）宣布，GitHub Copilot app 正式支持 GitHub Enterprise Server（GHES）账号，此前该能力处于可选预览状态。用户可把 GHES 账号加入 Copilot app，用于处理远程仓库、议题与拉取请求。

**详细内容**

使用方式有前提限制：需先用 GitHub.com 或 GHE.com 账号登录，再进入 Settings > Accounts > Add account 并选择 GitHub Enterprise Server。该能力需要 GitHub Copilot app 1.2.0 及以上版本。

一个明确的边界是：GHES 不支持 Cloud sessions——即在 Copilot app 内使用云端会话的这部分能力对 GHES 不可用。这一点对有自建合规环境的团队评估 Copilot app 可用范围时是硬约束。

**相关链接**

- https://github.blog/changelog/2026-11-13-github-enterprise-server-support-in-the-github-copilot-app （GitHub 官方 Changelog 原文已取）

## 技术与洞察

### 18. Ai2 等发布 XYBench 基准：8,115 个真实问题测模型能否识别「XY 问题」式误解，并获 EMNLP 2026 最佳资源论文奖

**导语**

Allen Institute for AI（Hugging Face 上发布方标注为 allenai）联合卡内基梅隆、NVIDIA 与约翰斯·霍普金斯发布基准 XYBench，包含 8,115 个真实世界问题，用于测量模型在用户「方法用错」时的表现——例如问怎么让糖霜挂不住杯子蛋糕，而真正的问题是蛋糕太烫。该工作获 EMNLP 2026 最佳资源论文奖。

**详细内容**

基准构建自四个来源：Stack Overflow 1,557 题、Stack Exchange 184 题、人工整理 102 题，以及由 WikiHow 指南生成的 6,272 题（用 Sonnet 4.5 围绕可能存在的误解生成，再经精修以保证专家能从上下文推断出真实目标而不直接点明）。评测分三个维度：Pragmatic solution（是否同时给出针对字面请求 Y 与真实目标 X 的方案）、Pragmatic emphasis（答案重心偏向哪一侧）、Misconception identification（是否把用户引向真实目标并劝退错误做法）。自动评审使用 Claude Sonnet 4.5；两名人工评审独立评估了 500 条模型回答，与评审的一致率在「是否出现某方案」上为 97.5%–100%，在「误解识别」上为 84.6%–93.3%，在「重心判断」上为 74.2%–79.8%。

实测结论有数据支撑：在 Stack Overflow 来源上，模型给出针对字面请求方案的比例为 75%–86%，给出针对真实目标方案的为 59%–71%；而答案重心真正落在真实目标上的只有 35%–41%，落在字面请求上的为 47%–57%。一个 oracle 实验中直接告知模型 X，Sonnet 4.6 的真实目标方案命中率从 59% 升到 67%，但误解识别率从 47% 降到 34%。另一组实验显示，六个模型在二选一判断中 71%–84% 能挑出面向真实目标的答案，远高于它们自己写答案时的重心比例——官方据此指出「识别好答案」与「写出好答案」之间存在差距，单选式测试无法暴露这一点。官方同时说明该基准目前只覆盖英文与程序性任务，扩展到其他语言、文化与对话场景仍是开放方向。

**相关链接**

- https://huggingface.co/blog/allenai/xybench （Hugging Face 官方博客原文已取，含论文、数据集与代码链接）

### 19. NVIDIA 在 Hugging Face 发布 SimReady 机器人抓取放置仿真实践：UR17G 机械臂加 Robotiq 2F-140 夹爪

**导语**

NVIDIA 在 Hugging Face 官方博客发布一篇实操教程，用 SimReady 资产在 NVIDIA Isaac Sim 中搭建一个饮料罐的抓取放置任务，使用 UR17G 机械臂、Robotiq 2F-140 夹爪与饮料罐资产，并配合 agent 生成的控制器运行示例。

**详细内容**

SimReady 的核心是给 OpenUSD 资产补齐特定仿真用例所需的属性，例如碰撞、质量、关节与关节驱动；SimReady Central 作为 Hugging Face 上的开放资产库，提供带完整仿真属性与配置校验证据的可复用机器人与物体资产。规范分三层组织：Profile（如「机器人本体」这类用途分组）、Features（该用途所需的能力，如可控关节）、Requirements（对某项设置的检查，如关节的驱动设置）。本文任务涉及机械臂与夹爪的关节、饮料罐的碰撞与质量，验证流程是按 profile 要求检查这些设置，再由仿真测试组装后的机器人能否抓取并移动罐体。

教程给出的流程是四步：下载机械臂、夹爪与饮料罐资产；组装机器人并搭建抓放场景；测试关节限位与驱动设置、运动与接触行为；再运行抓放示例。文中特别提示，机器人在 Isaac Sim 中静止时看起来正确，运行时与物体交互仍可能不正确，因此运行前应先测试关节、移动与接触行为——这一检查既可由 agent 执行，也可手动完成。

**相关链接**

- https://huggingface.co/blog/nvidia/simready-assets-robot-pick-and-place （Hugging Face 官方博客原文已取）

## 行业动态

### 20. LangChain 完成 3 亿美元 C 轮、估值 30 亿美元，CapitalG 领投，LangSmith 客户称达 7,000 家

**导语**

AI agent 基础设施公司 LangChain 于 11 月 13 日宣布完成 3 亿美元 C 轮融资，估值 30 亿美元，由 CapitalG 领投，新加坡 GIC、DFJ Growth、IVP 与 Sapphire Ventures 参与。这是该公司一年多前 1.25 亿美元融资、1.25 亿美元估值之后的两倍以上。

**详细内容**

据 TechCrunch 报道，LangChain 2022 年起步时是处理早期 LLM 不擅长任务的开源项目（网页搜索、调用 API、与数据库交互）。随着前沿实验室交付了能胜任这些任务的 harness，公司转向聚焦 agent 管理，并主张让企业拥有自己的智能（letting businesses own their own intelligence），强调 LangSmith 不试图把用户锁定到特定模型、云或生态。

客户规模上，LangChain 称 LangSmith 已有 7,000 家客户，包括 Harvey、Rippling、Clay 等创业公司与 Nvidia、Toyota、Salesforce 等企业。估值、融资金额与客户数均为公司口径与媒体转述，未见独立核实。

**相关链接**

- https://techcrunch.com/2026/11/13/ai-agent-startup-langchain-hits-3b-valuation/ （TechCrunch 原创报道）

### 21. FAA 把空管 AI 工具 SMART 推广至全美；同期全国性停飞，AI 工具开发商 ASI 公开否认与停飞有关

**导语**

美国联邦航空管理局（FAA）在 11 月 10 日宣布，把空管 AI 工具 SMART 的使用范围扩大到全美国家空域系统，用于协助空管人员管理拥堵（据 Ars Technica，经 Techmeme 聚合）。数日后，FAA 于 11 月 13 日因「影响多个空管中心的通信问题」发布全国性地面停飞令，逾四小时后解除。

**详细内容**

需要把两条信息分开看，因为它们在时间上相邻但被多方明确区分。停飞令由 FAA 以「非常情况」与「安全原因」发出，国土安全部长 Markwayne Mullin 称「这不是另一次 9·11，这是电信问题」，并表示不排除任何可能原因。多家媒体记录了成因线索：CBS News 引述消息人士称，故障发生在一次更新连接空管系统的私有通信网络之后，更新导致系统重启并崩溃；彭博社援引知情人士称，FBI 正调查是否由软件更新引发，并不认为是网络攻击或犯罪行为。

就 AI 关联性，空管 AI 工具开发商 ASI（Aviation Systems Intelligence）公开表示：「当前的地面停飞并非基于 SMART 系统、ASI 的任何产品，或我们与 FAA 及空管的集成。」Techmeme 聚合页也记录了外界的相关猜测与辟谣，包括「这会不会与 AI 有关」以及 Ars Technica 关于 FAA 第三次全国性地面停飞的报道。

对开发者的实际意义在于两条边界：其一，航空监管机构正在把 AI 辅助工具铺到全美空域这类关键基础设施，这是 AI 进入受监管场景的一个可观测样本；其二，本期故障的公开归因指向通信网络更新而非 AI 系统，这类混合归因需要以官方口径为准，不做推测性归因。

**相关链接**

- https://www.techmeme.com/261113/p32 （FAA 扩大 SMART 使用范围，Ars Technica 口径经聚合页可达）
- https://www.techmeme.com/261113/p33 （FBI 调查是否为软件更新导致，彭博社口径经聚合页可达）
- https://www.techmeme.com/261113/p30 （Axios 口径：逾四小时全国停飞解除，聚合页可达）

## 安全事件

### 22. AMD SEV-SNP 曝两条新攻击 Mior 与 Skyfall：Mior 可读取并改写机密虚拟机内存并伪造证明

**导语**

本周公开的两项研究显示，恶意云主机可以攻破 AMD SEV-SNP 保护的机密虚拟机：Mior 不仅能读取还能修改虚拟机内存，并能伪造签名证明以谎报所运行的软件；Skyfall 则能在特定条件下读出寄存器的保存值与磁盘加密密钥。两者分别对应 CVE-2026-0462（CVSS 5.9）与 CVE-2026-40671（CVSS 4.9），另有 SMM 泄露编号 CVE-2026-18448（CVSS 5.6）。

**详细内容**

Mior 由 ETH Zurich 团队完成，攻击点在 SEV-SNP 启动阶段：芯片上的平台安全处理器（PSP）会填充反向映射表（RMP），记录每页内存的归属与权限。团队把 PSP 的写入重定向到自己控制的显卡内存，理由是 PSP 会把值读回校验而显卡可以配合返回；启动过程因此没有报错，但真实 RMP 的一部分（包括保护该表自身的条目）未初始化，超线程侧便可改写 RMP 的保护项，随后用 PSP 自身的调试命令读写机密虚拟机内存，在两轮测试共 1,000 次尝试中全部成功。前置条件是控制虚拟机监控器（hypervisor）与 BIOS（UEFI），外加一个 PCIe 设备。团队在单颗 EPYC 9135（Zen 5）上测试，认为 Zen 3 与 Zen 4 同样可能受影响但未实测。关键判断是：普通虚拟机本就信任宿主与固件，因此 Mior 对普通虚拟机「没有新增价值」——受威胁的是那些把宿主机视为不可信对手的机密计算场景，且在开启 ciphertext hiding 时调试与证明攻击依然成立。

Skyfall 由 ETH Zurich 与 Google 团队完成，基于 Transient Scheduler Attacks（2025 年 7 月 8 日首次披露）。当 hypervisor 故意让虚拟机启动失败时，处理器已经缓存了部分保存状态且未走常规清理路径，超线程侧可通过 TSA 读出——团队据此恢复了测试虚拟机的保存寄存器值与磁盘加密密钥（做法是改虚拟机内核，在密钥位于寄存器的那一刻暂停）。Skyfall 每次只能读目标页内 3 条固定缓存行（偏移 0x0c0、0x380、0x3c0），且在 Zen 5 上未复现。除虚拟机外，该团队还在三颗测试芯片上读到了已解密的微码更新，以及存放在系统管理模式（SMM）内存中的寄存器值——连操作系统内核通常也读不到。

修复侧，AMD 为 7003、8004、8005、9004、9005 五条 EPYC 服务器线分别给出固件版本；Instinct MI300A 加速器的 Skyfall 补丁日期为 9 月 21 日，嵌入式 EPYC 型号的修复分布在 2027 年 1 月至 4 月之间。Supermicro 已发布覆盖数十款 H12/H13/H14 主板的 BIOS 修复清单，但同一页面说明这些主板还需要 BMC 固件更新，且部分产品仍在测试中。由于修复实施在宿主固件层，租用机密虚拟机的用户需依赖云服务商安装，AMD 未说明用户应如何自查 TCB 值。两份公告均未说明这些缺陷是否已被用于实际攻击。

**相关链接**

- https://thehackernews.com/2026/11/new-mior-and-skyfall-attacks-let-rogue.html （The Hacker News 报道原文已取，含 CVE 编号、CVSS、测试环境与修复版本）

### 23. PostgreSQL 一次性修复 52 个漏洞，含一个可导致已认证远程代码执行的 22 年老类型混淆缺陷

**导语**

PostgreSQL 于 11 月 13 日发布一批更新，一次性修复 52 个安全缺陷。其中编号 CVE-2026-6460 的类型混淆缺陷可让有权限创建对象的数据库用户在服务器上执行代码，CVSS 评分 8.8；该项目组与 CISA 均记录该漏洞尚无在野利用证据。

**详细内容**

CVE-2026-6460 的成因可追溯到 2004 年 5 月 5 日 PostgreSQL 获得修改列类型的能力，研究者利用 2015 年 5 月 14 日的另一项改动构造出完整利用路径。受影响版本为 18.7、17.12、16.16、15.20、14.25 之前的全部版本，修复版本即上述五个。同时必须重建所有以 C 语言编写的扩展：针对旧版本构建的扩展仍会加载，但项目 RPM 维护者公告称其「可能不受本次发布所修复漏洞的保护」；为新版本重建的扩展在旧服务器上会加载失败。部分扩展还需改源码。

客户端工具也在修复范围内：构造的归档文件可让 `pg_restore` 以运行用户身份执行代码；被控制的数据源服务器可通过 `pg_dump` 的 tar 输出让 `psql` 执行恢复脚本中的代码。项目建议在每台运行这些工具的机器上更新 `pg_dump`、`pg_restore`、`reindexdb` 与 `vacuumdb`，并明确不要用新的 `composite_type_mismatch` 设置关闭检查——项目方称这样做会带来安全风险。

本批 52 个缺陷中有 32 个被评为 8.8，为该版本最高分；按项目的漏洞索引，只有一个缺陷既不需要登录也不需要用户动作，即 CVE-2026-116322，可让未认证客户端触发 PostgreSQL 18 服务器重启。研究者的利用演示最初在 8 月私下分享给了 AWS（Aurora 与 RDS）、微软（Azure PostgreSQL）、Google（AlloyDB）、Supabase、Databricks 与 Ubicloud 等托管服务方的安全团队，但该文未给出各服务当前的修补状态。此外，PostgreSQL 14 已进入 EOL，14.25 是其最后一个版本，更早的主版本受影响且不再获得更新。

**相关链接**

- https://thehackernews.com/2026/11/postgresql-patches-52-flaws-including.html （The Hacker News 报道原文已取，含 CVE 编号、CVSS、受影响与修复版本、扩展重建要求）

### 24. Check Point 披露 PHP2Shell 漏洞利用链：植入 TSGA 后门、窃取配置并擦除 ESXi 文件

**导语**

Check Point 披露了一次针对其安全网关的真实攻击链：未打补丁的 Check Point Security Gateway 先经 PHP2Shell 漏洞获得初始访问，再经 Gaia OS 上一个此前未公开的本地提权缺陷升级到 root，随后部署 PHP web shell、名为 TSGA 的常驻后门及其配套的 TSProxy 网络组件。活动自 10 月 30 日起以以色列组织为目标，11 月 2 日的第二波扩散到多国多行业组织。

**详细内容**

提权环节对应 CVE-2026-123039（CVSS 7.8），是 DynamicCLI 进程的一个缺失授权缺陷，任何已认证的本地用户向该 socket 写入单个请求即可以任意命令执行，影响 R82.20、R82.10、R82、R81.20、R81.10 与 R81 产品线。初始访问与 PHP2Shell 相关（CVE-2026-109618 与 CVE-2026-109619）。Check Point 称首个漏洞修复发布约一周后，来自 130.94.19[.]204 的流量开始针对以色列组织的 Mobile Access 门户。

后利用阶段的动作具体到可核查的程度：TSGA 以 `slot_CPconfigdaemon` 名义部署，是带 Check Point 专属功能的 Linux 网关植入物，提供加密远程访问、配置窃取、备份与快照持久化、进程注入以及二进制防火墙日志篡改；配套的 TSProxy 组件用于网络侧。攻击者还在网关上部署 gogo 扫描器发现内网资产与服务，使用 `vpxuser` 服务账户经 SSH 横向移动到 VMware ESXi 主机，投放名为 `destroy_v6` 的 Linux ELF 擦除器并执行——该恶意软件递归遍历目标目录删除所有文件，不论扩展名，并尝试先以零覆写再删除，在每个处理过的目录投放名为 `DREAM_ANNEXATION.txt` 的文本。

关于归属，TSGA 与 TSProxy 被评估为 ESET 于 2026 年 6 月首次记录的工具包 PhiliKit 的 Check Point 专属组件，该工具包被归于跟踪代号 Armory Castle（原 UNC5221）的涉华间谍组织；扫描活动集中在 UTC 12 时至 9 时，也与通常的中国工作时间重合。但 Check Point 明确表示没有足够证据把本次活动与该组织或其他已知涉华组织关联，理由包括攻击聚焦以色列且擦除器文本明确提及以巴冲突。

**相关链接**

- https://thehackernews.com/2026/11/hackers-exploit-php2shell-flaws-in.html （The Hacker News 报道原文已取，含 CVE 编号、CVSS、受影响版本、攻击链细节）

### 25. FBI 与司法部公布朝鲜组织 FaceStealer：18 个月内以深度伪造视频通话盗走超 4 亿美元加密资产

**导语**

美国联邦调查局认定，与朝鲜关联的攻击者过去 18 个月内通过名为 FaceStealer 的社工方案盗走超过 4 亿美元加密资产，手段是录制视频与深度伪造。配合美国政府宣布的一揽子行动，支撑该行动的基础设施已被查扣；司法部另宣布对 12 亿美元以上加密资产完成法院授权的查封与冻结，涉朝鲜 TraderTraitor 组织此前对 Binance 的入侵。

**详细内容**

FaceStealer 的运作链条被完整披露：攻击者用此前受害者的被盗账号发出会议邀请；目标入会时，其视频流被录制，同时回放此前受害者的真实预录摄像头视频以建立信任；更多情况下还会使用深度伪造视频，并使用由 OpenAI ChatGPT 生成的头像图片作为静态占位头像。随后攻击者以「音频故障」或「Zoom SDK 已弃用」等话术诱导目标点击伪装成 Zoom（`uu01webzoom[.]us`）或 Teams（`teams.livemeet[.]us`）的仿冒链接安装更新或直接粘贴命令，进而部署恶意软件、劫持目标的 Telegram 等社交账号，实现循环传播。基础设施方面，攻击者使用仿冒视频会议平台的钓鱼工具包，并借助 Telegram 劫持接触者列表进行自我扩散。

 FBI 查扣了攻击者用于冒充受害者的 900 多段摄像头视频，并表示已知另有数起针对软件开发者、维护者与下载量较大的软件库的尝试。Arctic Wolf 2026 年 4 月的报告称该社工行动已针对 20 多个国家 400 多名受害者；本期的最新口径为 58 个国家 677 名目标，其中 80% 以上为创始人与 C-suite 高管。攻击集中于加密货币与 Web3 从业者，以及开源软件开发与维护者，目的是获取开发者设备与代码仓库账号权限以实施供应链攻击——文中提到 FaceStealer 曾用于针对热门 Axios npm 包的维护者投放带木马的版本，投递跨平台远程控制木马。归属方面，该活动关联到 BlueNoroff 集群（别名 APT38、CryptoCore 等）。

**相关链接**

- https://thehackernews.com/2026/11/fbi-says-north-korean-hackers-stole.html （The Hacker News 报道原文已取，含金额、目标数量、攻击链与归属）

## 前瞻与传闻

- Anthropic CEO Dario Amodei 称，一两年内需要多少算力是公司「最深的商业困境」，原因是收入不可预测（彭博社，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261113/p25
- Moonshot AI 正在注销其开曼群岛控股公司，将投资者股权迁入境内主要运营主体，为 IPO 铺路（华尔街日报，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261113/p31
- Meta 员工正在内测预测市场应用 Takes，用「cred」而非真实货币押注问题或事件结果（华尔街日报，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261113/p26
- Nvidia 在华盛顿以「焦土式、对抗性态度」针对出口管制反对者，并在争取许可时援引特朗普名义加速审批（Semafor，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261113/p29

## 后续追踪

- llama.cpp 版本线与稳定性承诺：此前仅有 b 号级连续构建、无公开 API 兼容性承诺 → 本期发布 1.0.0 主版本并转入语义化版本管理，公开 API 的不兼容只在主版本升级发生 → 关注下游集成方的迁移成本与 ggml ABI 边界的实际执行情况
- Nvidia CEO 继任与产业影响：董事会 11-12 公告黄仁勋辞任、CFO Kress 任临时 CEO 并启动搜寻 → 本期董事会称仍在挑选猎头公司、尚未正式接触任何候选人，媒体记录 480 亿美元股权投资与 1,650 亿美元云兜底 → 关注永久继任者公告、11-17 第三财季财报口径与出口管制立场是否变化
- 微软 365 故障根因：EP018 仅记录「多台服务器意外不可用、负载升高」 → 本期微软官方归因为网络容量升级引起的技术问题，并明确与网络攻击及 AI/agent 无关 → 关注官方状态页时间线与逐服务恢复时间戳是否补齐
- Gemini 4 Hydrogen 的开发者落地：11-12 官方发布并上线 Gemini API、AI Studio、应用与搜索 → 本期 GitHub Copilot 侧 GA 可用，并同期公告 12 月 14 日退役 Gemini 3.8 Flash 与 Gemini 4 Argon → 关注 Vertex AI 侧可用性、第三方评测复现与 AI Studio 额度口径
- Anthropic IPO 进展：EP018 记彭博社口径认购约发行量六倍、现有股东获优先配售 → 本期无新的定价或挂牌信息，仅 Amodei 就算力与收入不可预测的关系发声（单一来源） → 关注最终定价、挂牌日与官方确认
- Posture 漏洞处置：EP018 记 Apache mod_http2 CVE-2026-119618 与 Node.js 16 项漏洞 → 本期无新的修复版本或发行版打包进展 → 关注官方公告原文与各发行版打包进度

## 编辑备注

1. **本期真实检索窗口**：2026-11-13 07:00 ~ 2026-11-14 07:00（Asia/Shanghai），共 24 小时，无 72 小时补收条目。窗口内命中带时间戳的一手条目 80 条（来自官方 RSS 与 GitHub Releases API），另有 NotebookLM research 四轮检索（Q1 发布与开发生态、Q2 各厂商官方更新、Q3 安全与合规、Q4 额度与限流类小更新）各返回 10 条来源线索。
2. **未能取到原文的条目**：OpenAI 发布页 `openai.com/index/*` 在本环境持续返回 403（与 EP001、EP004、EP018 一致），因此第 1 条 ChatGPT Wallet 的官方标题与发布时间经官方 RSS 核对，功能细节以 TechCrunch 报道为准，正文需人工打开；OpenAI Python SDK v3.51.0 的完整 API 变更清单未取得，仅核对 Release 页与变更标题。
3. **媒体口径与证据分级**：第 3、4、21 条及全部前瞻与传闻条目为媒体口径，官方公告未取得或未更新；官方宣称数据（transformers 导出性能对比、XYBench 各模型比例、LangChain 客户数与估值）均按发布方口径标注，未独立验证。
4. **事件连续性**：本期 6 条后续追踪中，llama.cpp、Nvidia CEO 继任、微软 365 故障、Gemini 4 Hydrogen 与 Anthropic IPO 均为台账既有事件的新增变化，无旧消息重复包装；Anthropic IPO 与 Apache/Node.js 两条本期无实质新增，已在「后续追踪」中按规则仅保留事件链不展开。
5. **采集限制**：Techmeme 聚合页 261113 分页共核对 11 个，其中 p26、p29 的原始报道未单独取回，仅使用聚合页载明的标题与摘要口径。
