# 第 001 期（2026-10-27）来源清单与链接复核记录

- 复核时间：2026-10-27 12:50–12:56（Asia/Shanghai）
- 复核方式：对每个 URL 发起实际 GET 请求（跟随重定向、浏览器 User-Agent、25 秒超时），记录 HTTP 状态码与是否命中反爬/JS 质询。
- 判定规则：HTTP 200 = 可访问；HTTP 403 或质询页 = 标注「需人工打开」（链接保留，供人工在浏览器中打开）；404/410 等失效 = 移除（本期无失效链接被移除）。

| # | 条目 | 来源 | 链接 | 状态 | 备注 |
| --- | --- | --- | --- | --- | --- |
| 1 | A 区 · 第 1 条 | OpenAI 官方发布页 | https://openai.com/index/introducing-gpt-6-1-terra/ | 403 | 需人工打开（站点 JS 质询；本期未读到正文，价格与基准数据来自下方二手报道） |
| 1 | A 区 · 第 1 条 | gHacks 报道（已读全文） | https://www.ghacks.net/2026/10/27/openai-launches-gpt-6-1-terra-with-api-pricing-50-lower-than-gpt-5-6-terra/ | 200 | 标题级与全文已读 |
| 2 | A 区 · 第 2 条 | Cloudflare 官方披露 | https://blog.cloudflare.com/kv-cache-exposure-remediation/ | 200 | 一手原文，已读全文 |
| 2 | A 区 · 第 2 条 | SGLang 联合声明 | https://www.lmsys.org/blog/2026-10-26-cf-security | 200 | 由 Cloudflare 文中链接，未单独打开正文 |
| 2 | A 区 · 第 2 条 | Cloudflare 状态页事件记录 | https://www.cloudflarestatus.com/incidents/jsvvrtk5hvym | 200 | 文中引用 |
| 3 | A 区 · 第 3 条 | SEC EDGAR · Anthropic, PBC S-1 | https://www.sec.gov/Archives/edgar/data/2130357/000162828026067168/anthropicpbc-sx1.htm | 200 | 一手监管文件，已读全文（14.2 MB HTML）；SEC 对非合规 User-Agent 返回 403，普通浏览器可正常打开 |
| 13 | A 区 · 第 13 条 | Seattle Times | https://www.seattletimes.com/business/microsoft/microsoft-offers-mass-buyouts-for-roughly-a-quarter-of-its-workforce/ | 200 | 标题已核对，全文未读 |
| 13 | A 区 · 第 13 条 | gHacks 同日条目 | https://www.ghacks.net/category/ai/ | 200 | 标题已核对，全文未读 |
| 4 | B 区 | microsoft/pylance-release · TSP 规范 | https://github.com/microsoft/pylance-release/blob/main/docs/tsp/type-server-protocol.md | 200 | 单一来源 · 未核实 |
| 5 | B 区 | gHacks AI 栏目 | https://www.ghacks.net/category/ai/ | 200 | 单一来源 · 未核实（仅标题与日期） |
| 6 | B 区 | gHacks AI 栏目 | https://www.ghacks.net/category/ai/ | 200 | 单一来源 · 未核实（栏目未标注日期） |
| 7 | B 区 | OpenAI 官方文章 | https://openai.com/index/building-scientific-understanding-with-academic-communities/ | 403 | 需人工打开（站点 JS 质询） |
| 8 | B 区 | openai/math 预印本 PDF | https://github.com/openai/math/blob/main/preprints/The-Exponential-Time-Hypothesis-is-False-October-25-2026/paper.pdf | 200 | 单一来源 · 未核实 |
| 9 | B 区 | Sebastian Raschka 课程页 | https://magazine.sebastianraschka.com/p/building-reasoning-models | 200 | 单一来源 · 未核实 |
| 10 | B 区 | gHacks AI 栏目 | https://www.ghacks.net/category/ai/ | 200 | 单一来源 · 未核实 |
| 11 | B 区 | gHacks AI 栏目 | https://www.ghacks.net/category/ai/ | 200 | 单一来源 · 未核实 |
| 12 | B 区 | gHacks AI 栏目 | https://www.ghacks.net/category/ai/ | 200 | 单一来源 · 未核实 |
| 14 | B 区 | gHacks AI 栏目 | https://www.ghacks.net/category/ai/ | 200 | 单一来源 · 未核实 |
| 15 | B 区 | gHacks AI 栏目 | https://www.ghacks.net/category/ai/ | 200 | 单一来源 · 未核实 |
| 16 | B 区 | gHacks AI 栏目（广告扩围 / 八州起诉两条） | https://www.ghacks.net/category/ai/ | 200 | 单一来源 · 未核实 |

**统计**：去重后共 12 个唯一 URL —— 9 个返回 200，3 个返回 403（均已标注「需人工打开」，链接保留）；本期无 404/410 失效链接，故未移除任何链接。

---

## 第 3 条数字与 S-1 原文逐项核对记录

核对对象：Anthropic, PBC S-1 招股书原文（SEC EDGAR，As filed October 26, 2026）。核对方式：下载原始 HTML 后抽取全文，逐项比对下列表述。

| 发布版表述 | S-1 原文 | 结论 |
| --- | --- | --- |
| 2026 年上半年消费型收入 131 亿美元 | “Consumption-based revenue increased from $288 million, or 75% of total revenue, for the year ended December 31, 2024, to $3.8 billion, or 83% of total revenue, for the year ended December 31, 2025, to $13.1 billion, or 80% of total revenue, for the six months ended June 30, 2026.” | ✅ 一致 |
| 订阅型收入：9800 万 / 7.89 亿 / 32 亿美元 | “Subscription-based revenue increased from $98 million, or 25% of total revenue, to $789 million, or 17% of total revenue, to $3.2 billion, or 20% of total revenue, over the same periods.” | ✅ 一致（母版未写 20%，发布版按原文补全） |
| 总收入 2023/2024/2025 = 0.41 亿 / 3.86 亿 / 46 亿美元 | “In 2023, 2024, and 2025, our revenue was $41 million, $386 million, and $4.6 billion, respectively” | ✅ 一致（**母版将这两项标注为「按占比推算」，实际为招股书直接列示的数字，发布版改按原文引用**） |
| 2026 年上半年总收入 163 亿美元，同比 +1,300% | “In the six months ended June 30, 2026, our revenue was $16.3 billion, representing a year-over-year growth rate of 1,300%.” | ✅ 一致（**同上，母版标注为推算值，实为原文列示**） |
| 净亏损 2023/2024/2025 = 15 亿 / 83 亿 / 420 亿美元 | “we have incurred net losses in each year since our founding, including a net loss of $1.5 billion, $8.3 billion, and $42.0 billion for the years ended December 31, 2023, 2024, and 2025, respectively” | ✅ 一致 |
| 2026 年上半年净亏损 807 亿美元 | “…and $80.7 billion for the six months ended June 30, 2026” | ✅ 一致 |
| 自成立以来每个年度均出现净亏损 | “We have incurred net losses in each year since our founding” | ✅ 一致 |
| 三个月营收同比 +1,368%，计算与基础设施支出 +300% | “our revenue grew 1,368% year over year for the three months ended June 30, 2026, compared to our compute and infrastructure expenses that grew 300% during the same period” | ✅ 一致 |
| Claude Opus 5.5 客户单任务成本较 Claude Opus 5 降低约 40% | “Claude Opus 5.5 reduced customer costs per task by approximately 40% compared to Claude Opus 5” | ✅ 一致 |
| CSP 市场收入占比 11% / 32% / 47% / 48%；净应收占比 42% / 60% / 58% | “revenue generated from sales to customers through CSP marketplaces represented approximately 11%, 32%, 47%, and 48%, respectively, of total revenue. As of December 31, 2024 and 2025 and June 30, 2026, net accounts receivable from sales through CSP marketplaces to customers represented 42%, 60%, and 58%, respectively” | ✅ 一致 |
| 发行价区间尚未填写 | “It is currently estimated that the initial public offering price per share will be between $ and $.” | ✅ 一致（原文区间为空白） |
| 拟开始公开销售时间 | “Approximate date of commencement of proposed sale to the public: As soon as practicable after this registration statement becomes effective.” | ✅ 一致 |
| 注册地 / 总部 / 注册代理 | “Delaware … 548 Market Street PMB 90375 San Francisco, California 94104 … Dario Amodei, Chief Executive Officer and Co-Founder / Daniela Amodei, President and Co-Founder” | ✅ 一致 |
| 拟在纳斯达克全球精选市场挂牌 | “We have applied to list our Class A common stock on the Nasdaq Global Select Market under the symbol “ANT.”” | ✅ 一致（发布版未列代码，避免超出母版范围） |

**口径核对结论**：发布版第 3 条的全部数字均可在 S-1 原文中逐字定位；发布版未保留母版中「亏损规模与营收增速量级差提示推理成本结构」等解读性表述，也未加入亏损构成、现金流、估值对标内容；「发行价区间尚未填写，不推测估值、募资规模与上市时间」的声明已按 CMP-204 决定书写入。
