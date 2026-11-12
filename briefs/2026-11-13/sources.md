# AI 早报 2026-11-13 来源清单（EP018）

> 采集窗口：2026-11-12 07:00 ~ 2026-11-13 07:00（Asia/Shanghai）。一级来源优先，媒体口径逐条标注。
> 采集方式：官方博客与公告 RSS（OpenAI、Anthropic、Google、Meta、Microsoft、NVIDIA、Mistral、Ollama、Perplexity、Hugging Face、GitHub Blog 与 Changelog）、GitHub Releases API（40 余个项目）、arXiv cs.AI/cs.CL、Techmeme 聚合、TechCrunch AI 与开发者频道、The Hacker News 安全频道、页面直取，以及 NotebookLM research 四轮检索（Q1 发布与开发生态、Q2 各厂商官方更新、Q3 安全与合规、Q4 额度与限流类小更新，每轮返回 10 条来源线索）。窗口内命中带时间戳条目 131 条。
> 链接核验：公开条目与来源清单链接共 60 条，逐条实际访问 —— 可达 54 条（HTTP 200/206），需人工打开 6 条（401 ×3 为路透社、403 ×3 为美联社 / OpenAI 发布页 / 彭博社），**失效 0 条**。核验脚本与原始输出：`ep018/work/linkcheck.py`、`ep018/work/linkcheck.txt`。
> 证据等级口径：**官方已确认** = 已取得官方原文；**多源交叉** = 两个及以上独立来源互证；**媒体转述** = 媒体对官方文件的转述；**单一来源 · 未核实** = 只进「前瞻与传闻」。

## 一手来源（官方公告 / 官方仓库 Release / 官方博客）

| # | 条目 | 来源 | 证据等级 | 链接 |
| --- | --- | --- | --- | --- |
| S-01 | Nvidia 董事会宣布黄仁勋辞任总裁、CEO 与董事（即时生效）；Colette Kress 任临时 CEO 并继续兼任 CFO；Harvey C. Jones 出任首任独立董事长；FY2027 第三财季财报定于 11 月 17 日 | Nvidia 官方新闻室（2026-11-12） | 官方已确认 | https://nvidianews.nvidia.com/news/nvidia-announces-ceo-transition |
| S-02 | Gemini 4 Hydrogen 发布：1M 上下文、输入 1.50 美元 / 输出 7.50 美元每百万 token、四档思考级别、Orchestrator、安全与基准口径 | Google 官方博客（2026-11-12） | 官方已确认（性能数字为发布方口径） | https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-hydrogen/ |
| S-03 | Gemini 4 Hydrogen 上线 Google 搜索：AI Mode 默认模型、AI Overviews、意图理解、查询 fan-out、视觉化响应 | Google 官方博客（2026-11-12） | 官方已确认 | https://blog.google/products-and-platforms/products/search/gemini-4-hydrogen-search-upgrade/ |
| S-04 | GitHub Actions 托管 runner 将于 2026 年 12 月 8 日结束 Windows 与 Linux 的 ARM32 作业执行 | GitHub 官方 Changelog（2026-11-12） | 官方已确认 | https://github.blog/changelog/2026-11-12-actions-for-arm32-linux-windows-retirement |
| S-05 | Secret scanning 新增 Cloudflare service token 检测（`cloudflare_access_service_token`） | GitHub 官方 Changelog（2026-11-12） | 官方已确认 | https://github.blog/changelog/2026-11-12-secret-scanning-adds-a-detector-for-cloudflare |
| S-06 | LLMON 预览模型 granite-4.1-3b / 8b-LLMON-preview 发布；保留特殊 token 承载结构与语义；间接提示注入攻击成功率降至接近零 | Hugging Face 官方博客（2026-11-12） | 官方已确认（研究方口径） | https://huggingface.co/blog/ibm-granite/llmon-an-llm-native-markup-language-now-in-granite |
| S-07 | 3D 生成模型微调指南：TRELLIS.2 的 LoRA 微调脚本与容器、GSO 数据集用法、冻结与微调边界 | Hugging Face 官方博客（2026-11-12） | 官方已确认 | https://huggingface.co/blog/3d-lora-finetuning |
| S-08 | OpenAI Python SDK v3.50.0：Responses API 暴露 reasoning 输入变换（PR #4268） | openai/openai-python Release（2026-11-12） | 官方已确认 | https://github.com/openai/openai-python/releases/tag/v3.50.0 |
| S-09 | Claude Code v2.1.323：Code Mode 实验开关、`plugin.json` 的 `engines["claude-code"]`、插件 TypeScript 钩子类型校验与 `claude plugin validate --strict` | anthropics/claude-code Release（2026-11-12 发布 / 2026-11-13 06:12 CST 抓取） | 官方已确认 | https://github.com/anthropics/claude-code/releases/tag/v2.1.323 |
| S-10 | LiteLLM v1.110.0-rc.2（窗口内最新 RC） | BerriAI/litellm Release（2026-11-12 10:53 CST） | 官方已确认 | https://github.com/BerriAI/litellm/releases/tag/v1.110.0-rc.2 |
| S-11 | LiteLLM 1.108.7 LTS：14 个 PR（3 新增、8 修复、1 变更），迁移要求「Responses API 设置 `drop_params: true` 或停止发送 `max_tool_calls`」 | BerriAI/litellm Release（2026-11-13 04:27 CST） | 官方已确认 | https://github.com/BerriAI/litellm/releases/tag/v1.108.7 |
| S-12 | LiteLLM v1.106.9 / v1.108.6 LTS / v1.109.1 Release 与 cosign 签名校验说明 | BerriAI/litellm Releases（窗口内共 5 个版本） | 官方已确认 | https://github.com/BerriAI/litellm/releases |
| S-13 | llama.cpp 窗口内 19 个构建（b12302–b12329）的 Release 正文与时间戳 | ggml-org/llama.cpp Releases | 官方已确认 | https://github.com/ggml-org/llama.cpp/releases |
| S-14 | llama.cpp b12329（窗口内最新构建，CUDA nvfp4 预填充融合优化） | ggml-org/llama.cpp Release（2026-11-13 06:22 CST） | 官方已确认 | https://github.com/ggml-org/llama.cpp/releases/tag/b12329 |
| S-15 | Vercel AI SDK ai@7.0.171 与 ai@6.0.331：畸形消息校验的内存与 CPU 耗尽修复、guarded-fetch 传输转发、Topaz 与 TypeSafe AI 模型目录 | vercel/ai Releases（2026-11-13 04:16–04:24 CST） | 官方已确认 | https://github.com/vercel/ai/releases/tag/ai%407.0.171 |
| S-16 | OpenAI 承诺 200 万美元支持 AI 与儿童安全研究（标题与摘要经官方 RSS 取得） | OpenAI 官方发布页（2026-11-12） | 官方已确认（标题与摘要）· **正文本次环境 403，需人工打开** | https://openai.com/index/children-first-declaration |
| S-17 | Fireworks AI 官方安全公告（10 月事件更新） | Fireworks AI 官方 | 官方已确认 | https://fireworks.ai/security/bulletins/october-2026-security-incident-update |
| S-18 | Google Antigravity 官方发布帖（Orchestrator：会话内动态切换 Carbon 与 Hydrogen） | Google Antigravity 官方，经 Techmeme 聚合 | 官方已确认（聚合页载原文摘要） | https://www.techmeme.com/261112/p49 |
| S-19 | GitHub 官方 Changelog 当期索引（含 ARM32 退役、Cloudflare 检测、Public monitoring 直链等条目） | GitHub 官方 | 官方已确认 | https://github.blog/changelog/ |
| S-20 | Node.js 官方安全发布页（16 项漏洞修复的版本入口） | Node.js 官方 | 官方（入口） | https://nodejs.org/en/blog/vulnerability |
| S-21 | Apache HTTP Server 安全公告入口（mod_http2 CVE-2026-119618 核对用） | Apache 官方 | 官方（入口） | https://httpd.apache.org/security/ |

## 媒体报道（官方文件 / 项目公告转述，非独立验证）

| # | 条目 | 来源 | 证据等级 | 链接 |
| --- | --- | --- | --- | --- |
| M-01 | 黄仁勋辞任背景、Kress 履历与背景说明、Nvidia 市值约 3.8 万亿美元 | TechCrunch（2026-11-12 07:37 PST） | 媒体原创报道 · 已与 S-01 交叉 | https://techcrunch.com/2026/11/12/jensen-huang-is-out-at-nvidia-who-is-colette-kress-his-interim-replacement/ |
| M-02 | 黄仁勋辞任对 AI 产业的影响分析 | TechCrunch（2026-11-12） | 媒体原创报道 | https://techcrunch.com/2026/11/12/five-ways-jensen-huangs-ouster-from-nvidia-could-damage-the-ai-industry/ |
| M-03 | Nvidia 辞任后的开源立场疑问 | TechCrunch（2026-11-12） | 媒体原创报道 | https://techcrunch.com/2026/11/12/jensen-huangs-exit-puts-nvidias-support-for-open-source-in-question/ |
| M-04 | Nvidia 弃任对 AI 生态的冲击 | 路透社（2026-11-12） | 媒体 · 官方已交叉 | https://www.reuters.com/business/retail-consumer/nvidia-ceo-jensen-huang-step-down-big-blow-ai-boom-2026-11-12/ |
| M-05 | 黄仁勋与第二名员工的关系及另两段婚外情 | 路透社（实时报道页，2026-11-12） | 媒体 · 单一来源 | https://www.reuters.com/live/nvidia-live-board-meets-fate-ceo-jensen-huang-after-affair-reports-2026-11-12/ |
| M-06 | 黄仁勋同意赴国会作证 | TechCrunch（2026-11-12） | 媒体原创报道 | https://techcrunch.com/2026/11/12/jensen-huang-agrees-to-testify-before-congress/ |
| M-07 | 前 Nvidia CEO 将于本月赴国会作证 | Engadget（2026-11-12） | 媒体 · 多源交叉（与 M-06 同源报道链） | https://www.engadget.com/2315091/ex-nvidia-ceo-jensen-huang-is-set-to-testify-before-congress-this-month/ |
| M-08 | 国会民主党启动 Nvidia 调查并致函 | TechCrunch（2026-11-12） | 媒体原创报道 | https://techcrunch.com/2026/11/12/democrats-launch-nvidia-investigation-write-scathing-letter-on-huangs-scheme-with-trump/ |
| M-09 | Megaspeed 与新加坡转运线索 | 美联社（2026-11-12） | 媒体 · 单一来源 | https://apnews.com/article/nvidia-megaspeed-china-singapore-huang-5403f152a601cf82ce939f1d24fffa0f |
| M-10 | 白宫讨论商务部部长 Howard Lutnick 去留 | The Independent（2026-11-12） | 媒体 · 单一来源 | https://www.independent.co.uk/news/world/americas/us-politics/trump-commerce-secretary-howard-lutnick-nvidia-b3084187.html |
| M-11 | Nvidia 市值跌破 4 万亿美元 | 彭博社（2026-11-12） | 媒体 · 单一来源 | https://www.bloomberg.com/news/articles/2026-11-12/nvidia-market-value-sinks-below-4-trillion-after-huang-resigns |
| M-12 | Fireworks AI 攻击导致 Notion 客户聊天记录泄露；Notion 约 1% 客户受影响、Insights 功能对话记录被窃、11 月 3 日断开并删除数据 | TechCrunch（2026-11-12 07:02 PST） | 媒体原创报道 · 已与 S-17 交叉 | https://techcrunch.com/2026/11/12/cyberattack-on-fireworks-ai-allowed-hackers-to-access-notion-customers-chat-transcripts/ |
| M-13 | Fireworks AI 影响范围扩大（含 LLMJacking 团伙指向） | The Hacker News（2026-11-10） | 媒体转述官方公告 · 已与 S-17 交叉 | https://thehackernews.com/2026/11/fireworks-ai-breach-widens-to-expose.html |
| M-14 | 微软 365 多项服务故障；微软称多台服务器意外不可用、负载升高 | Engadget（2026-11-12） | 媒体原创报道 | https://www.engadget.com/2315259/multiple-microsoft-365-services-are-experiencing-an-outage/ |
| M-15 | 同一故障的 Verge、BleepingComputer、PCWorld、Wired、路透社等报道汇总 | Techmeme 聚合页（2026-11-12） | 媒体 · 多源交叉 | https://www.techmeme.com/261112/p51 |
| M-16 | United Airlines 限制第三方 AI 助理订票与改签；凭据泄露风险与 FAA 值机确认要求 | TechCrunch（2026-11-12） | 媒体原创报道（含公司声明原文） | https://techcrunch.com/2026/11/12/united-airlines-blocks-ai-agents-from-booking-flights-citing-cybersecurity-risks/ |
| M-17 | United Airlines 同题报道（华尔街日报原始出处） | 华尔街日报，经 Techmeme 聚合 | 媒体 · 与 M-16 交叉 | https://www.techmeme.com/261111/p39 |
| M-18 | Nebius 2027 年 400 亿美元投入计划；微软 Vineland 机房交付延至 2027 年 Q2、合同上限 194 亿美元、DataOne 天然气发电机罚单 110 万美元 | TechCrunch（2026-11-12 13:27 PST） | 媒体原创报道 | https://techcrunch.com/2026/11/12/nebius-tests-the-neocloud-playbook-with-40-billion-in-planned-spending/ |
| M-19 | Norwest 40 亿美元基金（第十八只、规模最大）、投向结构与 Jeff Crowe 表态 | TechCrunch（2026-11-12 07:18 PST） | 媒体原创报道 | https://techcrunch.com/2026/11/12/norwest-pushes-deeper-into-ai-with-new-4b-fund/ |
| M-20 | Gemini 4 Hydrogen 的搜索升级独立报道 | TechCrunch（2026-11-12） | 媒体 · 已与 S-02 / S-03 交叉 | https://techcrunch.com/2026/11/12/googles-latest-search-upgrade-promises-better-answers-to-your-most-complicated-questions/ |
| M-21 | Apache HTTP Server mod_http2 严重漏洞 CVE-2026-119618：影响 2.4.55–2.4.70、修复于 2.4.71 | The Hacker News（2026-11-12） | 媒体转述项目公告 · 官方公告页未取到 | https://thehackernews.com/2026/11/critical-apache-http2-flaw-could-let.html |
| M-22 | Node.js 修复 16 个漏洞，含两个 HTTP/2 漏洞（击垮服务器、泄露其他连接内存） | The Hacker News（2026-11-12） | 媒体转述项目公告 | https://thehackernews.com/2026/11/nodejs-fixes-16-flaws-including-http2.html |
| M-23 | 4,837 个被盗 GitHub 账号在 1,806+ 个仓库植入 CI 密钥窃取器（Aikido Security 报告口径） | The Hacker News（2026-11-12） | 媒体转述研究方报告 · 研究方原文未取到 | https://thehackernews.com/2026/11/4837-hijacked-github-accounts-ran-ci.html |
| M-24 | 186 个仿冒 AI 域名投递 ClickFix、浏览器劫持扩展与搜索劫持（Island 研究方口径，代号 TypoPrompting） | The Hacker News（2026-11-12） | 媒体转述研究方报告 · 单一来源 | https://thehackernews.com/2026/11/186-fake-ai-domains-redirect-users-to.html |

## 线索雷达（单一来源 · 未核实，仅保留标题与链接）

| # | 条目 | 来源 | 链接 |
| --- | --- | --- | --- |
| L-01 | Anthropic 的 IPO 认购约为发行量的六倍，银行家告知现有股东将获优先配售 | 彭博社，经 Techmeme 聚合 | https://www.techmeme.com/261112/p55 |
| L-02 | 六个自 4 月以来发布的开源权重模型被发现带有受出口管制 Blackwell GPU 的指纹 | Unemployment Labs，经 Techmeme 聚合 | https://www.techmeme.com/261112/p62 |
| L-03 | OpenAI 已向议员确认支持两党立法限制中国取得 AI 芯片与芯片制造工具 | 彭博社，经 Techmeme 聚合 | https://www.techmeme.com/261112/p59 |
| L-04 | Cerebras 第三季核心营收同比增 70% 至 2.309 亿美元，并宣布与微软合作 | CNBC，经 Techmeme 聚合 | https://www.techmeme.com/261112/p57 |
| L-05 | 美国商务部正敲定针对中国 AI 企业远程访问海外芯片的新规（Leo Schwartz 独家，与 L-02 同处一条 Techmeme 讨论区） | Leo Schwartz（X），经 Techmeme 聚合 | https://www.techmeme.com/261112/p62 |
| L-06 | SpaceX 计划在亚利桑那州投入 500 亿美元、德州投入 240 亿美元建设数据中心园区 | 纽约时报，经 Techmeme 聚合 | https://www.techmeme.com/261112/p54 |

## 未收录但已排除的窗口内条目（去重与取舍记录）

| 条目 | 来源 | 排除理由 |
| --- | --- | --- |
| Anthropic 推出 Claude Meetings | TechCrunch（2026-11-10） | 首次公开时间在主窗口外，属历史事件，本期不重复包装 |
| 微软 11 月补丁批次 1,259 个漏洞 | 微软安全响应中心（2026-11-10） | 已于 EP017 完整报道，属历史事件 |
| OpenAI 状态页 Mastercard 支付与图像生成故障 | status.openai.com | 已于 EP012–EP017 台账跟踪（EV-007），本期无新增进展 |
| MongoDB 预认证崩溃漏洞 CVE-2026-118383 | The Hacker News（2026-11-12） | 单一来源转述，未取得官方公告与修复版本清单 |
| Google Cloud 就 AMD Turin 三项侧信道漏洞的处置建议 | The Hacker News（2026-11-12） | 单一来源转述，受影响面与补丁基线未取得官方文档核对 |
| Windows CLFS 驱动 SignDrop 零日利用 | The Hacker News（2026-11-13） | 单一来源转述，PoC 与微软公告未核对 |
| Red Hat Quay 私有镜像读取与覆盖漏洞 | The Hacker News（2026-11-13） | 单一来源转述，CVE 与修复版本未核对 |
| Citrix NetScaler 12 项漏洞（含 CVE-2026-120868） | The Hacker News（2026-11-13） | 单一来源转述，与 AI 开发链路关联度不足 |
| N-able N-central 新公开漏洞 | The Hacker News（2026-11-12） | 单一来源转述，厂商仍在调查 |
| PTC Windchill / FlexPLM CVE-2026-126325 | The Hacker News（2026-11-12） | 单一来源转述，与 AI 开发链路关联度不足 |
| ScreenConnect 攻击与 SCKit 恶意软件 | The Hacker News（2026-11-12） | 单一来源转述，非 AI 专项 |
| Google 会话劫持钓鱼活动（Material Security） | The Hacker News（2026-11-12） | 单一来源转述，缺少可核对的官方要素 |
| SoftBank 百亿美元级亏损对 AI 天然气需求的影响 | TechCrunch（2026-11-12） | 主题为能源市场，与 AI 技术生态关联度不足 |
| Muse 可付费向美国商家拨打电话 | TechCrunch（2026-11-12） | 单一来源转述，产品细节与可用范围未核对 |
| Nectar 面向品牌方的创作者发现与外联 agent | TechCrunch（2026-11-12） | 单一来源转述，缺少官方公告 |
| Phota Labs 照片处理产品 | TechCrunch（2026-11-12） | 单一来源转述，缺少官方公告 |
| crewAI 1.15.41 | crewAI Release（2026-11-13 02:42 CST） | 常规补丁（私有 URL 主机白名单、PyMuPDF 2.x 依赖等 4 项），事实密度不足，已在开发生态第 11 条末尾提及 |
| llmStudio / Qwen / DeepSeek / Ollama / vLLM / PyTorch / transformers 等仓库窗口内发布 | GitHub Releases API | 窗口内无独立可引用的发布说明条目，或与已收录条目重复 |

## 采集限制说明

1. `openai.com/index/*` 在本环境返回 HTTP 403（含本期 S-16），该条目只登记官方 RSS 载明的标题、金额与用途，并在正文标注「需人工打开」。
2. Anthropic 官方 RSS 返回错误页（HTML 而非 XML），本期 Anthropic 官方内容改由 Techmeme / 媒体与官方页核对。
3. `api.github.com` 在窗口内触发速率限制，GitHub 侧事实改用 Releases JSON 与 Release 网页核对。
4. Cerebras 投资者关系页返回 HTTP 403，其季报数字只能保留媒体口径，故 L-04 降级为线索雷达。
5. 本期未取得 Apache 官方安全公告原文、Node.js 官方漏洞清单原文、Aikido Security 与 Island 研究方原文，相关条目已在正文注明证据边界。
6. 本期使用 NotebookLM research 四轮检索（每轮 10 条来源线索）作为线索发现与交叉验证手段；检索过程只使用公开信息，未上传任何内部或敏感材料。
