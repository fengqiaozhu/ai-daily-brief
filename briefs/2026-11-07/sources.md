# EP012 来源清单 · AI 早报 2026-11-07（第 012 期）

- 检索执行窗口：2026-11-05 20:00 – 2026-11-07 10:30 CST（24 小时主窗口 + 72 小时补充窗口，重要遗漏自 2026-11-04 10:30 起）
- 起稿时间：2026-11-07 10:22 CST（例程 07:00 触发延迟至本次唤醒）
- 证据分级：官方已确认 / 多源交叉 / 单一来源 · 未核实（线索雷达）
- 说明：每条来源均为本次实际访问或经官方 API 取得的链接；未实际取到的原文不列为「官方已确认」。

## 1. Anthropic Cyber Mission（官方已确认 · 官方原文已取）

- https://www.anthropic.com/news/anthropic-cyber-mission — Anthropic 官方公告：Cyber Mission、关键基础设施防御计划 CIDP、OSS Scanner、CVP 三档与所用模型清单、Project Glasswing 并入 CVP。
- https://www.anthropic.com/news/cyber-verification-program — Anthropic 官方公告：Cyber Verification Program 扩容版，Defense Access / Red Team Access 等访问档位、Claude Opus 5.5、Sonnet 5.5、Mythos 5.1、Fable 5.1、面向普通用户的保守网络安全防护说明。

## 2. OpenAI 新一轮融资（多源交叉 · 媒体转述，未取得公司确认）

- https://techcrunch.com/2026/11/06/openai-reportedly-raises-an-additional-11-billion-at-a-1-25-trillion-valuation/ — TechCrunch 原文已读：约 110 亿美元、估值 1.25 万亿美元、该轮未交割、总额或达约 200 亿美元、9 月底 300 亿美元目标、已向 OpenAI 求证未获置评。
- https://www.techmeme.com/261106/p22 — Techmeme 汇编条目：彭博报道口径复核（已募约 110 亿美元 @ 1.25 万亿美元）。
- 事实来源标注：彭博（Bloomberg）原始报道，经上述两个二级源转述；OpenAI 官方未确认。

## 3. Anthropic 上市估值分歧（多源交叉 · 来源冲突，按原文分列）

- https://www.techmeme.com/261106/p21 — 金融时报（FT）口径：感恩节前上市，拟募 800 亿–1000 亿美元，估值 1.25 万亿–1.75 万亿美元。
- https://techcrunch.com/2026/11/06/openai-reportedly-raises-an-additional-11-billion-at-a-1-25-trillion-valuation/ — 彭博口径：潜在买方估值预期低至 1.1 万亿美元，低于约一个月前的 2 万亿美元预期。
- 未解决：两组数字的差异原因，双方均未说明。

## 4. Claude Dispatch 浏览器扩展劫持（多源交叉 · 二级源原文已读）

- https://thehackernews.com/2026/11/malicious-browser-extensions-could-use.html — The Hacker News 原文已读：Forever Security 研究员 Gal Weizman 演示全过程、claude.ai 普通登录会话被 Dispatch 接受、每秒自动点击「Allow」、全局 npm 安装与安装脚本拉起计算器、Anthropic 10 月 13 日告知下线目标 10 月底、帮助页未提下线。
- 原文引用的研究方技术写作：Forever Security（本次采集中未取得直链，标注为需人工打开）。

## 5. llama.cpp b12180 / Kimi-K3.1-Pro（官方已确认 · GitHub Release API 与 release 正文已取）

- https://github.com/ggml-org/llama.cpp/releases/tag/b12180 — 官方 release 正文已取：PR #31779、93 层中 24 层 lightning indexer、32 heads × 128、top_k 2048、无 rope、indexer 掩码为加性、indexer LayerNorm eps 取自 rms_norm_eps、混合内存、KimiK31Model / KimiK31ForConditionalGeneration、dsa_config 展开字段、MXFP4 路由专家。
- 发布时间：2026-11-06T23:18:52Z（GitHub Releases API 已取）。
- 同日另发 b12179、b12177、b12176、b12175（GitHub Releases API 已取）。

## 6. transformers v5.22.2（官方已确认 · GitHub Release API 与 release 正文已取）

- https://github.com/huggingface/transformers/releases/tag/v5.22.2 — 官方 release 正文已取：Jinja sandbox 加固（#50431）、NCCL device_id（#50281）、compare 链接。
- 发布时间：2026-11-06T15:43:27Z（GitHub Releases API 已取）。

## 7. claude-code v2.1.319（官方已确认 · GitHub Release API 与 release 正文已取）

- https://github.com/anthropics/claude-code/releases/tag/v2.1.319 — 官方 release 正文已取：auto mode 服务端检查与 `CLAUDE_CODE_AUTO_MODE_SERVER=0/1`、终端内 MCP 任务后台化与 `CLAUDE_CODE_DISABLE_MCP_TASK_BACKGROUND`、`permissions.denyInsteadOfPrompting`、`/claude-api latency-optimize`、`CLAUDE_CODE_DISABLE_FEATURE_FLAGS`、`/usage` 今日/本周/本月消费。
- 发布时间：2026-11-06T17:04:01Z（GitHub Releases API 已取）。

## 8. LiteLLM v1.108.2 LTS 与 crewAI 1.15.37（官方已确认 · GitHub Release API 与 release 正文已取）

- https://github.com/BerriAI/litellm/releases/tag/v1.108.2 — 官方 release 正文已取：12 个 PR / 11 修复 1 变更、#50218、#50360、#50362、#50392、#50267、#50280、#50274、cosign 校验命令与公钥地址。
- https://github.com/crewAIInc/crewAI/releases/tag/1.15.37 — 官方 release 正文已取：crewai-files 读取表格、独立 agent 项目脚手架与加载、RagTool 文档更新。
- 发布时间：LiteLLM 2026-11-06T22:07:43Z；crewAI 2026-11-07T02:18:06Z（GitHub Releases API 已取）。

## 9. Underdog Woof（官方已确认 · 模型卡原文已取）

- https://huggingface.co/ConwayResearch/Underdog-Woof — 模型卡原文已取：单音色 31.7 MB / WER 2.06% / 18 倍实时 / 峰值 852 MB，双音色 40.6 MB / WER 1.42%（Mira）/ 13.8 倍实时（Juno）/ 峰值 402 MB，numpy 运行时、无需 GPU 或 API key、英文、Gradium TTS Hard Cases 500 句、与 Fish Audio Drama 3 的 1,022 倍体积差与 25% 更低词错率、许可 underdog-non-commercial-1.0。
- https://techcrunch.com/2026/11/06/underdog-shows-off-a-32mb-speech-model-in-new-demo/ — TechCrunch 原文已读：官方推文口径 31.7 MB、浏览器内可玩、创始人 Sigil Wen 表述、此前的 167 MB Bark。
- Hugging Face 模型页元数据（API 已取）：createdAt 2026-11-05T19:07:08Z、tags 含 on-device / cpu / text-to-speech。

## 10. Meta Spaces（官方已确认 · 官方 Newsroom 原文已取）

- https://about.fb.com/news/2026/11/introducing-spaces-customize-muse-app/ — Meta 官方 Newsroom 原文已取（发布日期 November 6, 2026）：space 定义、由描述生成、侧边栏与主标签页放置与定时出现、九类官方示例、连接应用后后台自动更新。
- https://techcrunch.com/2026/11/06/meta-introduces-spaces-a-new-way-to-collaborate-with-your-muse-agent/ — TechCrunch 原文已读（2026-11-06 10:44 PT）：Spaces 定位说明、扎克伯格 X 帖文引述、Meta 10 月财报电话会称 Muse agent 在美加有 1000 万用户。
- 关联但未采信为完整条目：https://thenewstack.io/meta-muse-specialized-models/ （The New Stack 关于 Muse Wonder 专门模型的报道；页面触发 JavaScript 质询，需人工打开；已列入线索雷达）。

## 11. Ai2 FoundationWorlds / ToyBlocks（官方已确认 · 官方博客原文已取）

- https://huggingface.co/blog/allenai/toyblocks — Ai2 官方博客原文已取（Published November 6, 2026）：FoundationWorlds 框架三要素、ToyBlocks 为首个基础世界、机械臂与积木设定、自动生成示范、无需遥操作、code/data/models/documentation。

## 12. Google 收购 Crusoe 怀俄明数据中心项目（多源交叉）

- https://techcrunch.com/2026/11/06/crusoe-sells-troubled-wyoming-data-center-project-to-google/ — TechCrunch 原文已读（2026-11-07 01:40 PT）。
- https://www.techmeme.com/261106/p25 — Techmeme 汇编：彭博口径复核（Google 买下站点，Crusoe 未锁定包括 Google 在内的客户）。

## 13. ARTEX 自主渗透测试框架公网暴露（多源交叉 · 一手报告原文已取）

- https://censys.com/blog/artex-agentic-asbestos/ — Censys 官方博客原文已取（Published Nov 5, 2026，By Silas Cutler）：1,465 台暴露 ARTEX 控制台的主机、约 650 台位于两段相同配置托管区块、约 815 个形态各异的部署、155 台（10.6%）同时运行其他威胁、32 处开放目录外泄后渗透工具包与 implant、ARTEX 2026-07-26 以 Autumn-27/ARTEX 发布于 GitHub、AGPL-3.0、ScopeSentry 作者关系、十周内 1,500–2,000 星标、Go + Next.js + PostgreSQL、Planner/Worker 子智能体、mitmproxy、nmap、CrowdStrike 2026-10-07 韩国金融事件与 DeepSeek v4.1-flash、微软与 Storm-0940/ConnectWise 的关联、2026-10-08 作者声明闭源与仓库下架。
- https://techcrunch.com/2026/11/06/hundreds-of-artex-ai-hacking-tools-found-publicly-exposed-to-the-web/ — TechCrunch 原文已读（2026-11-06）：800+ 免密可达部署的独立复核口径、Artex 自 7 月公开以来被关联多起攻击、微软对其能力的描述。
- 说明：TechCrunch 的「800+ 部署」与 Censys 的「约 815 个形态各异的部署」为同一测算的两种表述；Censys 的 1,465 台为主机口径，不等于部署数，正文按原文保留两组数字并说明差异。

## 14. GitHub Copilot 三项更新（官方已确认 · Changelog 正文已核实 · CMP-395 补漏入稿）

- https://github.blog/changelog/2026-11-06-github-copilot-in-slack-and-teams-is-generally-available — Changelog 原文已取（HTTP 200）：@GitHub in Slack and Teams GA，11-06 20:31 UTC，会话内排查 bug、建 issue、改代码、提 PR，Teams 侧 Canvas 协作。
- https://github.blog/changelog/2026-11-06-github-copilot-weekly-releases-november-2 — Changelog 原文已取（HTTP 200）：周更汇总 11-06 21:00 UTC，Copilot 进入 JetBrains Air 与 Xcode 的 coding assistant、Copilot app 的 Agent Merge、PR／设置／agent session 管理更新、VS Code 1.145。
- https://github.blog/changelog/2026-11-06-copilot-code-review-api-management-and-review-overview-updates — Changelog 原文已取（HTTP 200）：11-07 00:27 UTC 起 code review 设置可用 REST／GraphQL API 管理，覆盖 Pro／Pro+／Max／Business／Enterprise。

## 15. OpenAI 状态页 Mastercard 支付事件（官方已确认 · 状态页 API 原文已核实 · CMP-395 补漏入稿）

- https://status.openai.com/api/v2/incidents.json — 状态页 incidents API 原文已取（HTTP 200）：事件「Elevated error rates with some U.S. business Mastercards」，11-06 18:38 UTC identified、18:50 UTC 更新、11-07 01:29 UTC monitoring，impact=none，受影响卡号前缀 544015／546400／543502／543799／512998，另有 513989 前缀批次（官方原文在该处截断）；本期截稿未 resolved。

## 16. OpenAI × Hacktron（官方已确认 · 仅摘要核实 · CMP-395 补漏入稿）

- https://openai.com/index/partnering-with-hacktron — 正文页 HTTP 403（Cloudflare 校验，需人工打开）；本期仅核实官方 feed 的标题、分类与摘要，未据此扩写细节。
- https://openai.com/news/rss.xml — 官方 RSS 原文已取（HTTP 200）：11-06 08:00 GMT 发布《Partnering with Hacktron to find vulnerabilities in OpenAI's systems》，分类 Security。

## 17. OpenAI BioBasicsBench（官方已确认 · 仅摘要核实 · CMP-395 补漏入稿）

- https://openai.com/index/measuring-how-ai-agents-handle-wet-lab-science — 正文页 HTTP 403（需人工打开）；本期仅核实官方 feed 的标题、分类、时间与摘要（100 项任务的湿实验室科学基准），未写任务内容、参与机构与得分。
- https://openai.com/news/rss.xml — 官方 RSS 原文已取（HTTP 200）：11-06 00:00 GMT 发布《Measuring how AI agents handle everyday wet-lab science》，分类 Publication。

## 18. kaniko 严重漏洞 CVE-2026-105769（官方已确认 · Advisory 原文已核实 · CMP-395 补漏入稿）

- https://github.com/advisories/GHSA-5q7h-w9jf-cx97 — GitHub Advisory 原文已取（HTTP 200）：受影响版本 < v1.25.20，根因 `docker-credential-acr-env` 未锚定正则（`.azurecr.io`／`.azurecr.cn`／`.azurecr.de`／`.azurecr.us`），无需 `RUN` 指令、无需推送镜像即可把 Entra ID 的 Azure Resource Manager 令牌发往仿冒 ACR 主机；v1.25.20 已修复。

## 线索雷达（单一来源 · 未核实 · 不展开细节）

- https://techcrunch.com/2026/11/05/palo-alto-networks-in-talks-to-buy-ai-agent-security-startup-clutch-for-500m/ — Palo Alto Networks 洽购 AI Agent 安全公司 Clutch，约 5 亿美元，交易未宣布完成（2026-11-05）。
- https://www.techmeme.com/261106/p18 — 彭博：微软在 2023 年合同到期后关闭向 Oracle 租用的算力（2026-11-06）。
- https://www.techmeme.com/261106/p17 — NBC News：美国司法部起诉三名外国公民以 AI 冒充大型国际律所 CEO 与律师，逾 1.29 亿美元诈骗（2026-11-06）。
- https://www.techmeme.com/261106/p20 — PSI 自述：以未公开的 Anthropic 模型证明 Aaronson-Ambainis 猜想（2026-11-06）。
- https://thenewstack.io/meta-muse-specialized-models/ — Meta 由 Muse Wonder 训练的专门模型与 Active Memory / Active Focus 开放（2026-11-06，需人工打开）。

## 采集限制与未采信条目

- The New Stack 原文在本次采集中触发 JavaScript 质询，相关材料降级为线索雷达并标注需人工打开；美国司法部新闻稿页面在本环境中连接失败（http=000），该条保留在线索雷达。
- Censys 一手报告原文已另行取得（HTTP 200）并入稿第 18 条；OpenAI 两条官方新闻正文页 HTTP 403（已标注需人工打开），仅核实官方 RSS 的标题、分类、发布时间与摘要。
- 2026-11-07 合稿轮（依据 CMP-395 复核结论）另做一次一级源补漏：Mistral 官方 news feed 三路径（/news/feed.xml、/news/rss.xml、/feed.xml）均 404 返回站点首页，**本期 Mistral 侧未取得一级源，需人工补核**；`blogs.microsoft.com/ai/feed/` 返回 HTTP 410（改用 `blogs.microsoft.com/feed/`）；`techcrunch.com/category/developer/feed/` 返回 Turnstile 校验页（改用 `techcrunch.com/feed/`）。
- arXiv 当日更新量大且多为单一研究条目，本期不设该栏目，以避免低增量条目挤占版面。
- 第 011 期（2026-11-06）已报道条目不在本期重复出现：Gemini Omni 1.2 Flash、GPT-6 Cyber 发布本身、Claude Personal Finance、Meta Muse Voice、OpenAI 总裁 2027 年 IPO 表态、llama.cpp b12129–b12138、LiteLLM v1.108.0 与 v1.109.0-rc.1、OpenSSH 10.6p2 修复本身、GPT-6 Astra 隐性表现不足、Meta 怀俄明 170 亿美元数据中心、Dropbox 收购 Tigris Data 等。
