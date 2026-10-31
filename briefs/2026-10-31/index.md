# AI 早报 2026-10-31

> 第 005 期 · 检索窗口：2026-10-30 07:00 – 2026-10-31 07:00（Asia/Shanghai，24 小时，以事件首次公开时间为准）
> 目标读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者

## 今日概览

**要闻**

1. OpenAI、Google、Microsoft、Anthropic 宣布采用统一的 robots.txt AI 训练偏好标准
2. Google Project Suncatcher 原型卫星在轨完成首次 AI 推理，Gemma 4 生成太空俳句
3. Anthropic 重命名订阅套餐为 Max 与 Ultra，已验证账号取消 5 小时用量限制
4. OpenAI 发布社区安全报告并加强青少年保护，收紧未成年人武器相关回答

**开发生态**

5. llama.cpp 连发 b12007–b12017，KV cache 旋转常量常驻 GPU，Gemma 3n/4 修复 tied output 重复占用
6. HuggingFace transformers v5.22.1 发布，v5.22.0 已加入 Mistral Large 4 支持

**模型发布**

7. Google 发布 Gemini 4 Carbon，官方称在 Artificial Analysis 指数 v5.0 排名第一

**产品应用**

8. DoorDash 称第三方 AI 代理带来的订单仅「数百单」，对照日均 300 万单
9. Ollie 隐私向 AI 助手宣布 11 月 6 日关停

**技术与洞察**

10. AI 资本开支焦虑升温：Alphabet 等四家 2026 年资本开支超 7400 亿美元，纳指当日下跌 2.9%

**行业动态**

11. Salesforce 收购国防 AI 后勤软件公司 Rune，3.75 亿美元现金加股票
12. 据 FT 报道，Anthropic IPO 后预计获信用评级机构「高」等级垃圾债评级

**前瞻与传闻**

- Bloomberg：Alphabet、Meta、Microsoft、Amazon、Oracle 未来数年 AI 支出承诺合计超 3 万亿美元
- Bloomberg：Google 与美国国防部就 Golden Dome 导弹防御项目的数据安全工作展开磋商
- SEC 文件（经 GeekWire 转述）：供电 chiplet 公司 Powerlattice 完成 8600 万美元融资
- 伦敦高等法院驳回 Meta、TikTok、X 对 Ofcom 信息要求令的挑战

## 要闻

### 1. OpenAI、Google、Microsoft、Anthropic 宣布采用统一的 robots.txt AI 训练偏好标准

**导语**

四家主要模型厂商宣布共同支持一种基于 robots.txt 的统一信号，允许网站运营方一次性声明 AI 训练偏好，并让该偏好在多个爬虫之间生效。OpenAI 官方公告确认将遵守这一共享信号，The Verge 报道称 Google、Microsoft、Anthropic 也将采用同一标准。

**详细内容**

OpenAI 在官方 RSS 中发布《Making it easier for websites to express AI training preferences》，说明公司将遵守一种共享的 robots.txt 信号，帮助网站运营方把 AI 训练偏好传达给参与的提供方。此前各家的偏好表达方式互不通用，网站若要拒绝被训练，需要分别配置多家厂商的规则。

The Verge 的报道给出了四家厂商的一致表态范围：OpenAI、Google、Microsoft、Anthropic 均将采用该标准，出版方只需在一处声明，便可让多个抓取方遵循。这对依赖网页语料训练与抓取的团队有直接影响，需要把新的偏好声明纳入站点的 robots.txt 配置与数据合规流程。

需要说明的是，本条的一手事实依据为 OpenAI 官方条目标题与摘要，四家厂商的完整表述细节与标准的技术规范（信号字段名、支持节奏）未在本次抓取中取得正文，官方正文页在本次采集环境返回 HTTP 403。

**相关链接**

- https://openai.com/index/helping-websites-express-ai-training-preferences （官方公告）
- https://www.techmeme.com/261030/p26 （The Verge 报道聚合页）

### 2. Google Project Suncatcher 原型卫星在轨完成首次 AI 推理，Gemma 4 生成太空俳句

**导语**

Google 官方博客确认，Project Suncatcher 原型卫星在 10 月 1 日发射后已完成在轨调试，本周取得「Hello World」里程碑：首次从轨道上的数据中心级 TPU 得到 AI 响应。地面站向卫星上预载的 Gemma 4 开放权重模型下达指令，要求其生成一首关于太空的俳句。

**详细内容**

据 Google Research 高级总监 Travis Beals 的说明，调试清单包括主机与 TPU 托盘上电，以及早期机器学习测试的跑通。在卫星经过挪威斯瓦尔巴群岛上空的一次地面站过境期间，下行诗句确认链路成功，返回内容为：Blue marble below / Data streams in silent grace / Starlight feeds my core。此后 Google 又测试了太空主题的五行诗，以及用于报告载荷系统技术状态的遥测指令。

TechCrunch 报道补充了工程约束：该卫星携带四块 Google TPU，可产生最高 1 kW 电力；TPU 的功耗需求意味着一块芯片一次只能开启约 20 分钟，这使得地空通信更为困难。Google 表示后续测试将评估芯片在热应力与太空辐射环境下的表现——辐射会造成「位翻转」，即内存中存储的数值被改变而不触发常规监控工具；地面测试显示辐射对推理负载影响较小、对训练影响更大。Google 计划在 2027 年发射两颗互联卫星，验证更高速的星间链路。

Google 官方博客未给出上述四块 TPU、1 kW 与 20 分钟的工程数字，该部分以媒体报道为准。

**相关链接**

- https://blog.google/innovation-and-ai/models-and-research/google-research/project-suncatcher-satellite-response/ （官方博客）
- https://techcrunch.com/2026/10/30/googles-first-data-center-satellite-is-online-and-writing-poetry/ （报道）

### 3. Anthropic 重命名订阅套餐为 Max 与 Ultra，已验证账号取消 5 小时用量限制

**导语**

Anthropic 将个人订阅套餐重新命名为 Max（每月 100 美元）与 Ultra（每月 200 美元），价格不变。官方定价页确认 Ultra 对已验证账号不再设 5 小时用量限制，并提供每周 10 倍 Pro 额度；同时 Max 与 Ultra 的月度 API 额度分别调整为 100 美元与 200 美元。

**详细内容**

据 Anthropic 官方说明，Max 5x 改名为 Max，Max 20x 改名为 Ultra；已是订阅用户的无需操作。主要变化在额度结构：官方定价页显示 Max 提供每 5 小时与每周各 5 倍 Pro 用量，Ultra 在此基础上把每周额度提高到 10 倍 Pro，并对已验证账号取消 5 小时限制（官方脚注为「No 5-hour limit for verified accounts」），页面同时标注较新的账号暂时保留该限制。

API 额度部分同步调整：Max 每月包含 100 美元 Claude Platform 额度，Ultra 为 200 美元。Claude 帮助中心对 Max 套餐的说明为「每 5 小时与每周提供 Pro 套餐五倍用量」，与定价页口径一致。

对做 Claude Code 或 API 集成的开发者，套餐命名与额度口径的变化需要在用量预估、成本测算与文档中同步更新；官方同时提示「用量达到限额的速度取决于所用模型、对话时长与文件大小」。

**相关链接**

- https://www.anthropic.com/pricing （官方定价页）
- https://support.anthropic.com/en/articles/11049741-what-is-the-max-plan （官方帮助中心）

### 4. OpenAI 发布社区安全报告并加强青少年保护，收紧未成年人武器相关回答

**导语**

OpenAI 官方发布《Community safety report and new protections for teens》，称将加强 ChatGPT 的暴力防护，扩大防护措施、提前介入，并承诺就公共安全做报告。同期 Techmeme 收录的报道指出，该更新收紧了 ChatGPT 对青少年提供的武器相关信息，即使提问表面无害。

**详细内容**

官方条目的摘要为：「OpenAI 正在通过扩大防护措施、提前介入，并新增公共安全报告承诺，强化 ChatGPT 中的暴力防护。」这是本期 OpenAI 官方渠道在安全方向上的第三条公开动作——前两条分别是 10 月 30 日 08:00 CST 发布的《Fair use benefits everyone》（整理创作者、学者、无障碍倡导者与法律专家的法庭书状摘录，说明合理使用如何支持 AI 训练与创新），以及同日稍早发布的《An updated Model Spec for more capable and beneficial AI》。

官方正文页在本次采集环境返回 HTTP 403，因此本条只陈述官方标题与摘要所载内容，具体条款、适用范围与生效时间未取到原文，不做推断。

**相关链接**

- https://openai.com/index/community-safety-report-and-new-protections-for-teens （官方公告）
- https://openai.com/news/rss.xml （官方 RSS 条目确认）

## 开发生态

### 5. llama.cpp 连发 b12007–b12017，KV cache 旋转常量常驻 GPU，Gemma 3n/4 修复 tied output 重复占用

**导语**

llama.cpp 在 10 月 30 日 21:50 至 10 月 31 日 04:19（CST）间连发 b12007、b12008、b12012、b12014、b12015、b12017 共六个构建。其中 b12007 把 KV cache 的旋转常量常驻 GPU 并支持 per-layer rotation，b12008 修复 Gemma 3n/4 在 tied output 场景下 token_embd 重复占用的问题。

**详细内容**

b12007 的核心变更把 KV cache 旋转常量保留在 GPU 侧，并逐层支持旋转缓冲；同时为混合滑动窗口注意力的旋转输入与混合放置检查提供修复，并为 `mistral-large4` 与 `dflash` 两个模型启用 per-layer rotation。该提交由 Codex 协助完成。

b12008 修复了 Gemma 3n 与 Gemma 4 的 tied output 场景：在输入与输出共享缓冲区类型时（例如纯 CPU、`-ngl 0`），重复的输出查表会因 token_embd 未先创建而把表载入两次。官方给出的实测数据是，`gemma-4-E2B-it` Q4_K_M、不使用 mmap 时，CPU 模型缓冲区从 3163.73 MiB 降到 2947.73 MiB。

其余构建为常规维护：b12012 将 `cpp-httplib` 更新到 0.64.0；b12014 删除 Windows argv 重建逻辑（#31329 的 manifest 已保证 argv 为 UTF-8，同时修复 #26416）；b12015 与 b12017 删除 `fs_path_to_utf8()`。

**相关链接**

- https://github.com/ggml-org/llama.cpp/releases （Release 列表）

### 6. HuggingFace transformers v5.22.1 发布，v5.22.0 已加入 Mistral Large 4 支持

**导语**

HuggingFace transformers 于 10 月 30 日 17:36 CST 发布补丁版 v5.22.1。此前一日的 v5.22.0 已将 Mistral Large 4（Le Chonk）纳入新模型支持列表，v5.22.1 移除了该模型的 WIP 文档页。

**详细内容**

v5.22.1 是一次纯文档修补，官方说明为「只需修复文档」，具体改动是移除 Ml4（即 Mistral Large 4）的 WIP 文档引用。

更关键的是 10 月 29 日 22:15 CST 发布的 v5.22.0，其「新模型」章节以 Mistral Large 4 为首条，新增该模型的支持。同日 v5.21.1 修复了 `rope_scaling` setter 在初始化期赋值时的行为，官方说明此前该问题破坏了 vLLM 的远程代码加载。

对使用开权模型的团队，这意味着 transformers 侧对 Mistral Large 4 的支持已就位；结合第 5 条 llama.cpp 对 `mistral-large4` 的 per-layer rotation 支持，推理框架侧的支持进度在近两日已连续确认。

**相关链接**

- https://github.com/huggingface/transformers/releases （Release 列表）
- https://github.com/huggingface/transformers/pull/50124 （v5.22.1 移除 WIP 文档的 PR）

## 模型发布

### 7. Google 发布 Gemini 4 Carbon，官方称在 Artificial Analysis 指数 v5.0 排名第一

**导语**

Google 发布下一代前沿模型 Gemini 4 Carbon。官方称其在刚更新的 Artificial Analysis Intelligence Index v5.0 上以 59 分排名第一，并在漏洞发现基准 SEC-bench Pro 达到 88.2%。该模型沿用前代 Gemini 4 Argon 的首发价格：每百万输入 token 2 美元、每百万输出 token 10 美元。

**详细内容**

据 Google DeepMind 首席 AI 架构师 Koray Kavukcuoglu 的说明，Carbon 的定位是具备先进网络安全能力与长周期任务能力，官方称其在编码与智能体任务上均有显著提升。在网络安全维度，官方给出的数字为：SEC-bench Pro（漏洞发现）88.2%、ExploitGym（漏洞利用）54.8%、CWE-bench（补丁修复）71.0%；在 WebDev Arena 上提升 89 elo，排在第 4 位（1768 分）。这些均为官方内部与第三方榜单数据，官方另称在内部评测中实现了安全代码生成的成功率提升逾 2 倍。

上线节奏是分阶段的：本周起先向一部分网络防御方开放，随后通过 Fairwind Program 逐步扩展到更多可信伙伴，官方表示在收集反馈、完善护栏之后才会通过产品面向开发者、企业与消费者开放。Google 同时表示正积极参与美国政府的自愿预发布模型测试流程。

价格为官方数据：与两周前发布的 Argon 保持相同的介绍价，每百万输入 token 2 美元、每百万输出 token 10 美元，缓存输入 token 按输入价的 95% 折扣计费。

本条为 72 小时补收：模型首次公开时间为 10 月 28 日 17:00 UTC（10 月 29 日 01:00 CST），落在本期 24 小时窗口之外，但因被前几期遗漏且属重量级发布，本期补入并标注时间。

**相关链接**

- https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-carbon/ （官方发布文）
- https://artificialanalysis.ai/ （榜单提供方）

## 产品应用

### 8. DoorDash 称第三方 AI 代理带来的订单仅「数百单」，对照日均 300 万单

**导语**

DoorDash 在第三季财报电话会上表示，来自 Muse、Instinct、Fo 等第三方 AI 代理的订单总量仅「数百单」。作为对照，公司称 2025 年报告口径下平均每天完成 300 万次配送。

**详细内容**

CEO Tony Xu 在回答分析师提问时的原话要点是：这件事仍处在「非常动态」的阶段，技术领域「永远不要对抗重力」，但也不应当「自欺」。据 TechCrunch 报道，他表示用户目前仍主要通过 DoorDash 自有应用下单。

公司同时说明了自己的代理布局：9 月上线的文字下单代理、7 月的 CLI 代理、6 月的 Ask DoorDash 聊天机器人（支持用提示词与照片下单），以及一个用于支持企业下单的 MCP。Xu 表示公司希望了解代理化用例，并与第三方代理厂商建立良性关系，未来可能在这些代理内部投放广告。

对做 Agent 商务与 MCP 集成的开发者，这组数字提供了一个来自一线的现实基线：当前代理下单在整体交易量中占比仍然极小。

**相关链接**

- https://techcrunch.com/2026/10/30/doordash-said-its-only-received-several-hundred-orders-from-ai-agents/ （报道）

### 9. Ollie 隐私向 AI 助手宣布 11 月 6 日关停

**导语**

隐私向 AI 助手 Ollie 宣布将于 11 月 6 日正式关停。联合创始人兼 CEO Bill Lennon 于周五在 X 上宣布了这一消息。公司今年 9 月刚完成由 Khosla Ventures 领投的 750 万美元种子轮。

**详细内容**

Ollie 是一款订阅制文字 AI 助手，定位是帮助家庭保持联系与组织生活，可连接用户的邮箱与日历，提供预约安排、餐食计划与账单支付等功能，并计划进一步扩展到家庭预算管理。据 TechCrunch 报道，Ollie 是较早通过 SOC 2 隐私合规审计的主流应用之一。

Lennon 对关停给出的解释是行业竞争压力：「我们做得不错，但最终没能跟上」，并具体提到 Muse、Instinct 等新进入者让团队更难脱颖而出、增长并筹集所需资金。他补充说，用户将在未来几天收到数据导出与退款的说明。

**相关链接**

- https://techcrunch.com/2026/10/30/ollie-a-privacy-focused-ai-assistant-is-shutting-down/ （报道）

## 技术与洞察

### 10. AI 资本开支焦虑升温：Alphabet 等四家 2026 年资本开支超 7400 亿美元，纳指当日下跌 2.9%

**导语**

据 TechCrunch 报道，Alphabet、Amazon、Meta 与 Microsoft 在过去两周内披露了今年合计超过 7400 亿美元的资本开支计划，市场普遍将其解读为 AI 基础设施投入。焦虑情绪在周五蔓延至整体市场，纳斯达克指数当日下跌 2.9%，芯片股同步下挫。

**详细内容**

报道给出的公司层面数字为：Alphabet 第三季自由现金流为负 91 亿美元，为连续第二个季度为负，季度资本开支 514 亿美元，全年预计支出至多 2050 亿美元；其搜索广告业务（占收入约一半）增速放缓至 12%，为五个季度最弱。Amazon 过去 12 个月自由现金流为负 424 亿美元，而上年同期为正 148 亿美元，全年预计资本开支 2200 亿美元，AWS 收入同比增长 39%，财报后股价下跌 7%。Meta 第三季自由现金流为负 21 亿美元，全年资本开支指引至多 1450 亿美元，广告收入同比增长 26%，上周股价下跌 10%；公司称其新推出的免费个人 AI 代理 Muse 运行「非常消耗算力」。Microsoft 是唯一自由现金流为正的厂商，最近一季为正 186 亿美元，资本开支 452 亿美元，低于此前 500 亿美元的预期，公司称这并非主动收缩 AI 支出，而是第三方提供方的容量延迟所致。

市场表现方面，周五纳斯达克下跌 2.9%，Nvidia 下跌 4%，Broadcom 跌幅超过 5%，Qualcomm 下跌 11%；Alphabet 在前一日已下跌 12%，为该股历史上最差单日表现，市值蒸发约 5000 亿美元。

对开发者与算力使用方的直接影响在于：折旧与产能扩张的节奏、推理单价的中期走向、以及大厂在应用层（代理产品）上的投入取舍，都是这条线索的延伸观察点。本条数字均为媒体转述的财报口径，未取到各公司一手财报原文。

**相关链接**

- https://techcrunch.com/2026/10/30/cracks-are-emerging-in-the-ai-spending-boom/ （报道）
- https://www.techmeme.com/261030/p22 （Bloomberg 汇总报道聚合页）

## 行业动态

### 11. Salesforce 收购国防 AI 后勤软件公司 Rune，3.75 亿美元现金加股票

**导语**

Salesforce 签署最终协议收购 Rune Technologies，一家做军事后勤与保障软件的国防科技公司。据 Resilience Media 援引两位知情人士的说法，交易对价为 3.75 亿美元，以现金加股票组合支付。

**详细内容**

Axios 的报道确认了交易的存在，称 Salesforce 已签署最终协议，并将 Rune 称为其规模最大的、以国家安全为重点的收购案，同时表示未披露交易条款。Resilience Media 报道称 Rune 此前已从 a16z 等机构融资 3000 万美元。

Rune 主营军事软件与硬件开发，覆盖后勤与保障（logistics and sustainment）环节。交易金额、支付结构的具体细节目前仅见于媒体转述，Salesforce 未公开确认，官方公告文本在本次采集环境中未取到。

**相关链接**

- https://www.techmeme.com/261030/p17 （Axios 与 Resilience Media 报道聚合页）

### 12. 据 FT 报道，Anthropic IPO 后预计获信用评级机构「高」等级垃圾债评级

**导语**

据金融时报报道，在 Anthropic 完成首次公开募股后，信用评级机构预计将给予其「高」等级垃圾债评级。报道提到，黑石在为其芯片采购牵头的 630 亿美元融资交易中向投资者传达了这一预期。

**详细内容**

TechCrunch 转述 FT 的报道称，黑石此前曾表示相反的预期，认为在 2027 年之前 Anthropic 会获得投资级评级；现在其预期变为 BB 区间，即投机级「垃圾债」中的最高一档。

TechCrunch 就此联系 Anthropic 与黑石，两者均拒绝置评。TechCrunch 同时指出，评级本身只是预测，但对 Anthropic 而言，高等级垃圾债评级会提高其后续融资的难度与成本，而这家公司过去 12 个月已签下大量算力采购合同。

Anthropic 官网已确认公司于 10 月 26 日向美国证券交易委员会提交 S-1 上市注册声明。本条评级信息目前仅见于 FT 一家报道，Anthropic 与黑石均未确认，按单一来源处理，未做进一步推断。

**相关链接**

- https://techcrunch.com/2026/10/30/anthropic-expected-to-receive-high-junk-rating-from-credit-agencies-following-ipo-report-says/ （TechCrunch 转述 FT）
- https://www.anthropic.com/news/s1-sec （Anthropic 官方 S-1 公告）

## 前瞻与传闻

以下条目为单一来源线索，未取得一手原文，仅保留标题、来源与日期，不展开细节、不做推断。

- **Alphabet、Meta、Microsoft、Amazon 与 Oracle 未来数年 AI 支出承诺合计超 3 万亿美元**（Bloomberg，经 Techmeme 汇总，2026-10-31 00:00 CST）——摘要提及 Alphabet 的 1 万亿与 Meta 的 8000 亿美元口径，原文未取。https://www.techmeme.com/261030/p22
- **Google 与美国国防部就 Golden Dome 导弹防御项目的数据安全工作展开磋商**（Bloomberg「Sources」，经 Techmeme 汇总，2026-10-31 06:50 CST）——属消息人士级转述，未见官方确认。https://www.techmeme.com/261030/p28
- **供电 chiplet 公司 Powerlattice 完成 8600 万美元融资，宣称可降低 AI 算力功耗 50% 以上**（SEC 文件，经 GeekWire 转述，2026-10-31 06:05 CST）——SEC EDGAR 原文本次返回 403，未核。https://www.techmeme.com/261030/p27
- **伦敦高等法院驳回 Meta、TikTok 与 X 对 Ofcom 在线安全法信息要求令的挑战**（法务报道，经 Techmeme 汇总，2026-10-31 00:10 CST）——仅取到摘要。https://www.techmeme.com/261030/p15

## 后续追踪

- **Mistral Le Chonk 开权生态**：EP004 报道权重开放 → transformers v5.22.0 已加入 Mistral Large 4 支持，llama.cpp b12007 起对 `mistral-large4` 启用 per-layer rotation → 下一步关注 vLLM、SGLang 的实测支持与 HF 上的量化版本部署成本。
- **Reddit 登录墙**：EP004 报道将强制登录以应对 AI 抓取 → 本期第三季营收指引疲弱，周五股价收跌 29.27%，为 2024 年上市以来最大单日跌幅 → 下一步关注 Q4 实际流量结构、登录墙覆盖范围与过渡安排。
- **Anthropic 上市进程**：EP003 曾将 S-1 列入追踪 → 官网确认 10 月 26 日已提交 S-1，本期新增 FT 报道的「高等级垃圾债」评级预期 → 下一步关注 SEC EDGAR 原始文件的募资规模、与黑石 630 亿美元融资交易的关系，以及评级机构正式表态。
- **AI 资本开支周期**：EP003 报道 Alphabet 第三季财报、EP004 报道 Amazon 第三季 → 本期跨公司口径显示四家合计 7400 亿美元资本开支，纳指当日跌 2.9% → 下一步关注各厂自由现金流缺口对推理定价与产品投入节奏的传导。
- **Codex CLI 与 llama.cpp 节奏**：本期 llama.cpp 六个构建中含 KV cache 与 tied output 两处实质改动 → 下一步关注 0.166.0 之后的稳定版节奏与 Gemma 4 系列在主流推理框架的支持进度。

## 编辑备注

1. **本期真实检索时间窗**：24 小时窗口为 2026-10-30 07:00 – 2026-10-31 07:00（Asia/Shanghai）＝ 2026-10-29 23:00Z – 2026-10-30 23:00Z，以事件首次公开时间为准。第 7 条（Gemini 4 Carbon，2026-10-29 01:00 CST 首次公开）属 13.1 允许的 72 小时补收，已在正文标注。
2. **抓取限制**：`openai.com/index/*` 正文页在本次环境返回 HTTP 403（直连与 firecrawl 两条路径均未取到），故第 1、4 条只陈述官方标题与摘要所载内容；`sec.gov` EDGAR、`investor.redditinc.com`、`investor.doordash.com` 返回 403/404/空响应；Techmeme 单篇页正文由 JS 渲染，仅取到标题与摘要行；`firecrawl-firecrawl-scrape` 返回 `status=replayed` 且 `result=null`。因此第 10 条的财报数字、第 12 条的评级预期均为媒体转述口径，已逐条标明来源。
3. **来源分级**：本刊公开版完整条目均达到「官方已确认」或「多源交叉」——第 1、3、5、6、7 条有一级源原文，第 2 条有官方博客全文，第 4 条有官方 RSS 条目，第 8、9、11 条为多源一致的媒体报道，第 10、12 条为单一权威财经媒体转述且已在正文标明出处。「前瞻与传闻」四条均为单一来源，统一标注不展开。
4. **官方宣称归属**：第 7 条的全部基准与价格数字均归属 Google 官方表述，未表述为已独立验证的事实；第 2 条的四块 TPU、1 kW、20 分钟为媒体报道口径，与官方博客正文分列。
5. **去重**：第 003–004 期已报道的 Mistral Le Chonk 权重、OpenAI Model Spec 与失准检测、Gemini App 文件编辑、Reddit 登录墙、Codex CLI rust-v0.166.0、llama.cpp b11982–b11988、Deepgram 收购 Daily/Pipecat、Alphabet AI Mode 广告扩区、MCP 参考服务器 v2.2.0、OpenAI Python v3.41.0、Artificial Analysis Intelligence Index v5、Anthropic AI for Science 扩容本期均未重复收录，仅在「后续追踪」中交代新增进展。
6. **未收录说明**：Theranos 吹哨人言论、Apollo 关于 AI 财务回报的观点、Grok AI 短片发布、微软大规模买断计划等，本期无实质新事实或与目标读者关联度低，未予收录；同理未为凑条目收录 Zest 餐厅礼宾等单一来源产品发布（评分 64，低于 70 分收录线）。
