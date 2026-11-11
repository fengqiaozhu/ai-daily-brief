# AI 早报 2026-11-12 来源清单（EP017）

> 采集窗口：2026-11-11 07:00 ~ 2026-11-12 07:00（Asia/Shanghai）。一级来源优先，媒体口径逐条标注。
> 采集方式：官方博客与公告 RSS、GitHub Releases API、Hugging Face Blog、arXiv cs.AI/cs.CL、Techmeme 聚合、页面直取与工具网关检索；共落盘 27.5 MB 原始数据，窗口内命中 645 条带时间戳条目（媒体与官方源 86 条、arXiv 预印本 559 条）。
> 链接核验：公开条目链接 38 条，逐条实际访问 —— 可达 37 条（HTTP 200/206），需人工打开 1 条（403），**失效 0 条**。核验脚本与原始输出：`ep017/work/linkcheck.py`、`ep017/work/linkcheck.txt`。

## 一手来源（官方公告 / 官方仓库 Release）

| # | 条目 | 来源 | 证据等级 | 链接 |
| --- | --- | --- | --- | --- |
| S-01 | 微软 11 月安全更新：1,259 个漏洞、Outlook CVE-2026-124194 被在野利用 | 微软安全响应中心官方发布说明（2026-11-10） | 官方已确认 | https://msrc.microsoft.com/update-guide/releaseNote/2026-Nov |
| S-02 | 微软漏洞公告页 CVE-2026-124194 | 微软安全响应中心（2026-11-10） | 官方已确认 | https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-124194 |
| S-03 | Railway 10 月安全事件最终报告（解密时间窗、1.85% 上界、1,852 名用户令牌） | Railway 官方博客（2026-11-11） | 官方已确认 | https://blog.railway.com/p/incident-report-october-security-incident |
| S-04 | Railway 10 月安全事件初步报告 | Railway 官方博客（2026-10） | 官方已确认 | https://blog.railway.com/p/preliminary-report-october-security-incident |
| S-05 | Claroc「GhostShares 2」：Grok 应用默认「任何人可打开」与暴露面统计 | Claroc 官方研究博客（2026-11-11） | 官方已确认（研究方原文） | https://blog.claroc.io/ghostshares-grok-build-apps/ |
| S-06 | Gemini Decisions API 与 Gemini Decision 1（定价、延迟、三种问题类型、内部用法） | Google 官方博客（2026-11-11） | 官方已确认 | https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/ |
| S-07 | OpenAI Codex 0.167.2（Vertex AI 增量工具结果与回退开关） | openai/codex Release（2026-11-11 22:44 UTC） | 官方已确认 | https://github.com/openai/codex/releases/tag/rust-v0.167.2 |
| S-08 | OpenAI Codex 0.170.0-alpha.1 | openai/codex Release（2026-11-11 20:06 UTC） | 官方已确认 | https://github.com/openai/codex/releases/tag/rust-v0.170.0-alpha.1 |
| S-09 | LiteLLM v1.109.0（982 个 PR、5 项需要动作的迁移） | BerriAI/litellm Release（2026-11-11 00:56 UTC） | 官方已确认 | https://github.com/BerriAI/litellm/releases/tag/v1.109.0 |
| S-10 | LiteLLM v1.110.0-rc.1（镜像 cosign 签名校验） | BerriAI/litellm Release（2026-11-11 00:06 UTC） | 官方已确认 | https://github.com/BerriAI/litellm/releases/tag/v1.110.0-rc.1 |
| S-11 | llama.cpp b12292（窗口内最新构建） | ggml-org/llama.cpp Release（2026-11-12 04:15 CST） | 官方已确认 | https://github.com/ggml-org/llama.cpp/releases/tag/b12292 |
| S-12 | llama.cpp Release 列表（窗口内 15 个构建核对入口） | ggml-org/llama.cpp Releases | 官方已确认 | https://github.com/ggml-org/llama.cpp/releases |
| S-13 | AlphaGenome 2（1 亿+ 细胞谱、68 组织、条件式架构） | Google DeepMind 官方博客（2026-11-11） | 官方已确认 | https://deepmind.google/blog/alphagenome-2-deciphering-how-cells-read-dna-to-better-understand-disease/ |
| S-14 | Google Labs Tabletop（协作实验、候补名单、18+ 美国） | Google 官方博客（2026-11-11） | 官方已确认 | https://blog.google/innovation-and-ai/models-and-research/google-labs/tabletop/ |
| S-15 | 微软研究院 Lazarus：重编程休眠神经元给 AI agent 植入后门 | Microsoft Research 官方博客（2026-11-10） | 官方已确认 | https://www.microsoft.com/en-us/research/blog/lazare-veni-foras-reprogramming-dormant-neurons-to-backdoor-ai-agents/ |
| S-16 | 微软安全博客：检测隐藏在模型神经元中的休眠 agent | Microsoft Security Blog（2026-11-10） | 官方已确认 | https://www.microsoft.com/en-us/security/blog/2026/11/10/detecting-sleeper-agents-hiding-in-ai-model-neurons/ |
| S-17 | CISA 向 KEV 目录新增六个在野利用漏洞 | CISA 官方通告（2026-11-10，72 小时补收） | 官方已确认 | https://www.cisa.gov/news-events/alerts/2026/11/10/cisa-adds-six-known-exploited-vulnerabilities-catalog |
| S-18 | CISA 已知被利用漏洞目录（KEV） | CISA 官方 | 官方已确认 | https://www.cisa.gov/known-exploited-vulnerabilities-catalog |
| S-19 | Token Pooling 感知训练：pool_factor=4 时保留 94.6% NanoBEIR nDCG@10 | Hugging Face 官方博客（2026-11-11） | 官方已确认 | https://huggingface.co/blog/token-pooling |
| S-20 | BotPsy：0.8B 端侧 agentic 模型（对照组阅读） | Hugging Face 官方博客（2026-11-11） | 官方已确认 | https://huggingface.co/blog/qvac/botpsy |
| S-21 | OpenAI「ChatGPT Plus for veterans and servicemembers」 | OpenAI 官方发布页（2026-11-11 16:00 CST） | 官方已确认（标题与时间），**正文本次环境 403 不可达，需人工打开** | https://openai.com/index/chatgpt-plus-for-veterans |

## 媒体报道（官方文件 / 项目公告转述，非独立验证）

| # | 条目 | 来源 | 证据等级 | 链接 |
| --- | --- | --- | --- | --- |
| M-01 | 微软 1,259 个漏洞补丁、726 个在 Windows、Outlook 漏洞被利用 | The Hacker News（2026-11-11） | 媒体转述官方通告 · 未核实 | https://thehackernews.com/2026/11/microsoft-patches-1259-flaws-including.html |
| M-02 | Railway 被盗密钥导致约 74 万美元未授权支出与退款口径 | The Hacker News（2026-11-11） | 媒体转述官方事故报告 · 已与 S-03 交叉 | https://thehackernews.com/2026/11/railway-says-stolen-customer-ai-keys.html |
| M-03 | 35,578 个 Grok 应用无需登录可访问、24 个员工应用已下线 | The Hacker News（2026-11-11） | 媒体转述研究方原文 · 已与 S-05 交叉 | https://thehackernews.com/2026/11/over-35000-grok-built-apps-exposed.html |
| M-04 | OpenAI 单季营收首次超过 100 亿美元、Q2 为 67 亿美元、调整后经营利润率 -150% → -109% | TechCrunch 转述彭博社（2026-11-11） | 媒体 · 单一来源 · 未核实 | https://techcrunch.com/2026/11/11/openais-quarterly-revenue-reportedly-crosses-10b-for-the-first-time/ |
| M-05 | Meta 基础设施负责人 Santosh Janardhan 离职、 Dave Brown 接任 | TechCrunch（2026-11-11） | 多源交叉（彭博社原始报道经 Techmeme 聚合） | https://techcrunch.com/2026/11/11/meta-is-losing-its-longtime-head-of-infrastructure/ |
| M-06 | 彭博社原始报道：Janardhan 拟于 2027 年初离职 | 彭博社，经 Techmeme 聚合 | 媒体 · 单一来源（与 M-05 同源报道链） | https://www.techmeme.com/261111/p35 |
| M-07 | 微软「Lazarus」后门研究媒体转述 | The Hacker News（2026-11-11） | 媒体转述官方论文 · 已与 S-15 交叉 | https://thehackernews.com/2026/11/microsoft-researchers-show-ai-agents.html |
| M-08 | Databricks 升级 Genie：本体驱动的多步骤无人值守任务 | TechCrunch（2026-11-11） | 媒体（原创报道） | https://techcrunch.com/2026/11/11/databricks-new-ai-agent-tells-ceo-ali-ghodsi-the-unvarnished-truth/ |
| M-09 | Fractile 7.2 亿美元 C 轮、估值「超过 50 亿英镑」 | TechCrunch（2026-11-11） | 媒体转述英国政府表述 · 未核实 | https://techcrunch.com/2026/11/11/with-720m-round-britains-fractile-gets-a-leg-up-in-the-race-for-ai-chips/ |
| M-10 | Plurai 1,300 万美元种子轮 | TechCrunch（2026-11-11） | 媒体 · 单一来源 | https://techcrunch.com/2026/11/11/plurai-wants-to-help-ai-agents-work-better-using-the-same-approach-that-helped-get-self-driving-cars-to-roads/ |
| M-11 | Plurai 聚合页（交叉查阅入口） | Techmeme | 媒体聚合页 | https://www.techmeme.com/261111/p31 |
| M-12 | AlphaGenome 2 报道（含非商用研究口径） | The Verge，经 Techmeme 聚合 | 媒体 · 单一来源（已与 S-13 交叉） | https://www.techmeme.com/261111/p32 |

## 线索雷达（单一来源 · 未核实，仅保留标题与链接）

| # | 条目 | 来源 | 链接 |
| --- | --- | --- | --- |
| L-01 | United Airlines 将阻止个人 AI 助理代订机票，理由为数据隐私风险与可能触犯 FAA、DOT 规定 | 华尔街日报，经 Techmeme 聚合 | https://www.techmeme.com/261111/p39 |
| L-02 | Applied Intuition 洽谈至少 15 亿美元融资，pre-money 约 300 亿美元，General Catalyst 领投 | 彭博社，经 Techmeme 聚合 | https://www.techmeme.com/261111/p36 |
| L-03 | Edelbyte 携 7,000 万美元（Series A 加种子）走出隐身模式，主打面向 AI agent 的数据分析平台 | 福布斯，经 Techmeme 聚合 | https://www.techmeme.com/261111/p33 |
| L-04 | IBM 发布 Quantum Nighthawk r3：520 个量子比特、可执行 1 万次量子操作 | SiliconANGLE，经 Techmeme 聚合 | https://www.techmeme.com/261111/p37 |

## 未收录但已排除的窗口内条目（去重与取舍记录）

| 条目 | 排除理由 |
| --- | --- |
| arXiv cs.AI / cs.CL 窗口内 559 篇预印本 | 结论尚需独立复现，与已收录条目相比对读者决策增量低；原始文件已落盘 `ep017/raw/arxiv_cl.xml` |
| Codex alpha 线多个版本（0.167.0-alpha.4.2、0.169.0-alpha.10/11/11.1、0.170.0-alpha.1） | 发布正文仅一句版本号，无变更条目；仅正式版 0.167.2 有实质变更，单列收录 |
| OpenAI 官方页「JioStar 首席架构师谈 5 亿用户规模下的 AI 检索」 | 本次环境 403，需人工打开，正文未取到，不展开 |
| NVIDIA 博客「AI 帮助回收企业把混合废弃物转为可复用材料」 | 行业应用案例，非 AI 开发或工具变更，读者关联度低于阈值 |
| GitHub Changelog「个人账户支持 issue 类型与字段」「GitHub App 支持 Enterprise Copilot 席位管理」 | 与开发者决策关联度低于 10 分阈值 |
| OpenAI 状态页事件（11-12 06:50 UTC 起「无法启动新的 Workspace Agent 运行」） | 状态页为持续更新条目，窗口内仍在调查中，尚无结论；留待后续追踪 |
| 各类 arXiv 与公告中的单一来源传闻（美国商务部实体清单推迟、OpenAI 成本数据口径等） | 单一来源且未取得原文，不进完整条目 |
