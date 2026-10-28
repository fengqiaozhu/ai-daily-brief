# AI 早报 2026-10-28

## 今日概览

**要闻**

1. Anthropic 与 GSA 扩大合作，Claude 全产品线给政府客户 40% 折扣
2. SK hynix 三季度营收首破 100 万亿韩元，HBM4 成为第四季度主流产品
3. OpenAI Codex CLI 发布 rust-v0.165.0，内置 Google Cloud Vertex AI provider

**开发生态**

4. Claude Code 发布 v2.1.312
5. Gemini CLI 发布 v0.66.0 稳定版与 v0.67.0-preview.0

**技术与洞察**

6. OpenAI 连续第四次下调模型价格，单价降至 GPT-6.1 Sol 的一半

**前瞻与传闻（线索雷达 · 单一来源 · 未核实）**

7. 据报道，Amazon 内部备忘录称仅用 token 用量衡量 AI 采纳「严重失真」
8. 据报道，OpenAI 计划采购 Google TPU
9. 据报道，Physical Intelligence 拟募资 10 亿美元以上，估值约 200 亿美元
10. 据报道，Meta 250 亿美元股票发行获超额认购 5 倍
11. 据报道，Anthropic 披露与六家伙伴的早期药物研发合作，并收购一人公司 Mithril
12. Anthropic 招聘负责人称因 Claude 表现更好而取消编程面试
13. 据报道，Infisical 完成 4000 万美元 B 轮融资

**后续追踪**

- GPT-6.1 Terra 定价：上一期已报发布与价格 → 本期新增为第三方对第四次连续降价的分析 → 下一步关注官方定价页与竞品是否跟进

## 要闻

### 1. Anthropic 与 GSA 扩大合作，Claude 全产品线给政府客户 40% 折扣

**导语**

Anthropic 宣布与美国联邦采购机构 GSA 扩大合作，新协议给政府合作伙伴 Claude Enterprise、Claude for Government 与 Claude API 全产品线 40% 折扣，并首次覆盖从 Anthropic 直购与经云厂商采购的两种路径。折扣延伸至州、地方、部落与属地政府。官方称约 500 个美国联邦、州与地方政府机构在用 Claude。

**详细内容**

官方公告称，Claude for Government 周活跃用户自今年 2 月以来增长约 8 倍，联邦文职机构（civilian agencies）过去一年的使用量增长约 20 倍。Anthropic 估算该协议下的折扣合计可为政府节省约 10 亿美元，并表示机构不设最低消费承诺，按实际用量付费。

与公告同步推出的还有面向政府客户的落地支持项目，用于帮助机构在长采购周期、紧预算条件下部署 Claude。公告举出的场景包括积压工单处理、档案与表单管理、旧代码现代化。

对开发者的直接含义：Claude Enterprise 与 API 的政府渠道价格出现结构性下调，若此前因报价偏高而未进入采购流程的机构可能重新评估。

**相关链接**

- https://www.anthropic.com/news/expanding-partnership-gsa
- https://www.techmeme.com/261027/p36

### 2. SK hynix 三季度营收首破 100 万亿韩元，HBM4 成为第四季度主流产品

**导语**

SK hynix 10 月 28 日公布 2026 年第三季度财报：营收 104.6155 万亿韩元，营业利润 83.3338 万亿韩元（营业利润率 80%），净利润 39.7756 万亿韩元（净利率 38%）。季度营收首次突破 100 万亿韩元，营收与营业利润双双创历史新高。

**详细内容**

官方新闻稿称，增长主要由 AI 内存需求推动的价格上行与高附加值产品放量带动，HBM4 与高附加值服务器产品销售扩大，HBM4 预计从第四季度起成为主流产品。产能方面，公司已就 2027—2028 年超过 50% 的产量签订长期协议（LTAs）。

股东回报方面，Kioxia 投资带来的收益大部分将回馈股东，公司计划今年执行约 100 万亿韩元的股东回报。官方 AI 摘要另称，公司预计内存供应紧张将持续至 2030 年，并正在扩充先进 DRAM/NAND 产能。

这是 AI 算力需求在存储端的最新量化信号：供给端的长期协议已覆盖 2027—2028 年过半产量，价格周期与 AI 资本开支的绑定度进一步上升。

**相关链接**

- https://news.skhynix.com/en/q3-2026-business-results/
- https://www.techmeme.com/261027/p37

### 3. OpenAI Codex CLI 发布 rust-v0.165.0，内置 Google Cloud Vertex AI provider

**导语**

OpenAI 官方 Codex CLI 仓库 在 10 月 27 日发布 rust-v0.165.0。新版内置 Google Cloud Vertex AI provider，配置项为 `model_provider = "gcp"`；同时把 GPT-6.1 Terra 加入模型目录，并新增会话选择器的仓库过滤与目录分组能力。

**详细内容**

该版本在同日还发布了 alpha 通道的 0.166.0-alpha.1 至 alpha.3 三个预发布版本，stable 与 alpha 通道并行推进。模型目录新增 GPT-6.1 Terra 与上一期早报报道的价格下调形成呼应：接入 Vertex AI 的同时可以用到最新价位与最新模型。

对使用者的影响是多云与多 provider 调度不再依赖外部配置层，Codex 内部即可按 provider 配置调用不同后端。

**相关链接**

- https://github.com/openai/codex/releases/tag/rust-v0.165.0
- https://github.com/openai/codex/releases

## 开发生态

### 4. Claude Code 发布 v2.1.312

**导语**

Anthropic 的 Claude Code 官方仓库于 10 月 27 日 20:24（UTC）发布 v2.1.312，为该仓库当天发布的最后一个正式版本标签，前一个稳定版 v2.1.311 发布于 10 月 26 日 21:51（UTC）。

**详细内容**

该仓库的发布说明以「Immutable release」形式给出，发布内容以标题与变更条目为主。仓库同时在 10 月 26 日至 27 日间并行推进 v2.1.310 至 v2.1.312 三个版本，正式版节奏保持每日一版以上。

对使用者的实际影响是版本漂移：生产环境需要显式锁定版本号，官方仓库的 Releases 页提供完整标签列表与逐版本对比入口。

**相关链接**

- https://github.com/anthropics/claude-code/releases/tag/v2.1.312
- https://github.com/anthropics/claude-code/releases

### 5. Gemini CLI 发布 v0.66.0 稳定版与 v0.67.0-preview.0

**导语**

Google 的 Gemini CLI 在 10 月 27 日一天内发布三个标签：稳定版 v0.66.0（20:26 UTC）、预览版 v0.67.0-preview.0（20:07 UTC）以及夜间构建 v0.67.0-nightly.20261027。

**详细内容**

该项目沿用 nightly、preview、stable 三条发布通道。官方 release notes 页说明：自 2026 年 6 月 18 日起，Gemini CLI 已由 Antigravity CLI 取代，未付费用户与 Google One 用户不再使用 Gemini CLI；且 Gemini CLI 未针对 Gemini 4 Argon 做优化，需要该模型的用户应改用 Antigravity。

这两条限制直接影响选型：把 Gemini CLI 当作默认入口的团队需要确认自己是否处在被取代的通道上。

**相关链接**

- https://github.com/google-gemini/gemini-cli/releases/tag/v0.66.0
- https://geminicli.com/docs/changelogs/

## 技术与洞察

### 6. OpenAI 连续第四次下调模型价格，单价降至 GPT-6.1 Sol 的一半

**导语**

据 TechTarget 10 月 27 日报道，OpenAI 最新模型 GPT-6.1 Terra 的价格为每百万输入 token 1 美元、每百万输出 token 5 美元，是 GPT-6.1 Sol（2 美元 / 10 美元）的一半，也低于 GPT-5.6 Terra 的 2 美元 / 12 美元。报道称这已是 OpenAI 连续第四次下调模型价格。

**详细内容**

报道将降价放在与开放权重厂商（阿里巴巴、百度、Z.ai 等）竞争压力的背景下解读，并提到 Anthropic 也在 10 月下调了 Haiku 5.5 的价格（每 100K token 下降 90%，输出每百万 token 降 0.50 美元）。报道同时引述 Futurum Group 分析师 David Nicholson 的判断：价格下降让企业有更多低成本选项，但也让「哪个模型对应哪个工作负载」变得更难判断。

需要区分的是：GPT-6.1 Terra 的发布与价格本身已在上一期早报报道，本期新增的是第三方对「连续第四次降价」这一趋势的分析与竞品对比数字，并非新的价格动作。竞品具体降幅数字为二级来源转述，未在厂商官方定价页逐项核对。

**相关链接**

- https://www.techtarget.com/news/openai-slashes-price-for-model-again/872942/


## 前瞻与传闻

> 以下条目均为单一来源、未经官方确认，统一标注「单一来源 · 未核实」，只保留标题、来源链接与日期，不展开细节、不写推断（本期证据门槛见 13.4）。

- **据报道，Amazon 内部备忘录称仅用 token 用量衡量 AI 采纳「严重失真」**（2026-10-27）——Techmeme 汇总报道，备忘录原文未获取。https://www.techmeme.com/261027/p27
- **据报道，OpenAI 计划采购 Google TPU**（2026-10-27）——来源称其招聘启事显示将招聘负责 TPU 相关工作的工程师，OpenAI 为 Nvidia 的重要客户。官方未确认。https://www.techmeme.com/261027/p39
- **据报道，Physical Intelligence 拟募资 10 亿美元以上，估值约 200 亿美元**（2026-10-27）——传由 Avenir 与 Lux Capital 领投。官方未确认。https://www.techmeme.com/261027/p29
- **据报道，Meta 250 亿美元股票发行获超额认购 5 倍**（2026-10-27）——传为筹集约 980 亿美元 AI 支出资金。官方未确认。https://www.techmeme.com/261027/p28
- **据报道，Anthropic 披露与六家伙伴的早期药物研发合作，并收购一人公司 Mithril**（2026-10-27）——Anthropic 官方新闻列表中未见对应条目，未确认。https://www.techmeme.com/261027/p31
- **Anthropic 招聘负责人称因 Claude 表现更好而取消编程面试**（2026-10-27）——个人公开发言，不代表公司政策。https://www.techmeme.com/261027/p38
- **据报道，Infisical 完成 4000 万美元 B 轮融资**（2026-10-27）——该公司为 AI agent 提供凭据托管。官方公告未核对。https://www.techmeme.com/261027/p35

## 后续追踪

- **GPT-6.1 Terra 定价**：上一期已报发布与价格（较前代低 50%） → 本期新增为第三方对「连续第四次降价」的分析，以及与 Anthropic Haiku 5.5 降价的对比（二级来源） → 下一步关注厂商官方定价页是否再次调整、竞品是否同期跟进。
- **Anthropic 上市进程**：上一期已报 S-1 招股书与财务数据 → 本期新增为 TechTarget 提到其「本周提交招股书」并提及同期降价 → 下一步关注 SEC EDGAR 原文与承销安排。

## 编辑备注

- **本期检索时间范围**：2026-10-27 09:00 至 2026-10-28 09:00（Asia/Shanghai），即 2026-10-27 01:00Z 至 2026-10-28 01:00Z，以事件首次公开时间为准；未回补 72 小时。
- **采集限制**：本期检索阶段的 NotebookLM 超级 MCP 通道不可用（工具网关会话未暴露 NotebookLM 连接），检索降级为直接抓取一级与二级来源原文，并按 13.5 标注来源分级；无法核实的线索已降级为「前瞻与传闻」线索雷达（单一来源 · 未核实），取得第二独立来源后才升级为完整条目。
- **来源冲突**：SK hynix 三季度数据以官方新闻稿（韩元口径）为准，Techmeme 汇总的美元口径（约 788 亿美元营收、约 627.6 亿美元营业利润）与其一致，未见冲突。
- **条目降级说明**：本期行业类消息（Meta 股票发行、Physical Intelligence 融资、Infisical 融资、Amazon 内部备忘录等）目前均为单一来源，按 13.4 证据门槛收在「前瞻与传闻」线索雷达，仅保留标题与链接；取得第二独立来源后可升级为完整条目。
- **未收录说明**：本期未收录社交热度高但无实质产品或参数变化的条目；STEPX Neo 手机发布（IT之家，2026-10-13）等超窗条目未纳入。
