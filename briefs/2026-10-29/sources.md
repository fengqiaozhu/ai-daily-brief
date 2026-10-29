# AI 早报 2026-10-29 · 来源清单

- 期号：EP003（工单 CMP-254）｜完整条目 11 条 + 线索雷达 5 条
- 检索窗口：2026-10-28 07:00 – 2026-10-29 07:00（Asia/Shanghai）＝ 2026-10-27 23:00Z – 2026-10-28 23:00Z；补收至 72 小时（仅第 9 条）
- 采集方式：**直连抓取 + 人工逐条核验**（本期 NotebookLM 超级 MCP 与 Firecrawl 通道在 07:12 后不可用，按 13.5 降级，见编辑备注）
- 抓取时间：2026-10-29 07:02–07:20（Asia/Shanghai）

| 编号 | 条目 | 来源 | URL | 分级 | 核查标记 | 访问结果 |
|---|---|---|---|---|---|---|
| 1 | 微软 FY27 Q1 业绩 | Microsoft 投资者关系官方财报页（2026-10-28） | https://www.microsoft.com/en-us/Investor/earnings/FY-2027-Q1/press-release-webcast | 一级 | 官方已确认 | 浏览器 UA 200；脚本默认 UA 403。逐项读取：营收 923 亿美元、营业利润 459 亿、净利 366 亿、EPS 4.92、Agents and Infra 768 亿（+25%）、commercial RPO 6770 亿（+73%）、Microsoft Cloud 639 亿（+30%）、Azure +48% |
| 1 | 同上（二级交叉） | Reuters：Microsoft beats quarterly cloud revenue estimates | https://www.reuters.com/business/retail-consumer/microsoft-beats-quarterly-cloud-revenue-estimates-2026-10-28/ | 二级 | 多源交叉 | 401（需人工打开）；经 Techmeme 摘要核对资本开支 452 亿美元、自由现金流 186 亿美元 |
| 2 | Alphabet Q3 业绩 | SEC EDGAR 8-K 附件 99.1（2026-10-28） | https://www.sec.gov/Archives/edgar/data/1652044/000165204426000080/googexhibit991q32026.htm | 一级 | 官方已确认 | 浏览器 UA 200（SEC 对脚本默认 UA 返回 403）。读取：总营收 127,577 百万、Google Services 96,302、Search & other 63,350、YouTube ads 11,207、Google 广告 82,012、Google Cloud 30,709（营业利润 11,121）、Other Bets 372（亏损 2,047）、总营业利润 40,576、净利 26,468、归属普通股东 26,170、摊薄 EPS 12,169、资本开支 51,355、FCF -9,065、TTM FCF 10,116、员工 204,757 |
| 2 | 同上（一级 PDF） | Alphabet 官方业绩发布 PDF | https://s206.q4cdn.com/479360582/files/doc_financials/2026/q3/2026q3-alphabet-earnings-release.pdf | 一级 | 官方已确认 | 200，139,470 字节；文字层为自定义子集字体编码（解码后仅可确认标题行），**数字一律以 SEC HTML 为准** |
| 2 | 同上（二级交叉） | CNBC：Alphabet Q3 2026 | https://www.cnbc.com/2026/10/28/alphabet-googl-earnings-q3-2026.html | 二级 | 多源交叉 | 经 Techmeme RSS 摘要核对：负自由现金流 90.7 亿、资本开支 513.6 亿（预期 550.9 亿）、全年资本开支指引维持 1950–2050 亿 |
| 3 | DOJ 问询 Nvidia 收购 Hugging Face | Reuters 原文（2026-10-28） | https://www.reuters.com/world/us-doj-is-inquiring-about-nvidias-purchase-hugging-face-sources-say-2026-10-28/ | 二级 | 多源交叉 | 401（需人工打开）；经 Techmeme 事件页核对金额 129.3 亿美元 |
| 3 | 同上（二级汇总页） | Techmeme 事件页 261028/p57 | https://www.techmeme.com/261028/p57 | 二级 | 多源交叉 | 200，483,596 字节；含 Reuters 摘要全文与 The Next Web、Bloomberg Law、CNBC、WSJ 跟进列表 |
| 4 | Anthropic 扩大 AI for Science | Anthropic 官方新闻（2026-10-28） | https://www.anthropic.com/news/ai-for-science-expands-foundations-research-institutions | 一级 | 官方已确认 | 200，182,893 字节；读取到发布日期 Oct 28, 2026、20 家机构、免费 Claude 额度、MHS 与 HHMI Janelia 合作 |
| 5 | MCP 参考服务器 v2.2.0 | GitHub Release（2026-10-28T20:57:13Z） | https://github.com/modelcontextprotocol/servers/releases/tag/v2.2.0 | 一级 | 官方已确认 | 200（API 抓取）；读取 eMudhra 中间 CA 私钥事件、Node.js 24.22.1 / 26.12.1 要求、certifi 2026.10.23、各包版本号 |
| 6 | 微软来自 OpenAI 的 100 亿美元收入 | TechCrunch（2026-10-28T14:34 PDT，记者 Rebecca Bellan） | https://techcrunch.com/2026/10/28/microsoft-recorded-10-billion-in-revenue-from-openai/ | 二级（引监管文件） | 多源交叉 | 200，235,614 字节；原文读取：100 亿美元、约占 923 亿美元营收 11%、FY2026 全年 241 亿、应收款 72 亿（6 月末 60 亿）、分成 20%（双方未确认）、2030 年分成上限、持股由约 25% 降至 24% |
| 7 | openai-python v3.41.0 | GitHub Release（2026-10-28T22:26:54Z） | https://github.com/openai/openai-python/releases/tag/v3.41.0 | 一级 | 官方已确认 | 200（API 抓取）；读取 #4189 / #4201 / #4200 / #4191 功能项与 #4187 / #4192 修复项 |
| 7 | 模型下线公告改动 | GitHub PR #4199 | https://github.com/openai/openai-python/pull/4199 | 一级 | 官方已确认 | 200；正文读取：2027-01-06 下线批次（含 2025-03 快照）、audio translations 需在 2027-02-26 前迁移 Realtime translations |
| 7 | 下线时间表 | OpenAI 官方弃用页 | https://platform.openai.com/docs/deprecations | 一级 | 官方已确认 | 301 重定向，抓取到 509,607 字节正文；读取 2026-10-14 GPT-4 系列 2027-01-14 下线（替代 gpt-6-luna）、2026-10-01 TTS 系列 2027-01-06 下线、2026-08-26 转写系列 2027-02-26 下线 |
| 8 | NVIDIA Nemotron 3.5 Transcribe / Granary v2 | Hugging Face 官方博客（2026-10-28T14:58Z） | https://huggingface.co/blog/nvidia/nemotron-transcribe-granary | 一级 | 官方已确认 | 200；读取：40 种语言转写、31 种语言互译、13 种语言说话人标注、≤1 小时音频、≤8 说话人、Open ASR Leaderboard 表述为官方称 |
| 8 | 同上（站内索引核对） | Hugging Face Blog API | https://huggingface.co/api/blog?limit=30 | 一级 | 官方已确认 | 200；确认窗口内仅此 1 篇（LFM3 篇文章发布于 2026-10-27T17:16Z，落在窗口外） |
| 9 | Artificial Analysis Intelligence Index v5 | Artificial Analysis 官方文章（2026-10-27） | https://artificialanalysis.ai/articles/artificial-analysis-intelligence-index-v5 | 一级 | 官方已确认 | 200，401,319 字节；读取 60% 私有测试集、FrontierCode 2.0、Terminal-Bench-Science、HLE-Diamond、AA-Omniscience v1.1、CritPt v2 困难子集、移除项、25/25/25 权重 |
| 10 | Oracle 投资者日 FY2030 长期目标 | SEC EDGAR 8-K 附件 99.1（2026-10-28） | https://www.sec.gov/Archives/edgar/data/1341439/000119312526435853/d75538dex991.htm | 一级 | 官方已确认 | 浏览器 UA 200（SEC 对脚本默认 UA 返回 403）；读取 FY30 营收 2250 亿美元+、非 GAAP 营业利润率 40%+、非 GAAP EPS 21 美元+、FCF FY28 下半年转正 / FY29 ≥300 亿美元、新增融资上限 200 亿美元（100 亿股权 + 100 亿总债务）、FY27 营收 ≥900 亿美元 |
| 11 | ServiceNow 第三季 2026 业绩 | SEC EDGAR 8-K 附件 99.1（2026-10-28） | https://www.sec.gov/Archives/edgar/data/1373715/000137371526000092/erq3fy26.htm | 一级 | 官方已确认 | 浏览器 UA 200；读取订阅收入 39.88 亿（+21%）、总营收 41.06 亿、cRPO 136.5 亿（+20.5%）、RPO 297 亿（+22%）、AI ACV 目标上调 70% 至 17 亿、FCF 率目标上调 100bp 至 36%、Q4 指引订阅收入 42.45–42.55 亿、cRPO +18.5%、与 OpenAI 扩大合作（ChatGPT 插件 / Action Fabric） |
| L1 | Marvell 接近收购 Lumentum | Bloomberg（2026-10-28） | https://www.bloomberg.com/news/articles/2026-10-28/marvell-is-said-to-near-deal-for-lumentum-in-ai-related-megadeal | 三级（单一来源 · 未核实） | 传闻或推测 | 需人工打开；经 Techmeme 摘要核对市值约 830 亿美元 |
| L2 | Upwind Security 融资 4 亿美元 | Bloomberg（2026-10-28） | https://www.bloomberg.com/news/articles/2026-10-28/ai-cybersecurity-startup-upwind-raises-at-3-8-billion-value | 三级（单一来源 · 未核实） | 传闻或推测 | 需人工打开；经 Techmeme 摘要核对 4 亿美元、估值 38 亿美元、累计 8.3 亿美元 |
| L5 | 纽约州 AI 未成年人法案 | Bloomberg Government（2026-10-28） | https://news.bgov.com/bloomberg-government-news/hochul-signs-bills-on-ai-risks-to-children-in-pre-election-push | 三级（单一来源 · 未核实） | 传闻或推测 | 200，130,357 字节；未取到州议会法案号，待补官方链接后升级 |
| L6 | Xreal Aura 有线 XR 眼镜 | TechCrunch（2026-10-28） | https://techcrunch.com/2026/10/28/xreal-aura-is-a-new-wired-headset-powered-by-android-xr/ | 三级（单一来源 · 未核实） | 传闻或推测 | 200，233,635 字节；读取 Android XR、Snapdragon Reality Elite、1,099 / 1,279 美元两档 |
| L7 | Mac Studio M5 Ultra 512GB | MacRumors（2026-10-28） | https://www.macrumors.com/2026/10/28/mac-studio-m5-ultra-512gb-ram/ | 三级（单一来源 · 未核实） | 传闻或推测 | 200 |
| 线索池 | 当日线索发现源 | Techmeme 官方 RSS | https://www.techmeme.com/feed.xml | 二级 | 官方已确认 | 200，21,093 字节（直连）+ 77,135 字节（Firecrawl 抓取，07:02）；feed 时间戳 Wed, 28 Oct 2026 19:01:41 -0400，含 15 条当日条目 |

## 采集过程说明

- **线索发现**：Techmeme 官方 RSS `feed.xml`（07:02 经 Firecrawl 抓取、07:2x 直连复核），逐条按 AI 相关度筛选后回溯原始来源；另抓取 Anthropic 官方新闻列表、Hugging Face Blog API、GitHub Releases API 作为补充发现源。
- **一级来源核验**：Microsoft 投资者关系页（浏览器 UA）、SEC EDGAR 8-K 附件 99.1（浏览器 UA，Alphabet / Oracle / ServiceNow 三份）、Anthropic 官方文章、GitHub Releases/PR API、OpenAI 官方弃用页、Hugging Face 官方博客、Artificial Analysis 官方文章。
- **窗口外补收**：Artificial Analysis Intelligence Index v5 发布于 2026-10-27（美东），落在 24 小时窗口外，按 13.1 补至 72 小时并在正文标注。
- **未收录说明**：Anthropic 于 2026-10-26 提交 S-1 的消息在检索窗口外，且本次未取得可直接指向原文的稳定链接，按 13.4 不进完整条目，仅在「后续追踪」记录待办。
- **链接状态**：本表所有链接均在本次运行中实际访问。除注明「需人工打开」（401/403）者外均返回 200；公开版发布前需再次逐条访问，失效链接不得发布。
- **未使用的能力**：本期 NotebookLM 超级 MCP（网关目录不含 notebooklm 连接）与 Firecrawl 检索（504/502）在抓取中途失效，已按 13.5 降级；`chat_ask` 研判与母版单一 source 锚定的视频生成待通道恢复后补做。
