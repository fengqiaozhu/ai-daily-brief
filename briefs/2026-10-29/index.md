# AI 早报 2026-10-29

> 全球人工智能情报日报 · 第 003 期（EP003）· 检索窗口 2026-10-28 07:00 – 2026-10-29 07:00（Asia/Shanghai）

## 今日概览

**要闻**

1. 微软 FY2027 第一财季营收 923 亿美元，Azure 收入同比增 48%，商业剩余履约义务增至 6770 亿美元
2. Alphabet 第三季营收 1275.77 亿美元同比增 25%，Google Cloud 收入翻倍至 307.09 亿美元，当季资本开支 513.55 亿美元
3. 美国司法部就 Nvidia 以 129.3 亿美元收购 Hugging Face 对 AI 竞争的影响展开问询
4. Anthropic 扩大 AI for Science 计划，新增 20 家机构并公布 Model Hardware Standard
5. MCP 参考服务器发布 v2.2.0 安全更新，因 eMudhra 中间 CA 证书风险要求升级 Node.js 运行时
6. 微软披露单季来自 OpenAI 的收入 100 亿美元，约占其季度总营收 11%

**开发生态**

7. openai-python v3.41.0 发布，Realtime 输入支持类型化引用，并首次在 SDK 内写入模型下线公告

**模型发布**

8. NVIDIA 开源 Nemotron 3.5 Transcribe 与 Granary v2 数据管线，单模型覆盖 40 种语言转写与说话人归属

**技术与洞察**

9. Artificial Analysis 发布 Intelligence Index v5，60% 权重改用私有测试集

**前瞻与传闻（单一来源 · 未核实）**

- Marvell 接近以约 830 亿美元收购数据中心光模块厂商 Lumentum
- AI 与云安全创业公司 Upwind Security 融资 4 亿美元，估值 38 亿美元
- ServiceNow 第三季订阅收入 39.9 亿美元，第四季指引引发 AI 支出担忧
- Oracle 承诺至 FY2030 新增融资不超过 200 亿美元，预计 FY2029 自由现金流超 300 亿美元
- 纽约州 Hochul 签署法案，限制 AI 聊天机器人对未成年人提供「不安全功能」
- Google 与 Xreal 发布有线 XR 眼镜 Xreal Aura，1,099 美元起
- Apple 为 M5 Ultra Mac Studio 增加 512GB 内存版本，起价 22,299 美元

---

## 要闻

### 1. 微软 FY2027 第一财季营收 923 亿美元，Azure 收入同比增长 48%，商业剩余履约义务增至 6770 亿美元

**导语**

微软 2026 年 10 月 28 日公布截至 9 月 30 日的 FY2027 第一财季业绩：营收 923 亿美元、同比增长 19%，Microsoft Cloud 收入 639 亿美元、增长 30%，Azure 收入同比增长 48%，商业剩余履约义务（commercial RPO）同比增长 73% 至 6770 亿美元。

**详细内容**

官方财报列出：营收 923 亿美元（+19%），营业利润 459 亿美元（+21%，固定汇率 +22%），净利润 366 亿美元（GAAP +32%），摊薄每股收益 4.92 美元（+32%）；非 GAAP 净利润 364 亿美元（+18%）。分部口径上，「Agents and Infra」收入 768 亿美元、同比增长 25%。业务亮点包括：商业剩余履约义务 6770 亿美元（+73%）、Microsoft Cloud 639 亿美元（+30%，固定汇率 +31%）、Azure +48%、Microsoft 365 商业云收入 +17%、行业解决方案云收入 +10%。

CFO Amy Hood 表示「以 Microsoft Cloud 639 亿美元的收入开启本财年，增速加快至 30%（固定汇率 31%）」。据 Reuters 报道，本季资本开支 452 亿美元，低于微软自定的 500 亿美元指引，自由现金流 186 亿美元（分析师预期 85.4 亿美元）。

**相关链接**

- [Microsoft FY27 Q1 官方财报页](https://www.microsoft.com/en-us/Investor/earnings/FY-2027-Q1/press-release-webcast)（一级来源；脚本访问返回 403，需浏览器打开）
- [Reuters：Microsoft 季度云收入超预期](https://www.reuters.com/business/retail-consumer/microsoft-beats-quarterly-cloud-revenue-estimates-2026-10-28/)（二级；原文需人工打开）

### 2. Alphabet 第三季营收 1275.77 亿美元，Google Cloud 收入翻倍至 307.09 亿美元，当季资本开支 513.55 亿美元

**导语**

Alphabet 于 10 月 28 日向 SEC 提交 8-K 并发布第三季业绩：营收 1275.77 亿美元、同比增长 25%，Google Cloud 收入 307.09 亿美元、同比增长 103%，当季购置物业与设备支出 513.55 亿美元，自由现金流为 -90.65 亿美元。

**详细内容**

分项数据（SEC 8-K 附件 99.1 原文，单位百万美元）：Google Services 合计 963.02 亿（+11%），其中 Google Search & other 633.50 亿（+12%）、YouTube 广告 112.07 亿（+9%）、Google Network 74.55 亿、Google 广告合计 820.12 亿（+11%）；Google Cloud 307.09 亿（+103%），分部营业利润 111.21 亿（上年同期 35.94 亿）；Other Bets 收入 3.72 亿、营业亏损 20.47 亿。

合并层面：总营收 1275.77 亿（上年 1023.46 亿），营业利润 405.76 亿（+30%，利润率 31.8%），净利润 264.68 亿、归属普通股股东净利 261.70 亿，均低于上年同期的 349.79 亿。现金流量表显示，当季购置物业与设备支出 513.55 亿（上年同期 239.53 亿），自由现金流 -90.65 亿，前十二个月自由现金流 101.16 亿（上年同期 245.51 亿）。员工数由 190,167 人增至 204,757 人。

官方称这是连续第 13 个季度营收双位数增长，Search 查询量同比增速为近五年最高，并称 Google Cloud 的增长「由企业 AI 基础设施与企业 AI 解决方案带动，TPU 系统销售亦对增长有实质贡献」。CNBC 报道称公司维持全年资本开支 1950–2050 亿美元指引，盘后股价跌超 9%。

**相关链接**

- [Alphabet 8-K 附件 99.1（SEC EDGAR 原文）](https://www.sec.gov/Archives/edgar/data/1652044/000165204426000080/googexhibit991q32026.htm)（一级；SEC 对脚本 UA 返回 403，需浏览器打开）
- [Alphabet 官方业绩发布 PDF](https://s206.q4cdn.com/479360582/files/doc_financials/2026/q3/2026q3-alphabet-earnings-release.pdf)（一级；本次已抓取，文字层为自定义编码，数字以上述 SEC HTML 为准）

### 3. 美国司法部就 Nvidia 以 129.3 亿美元收购 Hugging Face 对 AI 竞争的影响展开问询

**导语**

据 Reuters 报道，美国司法部已就 Nvidia 以 129.3 亿美元收购开源平台 Hugging Face 一事问询其对 AI 竞争的影响，反垄断机构对 Nvidia 行为的调查仍在继续。Bloomberg Law、CNBC 等媒体同步跟进报道。

**详细内容**

Reuters 原文称司法部已就 Nvidia 收购 Hugging Face 的交易如何影响 AI 竞争提出问询。Techmeme 汇总显示，同一事件另有 The Next Web、Bloomberg Law、CNBC 等多家媒体报道；Bloomberg Law 另报道前反垄断执法人员创办 AI 驱动法律平台。Hugging Face 为开源模型托管与分发平台，此次收购对模型生态的集中度影响因此成为反垄断关注点。

本条为多源交叉（Reuters 首发，Bloomberg Law、CNBC、The Next Web 跟进）；Reuters 原文对脚本访问返回 401，需人工打开；司法部是否已升级为正式调查，公开信息中未见确认。

**相关链接**

- [Reuters 原文](https://www.reuters.com/world/us-doj-is-inquiring-about-nvidias-purchase-hugging-face-sources-say-2026-10-28/)（二级；需人工打开）
- [Techmeme 事件汇总页](https://www.techmeme.com/261028/p57)（二级；本次已抓取，含多家跟进媒体列表）

### 4. Anthropic 扩大 AI for Science 计划，新增 20 家基金会与研究机构

**导语**

Anthropic 于 10 月 28 日宣布扩展 AI for Science 计划，公开 20 家来自全球的科学基金会、研究机构与研究团体，为其提供免费 Claude 额度；该计划自 2025 年 5 月启动。

**详细内容**

官方说明中提到，该计划面向生物、医学、物理、化学、气候与数学等方向的高影响力科研项目，向研究者提供免费 Claude 额度；过去数月 Anthropic 还面向科学家推出折扣版 Team Plan，并支持了数百个在研项目。文章以 HHMI Janelia Research Campus 为例，说明双方合作制定了 Model Hardware Standard（MHS）——一套让 AI 智能体安全操作实验室仪器的共享规范。

**相关链接**

- [Anthropic：AI for Science expands to foundations and research institutions](https://www.anthropic.com/news/ai-for-science-expands-foundations-research-institutions)（一级来源，2026-10-28）

### 5. MCP 参考服务器发布 v2.2.0 安全更新，要求 Node.js 升级至 24.22.1 或 26.12.1 及以上

**导语**

modelcontextprotocol/servers 于 10 月 28 日发布 v2.2.0，核心内容是安全更新：因 eMudhra 披露八个中间 CA 证书私钥可被还原，TypeScript 参考服务器要求运行在 Node.js 24.22.1 或 26.12.1 及以上版本。

**详细内容**

官方发布说明写明：eMudhra 于 10 月 20 日披露其八个中间 CA 证书的私钥可从公开证书中还原；Node.js 于 10 月 21 日发布安全版本更新内置 CA 证书并修复若干高危运行时 CVE；Python 的 `certifi` 2026.10.23 移除了 eMudhra 根证书 `emSign Root CA - C1` 与 `emSign ECC Root CA - C3`。

受影响范围按服务器区分：TypeScript 系列服务器不自带 CA 证书、依赖 Node.js 运行时做证书校验，其中只有 `server-everything` 会发起对外 HTTPS 请求（`gzip-file-as-resource`），`server-filesystem`、`server-memory`、`server-sequential-thinking` 不连网；`mcp-server-fetch` 通过 `httpx` 使用 `certifi` 校验，从 PyPI 安装会解析到 2026.10.23 及以后版本，仓库内 Dockerfile 的 lockfile 本次也升级到该版本；`mcp-server-git` 与 `mcp-server-time` 不连网。官方给出的处置建议是：npm 安装（`npx` 或全局安装）场景需自行升级 Node.js（`engines` 字段接受任意 Node.js 24，npm 不会对旧版本告警）；已建环境的 `mcp-server-fetch` 需执行 `uvx --refresh mcp-server-fetch` 或 `pip install -U certifi`。

本次发布包含 `@modelcontextprotocol/server-everything` 2.1.0、`server-filesystem` 2.1.0、`server-memory` 2.0.1，以及 PyPI 侧 `mcp-server-fetch`、`mcp-server-git`、`mcp-server-time` 的 2026.10.28 版本。

**相关链接**

- [modelcontextprotocol/servers v2.2.0 Release](https://github.com/modelcontextprotocol/servers/releases/tag/v2.2.0)（一级来源）

### 6. 微软披露单季来自 OpenAI 的收入 100 亿美元，约占其季度总营收 11%

**导语**

据 TechCrunch 依据微软监管文件报道，微软在截至 9 月 30 日的季度中从与 OpenAI 的商业安排（含收入分成）取得 100 亿美元收入，约占其 923 亿美元季度总营收的 11%；同期 OpenAI 应付微软的应收款为 72 亿美元。

**详细内容**

报道给出更多口径：2026 财年全年来自 OpenAI 的收入为 241 亿美元，按最新季度速度推算年化约 400 亿美元；9 月末对 OpenAI 的应收款 72 亿美元，高于 6 月末的 60 亿美元，且该款项属既往交易应收、不计入当期收入。报道同时指出，报道无法确认这 100 亿美元中收入分成与 Azure 云服务各自占比；OpenAI 被报道按此前协议向微软分成其收入的 20%（微软投资逾 130 亿美元），双方均未公开确认该比例，2026 年 4 月的协议约定该分成延续至 2030 年并设有上限，同时允许 OpenAI 使用其他云厂商。报道还称微软持股比例由 6 月的约 25% 稀释至 9 月的 24%，微软未说明稀释原因。

**相关链接**

- [TechCrunch：Microsoft recorded $10 billion in revenue from OpenAI](https://techcrunch.com/2026/10/28/microsoft-recorded-10-billion-in-revenue-from-openai/)（二级原文，引监管文件；本次已抓取原文）
- [Microsoft FY27 Q1 官方财报页](https://www.microsoft.com/en-us/Investor/earnings/FY-2027-Q1/press-release-webcast)（一级；923 亿美元总营收口径来源）

## 开发生态

### 7. openai-python v3.41.0 发布，Realtime 输入支持类型化引用，并首次在 SDK 内写入模型下线公告

**导语**

OpenAI Python SDK 于 10 月 28 日发布 v3.41.0：新增 Realtime 响应输入的类型化引用（typed references）、response 工具用量模型、按 metadata 过滤智能体会话，以及 WebSocket 重连后恢复排队中的二进制帧；同一版本的文档变更首次在 SDK 内记录了即将下线的模型与迁移路径。

**详细内容**

功能变更包括：Realtime 响应输入接受类型化引用（#4189）、新增 response tool usage 模型（#4201）、支持按 metadata 过滤 agent 会话（#4200）、WebSocket 重连后恢复排队二进制帧（#4191）。修复项包括示例代码对不完整 WebSocket 响应的识别、push-to-talk 中断与断连处理，以及严格 Pyright 下的消费者 fixture 清理。

文档变更（#4199）为开发者给出明确时间表：2027 年 1 月 6 日下线批次包含 `tts-1`、`tts-1-hd`、`gpt-4o-mini-tts`（含 2025-03-20 快照），官方迁移路径为转向 `gpt-realtime-2.1-mini`；音频翻译（audio translations）标记为 deprecated，需在 2027 年 2 月 26 日前迁移到 Realtime translations，调用时会发出标准 `DeprecationWarning`，请求与响应类型不变。OpenAI 官方弃用页另列出 2026 年 10 月 14 日公告的 GPT-4 系列下线安排（`gpt-4o`、`gpt-4o-mini`、`gpt-4.1`、`gpt-4.1-mini` 于 2027 年 1 月 14 日下线，推荐替代为 `gpt-6-luna`）。

**相关链接**

- [openai/openai-python v3.41.0](https://github.com/openai/openai-python/releases/tag/v3.41.0)（一级来源）
- [PR #4199：chore(api): document upcoming model shutdowns](https://github.com/openai/openai-python/pull/4199)（一级来源）
- [OpenAI 官方弃用与下线页](https://platform.openai.com/docs/deprecations)（一级；本次已抓取原文，页面有重定向）

## 模型发布

### 8. NVIDIA 开源 Nemotron 3.5 Transcribe 与 Granary v2 数据管线，单模型覆盖 40 种语言转写与说话人归属

**导语**

NVIDIA 于 10 月 28 日在 Hugging Face 发布开放权重的 Nemotron 3.5 Transcribe 模型与开源数据管线 Granary v2：单 checkpoint 同时完成转写、说话人归属（diarization）、翻译与音频问答，支持 40 种语言转写、31 种语言与英语互译、13 种语言说话人标注，最长 1 小时音频、最多 8 名说话人。

**详细内容**

官方说明称该模型为开放权重、可通过自然语言引导输出，可选择音频处理位置并按领域词汇与口音适配识别范围；官方称其在 Hugging Face Open ASR Leaderboard 的英文榜单上位列开放权重模型首位，并使用 Artificial Analysis 的准确率评测（此为官方与第三方评测的官方表述，尚未经独立复现）。同期还发布 Granary v2 开源数据管线与微调配方（recipes），用于构建专用多模态模型。模型已在 Hugging Face 与 ModelScope 上提供。

**相关链接**

- [Hugging Face：NVIDIA Nemotron 3.5 Transcribe and Granary v2](https://huggingface.co/blog/nvidia/nemotron-transcribe-granary)（一级来源，2026-10-28）

## 技术与洞察

### 9. Artificial Analysis 发布 Intelligence Index v5，60% 权重改用私有测试集

**导语**

Artificial Analysis 于 10 月 27 日发布 Intelligence Index v5，称这是自 v4（1 月上线）以来最大的一次升级：指数的 60% 权重改为基于私有测试集或保留答案的评测，新增两项基准并升级三项基准。

**详细内容**

新增基准包括：Cognition 新推出的私有编码基准 FrontierCode 2.0（以「仓库维护者是否合并该智能体的改动」为评分方式）、以及在终端环境中运行的 70 项智能体科学研究任务 Terminal-Bench-Science。升级项包括 HLE-Diamond（1,000 题，推理与知识各半，替代 Humanity's Last Exam）、AA-Omniscience v1.1（剔除已饱和或公开的题、补题并修订有歧义或错误的题）、CritPt v2 的私有 40 题困难子集（由 CritPt 作者修订，带代码执行工具）。保留项为 AA-Briefcase、AutomationBench-AA、GDP.pdf 与 Terminal-Bench 4.0；移出指数的是 GDPval-AA v2.1、SciCode 与 AA-LCR v1.1。权重分布为知识工作 25%（AA-Briefcase 15%、AutomationBench-AA 5%、GDP.pdf 5%）、编码 25%（FrontierCode 2.0 15%、Terminal-Bench 4.0 10%）、科学 25%（Terminal-Bench-Science 15%、CritPt v2 困难子集 10%）。同时推出 Progress Index v1，用单一连续标尺跟踪模型能力变化。

本条发布于 10 月 27 日（美东），落在本期 24 小时窗口之外，属 13.1 允许的 72 小时补收。

**相关链接**

- [Artificial Analysis：Announcing Artificial Analysis Intelligence Index v5](https://artificialanalysis.ai/articles/artificial-analysis-intelligence-index-v5)（一级来源，2026-10-27）

## 行业动态

### 10. Oracle 投资者日设定 FY2030 营收 2250 亿美元以上长期目标，FY27–FY30 新增融资上限锁定 200 亿美元

**导语**

Oracle 于 10 月 28 日在拉斯维加斯举行投资者日，给出中期财务框架：FY2030 总营收 2250 亿美元以上（较 FY26 复合增速 35% 以上）、非 GAAP 营业利润率 40% 以上、非 GAAP EPS 21 美元以上；并承诺 FY27–FY30 投资周期内资本市场新增融资不超过 200 亿美元。

**详细内容**

官方披露的框架要点：自由现金流在 FY2028 下半年转正，FY2029 自由现金流目标 300 亿美元以上；资本开支在 FY27–FY28 见顶、FY29 起回落；FY27–FY30 期间资本市场新增融资上限 200 亿美元，其中约 100 亿美元股权、100 亿美元总债务（不含存量债务再融资），且不包含 FY27 第一季度已完成的 200 亿美元 ATM 股权发行；FY2029 起增长转为自筹资金，净债务/调整后 EBITDA 低于 3.5 倍。官方另重申 FY2027 展望：总营收不低于 900 亿美元。公司称供应商融资、客户提供的硬件与客户预付款将降低自由现金流转正前的现金需求。

**相关链接**

- [Oracle 8-K 附件 99.1：Oracle Investor Day 2026（SEC EDGAR 原文）](https://www.sec.gov/Archives/edgar/data/1341439/000119312526435853/d75538dex991.htm)（一级；SEC 对脚本默认 UA 返回 403，需浏览器打开）

### 11. ServiceNow 第三季订阅收入 39.88 亿美元，2026 年 AI 年合同价值目标上调至 17 亿美元

**导语**

ServiceNow 于 10 月 28 日公布第三季业绩：订阅收入 39.88 亿美元、同比增长 21%，当前剩余履约义务 136.5 亿美元、同比增长 20.5%；公司把 2026 年 AI 年合同价值（ACV）目标从年初水平上调 70% 至 17 亿美元，并将全年自由现金流率目标上调 100 个基点至 36%。

**详细内容**

官方新闻稿要点：总营收 41.06 亿美元（+20.5%），剩余履约义务 297 亿美元（+22%）；季度内 19 笔净新增 ACV 超 500 万美元的交易，同比增超 135%，季末 ACV 超 500 万美元的客户数达 680 家；管理层称生产环境中的 agentic AI 用量年内累计同比增长超过 13 倍，并强调通过降低资本开支、以更轻资产的模式承接需求。

第四季 2026 指引（非 GAAP）：订阅收入 42.45 亿–42.55 亿美元，同比增 22.5%–23%（固定汇率 21.5%），cRPO 同比增 18.5%，营业利润率 32%，摊薄股数 10.5 亿股。同日 ServiceNow 宣布与 OpenAI 扩大合作，先行推出由 Action Fabric 驱动的 ChatGPT 插件。Bloomberg 报道称公司股价盘后跌超 15%，主因第四季 cRPO 增速指引（18.5%）低于市场预期。

**相关链接**

- [ServiceNow 8-K 附件 99.1：第三季 2026 业绩（SEC EDGAR 原文）](https://www.sec.gov/Archives/edgar/data/1373715/000137371526000092/erq3fy26.htm)（一级；SEC 对脚本默认 UA 返回 403，需浏览器打开）
- [Bloomberg：ServiceNow falls after quarterly sales outlook revives AI fears](https://www.bloomberg.com/news/articles/2026-10-28/servicenow-falls-after-quarterly-sales-outlook-revives-ai-fears)（二级；需人工打开，仅用于盘后跌幅与市场反应口径）

## 前瞻与传闻

> 以下条目均只有单一来源，**未核实**，仅保留标题、来源链接与日期，不展开细节，也不作为公开版完整条目。

- **Marvell 接近以约 830 亿美元收购数据中心光模块厂商 Lumentum，交易最快下周宣布** · [Bloomberg](https://www.bloomberg.com/news/articles/2026-10-28/marvell-is-said-to-near-deal-for-lumentum-in-ai-related-megadeal)（需人工打开）· 2026-10-28
- **AI 与云安全创业公司 Upwind Security 融资 4 亿美元，Bessemer 领投，估值 38 亿美元** · [Bloomberg](https://www.bloomberg.com/news/articles/2026-10-28/ai-cybersecurity-startup-upwind-raises-at-3-8-billion-value)（需人工打开）· 2026-10-28
- **纽约州州长 Hochul 签署法案，禁止 AI 聊天机器人对未成年人使用「不安全功能」，并要求联网婴儿监视器具备安全功能** · [Bloomberg Government](https://news.bgov.com/bloomberg-government-news/hochul-signs-bills-on-ai-risks-to-children-in-pre-election-push) · 2026-10-28
- **Google 与 Xreal 发布有线 XR 眼镜 Xreal Aura（Android XR + Snapdragon Reality Elite），12 月前 1,099 美元起、之后 1,279 美元起** · [TechCrunch](https://techcrunch.com/2026/10/28/xreal-aura-is-a-new-wired-headset-powered-by-android-xr/) · 2026-10-28
- **Apple 为 M5 Ultra Mac Studio 增加 512GB 内存版本，起价 22,299 美元；M5 Max 最高 128GB** · [MacRumors](https://www.macrumors.com/2026/10/28/mac-studio-m5-ultra-512gb-ram/) · 2026-10-28

## 后续追踪

- **OpenAI 模型下线时间表**：2026-10-14 公告的 GPT-4 系列（`gpt-4o`、`gpt-4o-mini`、`gpt-4.1`、`gpt-4.1-mini`）定于 2027-01-14 下线，官方推荐替代 `gpt-6-luna`；TTS 系列（含 `gpt-4o-mini-tts` 2025-03-20 快照）定于 2027-01-06 下线 → 本期新增 SDK 内的下线公告与 Realtime 迁移说明 → 下一步关注其余模型的下线批次与替代映射是否补齐。
- **Codex CLI 0.166.0 预览版**：官方在 10 月 28 日先后发布 `rust-v0.166.0-alpha.5`（04:43Z）与 `rust-v0.166.0-alpha.5.1`（19:17Z），发布说明均只写「Release 0.166.0-alpha.x」，未列实质变更 → 下一步关注首个 0.166.0 稳定版的完整变更清单（上一稳定版 0.165.0 已于第 002 期报道，含内置 Vertex AI provider 与 GPT-6.1 Terra 入目录）。
- **Gemini CLI 0.67.0**：nightly 版 `v0.67.0-nightly.20261028` 于 10 月 28 日发布，修复 Termux 下 ripgrep 路径解析等 → 下一步关注 0.67.0 稳定版发布节奏。
- **Oracle 资本开支与融资周期**：FY27–FY28 资本开支见顶、FY29 起回落并转向自由现金流 ≥300 亿美元 → 本期投资者日给出 FY30 营收 2250 亿美元以上长期目标与 200 亿美元融资上限 → 下一步关注 FY27 资本开支实际执行节奏、ATM 与债务工具的落地结构。
- **Nvidia 收购 Hugging Face 的反垄断审查**：DOJ 已问询交易对 AI 竞争的影响 → 下一步关注是否升级为正式调查、是否出现公开的补救措施或交易条款调整。
- **Anthropic 上市进程**：Anthropic 于 10 月 26 日提交 S-1 的消息落在本期检索窗口之外，且本次未取得可直接指向原文的稳定链接，故本期不收录 → 下一步关注 SEC EDGAR 上的原始文件与募资规模细节。

## 编辑备注

- **本期真实检索时间窗**：24 小时窗口为 2026-10-28 07:00 – 2026-10-29 07:00（Asia/Shanghai）＝ 2026-10-27 23:00Z – 2026-10-28 23:00Z，以事件首次公开时间为准；第 9 条（Artificial Analysis Intelligence Index v5，发布于 2026-10-27）属 13.1 允许的 72 小时补收，已在正文标注。
- **采集通道降级**：本期 07:02 时 NotebookLM 超级 MCP 可用（`notebooklm-server-info` 返回 `0.8.5`、`authenticated=true`），07:12 起网关工具目录降为 97 个工具且不含 notebooklm 连接（与 [CMP-236](/CMP/issues/CMP-236) 2026-10-28 记录的同类抖动一致），Firecrawl 检索随后出现 504 超时与 502 上游缺工具。按 13.5 降级为直连抓取 + 人工逐条核验，事实依据全部来自本次实际访问的原始页面；母版锚定的 NotebookLM 步骤与动漫风视频生成待通道恢复后补做，补做前不生成视频。
- **链接可达性**：Reuters、Bloomberg 原文对脚本访问返回 401/403，标注「需人工打开」；Microsoft IR 与 SEC EDGAR 原文需浏览器 UA（脚本默认 UA 返回 403，本次以浏览器 UA 抓取成功）；OpenAI 弃用页存在重定向。公开版条目须逐一访问链接、失效链接不得发布。
- **口径说明**：官方与第三方的性能/排名表述（如 Nemotron 3.5 Transcribe 的榜单位置）均按发布方口径写为「官方称」，未表述为已独立验证的事实；财务数字保留原文口径并标注出处，不做估值推测。
