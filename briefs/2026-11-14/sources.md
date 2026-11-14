# AI 早报 2026-11-14 来源清单（EP019）

> 采集窗口：2026-11-13 07:00 ~ 2026-11-14 07:00（Asia/Shanghai）。一级来源优先，媒体口径逐条标注。
> 采集方式：官方博客与公告 RSS（OpenAI、Anthropic、Google、Meta、Microsoft、NVIDIA、Mistral、Ollama、Perplexity、Hugging Face、GitHub Blog 与 Changelog）、GitHub Releases API（40 余个项目）、arXiv cs.AI/cs.CL、Techmeme 聚合、TechCrunch AI 与开发者频道、The Hacker News 安全频道、页面直取，以及 NotebookLM research 四轮检索（Q1 发布与开发生态、Q2 各厂商官方更新、Q3 安全与合规、Q4 额度与限流类小更新，每轮返回 10 条来源线索）。窗口内命中带时间戳条目 80 条。
> 链接核验：公开条目与来源清单链接共 37 条，逐条实际访问 —— 可达 36 条（HTTP 200/206），需人工打开 1 条（403，openai.com 发布页），**失效 0 条**。核验脚本与原始输出：`ep019/work/linkcheck.py`、`ep019/work/linkcheck.txt`。
> 证据等级口径：**官方已确认** = 已取得官方原文；**多源交叉** = 两个及以上独立来源互证；**媒体转述** = 媒体对官方文件的转述；**单一来源 · 未核实** = 只进「前瞻与传闻」。

## 一手来源（官方公告 / 官方仓库 Release / 官方博客）

| # | 条目 | 来源 | 证据等级 | 链接 |
| --- | --- | --- | --- | --- |
| S-01 | ChatGPT Wallet 发布：dots 代理代下单结账、支付令牌替代真实卡号、Face ID/指纹校验、未来消费限额与预授权、Commerce Partner Playbook | OpenAI 官方发布页（2026-11-13 15:00 GMT） | 官方已确认（标题与发布时间经官方 RSS 核对）· **正文本次环境 403，需人工打开** | https://openai.com/index/introducing-chatgpt-wallet |
| S-02 | llama.cpp v1.0.0 / ggml v1.0.0 发布：语义化版本规则（MAJOR/MINOR/PATCH）、移除 35 个弃用 API、NextN API 提升进 llama.h、新增 OCP FP8 KV cache、MoE 缓存 CPU 共享、--shard/--ple 外部 PLE 加载、新增 Kimi-K3.1-Pro / Ripple-65B-Preview / xing4_0 / drama-3 TTS、/v1/audio/speech 端点、SSRF 与 CORS 等加固 | ggml-org/llama.cpp Release（2026-11-13 18:20 CST） | 官方已确认 | https://github.com/ggml-org/llama.cpp/releases/tag/v1.0.0 |
| S-03 | llama.cpp 1.0.0 发布博客：项目成立 3.5 年首个主版本、公开 API 兼容性责任表述、支持超过 150 种架构变体与全部主流推测解码方法、ggml 后端可编译为动态库并运行时加载 | Hugging Face 官方博客（2026-11-13） | 官方已确认（发布方口径） | https://huggingface.co/blog/ggml-org/llama-cpp-v1 |
| S-04 | Gemini 4 Hydrogen 在 GitHub Copilot 正式可用（GA）；按 provider 标价用量计费；覆盖 Pro/Pro+/Max/Business/Enterprise；支持 VS Code、Visual Studio、github.com、JetBrains、Xcode、Eclipse；灰度逐步放开 | GitHub 官方 Changelog（2026-11-13） | 官方已确认 | https://github.blog/changelog/2026-11-13-gemini-4-hydrogen-in-github-copilot |
| S-05 | GitHub Copilot 将于 2026-12-14 退役 6 个模型及替代映射（Claude Fable 5→Fable 5.2、Claude Haiku 4.5→Haiku 5.5、Gemini 3.8 Flash→Hydrogen、Gemini 4 Argon→Carbon、Grok 4.6→Grok 4.7、Kimi K3→待公布）；年付个人订阅的 Haiku 4.5 豁免 | GitHub 官方 Changelog（2026-11-13） | 官方已确认 | https://github.blog/changelog/2026-11-13-upcoming-deprecation-of-selected-github-copilot-models-in-december |
| S-06 | GitHub Copilot app 正式支持 GHES 账号（此前为可选预览）；需先登录 GitHub.com/GHE.com；需 Copilot app 1.2.0+；GHES 不支持 Cloud sessions | GitHub 官方 Changelog（2026-11-13） | 官方已确认 | https://github.blog/changelog/2026-11-13-github-enterprise-server-support-in-the-github-copilot-app |
| S-07 | AI Scan for repositories 支持 REST API 开关（公开预览）：`GET/PATCH /orgs/{org}/code-scanning/ai-scan` 与 `/repos/{owner}/{repo}/code-scanning/ai-scan`；企业策略不允许时返回 422；不自动触发扫描，每次扫描消耗 Code Security AI credits；不支持 GHES | GitHub 官方 Changelog（2026-11-13） | 官方已确认 | https://github.blog/changelog/2026-11-13-manage-ai-scan-for-repositories-using-the-rest-api |
| S-08 | transformers v5.23.0：新模型支持 Inkling 2（48 层 MoE、384 专家路由 8、594B 总参 / 17B 激活）、JEV 决策头、LFM3、Dots 3 Note Preview、LFM3-VL、IQuestCoder（7B/14B/40B）、InternLM3；导出器统一为 `ExportedModel`（覆盖 Dynamo/ONNX Runtime/OpenVINO/ExecuTorch）；官方性能对比口径；多项破坏性变更（ep_router 移除、[audio] 精简、Wav2Vec2ProcessorWithLM 废弃等） | huggingface/transformers Release（2026-11-13 22:10 CST） | 官方已确认（性能数字为发布方口径） | https://github.com/huggingface/transformers/releases/tag/v5.23.0 |
| S-09 | Codex 0.169.0：终端多侧栏会话标签与本地侧栏恢复、agent 命令中心按名称/提示/工作目录搜索历史任务、全屏 transcript 折叠轮次详情、终端内自建自定义模型 provider 与设备码认证、终端内保存诊断 ZIP、macOS/Linux 端 Cloud connection；`codex exec` 不可信目录保持禁用项目配置与 MCP 服务器 | openai/codex Release（2026-11-13 16:37 CST） | 官方已确认 | https://github.com/openai/codex/releases/tag/rust-v0.169.0 |
| S-10 | Codex 版本列表页（0.168.0、0.171.0-alpha.1 至 alpha.5 等窗口内发布） | openai/codex Releases | 官方已确认 | https://github.com/openai/codex/releases |
| S-11 | Claude Code v2.1.325：修复 zstd 压缩响应解码安全缺陷；子代理模型被 plan-mode 覆盖修复；子代理文件读取与 MCP 结果不再按主会话模型衡量；第三方 gateway 与 Foundry 会话上下文压缩修复；`/security-review` 在裸仓库工作树等场景报错修复；`sonnet[1m]` 模型设置被改写修复 | anthropics/claude-code Release（2026-11-14 04:40 CST） | 官方已确认 | https://github.com/anthropics/claude-code/releases/tag/v2.1.325 |
| S-12 | OpenAI Python SDK v3.51.0：扩展 agent、图像、Live 与外部密钥支持（#4269）；依赖 setup-uv 10.3.0→10.3.3 | openai/openai-python Release（2026-11-14 05:12 CST） | 官方已确认（完整 API 变更清单未取得） | https://github.com/openai/openai-python/releases/tag/v3.51.0 |
| S-13 | langchain-openai 1.8.0：放弃 Python 3.10，最低 Python 3.11 / langchain-core 1.8.0；新增 `OpenAIClassifier` 对接 GA Decisions API（#41787）；刷新模型档案数据；伙伴包移除 EOL Python 3.10 | langchain-ai/langchain Release（2026-11-14 00:48 CST） | 官方已确认 | https://github.com/langchain-ai/langchain/releases/tag/langchain-openai%3D%3D1.8.0 |
| S-14 | LiteLLM 1.108.8（LTS）：4 个 PR、3 项修复；Azure `/v1/decisions` 400 修复（#51460）、Gemini 文件 ID 拼写遗漏修复等；官方标注「无需升级操作」 | BerriAI/litellm Release（2026-11-14 04:21 CST） | 官方已确认 | https://github.com/BerriAI/litellm/releases/tag/v1.108.8 |
| S-15 | LiteLLM 版本列表页（v1.111.0-dev.2、v1.106.10 等窗口内版本与 cosign 校验说明） | BerriAI/litellm Releases | 官方已确认 | https://github.com/BerriAI/litellm/releases |
| S-16 | Vercel AI SDK ai@7.0.172：`experimental_extract`/`experimental_decide` 远程文件 URL 必须显式提供 `experimental_download` 钩子，不再经全局 fetch 静默下载，可用 `createDownload({ fetch })` 传 DNS 保护传输层 | vercel/ai Release（2026-11-13 13:57 CST） | 官方已确认 | https://github.com/vercel/ai/releases |
| S-17 | Vercel AI SDK ai@7.0.173：批准重放中防止就地 schema 校验改变已批准工具参数、`WorkflowAgent` 步骤上限告警、provider 告警接入 AI SDK 日志、`prepareStep` 结构对齐 | vercel/ai Release（2026-11-14 06:34 CST） | 官方已确认 | https://github.com/vercel/ai/releases/tag/ai%407.0.173 |
| S-18 | XYBench：8,115 题（Stack Overflow 1,557 / Stack Exchange 184 / 人工 102 / WikiHow 生成 6,272）；三维评测（Pragmatic solution / Pragmatic emphasis / Misconception identification）；Claude Sonnet 4.5 自动评审，两名人工评审 500 条回答，一致率 97.5–100% / 84.6–93.3% / 74.2–79.8%；实测比例数据与 oracle 实验；获 EMNLP 2026 最佳资源论文奖 | Hugging Face 官方博客（allenai，2026-11-13） | 官方已确认（评测数据为发布方口径） | https://huggingface.co/blog/allenai/xybench |
| S-19 | SimReady 机器人抓取放置实践：UR17G 机械臂 + Robotiq 2F-140 夹爪 + 饮料罐，Isaac Sim 场景组装与 agent 生成控制器；SimReady Central 开放资产库；Profile / Features / Requirements 三层规范 | Hugging Face 官方博客（nvidia，2026-11-13） | 官方已确认 | https://huggingface.co/blog/nvidia/simready-assets-robot-pick-and-place |

## 媒体报道（官方文件 / 项目公告转述，非独立验证）

| # | 条目 | 来源 | 证据等级 | 链接 |
| --- | --- | --- | --- | --- |
| M-01 | ChatGPT Wallet 功能细节：美国 Pro 订阅者限量开放、18+ 与美国签发卡要求、下单前核对商品/总额/卡、Face ID 或指纹校验并生成交易记录、支付令牌机制、商户自动获得履约信息、积分与争议保护保留、未来消费限额与品类/时段预授权、更多零售站点支持、Commerce Partner Playbook | TechCrunch（2026-11-13 08:00 PST） | 媒体原创报道 · 已与 S-01 交叉 | https://techcrunch.com/2026/11/13/chatgpts-new-wallet-lets-ai-agents-shop-and-check-out-for-you/ |
| M-02 | 微软就 365 故障致歉：事故为「network capacity upgrade」引起的技术问题，与网络攻击或 AI/agents 无关，服务已进入广泛恢复与稳定阶段 | @microsoft 官方声明，经 Techmeme 聚合 | 媒体转载官方声明 · 官方声明原文未单独取回 | https://www.techmeme.com/261113/p28 |
| M-03 | 微软 365 故障首发报道（多台服务器意外不可用、负载升高、Outlook/Teams/Copilot/OneDrive 不可用） | Engadget（2026-11-12） | 媒体原创报道（EP018 已取） | https://www.engadget.com/2315259/multiple-microsoft-365-services-are-experiencing-an-outage/ |
| M-04 | Nvidia 董事会称正在挑选 CEO 猎头公司、尚未正式接触任何候选人 | CNBC，经 Techmeme 聚合 | 媒体 · 单一来源 | https://www.techmeme.com/261113/p27 |
| M-05 | Nvidia 截至 7 月底持有 229 家私营企业 480 亿美元股权（含 OpenAI、Anthropic），曾提供 1,650 亿美元云服务兜底；部分投资人与创业者称「失去盟友」 | 纽约时报，经 Techmeme 聚合 | 媒体 · 单一来源 | https://www.techmeme.com/261113/p24 |
| M-06 | 黄仁勋离任对 AI 初创融资的影响：Nvidia 曾在黄任内向初创投入数百亿，创始人与风投预期更小的融资额与更低估值 | TechCrunch（2026-11-13） | 媒体原创报道 | https://techcrunch.com/2026/11/13/jensen-huangs-departure-blasts-big-hole-in-ai-startup-funding-vcs-and-founders-say/ |
| M-07 | FAA 扩大空管 AI 工具 SMART 使用至全美国国家空域系统（11-10 宣布） | Ars Technica（Jeremy Hsu），经 Techmeme 聚合 | 媒体 · 单一来源 | https://www.techmeme.com/261113/p32 |
| M-08 | FBI 正调查 FAA 通信中断是否由软件更新引发，不认为是网络攻击或犯罪行为 | 彭博社（Myles Miller），经 Techmeme 聚合 | 媒体 · 单一来源 | https://www.techmeme.com/261113/p33 |
| M-09 | FAA 逾四小时全国性地面停飞后解除，原因为影响多个空管中心的通信问题 | Axios（Alex Fitzpatrick），经 Techmeme 聚合 | 媒体 · 单一来源 | https://www.techmeme.com/261113/p30 |
| M-10 | LangChain 3 亿美元 C 轮、估值 30 亿美元，CapitalG 领投，GIC / DFJ Growth / IVP / Sapphire 参与；LangSmith 客户 7,000 家，含 Nvidia、Toyota、Salesforce | TechCrunch（2026-11-13） | 媒体原创报道（金额与客户数为公司口径） | https://techcrunch.com/2026/11/13/ai-agent-startup-langchain-hits-3b-valuation/ |
| M-11 | ElevenLabs 发布实验性应用 ElevenAI（会议纪要 + 听写 + agent 集成），需候补名单；支持 90+ 语言听写；ElevenLabs 估值 220 亿美元；同期发布 v3 系列 Scribe 语音转文本模型 | TechCrunch（2026-11-13） | 媒体原创报道 | https://techcrunch.com/2026/11/13/elevenlabs-new-app-combines-meeting-note-taking-and-dictation-for-teams/ |
| M-12 | AMD SEV-SNP 的 Mior 与 Skyfall 攻击：Mior 重定向 PSP 写入至显卡内存使 RMP 部分未初始化、改写保护并用 PSP 调试命令读写机密 VM 内存（1,000 次尝试全部成功）、可伪造签名证明；Skyfall 基于 TSA 在 VM 启动失败时读出保存寄存器值与磁盘加密密钥（每页仅 3 条固定缓存行）、在 Zen 5 未复现、另可读解密微码与 SMM 内存；CVE-2026-0462（CVSS 5.9）、CVE-2026-40671（4.9）、CVE-2026-18448（5.6）；AMD 给出 7003/8004/8005/9004/9005 五条 EPYC 线固件修复；Supermicro BIOS 清单与 BMC 更新要求 | The Hacker News（2026-11-13） | 媒体转述研究与厂商公告 · 官方公告原文未取回 | https://thehackernews.com/2026/11/new-mior-and-skyfall-attacks-let-rogue.html |
| M-13 | PostgreSQL 一次性修复 52 个漏洞：CVE-2026-6460 类型混淆 CVSS 8.8（成因追溯至 2004-05-05 与 2015-05-14 改动）、受影响版本与修复版本（18.7/17.12/16.16/15.20/14.25）、必须重建 C 语言扩展且新扩展在旧服务器加载失败、不得用 `composite_type_mismatch` 关闭检查、客户端工具 `pg_restore`/`pg_dump`/`psql` 代码执行风险、CVE-2026-116322 未认证可触发 PG18 重启、32 个缺陷评为 8.8、8 月私下分享给 AWS/微软/Google 等托管服务方的 PoC、PG14 已 EOL | The Hacker News（2026-11-13） | 媒体转述项目公告 · 官方公告原文未取回 | https://thehackernews.com/2026/11/postgresql-patches-52-flaws-including.html |
| M-14 | Check Point PHP2Shell 利用链：10-30 起针对以色列组织、11-02 扩散至多国多行业；CVE-2026-123039（CVSS 7.8，DynamicCLI 缺失授权）提权，影响 R82.20 至 R81；PHP2Shell 对应 CVE-2026-109618 与 CVE-2026-109619；TSGA 后门与 TSProxy 组件、gogo 扫描器、`vpxuser` 账户横向移动至 ESXi、destroy_v6 擦除器与 DREAM_ANNEXATION.txt；PhiliKit / Armory Castle 归属评估与 Check Point 的证据不足说明 | The Hacker News（2026-11-13） | 媒体转述厂商公告 · 官方公告原文未取回 | https://thehackernews.com/2026/11/hackers-exploit-php2shell-flaws-in.html |
| M-15 | FBI 与司法部公布朝鲜组织 FaceStealer：18 个月盗走超 4 亿美元加密资产；基础设施被查扣；12 亿美元以上 Binance 相关资产被查封冻结；钓鱼工具包、仿冒 Zoom/Teams 域名、ChatGPT 生成头像、900+ 视频被查扣；58 国 677 目标、80%+ 为创始人与 C-suite；Arctic Wolf 4 月报告口径 400+ 受害者；Axios npm 包维护者被投毒 | The Hacker News（2026-11-13） | 媒体转述 FBI / DOJ 公告 · 官方公告原文未取回 | https://thehackernews.com/2026/11/fbi-says-north-korean-hackers-stole.html |
| M-16 | Anthropic CEO Dario Amodei：算力需求是「最深的商业困境」，因收入不可预测 | 彭博社，经 Techmeme 聚合 | 媒体 · 单一来源 · 未核实（线索雷达） | https://www.techmeme.com/261113/p25 |
| M-17 | Moonshot AI 注销开曼群岛控股公司、迁股至境内主体以推进 IPO | 华尔街日报，经 Techmeme 聚合 | 媒体 · 单一来源 · 未核实（线索雷达） | https://www.techmeme.com/261113/p31 |
| M-18 | Meta 员工内测预测市场应用 Takes，用「cred」而非真实货币押注 | 华尔街日报，经 Techmeme 聚合 | 媒体 · 单一来源 · 未核实（线索雷达） | https://www.techmeme.com/261113/p26 |
| M-19 | Nvidia 在华盛顿以「焦土式、对抗性态度」针对出口管制反对者并援引特朗普名义加速审批 | Semafor，经 Techmeme 聚合 | 媒体 · 单一来源 · 未核实（线索雷达） | https://www.techmeme.com/261113/p29 |

## 补充说明

1. 本期公开条目与来源清单链接共 37 条，逐条实际访问结果为可达 36 条（HTTP 200/206）、需人工打开 1 条（403，`openai.com/index/introducing-chatgpt-wallet`）、**失效 0 条**。
2. `openai.com/index/*` 在本环境持续 403（与 EP001 / EP004 / EP018 一致）；OpenAI 官方 RSS 可用，本期据此核对 ChatGPT Wallet 的标题与发布时间。
3. OpenAI Python SDK v3.51.0 的完整 API 变更清单未取得，母版仅登记 Release 页可核对的变更标题，不做逐字段推断。
4. 官方安全公告原文（AMD、PostgreSQL、Check Point、FBI / DOJ）本期均未取回，相关条目按媒体转述口径标注，攻击在野证据一律照录原文口径，不做补全。
