# AI 早报 2026-11-15

> 检索时间窗：2026-11-14 07:00 ~ 2026-11-15 07:00（Asia/Shanghai，24 小时）。本期无 72 小时补收条目。
> 目标读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者。
> 一手来源优先：官方博客与公告、GitHub Release、Hugging Face 官方博客；媒体口径逐条标注，官方宣称均标注「官方称」。
> 窗口说明：本期覆盖周六与周日，官方发布节奏明显放缓，条目数量按实际发生量确定，不为凑数收录低价值内容。

## 今日概览

**要闻**

1. Nvidia 两大股东联名致信董事会，要求考虑「黄仁勋回归」，两家合计持股 21.3 亿美元
2. 复职请愿签名超 11.5 万：含马斯克、Tim Sweeney、Garry Tan，5,965 名前 Nvidia 员工签署
3. 意大利数据保护局对 Meta 处以 8.05 亿欧元罚款，指其未经同意访问 Android 用户照片与视频
4. FAA 全国性停飞初步归因：偏远站点铜改光纤施工，承包商 L3Harris 可能安装了「故障路由器」
5. 微软 365 全球故障结束：持续约 36 小时、波及 74 个国家，全部服务已恢复

**开发生态**

6. langgraph 1.2.22 与 checkpoint 4.3.2 等四件套：存储检索分页、批量读取去重、子图独立线程流式输出
7. llama.cpp 1.0.0 之后的密集构建 b12378–b12387：修复 Qwen2-VL 量化权重缩放缺失导致输出乱码
8. Vercel AI SDK ai@5.0.290 与 ai@6.0.332：工具调用失败信息与消息历史保持一致，限制内存与 CPU 占用

**行业动态**

9. Databento 完成 1 亿美元 C 轮、估值 11 亿美元，称已服务六大前沿 AI 实验室中的五家
10. 特斯拉 Cybercab 自动驾驶订阅协议：车辆仅在 Tesla 地理围栏内可用，且围栏可随时变更

**安全事件**

11. CISA 将 UnrealIRCd CVE-2026-114713 列入在野利用目录：CVSS 8.6，可致服务器级命令注入

**前瞻与传闻**

- 亚洲多国政府就黄仁勋离职表态：部分确认芯片供应承诺，其他国家评估本地项目影响（TechCrunch · 单一来源 · 未核实）https://techcrunch.com/2026/11/14/asian-governments-react-to-nvidia-ceo-jensen-huangs-exit/
- 华盛顿邮报：Rubio 借一份关于 Alice Huang 的 CIA 报告改写自身立场，推动更严对华限制并促成黄仁勋去职（华盛顿邮报，经 Techmeme 聚合 · 单一来源 · 未核实）https://www.techmeme.com/261114/p10
- Forbes：黄仁勋在 Nvidia 不持超级投票权，公司治理结构放大了此次人事变动的影响（Forbes，经 Techmeme 聚合 · 分析性报道 · 未核实）https://www.techmeme.com/261114/p20
- Interconnects AI：黄仁勋辞职对美国开源模型融资是打击，其资助开源开发者的资金「很可能枯竭」（Nathan Lambert，分析观点 · 未证实）https://www.techmeme.com/261114/p15

## 要闻

### 1. Nvidia 两大股东联名致信董事会，要求考虑「黄仁勋回归」，两家合计持股 21.3 亿美元

**导语**

Nvidia 的两家机构股东 Altimeter Capital 与 Atreides Management 已联名致信公司董事会，要求董事会「权衡公司未来领导层的所有选项」，并把「黄仁勋可能回归」（the potential return of Jensen Huang）列入考虑范围。据 CNBC 报道，两家机构合计持有 21.3 亿美元 Nvidia 股票。本期未取得该信件原文，媒体口径称信件敦促董事会不要急于敲定继任者。

**详细内容**

据 CNBC 报道，这封信的措辞是要求董事会考虑包括黄仁勋回归在内的所有选项。Techmeme 聚合页收录了纽约时报、GeekWire、华盛顿观察家报、24/7 Wall St. 与 The Hill 的跟进报道，均以同一封信为核心。

这封信的发起方本身即股东利益相关方，其主张不等同于公司立场；Nvidia 董事会此前已表示正在挑选猎头公司、尚未正式接触任何候选人（本期见后续追踪）。值得注意的是，网络上同时流传着另一封「致董事会公开信」，多位知名业内人士已公开声明该版本系伪造，与本次由 CNBC 首报的股东联名信并非同一文件。

从治理角度看，这封信把「董事会继任决策」推入公开博弈阶段。Nvidia 目前由 CFO Colette Kress 兼任临时 CEO，永久继任者尚未公布。

**相关链接**

- https://www.techmeme.com/261114/p18 （CNBC 首发报道与多源跟进聚合页：纽约时报、GeekWire、华盛顿观察家报、24/7 Wall St.、The Hill）

### 2. 复职请愿签名超 11.5 万：含马斯克、Tim Sweeney、Garry Tan，5,965 名前 Nvidia 员工签署

**导语**

要求 Nvidia 董事会恢复黄仁勋 CEO 职位的在线请愿，签名数在周六下午突破 115,000 人。请愿网站披露的签署人构成包括 5,965 名现任 Nvidia 员工、1,108 名前员工与 63,063 名股东，联名者包括特斯拉与 SpaceX CEO 埃隆·马斯克、Epic Games CEO Tim Sweeney、Y Combinator CEO Garry Tan 与 Replit CEO Amjad Masad。

**详细内容**

据 TechCrunch 报道，请愿文本称签署人「担忧黄仁勋在没有实质程序的情况下被免职」，要求董事会「在独立调查查明事实的同时把他请回来」，并要求董事会确保调查公正、向公众提供更多信息。请愿页面写道：「Jensen deserves due process, not mob justice.」

签名增长节奏很快：Business Insider 在 11 月 15 日 03:01（CST）的报道口径为约 97,000 份签名，TechCrunch 在同日 05:41 的口径已更新为超过 115,000 份。Business Insider 与 TechCrunch 均给出请愿网站的分项数字（5,000+ 现任员工、接近 1,000 名前员工、54,000+ 股东，随后更新为 5,965 / 1,108 / 63,063）。

需要提醒读者两点：其一，请愿页面本身不提供签名身份校验，多位业内人士公开质疑其可信度；其二，请愿要求的是「独立调查 + 恢复职务」的主张，不等于公司治理程序已经启动。

**相关链接**

- https://techcrunch.com/2026/11/14/elon-musk-other-tech-execs-sign-petition-calling-on-nvidia-to-reinstate-jensen-huang/ （TechCrunch 原文，含请愿分项数字）
- https://www.techmeme.com/261114/p17 （Business Insider 首发报道与多源跟进聚合页）

### 3. 意大利数据保护局对 Meta 处以 8.05 亿欧元罚款，指其未经同意访问 Android 用户照片与视频

**导语**

意大利数据保护局（Autorità Garante per la protezione dei dati personali）宣布对 Meta 处以 8.05 亿欧元（约 8.87 亿美元）罚款，指其在未取得用户同意、也未告知用户的情况下访问了 Android 用户的照片与视频。该处罚由路透社于 11 月 14 日 23:10（CST）报道，Associated Press、CNBC、CBS News、BBC、彭博等多家媒体跟进。

**详细内容**

据路透社报道，意大利数据保护局是在当地时间周六宣布的这项罚款。报道口径中，执法机构指控 Meta 在未告知用户、未取得同意的情况下访问了 Android 用户的照片和视频。

本期未取得意大利数据保护局的官方公告原文，也未取得 Meta 的回应声明，因此处罚的具体法律依据、涉及的行为时间跨度与 Meta 是否申诉均未确认。该案对以移动端系统权限为核心的平台业务是一次高额执法示范：欧洲监管机构对「以系统权限访问用户媒体内容」这一 AI 产品常见做法（相册识别、端侧多模态功能）保持高度关注。

**相关链接**

- https://www.techmeme.com/261114/p11 （路透社首发与多家跟进媒体聚合页）

### 4. FAA 全国性停飞初步归因：偏远站点铜改光纤施工，承包商 L3Harris 可能安装了「故障路由器」

**导语**

美国交通部长 Sean Duffy 就 11 月 13 日的 FAA 全国性地面停飞给出初步归因：故障源在单一偏远站点，原有铜缆改光纤的施工导致该站点网络不稳，承包商 L3Harris 可能安装了「故障路由器」。该口径由华尔街日报于 11 月 15 日 01:15（CST）披露，30 余家媒体跟进报道。

**详细内容**

据华尔街日报报道，单一偏远地点的施工造成网络不稳定，最终导致主管部门下令全国性地面停飞；报道同时称承包商 L3Harris 提供的路由器可能存在问题。停飞期间各航空公司持续取消航班并重置系统。相关报道还提到，该事件使 L3Harris 股价承压（Barron's 报道），并有韩国 ICT 主管部门表示将检查本国因此次中断而受影响的部门（韩联社 / The Korea Times）。

FAA 上一期的相关动作是扩大空管 AI 工具 SMART 的全美使用，本期官方口径已把故障原因指向物理线路与路由设备，未提及 AI 系统或空管自动化工具。本期未取得 FAA 的正式事故调查报告，官方最终结论仍待发布。

**相关链接**

- https://www.techmeme.com/261114/p14 （华尔街日报首发与多源跟进聚合页）

### 5. 微软 365 全球故障结束：持续约 36 小时、波及 74 个国家，全部服务已恢复

**导语**

微软宣布全部 Microsoft 365 产品已恢复正常服务，结束了这场波及 74 个国家、持续约 36 小时、影响政府部门、交易机构、医院与企业的故障。据彭博社报道，微软称访问已完全恢复；BBC、Associated Press、Wired、Forbes 等多家媒体跟进。

**详细内容**

据彭博社报道，微软表示对其旗舰软件产品的访问已完全恢复，这场故障一度使多个国家的政府办公室、交易机构与企业停摆。多家媒体的跟进口径显示：故障期间 Outlook、Teams、OneDrive、Copilot 等服务大范围不可用；多国政府、医院与学校受到影响。

微软此前给出的定因是「网络容量升级」引起的技术问题，并明确表示与网络攻击、AI 或 agent 无关（本期延续该口径，见后续追踪）。本期新增的是恢复时点与影响面量化，以及一个尚未闭环的服务积分问题：媒体报道称部分企业客户可依据服务等级协议申请最高 100% 的服务积分，申领截止日为 12 月 31 日。

**相关链接**

- https://www.techmeme.com/261114/p8 （彭博社首发与多源跟进聚合页）

## 开发生态

### 6. langgraph 1.2.22 与 checkpoint 4.3.2 等四件套：存储检索分页、批量读取去重、子图独立线程流式输出

**导语**

LangGraph 于 11 月 14 日 09:31–09:43（CST）连续发布四个版本：langgraph 1.2.22、langgraph-checkpoint 4.3.2、langgraph-checkpoint-postgres 3.2.1、langgraph-prebuilt 1.1.2。本期主要改动集中在性能：InMemoryStore 检索按请求页停止、批量 store 读取用字典去重、单次 store 读取绕过 pipeline 执行、子图改为在独立线程上流式输出。

**详细内容**

据各 Release 正文，langgraph-checkpoint 4.3.2 包含三项性能修正：InMemoryStore 的搜索在到达请求页数时停止；批量 store 读取用字典去重，减少重复 I/O；langgraph-checkpoint-postgres 3.2.1 把单次 store 读操作移出 pipeline 执行，以避免长事务等待。langgraph 1.2.22 本身的一项修正是让子图在自己的线程上流式输出（stream a child graph on its own thread）。langgraph-prebuilt 1.1.2 的改动是只格式化 call_model 的错误消息，以减少输出噪音。

这批版本没有引入新的 API 破坏性变更，属于常规维护与性能优化；对使用 LangGraph 做长期运行 Agent 的团队，checkpoint-postgres 的读写路径优化值得在升级时留意。

**相关链接**

- https://github.com/langchain-ai/langgraph/releases/tag/1.2.22
- https://github.com/langchain-ai/langgraph/releases/tag/checkpoint%3D%3D4.3.2

### 7. llama.cpp 1.0.0 之后的密集构建 b12378–b12387：修复 Qwen2-VL 量化权重缩放缺失导致输出乱码

**导语**

llama.cpp 在 11 月 14 日 21:10 至 11 月 15 日 03:26（CST）之间连续发布 9 个构建（b12378、b12379、b12380、b12381、b12383、b12385、b12386、b12387 等）。其中 b12385 修复了一个影响 Qwen2-VL 的量化正确性缺陷：通用 NVFP4 权重缩放从未应用到 qwen2vl 图，模型会输出乱码，困惑度约 1e6。

**详细内容**

按 Release 正文，b12385 的修复说明是：qwen2vl 图向 ffn_up / gate / down 的权重缩放传入了 NULL，导致通用 pass 加载的逐张量 NVFP4 缩放根本没有被应用，模型因而产出垃圾输出（实测困惑度约 1e6）。使用 Qwen2-VL 并开启 NVFP4 量化的本地部署用户，如果此前出现过无意义输出，升级到 b12385 即可解决。

其余构建的方向性改动包括：mtmd 允许自定义视频解码器，并适配 wllama 需求；修复视频像素纵横比与视频旋转处理；避免只有填充的 Whisper 音频分块；jinja 模板渲染降低值分配与查找开销；ggml-backend 在无输入的分片中遇到不兼容权重时开启新分片；hexagon 后端修复 fa 无掩码尾部；修复 32 位下的 ctz64。这些都是 1.0.0 之后的高频构建节奏，属于修复与实验性特性并行推进的阶段。

**相关链接**

- https://github.com/ggml-org/llama.cpp/releases/tag/b12385
- https://github.com/ggml-org/llama.cpp/releases

### 8. Vercel AI SDK ai@5.0.290 与 ai@6.0.332：工具调用失败信息与消息历史保持一致，限制内存与 CPU 占用

**导语**

Vercel AI SDK 在 11 月 14 日 07:43 与 07:44（CST）先后发布 ai@5.0.290 与 ai@6.0.332。5.0.290 的两项改动是：默认让失败工具调用的错误文本与模型的消息历史保持一致（可用 `redactToolErrors: true` 改为返回 `onError` 的结果），以及防止过度的内存与 CPU 占用；6.0.332 为依赖更新，`@ai-sdk/gateway` 升到 3.0.237。

**详细内容**

按 Release 正文，5.0.290 的第一项改动针对 Agent 场景：工具调用失败时，默认把错误文本原样保留在模型的消息历史里，避免错误处理路径在不同 provider 之间产生不一致；需要隐藏原始错误文本的调用方可以打开 `redactToolErrors: true`，让历史中只保留 `onError` 的返回值。第二项改动是限制过度的内存与 CPU 占用，属于资源保护类修复。

两处改动都属于补丁级别，不涉及 API 破坏性变更，但对自建工具调用循环的 Agent 应用，错误文本是否进入模型上下文会直接影响重试行为与 token 消耗，建议按需选择开关默认值。

**相关链接**

- https://github.com/vercel/ai/releases/tag/ai%405.0.290
- https://github.com/vercel/ai/releases/tag/ai%406.0.332

## 行业动态

### 9. Databento 完成 1 亿美元 C 轮、估值 11 亿美元，称已服务六大前沿 AI 实验室中的五家

**导语**

市场数据 API 平台 Databento 完成 1 亿美元 C 轮融资，投后估值 11 亿美元。公司称其客户包含六大前沿 AI 实验室中的五家。融资由 FinTech Global 于 11 月 15 日 02:35（CST）报道，Databento 官方渠道已确认该轮融资。

**详细内容**

据 FinTech Global 报道，Databento 为现代金融行业提供市场数据 API，本轮 1 亿美元 C 轮融资将公司估值推至 11 亿美元。报道引述公司说法：Databento 与六大前沿 AI 实验室中的五家签有合同。聚合页同时收录了 Databento 官方发布以及 The SaaS News、FinSMEs、RuntimeWire、Pulse 2.0、VC News Daily 等跟进报道。

值得记录的是这家公司所处的位置：它并不训练模型，而是为前沿实验室与量化机构提供行情与市场结构数据。随着 Agent 参与金融决策与交易场景，这类「结构化市场数据 API」正在成为 AI 系统的上游依赖。融资金额与估值均为报道口径，公司未披露具体客户名单。

**相关链接**

- https://www.techmeme.com/261114/p16 （FinTech Global 首发与多源跟进聚合页）

### 10. 特斯拉 Cybercab 自动驾驶订阅协议：车辆仅在 Tesla 地理围栏内可用，且围栏可随时变更

**导语**

特斯拉公布的 Cybercab 自动驾驶订阅协议文本显示，车辆只能在特斯拉启用的地理围栏（geofences）内工作，而该围栏范围由特斯拉随时可以更改。对应的 Cybercab 售价为 29,990 美元。该协议细节由 Electrek 于 11 月 15 日 00:01（CST）披露，The Verge、路透社、PCMag 等多家媒体跟进。

**详细内容**

据 Electrek 报道，特斯拉已公示随 Cybercab 提供的订阅协议文本，其中自动驾驶订阅的有效性以「特斯拉启用的地理围栏」为前提，且公司保留随时变更围栏的权利；报道认为实际条款比下单页显示的更严格。Cybercab 售价为 29,990 美元。

本期未取得协议原文全文，条款细节以媒体报道为准。对关注自动驾驶商业模式落地的读者，这条协议的实际含义是：自动驾驶订阅的可用范围由厂商单方面定义，随订阅购买的并不是对特定路段的长期能力承诺。

**相关链接**

- https://www.techmeme.com/261114/p12 （Electrek 首发与多源跟进聚合页）

## 安全事件

### 11. CISA 将 UnrealIRCd CVE-2026-114713 列入在野利用目录：CVSS 8.6，可致服务器级命令注入

**导语**

美国网络安全与基础设施安全局（CISA）于 11 月 13 日（周五）把影响开源 IRC 服务器 UnrealIRCd 的高危缺陷 CVE-2026-114713 加入「已知被利用漏洞」（KEV）目录，理由是已收到在野利用报告。该漏洞 CVSS 评分为 8.6，属于分隔符不当处理导致的服务器级命令注入。

**详细内容**

据 The Hacker News 报道，CISA 在周五将 CVE-2026-114713 加入 KEV 目录。该缺陷的成因是「分隔符的中和处理不当」，可导致服务器级命令注入；一旦被利用，攻击者可在 UnrealIRCd 服务端执行命令，属于典型的远程无认证高危路径。

官方处置路径是标准的 KEV 流程：被列入目录后，美国联邦机构的修补义务与时限被强制触发，同时该编号进入公开的已知在野利用清单，可供各机构扫描与防护策略直接消费。本期未取得 CISA 通告原文与受影响版本的精确区间，相关细节以媒体报道口径为准。

**相关链接**

- https://thehackernews.com/2026/11/attackers-exploit-unrealircd-flaw-that.html
- https://www.cisa.gov/known-exploited-vulnerabilities-catalog （CISA KEV 目录官方入口）

## 后续追踪

- **Nvidia CEO 继任**：此前已确认黄仁勋辞任、CFO Colette Kress 兼任临时 CEO、董事会启动内部与外部候选人搜寻，董事会向 CNBC 表示正在挑选猎头公司且尚未正式接触任何候选人 → 本期新进展：Altimeter 与 Atreides 联名致信要求董事会考虑「黄仁勋回归」（两家合计持股 21.3 亿美元），复职请愿签名超 11.5 万（含马斯克、Tim Sweeney、Garry Tan、Amjad Masad，5,965 名前员工、63,063 名股东签署）→ 下一步关注：正式候选人名单与公布时点、临时 CEO 任期安排、11-17 第三财季财报对领导层变动的表述。
- **微软 365 全球故障**：此前已确认故障范围与微软官方定因（网络容量升级引起的技术问题，与网络攻击、AI/agent 无关）→ 本期新进展：全部服务已恢复，故障持续约 36 小时、波及 74 个国家；媒体口径称部分企业可申请最高 100% 服务积分，申领截止 12 月 31 日 → 下一步关注：官方根因复盘、监管机构与客户索赔进展、企业侧是否收到积分。
- **FAA 全国性停飞与空管 AI 工具 SMART**：此前已确认 FAA 把空管 AI 工具 SMART 推广至全美、同期发生全国性停飞，AI 工具开发商 ASI 公开否认与停飞相关 → 本期新进展：交通部长 Sean Duffy 初步归因于偏远站点铜改光纤施工，承包商 L3Harris 可能安装了「故障路由器」，未提及 AI 系统 → 下一步关注：FAA 正式事故调查报告、承包商与路由器厂商的技术说明、SMART 系统在恢复后的运行状态。
- **Windows 11 月补丁与 GitHub Copilot 模型退役**：此前已确认 Copilot 将于 12 月 14 日退役 6 个模型（含 Gemini 3.8 Flash、Grok 4.6 等）并给出替代映射 → 本期新进展：本期窗口内未出现迁移完成度或替代模型公布方面的实质新增 → 下一步关注：Kimi K3 的替代模型公布、12 月 14 日前各模型的停用进度。

## 编辑备注

1. **本期真实检索时间窗**：2026-11-14 07:00 ~ 2026-11-15 07:00（Asia/Shanghai）。未做 72 小时补收 —— EP018 与 EP019 已分别覆盖 11-12 ~ 11-13 与 11-13 ~ 11-14 窗口。
2. **周末效应**：本期覆盖周六与周日，官方发布明显放缓。GitHub 侧在窗口内仅有 langgraph（4 个版本）、llama.cpp（9 个构建）、vercel/ai（2 个版本）产生版本发布；transformers、claude-code、openai-python、vLLM、sglang、ollama、MCP SDK 等高频仓库窗口内无新版本。
3. **采集限制（按实际情况披露）**：NotebookLM research（fast，四轮）返回了 40 条来源线索，但四轮的 report 字段均为空，本期改用「窗口摘要作为 source + chat 研判」的方式完成排序，研判结果已落盘于 `ep020/work/nblm_chat.json`；GitHub API 未认证配额本小时仅剩约 27 次，GitHub 侧事实一律以 Release 官方正文核对；DeepMind、Mistral、Microsoft AI、Perplexity、TechCrunch-Developer 的 feed 返回 HTML 页面或 JS 质询页，Google Innovation 与 arXiv cs.CL 解析失败；OpenAI 官方 RSS 最新条目时间为 11-13 23:00，Anthropic 与 Meta AI 的 feed 在本环境不可用 —— 这几处意味着本期对这几家官方渠道的覆盖可能存在遗漏。
4. **媒体报道口径的证据等级**：第 1、2、3、4、5、9、10 条均为多源交叉（聚合页列出多家跟进媒体），但均未取得官方原文，因此按「媒体口径」表述，涉及数字时保留原文数字并标明出处。
5. **两类易误读信息已做处理**：一是网络上流传的一封「致 Nvidia 董事会公开信」被多位业内人士公开声明为伪造，与 CNBC 首报的股东联名信不是同一文件，本期正文只写后者；二是 TechCrunch 的「AI 墓地」盘点文章与 Forbes、Interconnects AI 的分析文章属盘点与观点，本期一律不作为完整条目，只在必要时作为背景写入线索雷达。
