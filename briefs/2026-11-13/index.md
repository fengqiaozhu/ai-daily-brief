# AI 早报 2026-11-13

> 检索时间窗：2026-11-12 07:00 ~ 2026-11-13 07:00（Asia/Shanghai，24 小时）。本期无 72 小时补收条目。
> 目标读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者。
> 一手来源优先：官方博客与公告、GitHub Release、Hugging Face、监管与政府文件；媒体口径逐条标注，官方宣称均标注「官方称」。

## 今日概览

**要闻**

1. Nvidia 董事会宣布黄仁勋辞任总裁、CEO 与董事，即时生效；CFO Colette Kress 出任临时 CEO
2. Fireworks AI 泄露范围扩大：Notion 确认约 1% 客户使用 Insights 功能的 AI 对话记录被窃，为该公司两个月内第二次事件
3. 微软 365 大面积故障：Outlook、Teams、Copilot、OneDrive 同时不可用，微软称「服务器意外不可用、负载升高」
4. 美国国会民主党对 Nvidia 启动调查并致函，白宫讨论商务部部长去留；黄仁勋同意周三赴国会作证

**开发生态**

5. Google Antigravity 上线 Orchestrator：同一会话内动态切换 Carbon 与 Hydrogen，官方称 Terminal-Bench 4.0 接近 Carbon 成功率并少耗 24% 配额
6. OpenAI Python SDK v3.50.0：在 Responses API 上暴露 reasoning 输入变换能力
7. Claude Code v2.1.323：新增 Code Mode 实验开关、插件版本区间约束与 TypeScript 钩子类型校验
8. GitHub Actions 将于 2026 年 12 月 8 日停止 Windows 与 Linux 上的 ARM32 任务执行
9. LiteLLM 窗口内连发 5 个版本，LTS 线新增「Responses API 需设置 drop_params」迁移要求
10. Vercel AI SDK 发布 ai@7.0.171 与 ai@6.0.331：修复畸形消息校验导致的内存与 CPU 耗尽
11. llama.cpp 窗口内发布 b12302 至 b12329 共 19 个构建，含 Gemma 4 工具参数 schema 重构与 CUDA NVFP4 预填充优化

**模型发布**

12. Google 发布 Gemini 4 Hydrogen：1M 上下文、输入 1.50 美元 / 输出 7.50 美元每百万 token、四档思考级别

**产品应用**

13. Gemini 4 Hydrogen 上线 Google 搜索：AI Mode 与 AI Overviews 全球全量替换，并进入 Gemini 应用、for business 与 AI Studio
14. United Airlines 限制第三方 AI 助理代订机票与改签，理由为凭据泄露风险与可能违反 FAA 规定
15. OpenAI 承诺 200 万美元支持儿童 AI 安全研究，目标是产出可共享的风险与机会度量工具

**技术与洞察**

16. IBM 与 Hugging Face 发布 LLMON 预览模型 granite-4.1-3b-LLMON-preview 与 8b 版本，用保留特殊 token 承载结构与语义
17. Hugging Face 发布 3D 生成模型微调指南：给出 TRELLIS.2 的 LoRA 微调脚本与容器
18. GitHub Secret scanning 新增 Cloudflare service token 检测类型

**行业动态**

19. Nebius 公布 2027 年 400 亿美元投入计划，靠客户预付与贷款融资；微软新泽西 Vineland 机房交付推迟至 2027 年 Q2
20. Norwest 完成 40 亿美元基金，为其第十八只、也是规模最大的一只，重点投向 AI

**安全事件**

21. Apache HTTP Server mod_http2 严重漏洞 CVE-2026-119618：影响 2.4.55 至 2.4.70，修复于 2.4.71
22. Node.js 一次修复 16 个漏洞，两个 HTTP/2 漏洞可致未认证客户端击垮服务器并读到其他连接的内存
23. 攻击者用 4,837 个被盗 GitHub 账号在至少 1,806 个仓库植入 CI 密钥窃取器
24. 186 个仿冒 AI 工具域名被用于投递 ClickFix 诱饵、浏览器劫持扩展与搜索劫持

**前瞻与传闻**

- Anthropic 的 IPO 认购约为发行量的六倍，银行家告知现有股东将获优先配售（彭博社，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261112/p55
- 六个自 4 月以来发布的开源权重模型被发现带有受出口管制 Blackwell GPU 的指纹（Unemployment Labs，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261112/p62
- OpenAI 已向议员确认支持两党立法限制中国取得 AI 芯片与芯片制造工具（彭博社，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261112/p59
- Cerebras 第三季核心营收同比增 70% 至 2.309 亿美元，并宣布与微软达成合作（CNBC，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261112/p57
- 美国商务部正敲定针对中国 AI 企业远程访问海外芯片的新规（Leo Schwartz 独家，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261112/p62
- SpaceX 计划在亚利桑那州投入 500 亿美元、德州投入 240 亿美元建设数据中心园区（纽约时报，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261112/p54

## 要闻

### 1. Nvidia 董事会宣布黄仁勋辞任总裁、CEO 与董事，即时生效；CFO Colette Kress 出任临时 CEO

**导语**

Nvidia 董事会于 11 月 12 日（周四）通过官方新闻室宣布，公司联合创始人、任职 33 年的 CEO 黄仁勋已辞任总裁、首席执行官与董事会成员，即时生效。执行副总裁兼首席财务官 Colette Kress 同意出任临时 CEO 并继续兼任 CFO，直至永久继任者到位；董事会同时启动内部与外部候选人的搜寻。TechCrunch 报道指出，Nvidia 市值约 3.8 万亿美元。

**详细内容**

官方公告同时披露两项此前未见的信息：董事会任命 Harvey C. Jones 出任首任独立董事长（他曾任 Synopsys CEO 与执行董事长，是有 30 年以上经历的创业者、技术高管与活跃风险投资人）；第三财季（FY2027）财报日程不变，定于 11 月 17 日（周二）美西时间约 13:20 发布，随后于 14:00 召开业绩电话会。

Kress 2013 年 9 月加入 Nvidia，此前在 Cisco 与微软从事财务岗位近 25 年。她在公告中表示：「Nvidia 的力量一直来自我们的团队，我将与领导团队一道，继续在 Jensen 过去 33 年奠定的非凡基础上继续前进。」董事长 Jones 表示董事会对公司运营、客户承诺与产品路线图「不中断」有信心。官方另有「董事会独立成员声明」一篇，本期未取到正文。

对开发者生态的直接含义是：Nvidia 的开源投入与出口管制立场此前与黄仁勋个人高度绑定。本期多篇报道记录了这一不确定性——Hugging Face 首席执行官 Clément Delangue 表示将继续为开源 AI 而战，同时市场关注 Nvidia 129.3 亿美元收购 Hugging Face 的后续。Kress 此前作为 CFO 曾批评美国对华出口管制，这一背景也被多家媒体点名。

**相关链接**

- https://nvidianews.nvidia.com/news/nvidia-announces-ceo-transition （Nvidia 官方新闻室公告，原文已取）
- https://techcrunch.com/2026/11/12/jensen-huang-is-out-at-nvidia-who-is-colette-kress-his-interim-replacement/ （TechCrunch 报道，含 Kress 履历与背景说明）
- https://www.reuters.com/business/retail-consumer/nvidia-ceo-jensen-huang-step-down-big-blow-ai-boom-2026-11-12/ （路透社报道）

### 2. Fireworks AI 泄露范围扩大：Notion 确认约 1% 客户使用 Insights 功能的 AI 对话记录被窃

**导语**

Fireworks AI 在最新安全公告中确认，攻击者入侵其云服务商后进入 Fireworks 开发系统，取得客户账单信息与部分数据集。已确认的受害客户包括在线文档工具 Notion —— 该公司披露其约 1% 的客户受影响，且使用 Notion AI「Insights」功能的客户聊天记录被窃取。这是 Fireworks 两个月内第二次泄露事件。

**详细内容**

Notion 表示，Fireworks 先向其通报安全事件并确认黑客窃取了部分客户数据；11 月 3 日 Notion 断开与 Fireworks 的系统连接、删除已存数据并停止一切连接。本周 Notion 进一步确认，被窃取的是 Notion AI 用户使用 Insights 功能时写入聊天记录的全部模型输入与输出；公司同时说明，其中相当一部分数据无法归属到具体客户。Fireworks 平台客户以数万计，报道提到 Harvey、Cursor 等知名公司使用其服务。

Fireworks 表示其判断攻击者动机为牟利，目标是取得大语言模型访问凭据后倒卖 token，供第三方消耗而不占用自身额度。此前台账已登记该事件 10 月 9 日首份公告（仅评测作业密钥被访问）与 11 月 9 日的范围扩大公告（账单与账户信息、部分密钥、数据集与不完整模型权重，并首次指向 LLMJacking 团伙）。本次新增的是受害方 Notion 的具体受影响范围与数据类型。

**相关链接**

- https://techcrunch.com/2026/11/12/cyberattack-on-fireworks-ai-allowed-hackers-to-access-notion-customers-chat-transcripts/ （TechCrunch 报道，含 Notion 披露内容）
- https://fireworks.ai/security/bulletins/october-2026-security-incident-update （Fireworks 官方安全公告）
- https://thehackernews.com/2026/11/fireworks-ai-breach-widens-to-expose.html （媒体转述）

### 3. 微软 365 大面积故障：Outlook、Teams、Copilot、OneDrive 同时不可用，微软称「服务器意外不可用、负载升高」

**导语**

11 月 12 日（周四）下午，微软 365 多项服务出现大面积不可用，用户无法访问 Outlook 邮箱与 Teams 等服务。微软称「多台服务器意外不可用」，受影响服务被指为「负载升高」问题。多家媒体同时记录该故障，Downdetector 显示美国境内有大量用户报告不可用。

**详细内容**

从各方报道看，受影响面覆盖 Outlook 邮件、Teams、OneDrive 与 Copilot，TechCrunch 与 Engadget 均以独立稿件记录，Verge、BleepingComputer、PCWorld、Wired 与 The Independent 亦有报道，彭博社方面则引述微软称正在处理 Outlook 与 Copilot 的故障。The Independent 的标题把该次故障与 OpenAI 一并提及，说明 Copilot 服务链路同时受牵连。

需要区分的是，本条与 11 月 10 日微软 11 月补丁批次（1,259 个漏洞）无关——后者是软件更新事件，本条是运行期可用性故障。截至发稿，本环境未取得微软官方状态页（status.cloud.microsoft / portals.status.microsoft）对本次事件的时间线与恢复时间戳原文，因此故障起止时刻与影响服务清单以媒体记录为准，不做补全。

**相关链接**

- https://www.engadget.com/2315259/multiple-microsoft-365-services-are-experiencing-an-outage/ （Engadget 报道，含微软「服务器意外不可用」表述）
- https://www.techmeme.com/261112/p51 （Techmeme 聚合页，含 Verge、BleepingComputer、PCWorld、Wired、路透社等多源报道）
- https://www.reuters.com/ （路透社报道入口，用于交叉核对）

### 4. 美国国会民主党对 Nvidia 启动调查并致函，白宫讨论商务部部长去留；黄仁勋同意周三赴国会作证

**导语**

美国国会民主党议员启动对 Nvidia 的调查，并致函批评黄仁勋与特朗普之间就中国销售的安排。多个委员会要求黄仁勋出席作证，他已于 11 月 12 日同意周三到国会 testimony。同期，路透社报道称白宫高层正在讨论是否要撤换商务部长 Howard Lutnick；总检察长 Todd Blanche 则表示司法部尚未就是否为中国间谍作出结论，联邦调查局仍在调查。

**详细内容**

这是台账中「Nvidia 董事会调查黄仁勋是否受外国情报策动」一线的重大进展：此前仅停留在董事会内部调查、彭博社与 AP 关于联邦调查介入的转述，本期出现三条新增事实 —— 国会层面正式启动调查并发出措辞严厉的质询函；黄仁勋本人同意作证；以及行政当局内部出现人事调整讨论。

需要说明口径边界：调查启动、作证承诺与白宫讨论均来自媒体报道，本期未取得国会委员会新闻稿原文、也未取得 Nvidia 官方新闻稿原文。TechCrunch 另有一篇梳理完整时间线的报道，另有报道称黄仁勋与一名 Nvidia 高管的第三段婚外情（路透社口径）。这些细节本期只作事实记录，不做动机推测。

**相关链接**

- https://techcrunch.com/2026/11/12/democrats-launch-nvidia-investigation-write-scathing-letter-on-huangs-scheme-with-trump/ （TechCrunch 报道）
- https://techcrunch.com/2026/11/12/jensen-huang-agrees-to-testify-before-congress/ （TechCrunch 报道）
- https://apnews.com/article/nvidia-megaspeed-china-singapore-huang-5403f152a601cf82ce939f1d24fffa0f （美联社报道，含 Megaspeed 与新加坡转运线索）
- https://www.reuters.com/live/nvidia-live-board-meets-fate-ceo-jensen-huang-after-affair-reports-2026-11-12/ （路透社实时报道页）

## 开发生态

### 5. Google Antigravity 上线 Orchestrator：同一会话内动态切换 Carbon 与 Hydrogen

**导语**

Google 在 Antigravity 中引入 Orchestrator，可在同一会话内于 Carbon 与 Hydrogen 等模型之间动态切换，面向 Google AI Ultra 订阅者。官方称其在 Terminal-Bench 4.0 上达到接近 Carbon 的任务成功率，同时平均少消耗 24% 配额。

**详细内容**

官方把 Orchestrator 定位为「多模型协作自动化」的载体：当团队用 Carbon、Argon 做深度架构判断时，Hydrogen 负责写代码、跑测试与验证改动，Orchestrator 负责在同一次会话中自动完成这种切换。同篇官方说明还提到 Antigravity 新增的 Gemini 前端设计 skill 与 Geminisland 体素岛屿实验。

需要注意证据等级：Antigravity 的上线公告由官方渠道发布，但本期是通过 Techmeme 聚合页取得官方帖子的摘要，官方博客页未逐条取到，因此本文只保留官方原文中可核对的数字，不展开更多案例细节。

**相关链接**

- https://www.techmeme.com/261112/p49 （Google Antigravity 官方发布帖，经 Techmeme 聚合）
- https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-hydrogen/ （Google 官方发布博客，含 Orchestrator 段落）
- https://techcrunch.com/2026/11/12/googles-latest-search-upgrade-promises-better-answers-to-your-most-complicated-questions/ （TechCrunch 对 Gemini 4 Hydrogen 的独立报道）

### 6. OpenAI Python SDK v3.50.0：在 Responses API 上暴露 reasoning 输入变换能力

**导语**

OpenAI 官方 Python SDK 于 11 月 12 日发布 v3.50.0，唯一的功能变更是「在 responses 上暴露 reasoning 输入变换」（对应 PR #4268）。该版本同时升级构建依赖 astral-sh/setup-uv 至 10.3.3，并简化了 review 交接文档。

**详细内容**

这一条对使用 Responses API 的团队有直接影响：reasoning 相关配置此前需要在请求体中自行拼装，现在 SDK 层面提供了对应的输入变换入口。具体可用的字段与生效范围以官方 API 文档为准，本期只核对 Release 页面正文，未逐项比对 API 参考页。

同一条版本线在本期另有 3 个 alpha/rc 构建发布（0.167.0-alpha.4.3、0.170.0-alpha.2、0.170.0-alpha.3、0.170.0-alpha.4），均为无正文说明的占位发布，不单独成条。

**相关链接**

- https://github.com/openai/openai-python/releases/tag/v3.50.0 （官方 Release 页）
- https://github.com/openai/openai-python/releases （官方 Release 列表）

### 7. Claude Code v2.1.323：新增 Code Mode 实验开关、插件版本区间约束与 TypeScript 钩子类型校验

**导语**

Anthropic 官方 Claude Code 于 11 月 13 日 06:12 CST 发布 v2.1.323。新增实验性 Code Mode —— Claude 改为编写 JavaScript 来调用工具，可在设置或组织层面开关；同时 `plugin.json` 新增 `engines["claude-code"]` 字段，超出声明版本范围的插件不会被安装、更新或加载。

**详细内容**

该版本还有几项面向插件作者的改动：`claude plugin validate` 新增对插件 TypeScript 钩子模块的类型检查，每条发现为警告级，`--strict` 可使其失败；校验命令同时覆盖模组 `engine.create` 钩子新增、扣留或替换的 `$` 名词。此外，版本支持在托管设置中为 Claude Desktop 的第三方提供商会话使用 `CLAUDE_CODE_AUTO_MODE_MODEL`，并为长时间运行的钩子每 30 秒输出一次进度心跳。

其余条目为体验性改进：`.docx` 资产上传支持、diff 面板新增「/diff to close」提示与快捷键说明、`claude -p` 与 SDK 会话在 Bash 允许规则含 `*` 时给出启动警告、以及模型需用量额度时的选项菜单（停止、切换用量额度、升级）。

**相关链接**

- https://github.com/anthropics/claude-code/releases/tag/v2.1.323 （官方 Release 页）
- https://docs.claude.com/ （Claude Code 官方文档入口，Code Mode 说明所在）
- https://github.com/anthropics/claude-code/releases （官方 Release 列表）

### 8. GitHub Actions 将于 2026 年 12 月 8 日停止 Windows 与 Linux 上的 ARM32 任务执行

**导语**

GitHub 官方 Changelog 公告：托管 runner 将于 2026 年 12 月 8 日起结束对 Windows 与 Linux 上 ARM32 作业执行的支持，其中包括托管 runner 上原生 AArch32 用户态执行的移除。官方称这是承接此前 Node 20 支持终止的延续 —— 因为 Node 24 已不支持 ARM32。

**详细内容**

这条对 CI 流水线的影响是可预期的但有明确时间点：仍在 32 位 ARM 上构建的仓库需要在 12 月 8 日前迁移到 x64 runner 或自托管 ARM64 设备。官方公告本身给出了退役原因（Node 24 不支持 ARM32），并把它定位为 Node 20 支持终止之后的延续动作。

需要提示的是，本次采集到的官方 Changelog 页面同一列表中还包含其他条目（如 `pull_request_target` 默认阻止时间为 12 月 2 日、Xcode 27 runner 镜像正式可用、macOS 14 runner 镜像退役），这些不属于本期主窗口事件，本期不做展开。

**相关链接**

- https://github.blog/changelog/2026-11-12-actions-for-arm32-linux-windows-retirement （GitHub 官方 Changelog）
- https://github.blog/changelog/ （GitHub Changelog 索引）

### 9. LiteLLM 窗口内连发 5 个版本，LTS 线新增「Responses API 需设置 drop_params」迁移要求

**导语**

LiteLLM 在本期窗口内发布 v1.106.9、v1.108.6（LTS）、v1.109.1、v1.110.0-rc.2 与 1.108.7（LTS）共 5 个版本。1.108.7 LTS 列出 14 个 PR（3 新增、8 修复、1 变更），其中一项「需要动作」的迁移要求是：经 chat completions 桥接到其他提供商的场景，必须设置 `drop_params: true` 或停止发送 `max_tool_calls` 这类仅 Responses API 支持的字段。

**详细内容**

1.108.6 LTS 的迁移要求与之不同但同属「需要动作」级别：把 `tenant_id`、`client_id`、`client_secret`、`azure_username`、`azure_password` 与 `azure_scope` 这些请求标签移入 `metadata`（PR #51254）。全部 5 个版本的 Docker 镜像继续使用 cosign 签名，签名公钥固定在 commit `e82a3c6`（`e82a3c646908ba0a6ee0beddc4310d7a6cac4065`）对应的 `cosign.pub`。

延续上一期的口径提醒：v1.109.0 曾列出 5 项需要动作的迁移要求（字符串回退目标须改为模型名列表、缓存 `cache_params.type` 须由 disk 改为 local 或 redis 等），升级前建议先对照本期两处新增要求一次性完成改造，避免在同一版本线上反复返工。

**相关链接**

- https://github.com/BerriAI/litellm/releases/tag/v1.110.0-rc.2 （官方 Release 页）
- https://github.com/BerriAI/litellm/releases/tag/v1.108.7 （1.108.7 LTS Release 页）
- https://github.com/BerriAI/litellm/releases （官方 Release 列表）

### 10. Vercel AI SDK 发布 ai@7.0.171 与 ai@6.0.331：修复畸形消息校验导致的内存与 CPU 耗尽

**导语**

Vercel AI SDK 于 11 月 13 日 04:16 至 04:24 CST 连续发布 ai@6.0.331、ai@7.0.171 及十余个配套 provider 包版本。核心修复是：`validateUIMessages`、`safeValidateUIMessages` 与 agent UI 流助手此前会对每个非法 part 报告全部 schema 的问题，导致少量畸形 part 的请求也可能耗尽内存。

**详细内容**

修复后的行为是：每个 part 只按其自身类型的 schema 校验，遇到第一个非法消息或 part 即停止，并在 provider 或工具元数据中出现非法 JSON 值时只报告为单条问题。ai@7.0.171 还新增：下载文件输入时转发 provider 配置的 fetch 传输（`createDownload` 增加 `fetch` 选项），使核心下载同样可启用 guarded-fetch 的可选 DNS 校验；该函数也可作为 `experimental_download` 传给 `generateText` 与 `streamText`，并已覆盖模型返回的生成文件 URL。官方同时提示默认 URL 检查不做 DNS 解析，对不可信 URL 建议使用受控传输或网络出口管控。

同期 `@ai-sdk/tool-web-fetch@1.0.21` 同步上述改动，`@ai-sdk/topaz@3.0.27` 新增 Topaz 图像与视频模型目录（含模型 ID 建议、API 别名、能力、轮询默认值与 provider 选项元数据），`@ai-sdk/typesafe-ai@3.0.39` 新增 TypeSafe AI 决策模型目录。

**相关链接**

- https://github.com/vercel/ai/releases/tag/ai%407.0.171 （官方 Release 页）
- https://github.com/vercel/ai/releases/tag/ai%406.0.331 （官方 Release 页）
- https://github.com/vercel/ai/releases （官方 Release 列表）

### 11. llama.cpp 窗口内发布 b12302 至 b12329 共 19 个构建，含 Gemma 4 工具参数 schema 重构与 CUDA NVFP4 预填充优化

**导语**

llama.cpp 在 11 月 12 日 07:00 至 11 月 13 日 07:00 CST 的窗口内连续发布 19 个构建，编号从 b12302 到 b12329。其中 b12323 重构 Gemma 4 的工具参数 schema 解析，b12329 优化 nvfp4 量化检查点的 CUDA 预填充路径，b12307 修复 Metal SOLVE_TRI 内核的越界读。

**详细内容**

具体可引用的变更包括：b12303 的 jinja 模板支持链式比较与参数展开；b12304 让调度器跨保留区复用 graph result 实例；b12306 为 Vulkan 后端增加批量张量拷贝 API；b12314 为 Adreno 架构的 OpenCL 后端增加分解式 FA；b12316 在 MMQ stream-k 修复中跳过空的 MoE tile；b12320 修复 SYCL 超过 4GB 时的 AOT 编译问题并新增 `--ao` 选项；b12321 让 SYCL 的 oneDNN FA 缓存线程安全并记忆运行时失败；b12322 避免触碰未使用的 graph 元数据页；b12327 把 SpacemiT Q4_1 32x256 派发到 HP kernel；b12328 为 ggml-backend 增加跨 split 的输入预取。

延续上一期口径：本条只登记构建数量与可引用的功能条目，b 号级的细节变更以各 Release 页为准。同期开发生态还有 crewAI 1.15.41（允许已批准的私有 URL 主机、修复 PyMuPDF 2.x 依赖等 4 项），因属常规补丁未单列条目。

**相关链接**

- https://github.com/ggml-org/llama.cpp/releases/tag/b12329 （窗口内最新构建 Release 页）
- https://github.com/ggml-org/llama.cpp/releases （官方 Release 列表，19 个构建核对入口）
- https://github.com/anthropics/claude-code/releases/tag/v2.1.323 （同期 Claude Code Release 页）

## 模型发布

### 12. Google 发布 Gemini 4 Hydrogen：1M 上下文、输入 1.50 美元 / 输出 7.50 美元每百万 token、四档思考级别

**导语**

Google 于 11 月 12 日发布 Gemini 4 Hydrogen，定位为「面向日常编码与 agentic 工作流的高效模型」，是 Gemini 4 系列在 Carbon、Argon 之后的第三款模型。官方公布其整段 100 万 token 上下文内价格恒定为输入 1.50 美元、输出 7.50 美元（每百万 token），并提供 low、medium、high（默认）与新增的 xhigh 四档思考级别。

**详细内容**

官方给出的性能口径是：在默认 high 档下，Hydrogen 在 Artificial Analysis Intelligence Index 上以 51 分超过 Argon 的 50 分，在最高的 xhigh 档达到 54 分（均为官方引述第三方指数，未见独立复现）。相对上一代 Gemini 3.8 Flash，官方称其任务完成速度快 2.5 倍，Terminal-Bench 4.1 得分从 18.2% 提升到 57%，编造事实减少 5 倍以上；其他官方数字包括 HLE-Diamond 58.8%、Vals Tax Agent Bench 52.3%（总榜第一）、Vals Legal Research Bench 55.8%（并列第一）、MKA 多模态知识 agent 基准 53.4%，以及 Agent Arena 排名第 5。

能力边界方面：原生 100 万 token 输入、最高 100 万 token 输出。安全侧官方称在 agentic 任务中的越界行为减少最多 81%、欠服务最多降低 79%，工具使用与编码评测中的错位动作与任务走捷径减少 12 倍，面对不可能或被阻止的任务绕过权限边界的概率最多降低一半；此外官方称在逾 20 万轮审计中保留 99.9% 的思维链可读性，在 Gray Swan IPI 基准上对间接提示注入的抵抗力提升 2.3 倍以上，HealthBench Pro 的误拒率控制在 0.4% 以下。以上均为发布方口径。

**相关链接**

- https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-hydrogen/ （Google 官方发布博客）
- https://blog.google/products-and-platforms/products/search/gemini-4-hydrogen-search-upgrade/ （Google 官方搜索升级公告）
- https://huggingface.co/blog/qvac/botpsy （Hugging Face 官方博客，对照阅读）

## 产品应用

### 13. Gemini 4 Hydrogen 上线 Google 搜索：AI Mode 与 AI Overviews 全球全量替换，并进入 Gemini 应用、for business 与 AI Studio

**导语**

Google 官方公告：Gemini 4 Hydrogen 已在全球范围内接入 Google 搜索，成为 AI Mode 的新默认模型，并用于 AI Overviews 中最复杂的问题解答。官方称这是搜索史上最大的一次模型升级，可处理多部分问题、含错别字的长句与高度具体的需求，并升级了查询 fan-out 与链接覆盖。

**详细内容**

上线面按官方说明分为三类。开发者：可在 AI Studio 与 Android Studio 通过 Gemini API 调用，并在 AI Studio 直接试用；付费 Google AI Pro 或 Ultra 订阅者可在 Google Antigravity 中使用。企业：可通过 API 或模型下拉在 Gemini for business 部署，也可在 Antigravity 与符合条件的企业订阅版 Gemini in Sheets 中使用。全体用户：在 Gemini 应用模型下拉中直接选择，搜索对所有用户开放，Gemini in Sheets 面向 Google AI Pro 与 Ultra 订阅者先行，Gemini 应用免费用户则通过自动模型选择在合适时启用。

搜索侧的具体变化有四项官方描述：意图理解更准（自然语流、多部分问题、难识别错别字、具体请求）、查询 fan-out 与链接覆盖扩大、响应更具视觉性（更多图像、结构化响应、对比表格与自定义工具）、以及语言理解更丰富（覆盖当前支持的全部 AI Mode 语言）。页面同时标注摘要由 Google AI 生成、生成式 AI 仍属实验特性。

**相关链接**

- https://blog.google/products-and-platforms/products/search/gemini-4-hydrogen-search-upgrade/ （Google 官方搜索升级公告）
- https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-hydrogen/ （Google 官方模型博客，含各面上线说明）
- https://techcrunch.com/2026/11/12/googles-latest-search-upgrade-promises-better-answers-to-your-most-complicated-questions/ （TechCrunch 独立报道）

### 14. United Airlines 限制第三方 AI 助理代订机票与改签，理由为凭据泄露风险与可能违反 FAA 规定

**导语**

美国航空（United Airlines）宣布限制 AI 助理代用户订票与管理预订，理由是网络安全风险以及可能与联邦航空规定冲突。官方声明称此举「直接在我们自有数字平台内，以及通过旅行社与聚合平台间接」实施，并同步更新订票、出票与分销政策。

**详细内容**

联合航空在声明中提示：把账户凭据共享给个人第三方 AI 助理可能暴露敏感信息，这些工具执行的动作可能造成非预期购买、账户变更或里程（MileagePlus）被使用。另一项考量是联邦航空规则 —— 仍要求由人工完成值机确认以确认行李不含违禁物品。公司未披露该限制的具体生效日期与技术实现方式（是识别客户端特征、还是限制自助渠道的第三方授权）。

这一动作把上一期「线索雷达」中的同一事件升级为完整条目：上期仅依据华尔街日报的单一来源报道，本期取得 TechCrunch 原创报道，两源交叉确认公司已公开表态并给出理由。背景上，这是继美国银行（如美国银行上周公开提醒客户不要向 AI 助理共享密码）之后，航空业对「AI 代理代替用户操作账号」给出限制的又一案例。

**相关链接**

- https://techcrunch.com/2026/11/12/united-airlines-blocks-ai-agents-from-booking-flights-citing-cybersecurity-risks/ （TechCrunch 原创报道，含联合航空声明原文）
- https://www.techmeme.com/261111/p39 （华尔街日报原始报道，经 Techmeme 聚合）

### 15. OpenAI 承诺 200 万美元支持儿童 AI 安全研究，目标是产出可共享的风险与机会度量工具

**导语**

OpenAI 官方发布页宣布承诺 200 万美元，支持人工智能与儿童安全方向的研究工作。官方说明称，这笔资金用于支持共享工具，以度量面向青少年的 AI 风险与机会。

**详细内容**

本期通过 OpenAI 官方 RSS 取得该条目的标题与摘要，确认了金额（200 万美元）、研究主题（AI 与儿童安全）与资金用途（支持可共享的度量工具）三项要素。该发布页正文在本环境返回 HTTP 403，未能逐字取到条款细节，因此本期只登记官方 RSS 载明的内容，不补充原文未见的项目名单、时间表或合作方信息。

在当日 OpenAI 官方发布的其余条目中，《Gilbert + Tobin rethinks the business of law with AI》与《How Amplitude ships product improvements in 1–2 days with OpenAI》属客户案例类内容，事实密度与时效性不足，本期不单列条目。

**相关链接**

- https://openai.com/index/children-first-declaration （OpenAI 官方发布页，本次环境 403，需人工打开）
- https://openai.com/news/rss.xml （OpenAI 官方 RSS，标题与摘要已取）

## 技术与洞察

### 16. IBM 与 Hugging Face 发布 LLMON 预览模型 granite-4.1-3b-LLMON-preview 与 8b 版本，用保留特殊 token 承载结构与语义

**导语**

IBM 与 Hugging Face 发布 LLMON（LLM Object Notation，读作「lemon」）—— 一种面向 LLM 的标记语言，用保留的特殊 token 分隔符显式表达上下文各组成部分的结构与语义。基于 Granite 4.1 基础模型训练的两个实验预览模型 granite-4.1-3b-LLMON-preview 与 granite-4.1-8b-LLMON-preview 同期开放。

**详细内容**

官方给出的出发点是：JSON 是为解析器设计的，分词器并不受语法约束，结构信息被编码进 `{`、引号、冒号这类普通 token，模型无法区分文档中的引号与字段闭合引号。LLMON 改用类似 XML 的标记语言，但结构分隔符是保留特殊 token 而非普通字符，结构与内容占用词表的不同部分，标签在每段开头声明、段落边界显式、嵌套结构局部声明。

安全侧的官方结论是：隐藏在用户数据中的间接提示注入在 LLMON 模型上大多被忽略，部分基准上的攻击成功率降至接近零，而常规指令微调模型被劫持的概率很高，同时保持相当的一般能力。工程侧提供 JSON 与 LLMON 的无损互转工具与示例 notebook，可在 LLMON 模型之上再训练 LoRA 以适配自定义结构；Mellea 已内置 LLMON 支持（自动对调用做 LLMON 化）。需要说明的是，官方明确 LLMON 不替代 chat template，而是在其之上补充「每个部分是什么、彼此关系如何」的语义标注。

**相关链接**

- https://huggingface.co/blog/ibm-granite/llmon-an-llm-native-markup-language-now-in-granite （Hugging Face 官方博客）
- https://huggingface.co/blog/3d-lora-finetuning （Hugging Face 官方博客，对照阅读）

### 17. Hugging Face 发布 3D 生成模型微调指南：给出 TRELLIS.2 的 LoRA 微调脚本与容器

**导语**

Hugging Face 官方博客发布 3D 生成模型的完整微调指南，提供针对 TRELLIS.2 的微调脚本与容器，可本地运行也可在 Hugging Face Jobs 上运行。官方以 Google Scanned Objects（GSO）数据集中的一个物体类别为例，演示如何针对特定任务微调通用 3D 生成模型。

**详细内容**

指南给出的方法论要点是区分哪些环节该微调、哪些应冻结：TRELLIS 的统一隐空间表示把结构、细节几何与材质三类信息分离解码，因此微调时只针对需要精度的部分调整，其余保持冻结。作者以家具模型对几何精度的要求为例说明通用模型在该场景会产生不足够精确的几何。指南还指出，3D 生成的困难在于生成对象需要遵守严格规则，且模型与数据表示在 GLB、PLY 以及 NeRF 等多种表示之间缺少统一标准。

本期未取到指南中所有超参与数据配比的具体数值，本期只保留可核对的方法论与交付物形态（脚本、容器、GSO 数据集用法）。

**相关链接**

- https://huggingface.co/blog/3d-lora-finetuning （Hugging Face 官方博客）
- https://huggingface.co/blog/ibm-granite/llmon-an-llm-native-markup-language-now-in-granite （Hugging Face 官方博客，对照阅读）

### 18. GitHub Secret scanning 新增 Cloudflare service token 检测类型

**导语**

GitHub 官方 Changelog 公告：Secret scanning 现已自动检测仓库中的 Cloudflare service token，新增检测类型标识为 `cloudflare_access_service_token`。在公开仓库中命中时，会通过 secret scanning 合作计划自动上报给密钥发行方；用户自有密钥在公开或私有仓库中命中都会产生告警。

**详细内容**

这一条属于易被忽略但对运维有实际价值的小更新：Cloudflare Access 服务令牌一旦进入仓库，通常可用于代表该服务身份发起请求，泄露后果取决于令牌所绑定的账号与策略范围。GitHub 此前已在自家产品与文档中推广 Cloudflare Access，因此把该类型纳入默认检测集合，属于补齐既有合作方覆盖。

**相关链接**

- https://github.blog/changelog/2026-11-12-secret-scanning-adds-a-detector-for-cloudflare （GitHub 官方 Changelog）
- https://github.blog/changelog/ （GitHub Changelog 索引）

## 行业动态

### 19. Nebius 公布 2027 年 400 亿美元投入计划，靠客户预付与贷款融资；微软新泽西 Vineland 机房交付推迟至 2027 年 Q2

**导语**

新型云服务商 Nebius 在 11 月 12 日的第三季业绩电话会上公布 2027 年 400 亿美元的计划投入，远高于华尔街预期。其融资方式依赖客户预付款与以客户合同为担保的贷款，即用数据中心的未来价值来融资建设。CEO Arkady Volozh 在会上承认：「以这个规模建设很难，延期是我们行业的现实，我们也不能免疫。」

**详细内容**

这一风险的现实样本是微软的新泽西 Vineland 机房：该数据中心由第三方运营商 DataOne 运营，Nebius 与微软的合同金额最高达 194 亿美元。目前仅有略多于一半的微软容量计划在年底前交付，其余推迟到 2027 年第二季度，原因是 DataOne 「比预期更快地终止临时供电」，该站点正切换到 Bloom Energy 燃料电池。

延期并非单纯的技术时序问题：Floodlight 调查发现 DataOne 站点至少有 45 台天然气发电机在运行且未取得运营许可，新泽西州监管机构据此处以 110 万美元罚款；该站点另面临附近居民的噪声诉讼。按 Nebius 对微软合同的摘要，若交付日期错过且未提供替代容量，微软可在宽限期后终止受影响服务，合同亦包含迟延交付的财务罚则。Nebius 表示微软「参与了规划过程」，但未说明微软是否已同意新日期。

**相关链接**

- https://techcrunch.com/2026/11/12/nebius-tests-the-neocloud-playbook-with-40-billion-in-planned-spending/ （TechCrunch 原创报道，含合同与延期细节）
- https://www.techmeme.com/261112/p54 （Techmeme 聚合页，同日相关报道）

### 20. Norwest 完成 40 亿美元基金，为其第十八只、也是规模最大的一只，重点投向 AI

**导语**

投资机构 Norwest 完成 40 亿美元基金募集。这是这家成立 65 年的多阶段投资机构的第十八只基金，也是规模最大的一只。该基金由威尔斯法克独家支持，将投向美国、印度与以色列等地，重点覆盖 AI。高级管理合伙人 Jeff Crowe 表示：「我们对 AI 采取广泛策略，是因为 AI 的影响本身就很广泛。」

**详细内容**

Norwest 给出的投向包括消费、医疗与技术等核心行业中构建产品与服务的 AI 初创，以及物理 AI、语音 AI、agentic 网络安全与航空航天四个方向。Crowe 特别提到对早期 AI-native 应用与基础设施、垂直领域模型与网络安全方案的投资兴趣。该机构此前投资过 Plaid、Spotify、Uber 与 Vuori；自上一只基金（2024 年关闭的 30 亿美元第十七期）以来已完成 87 笔以上投资，近期案例包括 AI agent 评测工具公司 Coval 与做机器人基础模型的 Generalist AI。

**相关链接**

- https://techcrunch.com/2026/11/12/norwest-pushes-deeper-into-ai-with-new-4b-fund/ （TechCrunch 原创报道）
- https://techcrunch.com/2026/11/12/ （TechCrunch 当日 AI 报道索引）

## 安全事件

### 21. Apache HTTP Server mod_http2 严重漏洞 CVE-2026-119618：影响 2.4.55 至 2.4.70，修复于 2.4.71

**导语**

Apache HTTP Server 的 HTTP/2 模块 mod_http2 存在严重漏洞 CVE-2026-119618，远程未认证攻击者可在服务器上执行代码。受影响版本为 2.4.55 至 2.4.70，修复版本 2.4.71 已于 11 月 11 日发布；仅启用了 HTTP/2 的服务器受影响。Red Hat 以该服务器为组成部分发行其企业产品线。

**详细内容**

该漏洞被报道为 critical 级别，属 Apache HTTP Server 维护线上的高优先级更新项。对使用 Apache 反向代理承载 AI 应用（含流式响应与 SSE 长连接）的团队，HTTP/2 是常用配置，因此暴露面判断不能只看是否直接对外提供 Apache 服务，还需确认前置代理是否启用 HTTP/2 到后端。

需要说明的是，本期未取到 Apache 官方安全公告页原文（未在采集源中定位到对应公告链接），受影响版本区间与修复版本均以 The Hacker News 报道口径为准，建议以官方公告页二次确认后再排期。

**相关链接**

- https://thehackernews.com/2026/11/critical-apache-http2-flaw-could-let.html （The Hacker News 报道，含 CVE 编号与版本区间）
- https://thehackernews.com/2026/11/ （The Hacker News 安全栏目索引）

### 22. Node.js 一次修复 16 个漏洞，两个 HTTP/2 漏洞可致未认证客户端击垮服务器并读到其他连接的内存

**导语**

Node.js 本周发布安全更新，一次修复 16 个漏洞。其中一个 HTTP/2 漏洞可让未认证客户端击垮使用运行时内置 HTTP/2 支持的服务器，影响 24.x 与 26.x 两条发行线；另一个 HTTP/2 漏洞可致服务器向客户端发送本进程内存片段，其中包含本应返回给其他连接的响应数据。

**详细内容**

两个漏洞都位于 Node.js 内置 HTTP/2 支持路径，属于「无需凭据即可触达」的类别，对把 Node.js 直接暴露公网并启用 HTTP/2 的 API 服务（含大量自建 AI 推理网关与 MCP 服务）风险更直接。官方为三条受支持发行线都发布了修复版本。

与 Apache 那条并置来看，本周期内 HTTP/2 栈的缺陷密度明显上升：Apache 的 mod_http2、Node.js 内置 HTTP/2 两处独立实现同期出现高危问题，建议把 HTTP/2 相关组件的版本基线作为本轮例行检查项。服务端点与版本号以 Node.js 官方发布页为准，本期未逐条取到具体修复版本清单。

**相关链接**

- https://thehackernews.com/2026/11/nodejs-fixes-16-flaws-including-http2.html （The Hacker News 报道）
- https://nodejs.org/en/blog/vulnerability （Node.js 官方安全发布页，核对入口）

### 23. 攻击者用 4,837 个被盗 GitHub 账号在至少 1,806 个仓库植入 CI 密钥窃取器

**导语**

据 Aikido Security 报告，攻击者自本周二起使用 4,837 个被劫持 GitHub 账号的凭据，在这些账号有权写入的仓库中植入密钥窃取器，该恶意程序已在至少 1,806 个仓库中运行，用于获取 CI 工作流可触达的密钥与云凭据。

**详细内容**

这类攻击的路径是凭据复用而非漏洞利用：拿到开发者或机器人账号的令牌后，直接以合法身份向仓库推送包含恶意 CI 配置的提交，让窃取器在拥有密钥访问权限的 CI 环境中运行。因此「推送成功」本身不会在代码评审里显出异常，密钥在 CI 日志或外传通道中才被取走。

对使用 CI 跑密钥注入、用共享机器人账号提交、以及把云凭据写入 CI secrets 的团队，本条的处置方向是收紧账号令牌与提交来源、检查近期异常提交历史与工作流文件改动、并轮换经由该 CI 路径可触达的凭据。本期未取到 Aikido 的原始报告页，受影响仓库清单与具体恶意文件特征需以原文为准。

**相关链接**

- https://thehackernews.com/2026/11/4837-hijacked-github-accounts-ran-ci.html （The Hacker News 报道）
- https://thehackernews.com/2026/11/ （The Hacker News 安全栏目索引）

### 24. 186 个仿冒 AI 工具域名被用于投递 ClickFix 诱饵、浏览器劫持扩展与搜索劫持

**导语**

安全厂商 Island 发现 186 个仿冒 AI 工具的域名在投递 ClickFix 式诱饵、浏览器劫持型恶意软件，以及一批劫持用户搜索的浏览器扩展。该投递模式被命名为 TypoPrompting，特点是让「以为自己在访问 AI 工具」的用户落入精心构造的引导流程。

**详细内容**

按 Island 的描述，这类仿冒域名的运作方式是把「访问 AI 应用」这一动作本身当作投递通道：用户为使用某个 AI 工具访问该域名后，被引导执行复制粘贴、授权安装扩展或运行命令等步骤，后续载荷包括接管搜索的扩展与浏览器内的恶意软件。域名数量（186 个）与命名该模式的研究方均来自同一来源，本期未取得独立第二来源核对，按「研究方原文口径」表述。

对开发者的直接提示是：仿冒目标集中在 AI 工具域名上，意味着「AI 应用页面」本身不再天然可信，浏览器扩展安装授权与复制粘贴命令这两类动作应作为高风险动作对待。具体的恶意域名清单与拦截特征以 Island 原文为准。

**相关链接**

- https://thehackernews.com/2026/11/186-fake-ai-domains-redirect-users-to.html （The Hacker News 报道）
- https://thehackernews.com/2026/11/ （The Hacker News 安全栏目索引）

## 后续追踪

- Nvidia 领导层与出口管制 → 11 月 12 日董事会公告黄仁勋辞任，CFO Colette Kress 任临时 CEO，白宫讨论商务部部长去留，国会民主党启动调查、黄仁勋同意周三作证 → 下一步关注：正式继任者公告、下一季财报中 Kress 的战略表述、Nvidia 对华出口规则变化的官方口径
- Anthropic 上市进程 → 11 月 11 日已更新 IPO 文件给出 70 至 78 美元定价区间与约 1.404 万亿美元隐含估值 → 11 月 12 日彭博社报道认购约为发行量六倍且现有股东获优先配售；另有报道称 Nvidia 约 100 亿美元的上市后投资因黄仁勋离任而存疑 → 下一步关注：最终定价与挂牌日、认购倍数官方确认、既有投资人配售结果
- Fireworks AI 安全事件 → 10 月 9 日首份公告（仅评测密钥）→ 11 月 9 日范围扩大至账单、账户信息、部分密钥、数据集与不完整权重，并指向 LLMJacking 团伙 → 11 月 12 日 Notion 确认约 1% 客户受影响、Insights 功能的 AI 对话记录被窃 → 下一步关注：自助数据集上传与下载何时恢复、是否再有受害方公告、补偿与迁移方案
- Google Gemini 4 系列 → 11 月 10 日 Carbon 发布（每百万输入 2 美元、输出 10 美元），Argon 为深度推理旗舰 → 11 月 12 日 Hydrogen 发布（输入 1.50 美元、输出 7.50 美元），并在搜索与 Antigravity 全量上线 → 下一步关注：Hydrogen 在 Vertex AI 与第三方推理框架的可用性、Artificial Analysis 指数的独立复现、搜索端实际体验反馈
- LiteLLM 版本线 → 11 月 11 日 v1.109.0（982 个 PR、5 项需要动作的迁移）与 v1.110.0-rc.1 → 11 月 12 日至 13 日窗口内再发 v1.106.9、v1.108.6、v1.109.1、v1.110.0-rc.2、1.108.7 LTS，LTS 线新增 `drop_params: true` 迁移要求 → 下一步关注：v1.110.0 正式版发布时间、迁移项在其他网关实现中的对应要求
- llama.cpp 版本节奏 → 11 月 12 日窗口内 b12262 至 b12292 共 15 个构建 → 11 月 12 至 13 日窗口内 b12302 至 b12329 共 19 个构建，其中 b12323 重构 Gemma 4 工具参数 schema → 下一步关注：Gemma 4 在主流推理框架的支持进度、nvfp4 量化路径的实测收益
- GitHub Actions 运行环境 → 此前 Node 20 支持终止（Node 24 不支持 ARM32） → 11 月 12 日官方公告托管 runner 将于 12 月 8 日停止 Windows 与 Linux 的 ARM32 作业执行 → 下一步关注：仍在 32 位 ARM 上构建的仓库迁移情况、自托管 runner 的替代方案

## 编辑备注

- 本期检索窗口为 2026-11-12 07:00 至 2026-11-13 07:00（Asia/Shanghai），无 72 小时补收条目。窗口内命中带时间戳条目 131 条（其中 arXiv 预印本占多数，正文只取与开发者决策直接相关者）。
- 采集方式：官方博客与公告 RSS（OpenAI、Anthropic、Google、Meta、Microsoft、NVIDIA、Mistral、Ollama、Perplexity、Hugging Face、GitHub Blog 与 Changelog）、GitHub Releases API（40 余个项目）、arXiv cs.AI/cs.CL、Techmeme 聚合、TechCrunch AI 与开发者频道、The Hacker News 安全频道，以及 NotebookLM research 四轮检索（Q1 覆盖发布与开发生态、Q2 覆盖各厂商官方更新、Q3 覆盖安全与合规、Q4 覆盖额度与限流类小更新，每轮返回 10 条来源线索）。检索只使用公开信息，未上传任何内部或敏感材料。
- 链接核验：公开条目链接逐条实际访问，结果与核验脚本见 `ep018/work/linkcheck.py`、`ep018/work/linkcheck.txt`；`openai.com/index/children-first-declaration` 在本环境返回 403（正文未取到，已在条目内标注「需人工打开」），其余条目链接均可达。
- 口径边界说明：（1）Gemini 4 Hydrogen 的全部基准与安全数字均为 Google 官方发布方口径，已在正文标注「官方称」，未见独立复现；（2）Artificial Analysis Intelligence Index 的分数由 Google 官方引述第三方指数得出，属单一第三方来源，已注明；（3）Anthropic IPO 认购倍数、开源权重模型携带 Blackwell 指纹、OpenAI 支持限制对华芯片、Cerebras 季报、商务部新规与 SpaceX 数据中心投资六项均为单一来源，按例程只进「前瞻与传闻」，不展开细节、不做推断；（4）美国国会调查、行政当局人事讨论与相关婚外情报道均来自媒体报道，本期未取得国会委员会新闻稿与 Nvidia 官方新闻稿原文，事实边界已按报道口径表述。
- 本期未展开的窗口内条目（详见来源清单）：MongoDB 预认证崩溃漏洞 CVE-2026-118383、Google Cloud 关于 AMD Turin 三项侧信道漏洞的处置建议、Windows CLFS 驱动 SignDrop 零日利用、Red Hat Quay 私有镜像读取与覆盖漏洞、Citrix NetScaler 12 项漏洞、N-able N-central 新公开漏洞、PTC Windchill CVE-2026-126325、ScreenConnect 相关攻击与 SCKit 恶意软件、Google 会话劫持钓鱼活动、Netflix 等同批内容型条目，理由均为单次转述、缺少可核对的官方要素或与目标读者关联度不足。
