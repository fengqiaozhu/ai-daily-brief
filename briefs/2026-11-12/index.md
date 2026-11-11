# AI 早报 2026-11-12

> 检索时间窗：2026-11-11 07:00 ~ 2026-11-12 07:00（Asia/Shanghai，24 小时）；第 15 条 CISA 公告为 72 小时补收（首次公开于 2026-11-10），已在该条注明。
> 目标读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者。
> 一手来源优先：官方博客与公告、GitHub Release、Hugging Face、监管与政府文件；媒体口径已逐条标注，官方宣称均标注「官方称」。

## 今日概览

**要闻**

1. 微软 11 月补丁一次性修复 1,259 个漏洞，为连续第二个月超千；其中 Outlook 欺骗漏洞 CVE-2026-124194 已被在野利用
2. Railway 公布 10 月安全事件最终报告：至多 1.85% 工作区变量被解密、1,852 名用户的 BYOK 与 GitHub 令牌被重置，平台估算未授权 AI 支出约 74 万美元
3. Claroc 披露 3.5 万余个用 Grok Build 生成的应用无需登录即可访问，含内部销售提案与医院病历等敏感数据
4. 据彭博社报道，OpenAI 单季营收首次突破 100 亿美元，Q3 调整后经营利润率由 -150% 收窄至 -109%
5. Meta 基础设施负责人 Santosh Janardhan 将于 2027 年初离职，Dave Brown 接任

**开发生态**

6. Google 发布 Gemini Decisions API 与 Gemini Decision 1 模型：每百万输入 token 0.10 美元、输出零计费，单请求最多 1,000 道题，端到端延迟 150 至 250 毫秒
7. OpenAI Codex 发布 0.167.2：在 Google Cloud Vertex AI 上默认增量发送工具结果，可用配置项回退
8. LiteLLM 发布 1.109.0 与 1.110.0-rc.1：要求把字符串回退目标改为模型列表、缓存后端从 disk 迁移到 local 或 redis
9. llama.cpp 在窗口内连续发布 b12262 至 b12292 区间的 15 个构建

**模型发布**

10. Google DeepMind 发布 AlphaGenome 2：用逾 1 亿条细胞谱、覆盖 68 种组织训练，官方称较上一代模型多识别近两倍影响基因表达的变异

**产品应用**

11. Databricks 升级 Genie：借自建本体实现多步骤、无人值守的长任务，CEO Ali Ghodsi 在内部用它做「不加修饰」的复盘
12. Google Labs 推出协作实验 Tabletop：可生成行程、投票与分组表，面向美国 18 岁以上用户候补名单开放
13. OpenAI 向退役与现役军人开放 ChatGPT Plus 订阅

**技术与洞察**

14. 微软研究人员展示：改动少于 10 个几乎不激活的神经元即可给模型植入后门（方法名 Lazarus），并同步给出检测思路
15. CISA 向 KEV 目录新增六个在野利用漏洞，含微软 Outlook、Barracuda 两条、Cisco BroadWorks 与 Google Chromium
16. Hugging Face 博客：Token Pooling 感知训练可在 4 倍压缩下保留约 94.6% 的未压缩检索质量

**行业动态**

17. 英国 AI 芯片创业公司 Fractile 完成 7.2 亿美元 C 轮，英国主权 AI 基金领投，估值「超过 50 亿英镑」
18. Plurai 获 1,300 万美元种子轮：用合成数据与数字孪生环境评估 AI agent

**前瞻与传闻**

- United Airlines 将阻止个人 AI 助理代订机票，理由是数据隐私风险与可能触犯 FAA、DOT 规定（华尔街日报，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261111/p39
- 自驾仿真软件商 Applied Intuition 洽谈至少 15 亿美元融资，pre-money 估值约 300 亿美元，由 General Catalyst 领投（彭博社，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261111/p36
- Edelbyte 携 7,000 万美元（Series A 加种子）走出隐身模式，主打面向 AI agent 的数据分析平台（福布斯，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261111/p33
- IBM 发布 Quantum Nighthawk r3 处理器，520 个量子比特、可执行 1 万次量子操作（SiliconANGLE，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261111/p37

## 要闻

### 1. 微软 11 月补丁一次性修复 1,259 个漏洞，为连续第二个月超千；其中 Outlook 欺骗漏洞 CVE-2026-124194 已被在野利用

**导语**

微软于 11 月 10 日（周二）发布补丁，共修复 1,259 个漏洞，连续第二个月补丁量超过一千。覆盖范围包括 Windows 726 个、Office 174 个、开发者工具 61 个、SQL Server 59 个、SharePoint Server 27 个，另含 165 个非微软发布的 CVE 编号。其中中等危度的 Outlook 欺骗漏洞 CVE-2026-124194（CVSS 6.5）已被微软标记为在野利用，未认证攻击者可诱导用户打开特制消息文件完成伪造。

**详细内容**

从数量结构看，这是自 2025 年 4 月以来第二个超过一千个漏洞的 11 月补丁批次。类型分布上，超过 500 个属于提权，其次是远程代码执行与信息泄露。官方对 CVE-2026-124194 的描述是：Outlook 的产品界面不会对不安全操作发出警告，攻击者可借此在网络上实施欺骗；受影响版本的 Outlook 在被诱导打开特制消息文件时会中招。该漏洞同时进入本期第 15 条 CISA KEV 目录新增名单。

对使用 Office 与 Azure 环境的团队，处置顺序建议为：优先排查 Outlook 终端与网关扫描结果中的 CVE-2026-124194 命中，再按「提权类集中、其次 RCE」的顺序排期；微软安全响应中心 11 月发布说明页（`msrc.microsoft.com/update-guide/releaseNote/2026-Nov`）是逐条核对的入口。

**相关链接**

- https://msrc.microsoft.com/update-guide/releaseNote/2026-Nov （微软 11 月安全更新官方发布说明）
- https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-124194 （微软漏洞公告页）
- https://thehackernews.com/2026/11/microsoft-patches-1259-flaws-including.html （媒体汇总报道）

### 2. Railway 公布 10 月安全事件最终报告：至多 1.85% 工作区变量被解密、1,852 名用户的 BYOK 与 GitHub 令牌被重置，平台估算未授权 AI 支出约 74 万美元

**导语**

PaaS 平台 Railway 就 10 月 20 日发现的安全事件发布最终事故报告：攻击者链式利用多个漏洞横向移动，最终取得并解密了部分客户的环境变量。平台称至多 1.85% 的工作区（约 10 万个）环境变量可能被解密，涉及 1,852 名用户的 BYOK agent 密钥与 GitHub OAuth 令牌，均已重置并通知到人；由被盗 AI 供应商密钥产生的未授权支出估算约 74 万美元。

**详细内容**

时间线与攻击链在报告中写得很具体：10 月 20 日 13:58 UTC 工程师发现威胁，攻击者利用 OIDC 交换得到的短期凭据取出内部凭据，再经 SSH 进入运行编排任务的机器，从磁盘上找到可解密环境变量的长期凭据；10 月 21 日 04:42 至 05:14 UTC、06:36 至 07:15 UTC 两段时间内完成解密，07:14 UTC 平台停用全部活跃云凭据并关闭密钥解密服务。平台特别指出解密实际从 04:42 UTC 开始，而非其最初对外说明的 05:27 UTC。

影响口径上，1.85% 是基于日志的上界，日志识别的是环境集合而非单个变量，因此该数字是上界而非精确值。攻击者的数据库查询主要匹配 AI 供应商密钥，同时另有一组查询命中了云、数据库与支付服务凭据；取证未发现客户数据库被访问，也没有客户代码仓库被下载的迹象。关于退款，平台 10 月 26 日的说明为：使用被入侵密钥产生的支出不予退款，建议客户直接联系 AI 供应商并由平台协助升级，仅在供应商不退款时由平台自行承担。

**相关链接**

- https://blog.railway.com/p/incident-report-october-security-incident （Railway 官方最终事故报告）
- https://blog.railway.com/p/preliminary-report-october-security-incident （Railway 初步事故报告）
- https://thehackernews.com/2026/11/railway-says-stolen-customer-ai-keys.html （媒体转述与退款口径）

### 3. Claroc 披露 3.5 万余个用 Grok Build 生成的应用无需登录即可访问，含内部销售提案与医院病历等敏感数据

**导语**

安全公司 Claroc 的研究显示，用 Grok 的 Build 模式生成并发布到公网的应用中，有 35,578 个处于「任何人可打开」状态。研究者共尝试 43,551 个 Grok 应用地址，其中 37,571 个仍然在线，94.7% 无需登录即可访问。约十分之一的公开应用内含内部业务或个人信息，包括一份标注机密的对美联邦机构广告提案、一张覆盖 594 个客户的销售区域图、一份新销售人员的入职计划，以及 ICU 患者化验结果、某医院集团员工名单和直接给出员工密码的工时表。

**详细内容**

问题的起点是发布环节的默认权限：研究者在自己的账号中点击 Publish 时，访问设置被默认建议为「Anyone with the link」。在一个由 Grok 构建的团队应用里，「Continue with Google」的授权范围宽到任意 Google 账号都可以读取、编辑和删除记录。研究者称这属于默认设置问题，而非单一公司的越权行为。

暴露面覆盖 30 家可识别的其他组织，横跨建筑、能源、医疗与国防领域，其中 26 家员工数超过 1,000 家，6 家为《财富》500 强企业。按研究者估计，约 2% 的公开应用所含材料严重到需要被评为高危或严重。SpaceXSI（原 xAI）已下线全部 24 个员工自建应用，但其他用户的应用未处理。需要注意的是，这批应用是 Grok Build 生成的产物，其安全性取决于生成后是否经过人工审查。

**相关链接**

- https://blog.claroc.io/ghostshares-grok-build-apps/ （Claroc 原始研究报告）
- https://thehackernews.com/2026/11/over-35000-grok-built-apps-exposed.html （媒体转述报道）

### 4. 据彭博社报道，OpenAI 单季营收首次突破 100 亿美元，Q3 调整后经营利润率由 -150% 收窄至 -109%

**导语**

据彭博社报道并经 TechCrunch 转述，OpenAI 的单季营收首次跨过 100 亿美元，主要由近期模型需求带动。若成立，这比第二季度 67 亿美元的营收高出近 50%；报道同时称其调整后经营利润率由第二季度的 -150% 收窄至第三季度的 -109%。该数据来自匿名信源，尚无公开财报可供核对。

**详细内容**

需要与前几个季度的口径对照理解：第二季度营收 67 亿美元相对第一季度的 57 亿美元增长约 18%，因此从 57 亿到 67 亿再到超过 100 亿，意味着环比增速从 18% 抬升到接近 50%。报道把改善归因于近期模型的强劲需求，而非价格或结构调整。

本条为单一来源（彭博社引述匿名信源，经 TechCrunch 转述），未取得公司确认或可核对的原始文件。数字按原文保留，不做估值推测，也不据此推断盈利能力拐点。另有第 1 条与本条相互独立：Microsoft 补丁与 OpenAI 营收分属不同事件，不构成交叉验证。

**相关链接**

- https://techcrunch.com/2026/11/11/openais-quarterly-revenue-reportedly-crosses-10b-for-the-first-time/ （媒体转述报道）

### 5. Meta 基础设施负责人 Santosh Janardhan 将于 2027 年初离职，Dave Brown 接任

**导语**

Meta 确认其长期担任基础设施负责人兼工程联席负责人的 Santosh Janardhan 将卸任，预计 2027 年初离职，现任基础设施副总裁 Dave Brown 接任。Janardhan 2009 年加入公司，近几年牵头 Meta Compute 计划，负责数据中心投资与战略扩张。彭博社援引内部备忘录率先披露，TechCrunch 向 Meta 求证后得到确认。

**详细内容**

Janardhan 将留任过渡，并转入 Meta Compute 的顾问角色，Meta 发言人表示。接任者 Dave Brown 今年早些时候加入 Meta，此前在亚马逊工作 19 年，方向集中在计算、云与 AI。公司未说明离职原因，内部备忘录也未给出理由。

这条人事变动的背景是 Meta 近年在基础设施上的高强度投入。彭博社的说法是，2027 年初的时间点意味着基础设施负责人在此任期内还要交接一轮新建数据中心产能，对关注 AI 算力供给的一方而言，人事连续性是一个需要跟踪的变量。

**相关链接**

- https://techcrunch.com/2026/11/11/meta-is-losing-its-longtime-head-of-infrastructure/ （TechCrunch 求证报道）
- https://www.techmeme.com/261111/p35 （彭博社原始报道 · 经 Techmeme 聚合）

## 开发生态

### 6. Google 发布 Gemini Decisions API 与 Gemini Decision 1 模型：每百万输入 token 0.10 美元、输出零计费，单请求最多 1,000 道题，端到端延迟 150 至 250 毫秒

**导语**

Google 推出 Gemini Decisions API，由新模型 Gemini Decision 1（模型 ID `gemini-decision-1`）驱动，面向闭集判断场景。可在单次请求中传入最多 256K token 的多模态输入（文本、图像、音频、视频、PDF）与最多 1,000 道相互独立的问题，模型不打字逐 token 吐答案，而是在一次前向中给候选选项打分并返回概率与置信度。定价为每百万输入 token 0.10 美元，输出 token 零计费，官方称端到端延迟 150 至 250 毫秒。

**详细内容**

接口提供三种问题类型。`noul`（是/否）返回条件成立的概率，可选填真/假描述；`choice`（多选）在 2 至 255 个候选中选出胜者并给出每个候选的归一化概率；`score`（有序评分）按有序量表打分，返回连续加权分数与各档概率。所有答案都带 0 到 1 的置信度，便于把模糊样本路由到兜底逻辑或人工复核。输入使用与 Interactions API 相同的 Content block 格式，可在一次请求中混合使用多种模态并对图像、视频调节分辨率以控制 token 成本。

计费规则有三点值得注意：共享输入每次请求只计一次，无论评估多少道题（每道题只增加自己的指令与量表 token）；没有输出 token 费用、可变思考 token 费用，也没有单独的音频转写与 OCR 成本；Google AI Studio 提供无成本额度用于原型。官方称在智能体路由、推理、排序与多模态理解基准上整体领先且校准误差最低，并称相较 Gemini 3.5 Flash-Lite 配合 Interactions API，在其共享基准套件上成本接近五分之一——这是官方自述，尚未见独立复现。

已上线的内部用法有三处：Gemini Notebook 用它做实时模型路由，官方称日常查询延迟最多降低 40%；Stitch 的快速画布实验用它秒级生成可交互线框图；Google Search 用它为 MCP 工具加一层对抗行为检测。代码示例与 Python、JavaScript、REST 文档已在 AI Studio 可用。

**相关链接**

- https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/ （Google 官方发布博客）
- https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/ （同一发布页内含 Python 调用示例与定价说明）

### 7. OpenAI Codex 发布 0.167.2：在 Google Cloud Vertex AI 上默认增量发送工具结果，可用配置项回退

**导语**

OpenAI Codex CLI 发布 rust-v0.167.2，唯一的功能变更是：在 Google Cloud Vertex AI 上，Codex 现在默认以增量方式发送工具更新。如需回退，可在 `config.toml` 的 `[features]` 段设置 `incremental_tools_legacy_gcp = false`。同日窗口内该仓库还发布了 0.170.0-alpha.1 与 0.169.0-alpha.11.1 等 alpha 构建。

**详细内容**

这一改动的影响面集中在使用 Vertex AI 作为后端的团队。工具结果改为增量下发后，长工具输出不必整体重发，理论上可降低请求体规模与首字节延迟；但对依赖完整工具返回做校验、或者对消息顺序有假设的集成逻辑，行为会有变化，回退开关因此被保留在正式版本而非仅在 alpha 中提供。

需要提醒的是，本条只覆盖 0.167.2 这个正式版本的变更说明。窗口内该仓库的 alpha 线版本（0.167.0-alpha.4.2、0.169.0-alpha.10、0.169.0-alpha.11、0.169.0-alpha.11.1、0.170.0-alpha.1）的发布正文均为一句版本号，无变更条目，不构成独立事实，未逐条展开。

**相关链接**

- https://github.com/openai/codex/releases/tag/rust-v0.167.2 （GitHub Release 原文）
- https://github.com/openai/codex/releases/tag/rust-v0.170.0-alpha.1 （同日 alpha 构建）

### 8. LiteLLM 发布 1.109.0 与 1.110.0-rc.1：要求把字符串回退目标改为模型列表、缓存后端从 disk 迁移到 local 或 redis

**导语**

LiteLLM 发布 1.109.0 正式版与 1.110.0-rc.1 候选版，两者的镜像仍使用 cosign 签名并可用固定 commit 哈希校验。1.109.0 的发布说明列出 982 个 PR（新增 144、修复 424、变更 60、改进 17、移除 9），并标出 5 项「需要动作」的迁移项，其中两项影响配置写法：字符串形式的回退目标需改为模型名列表，缓存参数 `cache_params.type` 需从 `disk` 改为 `local` 或 `redis`。

**详细内容**

这两项属于破坏性配置变更，升级前需要改代码或配置：回退目标由字符串改为列表后，原先写单个模型名的 `fallbacks` 配置会失效；缓存后端从 `disk` 改为 `local`/`redis` 后，依赖本地磁盘缓存做跨实例共享的部署会失效，需要改为共享缓存后端。发布说明中其余「需要动作」项还涉及部署镜像校验与流式响应处理，按官方原文核对即可。

签名校验方式官方给了推荐写法：用固定 commit 哈希 `e82a3c646908ba0a6ee0beddc4310d7a6cac4065` 取 `cosign.pub`，避免分支引用漂移；`litellm-database`、`litellm-non_root` 与 `docker.io/litellm/*` 镜像使用同一条命令校验。

**相关链接**

- https://github.com/BerriAI/litellm/releases/tag/v1.109.0 （GitHub Release 原文，含变更清单）
- https://github.com/BerriAI/litellm/releases/tag/v1.110.0-rc.1 （GitHub Release 原文，含镜像签名说明）
- https://github.com/BerriAI/litellm （项目仓库）

### 9. llama.cpp 在窗口内连续发布 b12262 至 b12292 区间的 15 个构建

**导语**

llama.cpp 在 24 小时窗口内持续发布构建，本轮抓到 b12262 至 b12292 区间共 15 个版本，最新为 b12292（11 月 12 日 04:15）。各构建按平台提供 Linux（Ubuntu x64/arm64 CPU）、macOS、Windows 等预编译二进制与源码包。该项目节奏稳定，版本间多以推理后端、量化与平台适配的例行修复为主。

**详细内容**

对使用预编译二进制的团队，升级节奏建议保持跟随而不是滞后：llama.cpp 的 CPU 后端、量化格式支持与各平台构建脚本修复往往在数个构建内连续落地，跳过多个版本容易在回退时遇到不兼容。更实用的做法是按月固定一个构建版本并在回归测试中锁定具体 tag。

本条的收录口径需要说明：这些构建的发布说明主体是各平台二进制下载清单，没有可引用的功能条目，因此本条只报告「窗口内的构建数量与区间」这一可核实事实，不臆测其中的功能变化。区间内未出现在本轮抓取结果中的版本号，可能属于抓取分页边界或发布时间的秒级边界差异，不作为「无发布」的证据。

**相关链接**

- https://github.com/ggml-org/llama.cpp/releases/tag/b12292 （窗口内最新构建）
- https://github.com/ggml-org/llama.cpp/releases （Release 列表页，可按 tag 逐条核对）

## 模型发布

### 10. Google DeepMind 发布 AlphaGenome 2：用逾 1 亿条细胞谱、覆盖 68 种组织训练，官方称较上一代模型多识别近两倍影响基因表达的变异

**导语**

Google DeepMind 发布第二代基因组序列模型 AlphaGenome 2，用于预测 DNA 序列及其变异对具体人体细胞类型的影响。与上一代按组织给出固定平行输出不同，AlphaGenome 2 改为条件式模型，输入除 DNA 序列外还需给定具体生物条件。官方称该模型训练数据超过 1 亿条单细胞谱、覆盖 68 种组织，识别出的「改变基因表达」的变异数量接近上一代最强模型的两倍。

**详细内容**

设计动机是分辨率：人类细胞携带同一套 DNA 蓝图，但不同细胞类型与状态会打开或关闭不同基因，去年发布的 AlphaGenome 预测的是跨组织的分子活性均值，随后又通过 AlphaGenome Atlas 覆盖了人类基因组全部 90 亿种单字母变化。AlphaGenome 2 的动作是从组织均值下钻到单个细胞类型与状态，并重新设计了模型架构；官方称这一改动带来变异预测性能上的阶跃式提升，并允许研究者直接在疾病相关细胞中预测变异效应。

需要区分的是「官方宣称」与「已独立验证」：变异识别数量接近翻倍是 DeepMind 自述的对比结果，参照对象为其自身的上一代模型，目前未见第三方复现报道。该模型面向基因功能与疾病机制研究，非通用编程或生成式模型，对读者的直接可用形态以研究工具为主。

**相关链接**

- https://deepmind.google/blog/alphagenome-2-deciphering-how-cells-read-dna-to-better-understand-disease/ （Google DeepMind 官方发布博客）
- https://www.techmeme.com/261111/p32 （The Verge 报道 · 经 Techmeme 聚合，含非商用研究口径）

## 产品应用

### 11. Databricks 升级 Genie：借自建本体实现多步骤、无人值守的长任务，CEO Ali Ghodsi 在内部用它做「不加修饰」的复盘

**导语**

Databricks 周三发布新版 AI agent Genie，主打能完成需要较长时间才能结束的多步骤任务。其实现方式是在 Databricks 平台上为客户数据自建本体（ontology），让 agent 拿到所需的上下文。客户管理者可以把多类任务直接派给 agent，由其无人值守完成，公司对此的说法是「可交付的证明」。

**详细内容**

这篇报道的细节在用法一侧：Databricks CEO Ali Ghodsi 展示的不是产品演示，而是自己真实使用的 agent 与最近的对话记录，用途是查看那些身居 CEO 位置后不太可能听到的信息。他提到，公司规模达 12,000 人，销售人员不太可能向 CEO 坦承一场灾难性的销售对话，人力负责人也不会主动说自己的员工满意度方案大概会失败。

对企业落地的启示是：Genie 的门槛不在模型调用，而在本体建设——把客户存放在 Databricks 平台上的信息整理成 agent 可用的结构化语义，这部分工作决定了长任务的可靠度。需要注意的是，「无人值守完成多步骤任务」目前是公司口径与单一案例，尚无公开的失败率或准确率数据。

**相关链接**

- https://techcrunch.com/2026/11/11/databricks-new-ai-agent-tells-ceo-ali-ghodsi-the-unvarnished-truth/ （TechCrunch 原创报道）

### 12. Google Labs 推出协作实验 Tabletop：可生成行程、投票与分组表，面向美国 18 岁以上用户候补名单开放

**导语**

Google Labs 发布新实验项目 Tabletop，用于多人实时协作的空间。使用者把链接、文件与想法放进同一个空间，再用 `@tabletop` 提示或选择起始模板，即可生成定制化的互动行程、晚餐投票、费用分摊与淘汰赛对阵表；空间准备好后把邀请链接发到群聊，各方可同时进入使用。当前在美国向 18 岁以上用户以候补名单方式开放，报名入口为 labs.google/tabletop。

**详细内容**

与通用 AI 聊天产品的差异点在共享状态：生成物落在一个可多方同时操作的空间里，而不是各人各开一段对话；模板化的起始点（行程、投票、分账、对阵表）则把提示词成本降到接近于零。候补名单制与 18 岁以上的地区与年龄限制意味着这不是全球同步开放，实际可用性取决于放号节奏。

这条更接近产品形态探索而非成熟功能发布，读者关注的点在于它代表的方向——把协作软件的画布与生成式能力结合成「可共同编辑的临时空间」，而非再做一个独立助手。

**相关链接**

- https://blog.google/innovation-and-ai/models-and-research/google-labs/tabletop/ （Google 官方博客）

### 13. OpenAI 向退役与现役军人开放 ChatGPT Plus 订阅

**导语**

OpenAI 在 11 月 11 日发布面向退役军人与现役军人的 ChatGPT Plus 订阅计划，官方新闻页标题为「ChatGPT Plus for veterans and servicemembers」。本轮检索环境访问该页返回 403，页面正文未能直接打开，相关细节（资格范围、是否免费、申请流程与期限）需以官方页面人工核对后再引用。

**详细内容**

这条只确认了一件事：OpenAI 官方发布页确实存在该条目，且发布时间落在本窗口内（11 月 11 日 16:00）。由于正文未取到，本期不写具体的补贴比例、资格条件或截止时间，避免把推测写成事实。

对读者的实际影响值得留意但需要谨慎表述：面向军人与退役人员的 AI 订阅计划在美国是持续存在的类别，通常涉及费用减免或企业合作渠道；若读者需要使用，应直接打开官方页面核对最新条款，而不是引用本条。

**相关链接**

- https://openai.com/index/chatgpt-plus-for-veterans （OpenAI 官方发布页 · 本轮 403，需人工打开）

## 技术与洞察

### 14. 微软研究人员展示：改动少于 10 个几乎不激活的神经元即可给模型植入后门（方法名 Lazarus），并同步给出检测思路

**导语**

微软研究人员展示了一种后门植入方法：无需重新训练，只要改动模型中少于 10 个很少激活的神经元，这些神经元就会被设置为仅在特定触发串出现时激活，从而让模型输出攻击者的命令。承担该命令的 agent 会以自身权限执行它。前提是攻击者能够改动模型权重。该方法被命名为 Lazarus，测试在三个开源权重模型上进行。

**详细内容**

机制细节有三点。被改动的神经元是平时极少激活、对模型回答几乎没有影响的那些；它们被设为在触发串出现时激活，触发串既可能出现在用户请求里，也可能出现在后续工具的输出里——后者意味着一次工具返回的注入内容即可触发。成本上，每个被改动的神经元迫使输出一个 token 的命令，因此一条命令大约需要一个神经元对应一个 token。

攻击面因此被限定得很清楚：需要权重写权限的供应链或部署环节，而不是普通提示注入。微软称目前未发现任何威胁行为体使用该技术，并同时发布了防御指引——一篇专门讲如何检测隐藏在模型神经元中的「休眠 agent」的安全博客。值得注意的是，同一日微软还发布了 1,259 个漏洞的补丁（见第 1 条），两条都指向供应链与权重管理。

**相关链接**

- https://www.microsoft.com/en-us/research/blog/lazare-veni-foras-reprogramming-dormant-neurons-to-backdoor-ai-agents/ （微软研究院原始论文博客）
- https://www.microsoft.com/en-us/security/blog/2026/11/10/detecting-sleeper-agents-hiding-in-ai-model-neurons/ （微软安全博客：检测休眠 agent）
- https://thehackernews.com/2026/11/microsoft-researchers-show-ai-agents.html （媒体转述报道）

### 15. CISA 向 KEV 目录新增六个在野利用漏洞，含微软 Outlook、Barracuda 两条、Cisco BroadWorks 与 Google Chromium

**导语**

美国 CISA 于 11 月 10 日发布通告，依据已有在野利用证据向「已知被利用漏洞」（KEV）目录新增六个条目：CVE-2026-20320（Cisco BroadWorks XML 外部实体引用限制不当）、CVE-2026-111560（Barracuda Networks 多产品操作系统命令注入）、CVE-2026-111793（Openwave Messaging Limited Webtop Media Transcoder 跨安全域资源传输错误）、CVE-2026-116606（Barracuda Email Security Gateway 认证绕过）、CVE-2026-124194（Microsoft Office Outlook 缺少用户交互的潜在不安全操作）与 CVE-2026-125350（Google Chromium 释放后重用）。本条为 72 小时补收，首次公开时间为 2026-11-10，落在本期 24 小时窗口之外。

**详细内容**

KEV 目录的意义在于它是美国联邦机构的强制修复清单：列入的漏洞有法定修复期限，联邦资产必须按期打补丁。对企业与开发者而言，这份清单更适合当作「本周期补丁优先级排序表」而非新闻清单使用。本期新增的六个条目里，CVE-2026-124194 与第 1 条的微软 11 月补丁是同一漏洞——这说明该 Outlook 欺骗漏洞不仅被微软标记为在野利用，也已进入 CISA 的强制修复目录，处置紧迫性高于一般中危漏洞。

目录本身可持续跟踪，新增条目通常在厂商补丁发布后数日到一周内出现，因此「补丁已发但尚未进入 KEV」与「已进入 KEV」是两个不同状态，对外网暴露的服务应分别对待。

**相关链接**

- https://www.cisa.gov/news-events/alerts/2026/11/10/cisa-adds-six-known-exploited-vulnerabilities-catalog （CISA 官方通告）
- https://www.cisa.gov/known-exploited-vulnerabilities-catalog （KEV 目录）
- https://www.cisa.gov/news-events/alerts/2026/11/10/cisa-adds-six-known-exploited-vulnerabilities-catalog （通告原文，含六个漏洞条目全名）

### 16. Hugging Face 博客：Token Pooling 感知训练可在 4 倍压缩下保留约 94.6% 的未压缩检索质量

**导语**

Hugging Face 博客介绍 Token Pooling 感知训练（pooling-aware training）在多向量嵌入模型上的做法与取舍。多向量嵌入模型为查询的每个 token 单独提供匹配机会，表达力强但文档向量膨胀，百万级语料可能对应上亿个向量。Token pooling 通过合并相似 token 向量压缩表示，代价是压缩越狠越容易丢信息；感知训练则让编码器在训练时就学会保留重要信息。

**详细内容**

文中给出的实验量化了这条取舍：以 Sentence Transformers 训练压缩检索模型，设置 `pool_factor=4` 时，通常训练所得的模型保留了未池化模型在 NanoBEIR 上 nDCG@10 指标的 94.6%，同时向量数量减少到四分之一。结论是感知训练能在同样向量预算下获得更好的检索质量。

这条属于方法与工程实践，不含商业宣称，对做检索增强或向量存储成本优化的团队有直接参考价值：先决定可接受的向量预算，再按需选择池化倍率，而不是先压缩再评估损失。

**相关链接**

- https://huggingface.co/blog/token-pooling （Hugging Face 官方博客）
- https://huggingface.co/blog/qvac/botpsy （同日发布的端侧 agent 模型文章，可作对照阅读）

## 行业动态

### 17. 英国 AI 芯片创业公司 Fractile 完成 7.2 亿美元 C 轮，英国主权 AI 基金领投，估值「超过 50 亿英镑」

**导语**

英国芯片创业公司 Fractile 完成 7.2 亿美元 C 轮融资，由英国主权 AI 基金领投，英国政府称此举是为了「确保英国在支撑未来经济的硬件上拥有更大份额」。本轮由 Thrive Capital、Founders Fund、Lightspeed Venture Partners 与 Redpoint 参与领投。英国政府给出的估值口径是「超过 50 亿英镑」。

**详细内容**

Fractile 的定位是专用 AI 芯片，与 Axelera、Etched、OLIX 等同处一条赛道——专用芯片是降低推理成本的路径之一。它同时强调全栈：除硬件外还自研机器学习编译器以提升大模型在其芯片上的执行速度，因此把自身定位为「前沿 AI 公司」，本轮定价也按该定位给出。

对读者的直接关联在推理成本结构上：如果专用推理硬件的供给与生态在 2027 年前后起来，主流闭源模型之外的自建推理方案会多一个可选项。但要注意估值口径来自政府表述而非经审计数字，且「超过 50 亿英镑」到美元换算存在区间，不做精确折算。

**相关链接**

- https://techcrunch.com/2026/11/11/with-720m-round-britains-fractile-gets-a-leg-up-in-the-race-for-ai-chips/ （TechCrunch 原创报道）

### 18. Plurai 获 1,300 万美元种子轮：用合成数据与数字孪生环境评估 AI agent

**导语**

Plurai 宣布获得 1,300 万美元种子轮融资。这家由前 Nexar 团队成员创立的公司，做法是把自动驾驶领域验证方法迁移到 AI agent 上：用合成数据与被测企业 IT 环境的数字孪生来评估 agent 的表现。

**详细内容**

融资规模在 agent 评估赛道属于早期偏大的一档，说明投资方把「上线前如何验证 agent」当成独立的基础设施问题，而非各家自建测试台的问题。方法论上的类比是清晰的：自动驾驶用仿真里程替代真实路测，agent 评估则用数字孪生环境替代真实生产系统。

这条目前是 TechCrunch 单一来源，融资金额与投资方未在公司侧取得第二处确认。按本期惯例，条款细节（估值、投资方名单、是否含附带条款）以原文为准，本条不补充未在报道中出现的推断。

**相关链接**

- https://techcrunch.com/2026/11/11/plurai-wants-to-help-ai-agents-work-better-using-the-same-approach-that-helped-get-self-driving-cars-to-roads/ （TechCrunch 原创报道）
- https://www.techmeme.com/261111/p31 （聚合页 · 供交叉查阅）

## 后续追踪

- 微软 11 月补丁：1,259 个漏洞中 CVE-2026-124194 已被在野利用并进入 CISA KEV → 本期新进展是该漏洞同时出现在微软公告与联邦强制修复清单 → 下一步关注补丁后残余利用活动与组织侧清零情况
- Railway 10 月安全事件：官方初步报告已发布 → 本期为最终报告，给出解密时间窗（10 月 21 日 04:42 UTC 起）、1.85% 上界口径与 74 万美元未授权支出估算 → 下一步关注 AI 供应商退款结果、平台是否调整 BYOK 密钥的默认存储与轮换策略
- Anthropic 上市进程：此前已报道 IPO 文件更新与价格区间 → 本期无新增官方文件或时间表变更 → 关注交易所挂牌日与定价公告
- llama.cpp 构建节奏：上期为 b12252 至 b12261 → 本期为 b12262 至 b12292 区间 15 个构建 → 关注是否出现带可引用变更说明的版本
- LiteLLM 迁移项：上一期发布 1.108.5 LTS 与 v1.109.0 → 本期 v1.109.0 正式版列出 5 项需要动作的迁移要求 → 关注 1.110.0 正式版是否移除 disk 缓存等过渡兼容
- Claroc 披露的 Grok 应用暴露面：3.5 万余个应用处于任何人可访问状态 → 本期为首次披露，SpaceXSI 已下线 24 个员工自建应用但未处理其他用户应用 → 关注平台侧是否调整 Build 模式发布默认权限

## 编辑备注

1. **检索与核实范围**：本期一手抓取覆盖 24 个 RSS/API 源与 39 个 GitHub 仓库 Release 源，窗口内命中 645 条带时间戳条目（其中 arXiv 预印本 559 条，媒体与官方源 86 条），人工筛选后收录 18 条完整条目与 4 条线索雷达。所有公开条目链接均逐条访问核验。
2. **采集限制（本期）**：Anthropic 官方 news RSS 与 Meta AI 官方 RSS 本轮返回错误页，Microsoft 官方博客、Perplexity 博客与 TechCrunch 开发者频道的 feed 被 JS 质询拦截，均改由页面直取或工具网关检索补足；GitHub 未认证 API 在抓取中段触发速率限制（60 次/小时），部分仓库（LangChain、vLLM、transformers、crewAI、MCP 各语言 SDK、ollama、ComfyUI、Vercel AI 等）本轮未取到 release 列表，这部分仓库若在窗口内有新版本，本期可能遗漏。
3. **证据等级标注**：标注「官方已确认」者已取得官方原文；「多源交叉」者至少两条独立来源一致；「媒体」类条目按原文口径保留数字，不做估值推测，也不以未经验证的性能表述替代实测数据。
4. **时限例外**：第 15 条 CISA 公告首次公开于 2026-11-10，落在 24 小时窗口之外，按例程作为 72 小时补收收录并已注明。
5. **本期无视频**：按 2026-11-11 董事会指令（CMP-472），每日早报不再生成 NotebookLM 视频与音频，本期交付物仅为正文母版、HTML 专业报告、来源清单、发布建议与待确认项。
