# AI 早报 2026-11-03

> 第 008 期　｜　检索窗口：2026-11-02 07:00 – 2026-11-03 07:00（Asia/Shanghai）
> 读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者
> 证据标注：本期条目后括注证据等级（官方已确认 / 多源交叉 / 单一来源 · 未核实）；括注为「单一来源 · 未核实」者只保留标题、来源与日期。
> 补发说明：本期为 2026-11-03 期，因发布流程缺口于 2026-11-06 之后补发。内容与检索窗口未变，条目、事实与数字未作改动。

## 今日概览

**要闻**

1. Anthropic 提交修订版 S-1/A-1：第三季度营收 170 亿美元、净亏损 232.91 亿美元，前九个月净亏损 1040.39 亿美元
2. Anthropic 披露约 8954 亿美元采购承诺与租赁合同，未来 12 个月约 698 亿美元到期
3. OpenAI 启动 Grid Protectors Program，佐治亚州试点，极端天气下最多释放 1000 兆瓦电力
4. 纽约时报等另案起诉 Brave，指其抓取内容并供给 Anthropic、Perplexity 等 AI 公司

**开发生态**

5. llama.cpp b12050–b12060：新增 Clover MoE 支持、统一 KV 缓存优化、Apple 平台内存分配切换
6. OpenAI 同日发布 LifeVal 与 Qodo × Codex 插件两条官方内容

**产品应用**

7. OpenAI 合并 ChatGPT 桌面端 Chat 与 Work 标签页，ChatGPT 与 Codex 共享同一额度池
8. xAI 收紧 Grok Bot 周使用额度，马斯克称服务成本相对收入「不可持续」

**技术与洞察**

9. NVIDIA 开发者博客同日更新：分布式训练自动化工作负载恢复、用 Cosmos 构建世界模型做交互式仿真

**行业动态**

10. Anthropic 在 S-1/A-1 中首次把「递归自我改进」写进风险因素，并披露内部 Claude 用量价值 9 个月增长逾 250 倍

**前瞻与传闻**

- 线索雷达｜机构投资者向 Anthropic 给出 1.5–1.6 万亿美元 IPO 估值指引，低于此前 2 万亿美元口径（2026-11-02，来源：华尔街日报，经 Techmeme 聚合转述）
- 线索雷达｜Palantir 第三季度营收同比增长 96% 至 23.1 亿美元，上调 2026 财年营收指引至约 85.3 亿美元（2026-11-02，来源：CNBC，经 Techmeme 聚合转述）
- 线索雷达｜Linux 发行版厂商 SUSE 内部备忘录称将裁减约 10% 员工，理由是「自动化与 AI 正在根本改变软件公司的运作方式」（2026-11-02，来源：The Register，经 Techmeme 聚合转述）
- 线索雷达｜Web 托管商 Squarespace 确认裁减全球约 19% 员工（约 300 人），同期正推进 AI 原生平台 Forma（2026-11-02，来源：TechCrunch）
- 线索雷达｜机器人基础模型公司 Tutor Intelligence 完成 7500 万美元 B 轮，a16z 领投，累计融资 1.17 亿美元（2026-11-02，来源：Forbes，经 Techmeme 聚合转述）
- 线索雷达｜特拉维夫 42AI 以 6250 万美元种子轮出隐身，宣称做「行为世界模型」预测人类决策，已在数家券商试运行（2026-11-02，来源：TechCrunch）
- 线索雷达｜DeepSeek 为 DeepSeek Harness 推出「creator mode」，可快速生成自定义插件（2026-11-02，来源：彭博，经 Techmeme 聚合转述）
- 线索雷达｜研究者称大模型可直接读写神经网络权重，并用 GPT-6 Astra 修改 Qwen3.5-0.8B 权重以提升数学能力（2026-11-02，来源：经 Techmeme 聚合转述）
- 线索雷达｜AI 数据中心水冷监测公司 Omen AI 以 1600 万美元现金加股票方式收购 Aquatic Labs（2026-11-02，来源：TechCrunch）

## 后续追踪

- **Anthropic 上市与算力承诺**：EP005 报道四家巨头资本开支超 7400 亿美元 → EP006 报道 neoclouds 在债券市场被有效排除、Nvidia 需为客户债务担保 → 本期 Anthropic 在 S-1/A-1 中自述已签订约 8954 亿美元采购承诺与租赁合同、其中约 698 亿美元需在 2027 年 9 月前支付 → 下一步关注 IPO 定价（机构给出的 1.5–1.6 万亿美元指引为单一来源待核实）与承诺落地节奏。
- **Claude Code 使用边界**：EP007 报道 Anthropic 在 Opus 5.5 系统提示词加约束、Claude Code 被指暗中打击游戏克隆 → 本期 Anthropic 的 Addy Osmani 公开确认新增两句提示词，说明是为避免复刻特定既有游戏、原创与同品类游戏不受影响 → 下一步关注是否公开该约束的技术边界与第三方审计口径。
- **国产开源 Agent 底座**：EP007 报道 DeepSeek 开源 deepseek-harness 与 dsh-superagent-prototype（插件式架构）→ 本期彭博报道其推出 creator mode，可快速生成自定义插件 → 下一步关注 creator mode 是否随正式版发布、插件生态与许可证细则。
- **开源推理链与移动端进度**：EP005–EP007 连续跟进 Gemma 4 与量化路径在 llama.cpp 的支持 → 本期 b12060 新增 Clover MoE 支持、b12059 统一多序列 KV 缓存路径 → 下一步关注 b1205x 系列在移动 GPU 上的实际吞吐与更多新架构落地节奏。
- **AI 服务成本与额度**：本期 Grok Bot 因成本「不可持续」收紧周额度（唯一来源为 TechCrunch 转述马斯克公开发言）→ 下一步关注 xAI 是否公布具体额度数值、是否调整订阅分层。
- **AI 数据中心与电网**：EP007 报道 OpenAI 拟把数据中心改称「AI compute campuses」→ 本期 OpenAI 启动 Grid Protectors Program，用自建电力换取「电网保护者」叙事 → 下一步关注试点数据中心的实际释放电量与各州阻击数据中心的政策进展。

## 要闻

### 1. Anthropic 提交修订版 S-1/A-1：第三季度营收 170 亿美元，九个月净亏损 232.91 亿美元（官方已确认）

**导语**

Anthropic 于 2026 年 11 月 2 日向美国证券交易委员会提交修订版招股文件（S-1/A-1）。文件显示，公司第三季度（截至 2026 年 9 月 30 日）营收 170 亿美元、净亏损 232.91 亿美元（上年同期营收约 14 亿美元、净亏损 121.38 亿美元）；前九个月营收 332.42 亿美元（上年同期 25.45 亿美元，增长 1206%），前九个月净亏损 1040.39 亿美元；2025 财年净亏损 419.65 亿美元。

**详细内容**

据招股文件原文，Anthropic 表述其收入从 2023 年第一季度商业化上线时的 0 美元增长到截至 2026 年 9 月 30 日三个月的 170 亿美元。同期口径下，TTM 营收达到 10 万美元以上的客户数量从 2025 年 9 月 30 日的 950 多家增加到 2026 年 9 月 30 日的 11900 多家；这部分客户贡献收入 261 亿美元，占 TTM 总收入的 74%。

亏损端，文件给出的季度净亏损序列为：2025 年第一季度 65.92 亿美元、第二季度 63.77 亿美元、第三季度 121.38 亿美元；2026 年第一季度 144.39 亿美元、第二季度 663.09 亿美元、第三季度 232.91 亿美元。对应 2025 财年全年净亏损 419.65 亿美元、前九个月 1040.39 亿美元。上述 7 个数字对应 2025 年第一季度至 2026 年第三季度的连续季度净亏损；招股文件另行列出可转换本票等负债的公允价值变动等项目。

多家媒体同步报道了这组数字：纽约邮报称 Anthropic 第三季度净亏损 233 亿美元，高于上年同期的 121 亿美元；Gizmodo 转述彭博称第三季度营收约 170 亿美元、上年同期为 14 亿美元，约 12 倍增长。报道还提到，Anthropic 此次在申报时才首次填入此前留空的最近一个季度数据。

TechCrunch 报道称，最引人关注的是文件「小字部分」的更新：Anthropic 在风险因素中新增表述，称已用 AI 开发出能力跃升超出其当时认知的模型。

**相关链接**

- https://www.sec.gov/Archives/edgar/data/2130357/000162828026068676/anthropicpbc-sx1ax1.htm
- https://nypost.com/2026/11/02/business/anthropic-reports-23b-q3-loss-in-amended-ipo-filing/
- https://techcrunch.com/2026/11/02/anthropic-warns-that-its-very-close-to-rsi-capability-aka-self-building-ai/

### 2. Anthropic 披露约 8954 亿美元采购承诺与租赁合同，未来 12 个月约 698 亿美元到期（官方已确认）

**导语**

Anthropic 在同一份 S-1/A-1 中披露：截至及 2026 年 9 月 30 日之后，公司已签订采购承诺与租赁协议（含短期承诺与尚未起租的租约），合计承诺支出约 8954 亿美元，绝大部分与算力和基础设施相关。

**详细内容**

文件把承诺拆成时间轴：其中约 4475 亿美元预计在 2030 年 12 月 31 日之前发生，其余绝大部分预计在 2031 年至 2045 年之间发生；约 698 亿美元的承诺在 2026 年 9 月 30 日之后的 12 个月内到期。

公司同时披露，自 2026 年 1 月到 2026 年 9 月，其内部使用 Claude 的按目录价计价值增长超过 250 倍；2026 年 4 月起，该内部使用价值的月度金额首次超过其月度人力开支（不含股权激励）。Anthropic 称这一内部使用形成的算力投入会持续放大研发节奏。

这份披露把 EP005、EP006 报道过的「AI 基建资本开支」口径落到了单一公司的合同层面，可作为后续核对超大规模云厂商债务与算力成本传闻的对照点。

**相关链接**

- https://www.sec.gov/Archives/edgar/data/2130357/000162828026068676/anthropicpbc-sx1ax1.htm
- https://gizmodo.com/anthropic-is-betting-nearly-900-billion-that-the-ai-boom-wont-bust-2000833885
- https://nypost.com/2026/11/02/business/anthropic-reports-23b-q3-loss-in-amended-ipo-filing/

### 3. OpenAI 启动 Grid Protectors Program，佐治亚州试点，极端天气下最多释放 1000 兆瓦电力（多源交叉）

**导语**

OpenAI 于 2026 年 11 月 2 日发布 Grid Protectors Program，称这是面向美国的一项计划，把自建电力包装成电网紧张时的可调度资源。公司承诺在美国佐治亚州 Effingham County 的在建数据中心先行试点，在极端天气或紧急状况下最多释放 1000 兆瓦电力。

**详细内容**

据 The Verge 报道，OpenAI 的说法是：这些为 AI 数据中心配套建设的电厂，在社区需要时可以作为「公用事业可以随时调用的资源」。试点规模方面，1000 兆瓦的释放量被换算为「大约 70 万户家庭的空调用电量」。

该计划发布的时间点正值美国多地社区对大型数据中心的反对升温：犹他州 Box Elder County 已批准一个用电量可能超过该州用电峰值两倍的数据中心项目；田纳西、佛罗里达、俄克拉何马、俄勒冈等州已出台阻止 AI 企业把能源成本转嫁给居民的法律或暂停令。此前 OpenAI 已开始把 AI 数据中心改称「compute campuses」，以淡化公众对「数据中心」的负面联想。

**相关链接**

- https://openai.com/index/grid-protectors-program
- https://www.theverge.com/ai-artificial-intelligence/1024604/openai-data-center-grid-protection-

### 4. 纽约时报等另案起诉 Brave，指其抓取内容并供给 Anthropic、Perplexity 等 AI 公司（多源交叉）

**导语**

《纽约时报》于 2026 年 11 月 2 日在纽约联邦法院起诉隐私浏览器公司 Brave，指其抓取媒体版权内容并非法分发给包括 Anthropic、Perplexity、Mistral、xAI、Cohere 在内的客户。同日，《Daily News》《芝加哥论坛报》《奥兰多哨兵报》提起类似诉讼。

**详细内容**

据 TechCrunch 报道，原告把 Brave 描述为 AI 公司的「供应商、经销商和分销商」——诉状称 Brave 既是「像窃贼一样攫取出版商内容的贼」，又是把赃物卖给第三方的 AI「销赃者」。诉状称 Brave 用一个未公开身份的爬虫建立了超过 300 亿网页的索引，使出版商无从拦截。

诉讼还指向 Brave 浏览器中绕过付费墙的功能，以及屏蔽出版商广告、同时出售自身广告的做法。Brave 成立于 2015 年，据私募市场追踪机构统计累计融资约 2.5 亿美元。原告要求法院发出禁令并赔偿。报道发布时 Brave 未回复置评请求。

**相关链接**

- https://techcrunch.com/2026/11/02/new-york-times-and-other-outlets-sue-web-browser-brave-over-alleged-content-scraping/
- https://www.theverge.com/tech/1024588/brave-lawsuit-ai-scraping-new-york-times

## 开发生态

### 5. llama.cpp b12050–b12060：新增 Clover MoE 支持、统一 KV 缓存优化、Apple 平台内存分配切换（官方已确认）

**导语**

llama.cpp 在 2026 年 11 月 2 日一天内发布 b12050 至 b12060 共 11 个构建版本，主要变更集中在新模型架构支持、注意力与 KV 缓存路径优化，以及 Apple 平台的内存分配实现调整。

**详细内容**

b12060（11 月 2 日 23:00 UTC）加入 Clover 支持：新增仅注意力（AR-only）的 Clover MoE 支持，包含 GGUF 转换、模型加载与因果混合注意力（causal hybrid attention）实现，并复用共享注意力与递归相关组件。

b12059（22:41 UTC）修改 `flash_attn_ext_rows`，用 `llm_attn_mask` 与 `kv_rows` 实现统一注意力下的更高效统一 KV 管理，面向多序列场景。b12052（17:37 UTC）在 OpenCL 路径新增 `topk_mask`；b12050（16:54 UTC）改进 Vulkan 在 RDNA3/RDNA4 上的小 N split-K 选择。

平台侧，b12053（18:23 UTC）在所有 Apple 平台改用 `vm_allocate` 取代 `posix_memalign`；b12054（18:44 UTC）让 ggml-zdnn 与宿主共享缓冲区；b12058（19:30 UTC）修复 `imatrix --nextn` 崩溃。

**相关链接**

- https://github.com/ggml-org/llama.cpp/releases

### 6. OpenAI 同日发布 LifeVal 与 Qodo × Codex 插件两条官方内容（官方已确认 · 内容标题级）

**导语**

OpenAI 官方博客在 2026 年 11 月 2 日连发两条内容：上午发布 LifeVal，同日另发布客户案例 Qodo builds context into AI code review with Codex。两页正文为前端动态渲染，本期抓取只取得标题、发布时间与官方链接，未取得正文细节。

**详细内容**

从官方 RSS 可核验的时间与链接为：LifeVal（2026-11-02 09:00 GMT，即北京时间 17:00）与 Qodo builds context into AI code review with Codex（2026-11-02 00:00 GMT，即北京时间 08:00）。后者是 OpenAI 与代码审查工具 Qodo 的合作案例，涉及用 Codex 插件把项目上下文带入 AI 代码审查流程。

由于未能读取正文，本期不展开两者的功能细节与技术参数，仅登记官方出处，留待后续期次抓取到正文后再行展开。

**相关链接**

- https://openai.com/index/lifeval
- https://openai.com/index/qodo-codex-plugin

## 产品应用

### 7. OpenAI 合并 ChatGPT 桌面端 Chat 与 Work 标签页，ChatGPT 与 Codex 共享同一额度池（官方邮件经 TechCrunch 转述）

**导语**

据 TechCrunch 转述 OpenAI 发给用户的一封邮件，OpenAI 正在把 ChatGPT 桌面端 Chat 与 Work 两个标签页合并为一个界面，先向部分用户开放以收集反馈，再逐步推给所有用户。邮件同时说明，ChatGPT 与 Codex 之后将从同一额度池扣减 token。

**详细内容**

邮件原文称，这样用户「可以在一个地方从探索想法到让 ChatGPT 把它做完」，可以带入文件与插件，让 ChatGPT 建网站、做演示文稿，或在网页上代为执行，同时由用户审阅并引导其工作。邮件明确：Codex 在 ChatGPT 桌面端仍是独立体验。

额度池合并是这次调整的另一面。OpenAI 称该变化不会影响大多数用户，但按使用量与模型不同，部分用户可能需要更久才能等到额度重置。Anthropic 已于 2026 年 9 月把 Claude 的 chat 与 Cowork 合并到同一屏。

**相关链接**

- https://techcrunch.com/2026/11/02/openai-is-finally-merging-chatgpts-chat-and-work-tabs/

### 8. xAI 收紧 Grok Bot 周使用额度，马斯克称服务成本相对收入「不可持续」（官方公开发言经 TechCrunch 转述）

**导语**

据 TechCrunch 报道，xAI 的 Grok Bot 用户在周末发现周使用额度被意外用满，部分用户在 X 上称用量从 50% 直接跳到 100%。马斯克在 X 上回应称这不是故障，而是「提供 Grok Bot 的成本相对收入不可持续」。

**详细内容**

马斯克在回复用户提问时写下「The cost of serving Grok Bot was unsustainably high relative to revenue」，但未在主feed上进一步说明，也未说明后续订阅用户的额度将如何调整。

报道称，Grok Bot 被定位为新上市的 SpaceX 的一个成功案例：SpaceX 上月披露 AI 已占公司收入的 52%，更名后的「Super Intelligence」部门实现 4.31 亿美元利润（未计入收购 Cursor 相关的一次性 12 亿美元成本）。

**相关链接**

- https://techcrunch.com/2026/11/02/elon-musk-throttles-grok-bot-limits-due-to-unsustainably-high-costs/

## 技术与洞察

### 9. NVIDIA 开发者博客同日更新：分布式训练自动化工作负载恢复、用 Cosmos 构建世界模型做交互式仿真（官方已确认）

**导语**

NVIDIA 开发者博客在 2026 年 11 月 2 日发布两篇文章：一篇讲用自动化工作负载恢复机制保持分布式训练不中断，另一篇讲用 NVIDIA Cosmos 构建世界模型以支持交互式仿真。

**详细内容**

两篇文章均为官方技术博客内容：《Keep distributed training running with automated workload recovery》发布于 11 月 2 日 22:43 UTC，《Build world models for interactive simulation with NVIDIA Cosmos》发布于同日 17:40 UTC。

本期抓取到官方 RSS 的标题、发布时间与链接，页面正文为动态渲染，未逐段读取，因此不展开其中的实现细节与参数。值得注意的是，本期另有线索指向「世界模型」方向的集中升温：42AI 宣称做「行为世界模型」（见线索雷达），本期 NVIDIA 官方博客也在同一时间点讨论世界模型与交互式仿真，两者属于不同层次但同一趋势。

**相关链接**

- https://developer.nvidia.com/blog/keep-distributed-training-running-with-automated-workload-recovery/
- https://developer.nvidia.com/blog/build-world-models-for-interactive-simulation-with-nvidia-cosmos/

## 行业动态

### 10. Anthropic 在 S-1/A-1 中首次把「递归自我改进」写进风险因素（官方已确认）

**导语**

Anthropic 在 S-1/A-1 中写明：「用 AI 帮助构建更强的 AI 也可能带来相当大的安全风险，尤其是在它大幅加快进步节奏的情况下。」公司称这是其负责任扩展政策（Responsible Scaling Policy）覆盖的范围，「在我们接近所谓的『递归自我改进』时」，政策给出了监测与缓解计划。

**详细内容**

招股文件原文进一步写明：「我们的内部估计以及对未来模型的预期，而非我们当前的模型，表明我们可能很快达到负责任扩展政策中『归因于 AI 的剧烈加速进展』的定义。我们尚未指定任何现有模型超过这一阈值。」文件同时称，Anthropic「预计无法在技术可行时，在没有实质性人类监督或理解的情况下，安全地使用 Claude 完全自主设计并构建一代又一代前沿模型」，因此正考虑更新负责任扩展政策以保持人类在前沿模型开发中的控制权。

这段表述把 EP007 报道的「Anthropic 在系统提示词层面加约束」之外的安全叙事落到招股文件层面：风险不再只是模型行为，而是研发流程本身。TechCrunch 报道称，Anthropic 在风险因素中新增了两条表述：一是已经用 AI 开发出能力跃升超出其当时认知的模型；二是公司可能很快达到其内部对递归自我改进（RSI）的定义。

招股文件同时强调，公司认为对安全技术投入可以让它在开发 AI 模型时获得比现在更多得多的生产力杠杆。Anthropic 的安全框架此前已被业界视为最具体的一家；把 RSI 写进公开招股文件，意味着公司需要在上市文件中对这一风险作出可被投资者核对的表述。

**相关链接**

- https://www.sec.gov/Archives/edgar/data/2130357/000162828026068676/anthropicpbc-sx1ax1.htm
- https://techcrunch.com/2026/11/02/anthropic-warns-that-its-very-close-to-rsi-capability-aka-self-building-ai/

## 前瞻与传闻

以下条目为单一来源线索，未取得官方公告或第二独立来源，仅保留标题、来源与日期，不展开细节与推断。

- 线索雷达｜机构投资者向 Anthropic 给出 1.5–1.6 万亿美元 IPO 估值指引，低于此前 2 万亿美元口径（2026-11-02，华尔街日报经 Techmeme 聚合转述）——单一来源 · 未核实：https://www.techmeme.com/261102/p42#a261102p42
- 线索雷达｜Palantir 第三季度营收同比增长 96% 至 23.1 亿美元，美国商业营收同比增长 148% 至 9.84 亿美元，上调 2026 财年营收指引至约 85.3 亿美元（2026-11-02，CNBC 经 Techmeme 聚合转述）——单一来源 · 未核实：https://www.techmeme.com/261102/p38#a261102p38
- 线索雷达｜Linux 发行版厂商 SUSE 内部备忘录称将裁减约 10% 员工，理由是「自动化与 AI 正在根本改变软件公司的运作方式」（2026-11-02，The Register 经 Techmeme 聚合转述）——单一来源 · 未核实：https://www.techmeme.com/261102/p35#a261102p35
- 线索雷达｜Web 托管商 Squarespace 确认裁减全球约 19% 员工（约 300 人），公司正推进 AI 原生平台 Forma（2026-11-02，TechCrunch）——单一来源 · 未核实：https://techcrunch.com/2026/11/02/web-host-squarespace-lays-off-19-of-its-employees/
- 线索雷达｜机器人基础模型公司 Tutor Intelligence 完成 7500 万美元 B 轮，a16z 领投，累计融资 1.17 亿美元（2026-11-02，Forbes 经 Techmeme 聚合转述）——单一来源 · 未核实：https://www.techmeme.com/261102/p33#a261102p33
- 线索雷达｜特拉维夫 42AI 以 6250 万美元种子轮出隐身，宣称做「行为世界模型」预测人类决策，已在数家券商试运行（2026-11-02，TechCrunch）——单一来源 · 未核实：https://techcrunch.com/2026/11/02/42ai-comes-out-of-stealth-with-62-5m-and-a-world-model-that-can-predict-human-behavior/
- 线索雷达｜DeepSeek 为 DeepSeek Harness 推出「creator mode」，可快速生成自定义插件（2026-11-02，彭博经 Techmeme 聚合转述）——单一来源 · 未核实：https://www.techmeme.com/261102/p32#a261102p32
- 线索雷达｜研究者称大模型可直接读写神经网络权重，并用 GPT-6 Astra 修改 Qwen3.5-0.8B 权重以提升数学能力（2026-11-02，经 Techmeme 聚合转述）——单一来源 · 未核实：https://www.techmeme.com/261102/p36#a261102p36
- 线索雷达｜AI 数据中心水冷监测公司 Omen AI 以 1600 万美元现金加股票方式收购 Aquatic Labs（2026-11-02，TechCrunch）——单一来源 · 未核实：https://techcrunch.com/2026/11/02/omen-ai-adds-liquid-know-how-in-16-million-aquatic-labs-acquisition/
## 编辑备注

1. **本期检索时间范围**：主窗口 2026-11-02 07:00 – 2026-11-03 07:00（Asia/Shanghai），以事件首次公开时间为准；本期未使用 72 小时补收条目。覆盖一手源包括 Anthropic 提交 SEC 的 S-1/A-1 原文、OpenAI 官方博客与 RSS、llama.cpp 等仓库的 Release API、NVIDIA 开发者博客 RSS、Techmeme 聚合、TechCrunch 与 The Verge 报道，以及 OpenAI 与 Anthropic 状态页的历史故障记录。
2. **来源分级**：第 1、2、10 条为 Anthropic 提交 SEC 的 S-1/A-1 原文（一手），并与纽约邮报、Gizmodo、TechCrunch 交叉核对；第 3 条为 OpenAI 官方公告加 The Verge 报道；第 4 条为 TechCrunch 与 The Verge 两家报道交叉；第 5 条为 llama.cpp 官方 Release 正文；第 6、9 条为 OpenAI 与 NVIDIA 官方博客（本次抓取只取得标题、时间与链接，正文为前端动态渲染，未展开细节）；第 7、8 条为公司官方渠道声明经 TechCrunch 转述（分别为 OpenAI 致用户邮件、马斯克 X 发文）。线索雷达 9 条均为单一来源，未展开细节，不做推断。
3. **财务数字归属与更正**：第 1、2 条的营收、亏损与承诺金额全部取自招股文件原文；起草过程中曾把季度口径与九个月口径混淆，已按原文季度净亏损序列修正为第三季度 232.91 亿美元、前九个月 1040.39 亿美元、2025 财年 419.65 亿美元。招股文件中「Run-Rate Revenue」的具体数值在本次抓取文本中未能提取（该处为动态渲染或图形化内容），故本期不引用该数字。
4. **官方宣称归属**：第 1 条的营收与亏损为公司申报口径，未经独立审计以外的第三方验证；第 2 条的承诺金额为公司在申报文件中的前瞻性承诺；第 3 条的 1000 兆瓦与「约 70 万户家庭空调用电量为」为公司口径；第 7 条的额度池变化为公司邮件口径；第 8 条的成本表述为马斯克个人发言。
5. **去重**：EP001–EP007 已报道的 Anthropic 系统提示词约束与 Claude Code 限制、DeepSeek 开源 deepseek-harness、OpenAI 政策攻势与 AI compute campuses 命名、Cloudflare Q3 网络层 DDoS 数据、llama.cpp b12027–b12032、openai-python v3.42.1、NeuroXess 融资等，本期均未重复收录，仅在「后续追踪」中交代新增进展。
6. **采集限制**：openai.com 与 NVIDIA 部分博客页面对自动请求返回 403 或为前端动态渲染，只能从官方 RSS 取得标题、时间与链接；Techmeme 转述的付费墙来源（WSJ、CNBC、Bloomberg、Forbes、The Register）未取得原文，仅登记出处，未对其数字做独立核验。
7. **未收录说明**：Apple 2026 财年第四季度财报、Roku 第三季度财报、Mercado Bitcoin 安全事件与本期监测领域（全球 AI 及相关技术生态）关联度不足；NVIDIA 10-27 至 10-30 的博客与 Hugging Face 10-29 之前的文章均在本期窗口之外且此前已覆盖，未为凑条目收录。
