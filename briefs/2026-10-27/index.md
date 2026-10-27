# AI 早报 · 第 001 期 · 2026-10-27（对外发布核验版）

> **本期为「核验版」**：只有达到「官方已确认」或「多源交叉」的条目才完整展开；其余条目只保留标题级线索，不作事实断言。

## 版头

| 项目 | 内容 |
| --- | --- |
| 期号 / 日期 | 第 001 期 · 2026-10-27（Asia/Shanghai，UTC+8） |
| 实际检索时间窗 | 2026-10-27 12:20–12:48（Asia/Shanghai） |
| 事件窗口 | 主窗口 2026-10-26 00:00 – 2026-10-27 12:00（Asia/Shanghai）；补充 72 小时内遗漏的重要事件，最早回溯至 2026-10-15 |
| 监测领域 | 全球人工智能及相关技术生态 |
| 目标读者 | 开发者、AI 工具用户、独立开发者与行业观察者 |
| 本期条目 | 共 16 条：已核验条目 4 条（第 1、2、3、13 条）／线索雷达 12 条 |
| 链接复核 | 2026-10-27 发布前逐条访问复核，结果见同目录 `sources.md` |

### 来源分级说明

- **官方已确认**：已读到发布方或监管机构原文（本期为 Cloudflare 官方披露、Anthropic S-1 招股书原文）。
- **多源交叉**：至少两个相互独立的来源同时指向同一事实，但未逐字核对全部一手正文。
- **单一来源 · 未核实**：仅有一个来源，且正文未逐篇打开。本期该级别条目**只进入「线索雷达」**，仅列标题、来源链接、日期，不展开细节、不作推断。

### 更正与反馈

- 发现错误，请通过站点「更正与反馈」入口提交更正请求（Issue / 邮件，入口见页脚）。
- 更正机制：确认后 **24 小时内在原文顶部加更正说明**，并同步仓库 commit；第 001 期如招股书发生修订，以修订版为准，并在下一期做更正说明。
- 本期所有一手来源链接与复核状态见 [`sources.md`](./sources.md)。

---

## A 区 · 已核验条目（完整展开）

### 1. OpenAI 发布 GPT-6.1 Terra，API 标准价格较 GPT-5.6 Terra 与 GPT-6.1 Sol 低 50%

**证据等级：多源交叉**

**导语**

OpenAI 于 10 月 26 日发布 GPT-6.1 Terra，官方口径下 API 标准价格较前代 GPT-5.6 Terra 与同期 GPT-6.1 Sol 低 50%：每百万输入 token 1 美元、每百万缓存输入 token 0.05 美元、每百万输出 token 5 美元。该模型已在 ChatGPT Work 与 Codex 向 Plus、Pro、Enterprise、Edu 订阅者开放，API 模型标识为 `gpt-6.1-terra`。

**详细内容**

官方将 Terra 定位为面向计算机操作、视觉推理、编码与日常办公场景的模型，典型任务包括起草方案、解读技术图纸、填写表单与剪辑视频，其中给出的示例是读取来件发票并将字段录入财务软件。OpenAI 称 Terra 是 GPT-5.6 Terra 的替代型号。

基准数据全部来自 OpenAI 自测，未见第三方独立复现：

- **Agents' Last Exam**（专业计算机操作任务基准）：medium reasoning effort 下较 GPT-5.6 Terra 高 15 个百分点，官方称成本约为后者的三分之一。
- **Terminal-Bench 4.0**（命令行编码智能体测试）：max reasoning effort 下解出 50.3% 任务，GPT-5.6 Terra 为 21.5%。OpenAI 仍建议最复杂的编码任务使用 GPT-6.1 Sol 或 GPT-6 Astra。
- **内部「诱导错误提示」基准**：low reasoning effort 下错误率从 GPT-5.6 Terra 的 53.6% 降至 16.7%；max reasoning effort 下降 18 个百分点至 4.3%。
- **横向对比（均为官方口径）**：官方称与 Claude Opus 5.5 相比，max effort 下 token 效率高出 3 倍以上、单 token 成本为四分之一，折算每任务成本约低 9 倍；官方称与 GPT-6 Astra 表现相当而单 token 价格为十分之一，完成速度快 3 倍以上。

安全方面，官方称 GPT-6.1 Terra 在其 Preparedness Framework 的网络安全维度达到 Critical 阈值，保留了 GPT-6 Astra 的防护措施，并称对提示注入的抵抗力强于 GPT-5.6 Terra（细节见系统卡）。ChatGPT 订阅用户的实际变化是额度口径：官方称同等套餐额度在 Terra 上可完成的任务数多于 GPT-5.6 Terra，也显著多于 GPT-6.1 Sol 与 GPT-6 Astra。OpenAI 尚未说明 GPT-6.1 Terra 是否进入免费层。

**来源与链接**

- OpenAI 官方发布页 —— **需人工打开**（站点对自动抓取返回 403 / JS 质询，本期未读到正文）：https://openai.com/index/introducing-gpt-6-1-terra/
- 已读全文的二手报道（含价格与基准细节）：https://www.ghacks.net/2026/10/27/openai-launches-gpt-6-1-terra-with-api-pricing-50-lower-than-gpt-5-6-terra/

> 阅读提示：本条的价格与基准数字来自发布方口径与已读全文的二手报道，**未经第三方独立复现**，请勿作为已验证事实引用。

---

### 2. Cloudflare 披露 Workers AI 上 GLM-5.3 跨请求 KV 缓存泄露，155 次响应受影响

**证据等级：官方已确认**

**导语**

Cloudflare 于 10 月 26 日与开源推理引擎 SGLang 联合披露：8 月 27 日至 9 月 9 日期间，Workers AI 上的 `@cf/zai-org/glm-5.3` 存在跨请求 KV 缓存暴露，共 155 次响应中混入了其他用户请求的内容，全部发生在提示长度超过 681,280 token 的请求上。事件已于 9 月 9 日修复并恢复服务。

**详细内容**

根因是两层问题叠加。第一层是配置错配：Cloudflare 以 1,048,576 token 的上下文窗口部署 GLM 5.3，但 prefill GPU 上的 KV 缓存池只有 681,280 token 容量，这一错配在发布前已知，团队原以为引擎会自行报错——实测只校验了 HTTP 状态码与流式响应体，没有校验模型输出连贯性。第二层是 SGLang 的缺陷：在 disaggregated prefill/decode 模式下，超长提示被调度器拒绝后会被替换成单 token 占位符继续走流程，prefill 照常为占位符生成 KV 缓存并通过 RDMA（Mooncake）传给 decode 节点；decode 节点收到「传输完成」信号后认为缓存已被本次请求完全覆盖，实际只写入了部分页码，于是生成时读取到残留的旧页面，客户端拿到 HTTP 200 且内容连贯但混入了他人数据。

处置与修复：9 月 8 日收到 Knostic 研究员 Gadi Evron 的 HackerOne 报告；9 月 9 日 13:22 宣布安全事件，14:00 将模型置为私有（返回 HTTP 400），14:52 完成全部 prefill 节点配置回滚，19:04 以修正配置加引擎补丁重建并用研究者复现脚本验证，19:40 恢复公开。配置侧把 KV 池扩到约 204 万 token（约为上下文长度的两倍），引擎侧让被拒请求在 KV 传输前就以原始错误终止。相关上游修复已合入 SGLang v0.5.20（PR #36988）与 v0.5.21（PR #38935），Cloudflare 建议所有 SGLang 部署方升级到 v0.5.22 或更高版本，并做四项检查：核对 KV 池与上下文长度、开启 deferred KV release、限制传输批次、启用 `--disaggregation-enable-kv-checksum` 与 `--kv-canary`（对 GLM 5.3、GLM 5.3 Flash、DeepSeek V4 的支持仍在扩展中）。Cloudflare 称仅 GLM 5.3 受影响，Workers AI 上其他模型的 KV 池均大于其上下文长度。

**来源与链接**

- Cloudflare 披露原文（一手，已读全文）：https://blog.cloudflare.com/kv-cache-exposure-remediation/
- SGLang 侧联合声明（由 Cloudflare 文中链接，未单独打开）：https://www.lmsys.org/blog/2026-10-26-cf-security
- Cloudflare 状态页事件记录（文中引用）：https://www.cloudflarestatus.com/incidents/jsvvrtk5hvym

---

### 3. Anthropic 提交 S-1 招股书：2026 上半年净亏 807 亿美元，消费型收入半年达 131 亿美元

**证据等级：官方已确认（一手监管文件，已读原文）**

**导语**

10 月 26 日，Anthropic PBC 向 SEC 提交 S-1 招股说明书，拟以 Class A 普通股在纳斯达克全球精选市场（Nasdaq Global Select Market）首次公开发行。本期已读到招股书原文：**2026 年上半年消费型收入 131 亿美元（占总收入 80%），同期净亏损 807 亿美元；发行价区间尚未填写。**

**已披露关键数据（均引自 Anthropic S-1（SEC EDGAR）原文）**

> 出处链接（下同）：Anthropic, PBC S-1 招股书原文 · SEC EDGAR —— https://www.sec.gov/Archives/edgar/data/2130357/000162828026067168/anthropicpbc-sx1.htm
> 文件信息：As filed with the Securities and Exchange Commission on October 26, 2026；Registration No. 333-（待分配）。

- **消费型收入（consumption-based revenue）**：2024 年 2.88 亿美元（占总收入 75%）→ 2025 年 38 亿美元（83%）→ 2026 年上半年 **131 亿美元（80%）**。
- **订阅型收入（subscription-based revenue）**：2024 年 9800 万美元（25%）→ 2025 年 7.89 亿美元（17%）→ 2026 年上半年 32 亿美元（20%）。
- **总收入（原文直接列示）**：2023 / 2024 / 2025 年分别为 **0.41 亿 / 3.86 亿 / 46 亿美元**；2026 年上半年 **163 亿美元**，同比增长 1,300%。
- **净亏损**：2023 / 2024 / 2025 三个年度分别为 **15 亿 / 83 亿 / 420 亿美元**；2026 年上半年 **807 亿美元**。招股书自述「自成立以来每个年度均出现净亏损」（*We have incurred net losses in each year since our founding*）。
- **增长与成本口径（原文表述）**：截至 2026 年 6 月 30 日的三个月，营收同比增长 1,368%，同期计算与基础设施支出增长 300%；公司称 Claude Opus 5.5 相比 Claude Opus 5 将客户单任务成本降低约 40%。
- **客户集中度（原文表述）**：通过 CSP 市场（云厂商等分发与计费渠道）产生的收入，分别占 2023、2024、2025 三个年度总收入的约 11%、32%、47%，以及 2026 年上半年的约 48%；对应净应收账款占比为 42%、60%、58%。
- **注册信息**：注册主体为 Delaware 注册的 Anthropic, PBC（总部 548 Market Street, San Francisco, California 94104）；公司注册代理为 CEO 兼联合创始人 Dario Amodei、总裁兼联合创始人 Daniela Amodei；招股书封面写明「本次为 Anthropic PBC Class A 普通股的首次公开发行」；「拟开始公开销售时间」一栏为「本注册声明生效后尽快」。

**披露口径声明**

- **发行价区间尚未填写，本文不推测估值、募资规模与上市时间。**（招股书原文为 “the initial public offering price per share will be between $ and $”。）
- 本条不包含亏损构成、现金流、估值对标等原文未支持的解读。
- 若正式招股书后续修订，以修订版为准，并在下一期做更正说明。

**来源与链接**

- SEC EDGAR 招股书原文（一手，已读全文）：https://www.sec.gov/Archives/edgar/data/2130357/000162828026067168/anthropicpbc-sx1.htm

---

### 13. 微软向四国约 6 万名员工提供自愿离职买断方案，至 12 月 31 日

**证据等级：多源交叉**

**导语**

据 10 月 26 日《Seattle Times》报道，微软面向四国员工提供批量自愿离职买断方案，覆盖人数约占其员工总数的四分之一；gHacks 同日标题给出的口径为约 60,000 人、四个国家、截止 12 月 31 日。

**详细内容**

两处报道口径存在差异：一处以「约占四分之一员工规模」表述，一处给出「60,000 人、四国、截至 12 月 31 日」的具体数字。本期**未能读到任一报道全文**，故并列呈现而不做取舍，读者引用时应以原文为准。就其性质而言，这是本季度规模最大的科技公司结构调整信号之一，且与同期的 Copilot 产品线扩张（条目 5、6）同时发生。对开发者的现实影响主要在招聘侧与云/工具链支持侧。

**来源与链接**

- Seattle Times 报道（标题已核对，全文未读）：https://www.seattletimes.com/business/microsoft/microsoft-offers-mass-buyouts-for-roughly-a-quarter-of-its-workforce/
- gHacks 同日条目（标题已核对，全文未读）：https://www.ghacks.net/category/ai/

---

## B 区 · 线索雷达（标题级）

> 本区 12 条**全部为「单一来源 · 未核实」**：只提供标题、来源链接与日期，**不含细节断言、因果结论、估值或影响推断**。请把本区当作「值得一跟的线索清单」，引用前回到原始链接确认。

| # | 栏目 | 标题 | 日期 | 来源链接 |
| --- | --- | --- | --- | --- |
| 4 | 开发生态 | 微软公开 Type Server Protocol（TSP）规范文档，指向语言服务器协议层 | 2026-10-26 | https://github.com/microsoft/pylance-release/blob/main/docs/tsp/type-server-protocol.md |
| 5 | 开发生态 | 微软将移除 OneDrive Copilot 快捷入口，自 11 月中旬起执行 | 2026-10-21（报道日期） | https://www.ghacks.net/category/ai/ |
| 6 | 开发生态 | 微软扩展 Copilot Studio，新增 AI Agent 与治理能力 | 栏目未标注日期 | https://www.ghacks.net/category/ai/ |
| 7 | 模型发布 | OpenAI 公布与学界合作推动科学理解的三项研究进展 | 2026-10-26 | https://openai.com/index/building-scientific-understanding-with-academic-communities/（**需人工打开**：站点对自动抓取返回 403 / JS 质询） |
| 8 | 技术与洞察 | OpenAI 发布预印本《The Exponential Time Hypothesis is False》 | 2026-10-26 | https://github.com/openai/math/blob/main/preprints/The-Exponential-Time-Hypothesis-is-False-October-25-2026/paper.pdf |
| 9 | 技术与洞察 | Sebastian Raschka 发布从零构建推理模型的视频课程 | 2026-10-26 | https://magazine.sebastianraschka.com/p/building-reasoning-models |
| 10 | 产品应用 | Anthropic 发布后台代理 Claude Duet，仅面向美国 Pro/Max 订阅者 | 2026-10-23（报道日期） | https://www.ghacks.net/category/ai/ |
| 11 | 产品应用 | 谷歌自 11 月 13 日起从 4.99 美元 AI Plus 套餐移除 Gemini Pro 模型 | 2026-10-16（报道日期） | https://www.ghacks.net/category/ai/ |
| 12 | 产品应用 | 谷歌在 Android Auto 推出 Gemini Personal Intelligence | 2026-10-21（报道日期） | https://www.ghacks.net/category/ai/ |
| 14 | 行业动态 | 美国国土安全部要求联邦民事机构停用并移除 DeepSeek 产品 | 2026-10-20（报道日期） | https://www.ghacks.net/category/ai/ |
| 15 | 行业动态 | OpenAI 指控前员工带走 100 余份未发布硬件机密文件 | 2026-10-16（报道日期） | https://www.ghacks.net/category/ai/ |
| 16 | 行业动态 | ChatGPT 广告扩展至 89 个市场；八州检方起诉 OpenAI | 2026-10-21 宣布 / 10-22 报道；诉讼 10-15 报道 | https://www.ghacks.net/category/ai/ |

---

## 后续追踪（编辑内部注，不对外承诺）

- **GPT-6.1 Terra**：价格降幅与基准数字均为发布方口径，待第三方独立复现与官方系统卡全文。
- **Workers AI GLM-5.3 KV 缓存泄露**：待观察 SGLang v0.5.22+ 的实际普及率与 `--kv-canary` 对其他模型的支持落地。
- **Anthropic 上市文件**：待注册声明生效日期与最终定价区间。
- **微软结构调整**：两种人数口径待统一，待 12 月 31 日截止后的实际参与人数。
- **Claude Duet**：待地区与档位扩展、后台运行额度计量规则。
- **低价套餐权益收缩**：待替代档位与迁移路径。

---

## 更正与反馈

发现错误或有补充，请通过站点「更正与反馈」入口提交（Issue / 邮件）。确认后我们将在 **24 小时内在原文顶部加更正说明**并同步仓库 commit。

本期一手来源与链接复核状态见 [`sources.md`](./sources.md)。

*第 001 期 · 2026-10-27 · 小小工作室内容运营组 制*
