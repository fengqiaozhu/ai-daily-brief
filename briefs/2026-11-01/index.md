# AI 早报 2026-11-01

> 第 006 期　｜　检索窗口：2026-10-31 07:00 – 2026-11-01 07:00（Asia/Shanghai）
> 读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者

## 今日概览

**要闻**

1. OpenAI 最新一轮融资目标从 300 亿美元下调至约 200 亿美元，估值降至 1.25 万亿美元
2. ChatGPT 分享链接漏洞可执行攻击者代码并读取私有会话，OpenAI 定级 P1 并已修复
3. Anthropic 称恶意行为者利用 Cursor 市场权限发布「被篡改」的 Claude Code 扩展副本

**开发生态**

4. llama.cpp 连发 b12018–b12024：修复 `/v1/responses` 端点、Gemma 4 图像缩放新增参数
5. OpenAI Python SDK v3.42.0 加入 agent 上下文压缩与会话复审设置
6. Claude Code v2.1.316 新增 `CLAUDE_CODE_DISABLE_ULTRATHINK` 与 group 共享预算
7. Nvidia 洽谈为 Nscale 西弗吉尼亚 Anthropic 数据中心债务融资提供担保

**模型发布**

8. Transformers 与推理框架侧新增 Gemma 4 图像处理与 Mistral Large 4 支持延续

**产品应用**

9. 苹果 CEO Ternus：苹果不打算「为 AI 而 AI」出货 AI

**技术与洞察**

10. Sam Altman：供应链受限的 DRAM 更应留在数据中心，而非闲置在 PC 里

**行业动态**

11. S&P 将 Meta 展望下调至负面，理由是高资本开支与自由现金流为负
12. 联邦法官准许 NAACP 起诉 xAI Colossus 数据中心污染案继续推进

**前瞻与传闻**

- 线索雷达｜Meta 与中国傅利叶三个月造出原型人形机器人，正造第二台
- 线索雷达｜Baseten 分两笔融资约 20 亿美元，估值 260 亿与300亿美元
- 线索雷达｜neoclouds 近期在债券市场被有效排除
- 线索雷达｜亚利桑那州两党反对新建 AI 数据中心
- 线索雷达｜AI 探测器正在改变人类写作习惯

## 后续追踪

- **OpenAI 融资规模下调**：此前报道拟按 300 亿美元 / 1.4 万亿美元推进 → 本期目标降至 200 亿美元 / 1.25 万亿美元，首轮交割可能更低，已获承诺约 110 亿美元 → 下一步关注交割完成金额与最终投资方名单。
- **AI 基建融资成本上升**：此前 EP005 报道四家巨头资本开支超 7400 亿美元并引发股价下跌 → 本期 neoclouds 遭债券市场排斥、Nvidia 需为客户债务担保、Meta 被下调展望 → 下一步关注信用利差与担保安排是否成为常态。
- **Anthropic 上市进程**：此前官网确认已提交 S-1、FT 报道预计获「高」等级垃圾债评级 → 本期 Anthropic 方面就 Claude Code 被篡改扩展副本发声 → 下一步关注发行定价与安全事件处置说明。
- **Claude Code 供应链安全**：此前无相关记录 → 本期出现被篡改扩展副本 → 下一步关注 Cursor 市场是否收紧发布权限、Anthropic 是否公布检测与处置细节。

## 要闻

### 1. OpenAI 最新一轮融资目标从 300 亿美元下调至约 200 亿美元，估值降至 1.25 万亿美元

**导语**

据英国《金融时报》报道，OpenAI 最新一轮融资目标已从原定的 300 亿美元下调至约 200 亿美元，估值从 1.4 万亿美元降至 1.25 万亿美元。TechCrunch 转述该报道时补充，首轮交割金额预计低于 200 亿美元。部分投资者在 AI 板块回调中削减了承诺额度。

**详细内容**

这笔融资原本被视为 OpenAI 计划中的 IPO 前的关键一步。《金融时报》的报道称，最初的目标是 300 亿美元、对应 1.4 万亿美元估值，随后调整至 1.25 万亿美元估值，最新一次调整把募资规模降到约 200 亿美元。TechCrunch 在 10 月 31 日的报道中写道，FT 称公司「随后把融资目标下调至 200 亿美元，首次交割预计甚至低于该数字」。

同期《华尔街日报》的一则聚合报道指向同一方向：OpenAI 目前已获得的承诺约 110 亿美元，不足原定 300 亿美元目标的一半。截至本期截稿，OpenAI 未就本轮融资条件发布官方公告，上述金额与估值均为媒体转述口径。

**相关链接**

- https://www.ft.com/content/7a3ad950-1b3b-4d9e-8c15-65a61ae6180f
- https://techcrunch.com/2026/10/31/openai-reportedly-lowers-funding-target-for-new-round/
- https://www.techmeme.com/261030/p30

### 2. ChatGPT 分享链接漏洞可执行攻击者代码并读取私有会话，OpenAI 定级 P1 并已修复

**导语**

安全公司 Parameter 向 OpenAI 漏洞赏金计划报告的缺陷显示，一个普通的 ChatGPT 公开分享链接可在受害者登录会话中执行攻击者代码，并读取其私有对话。OpenAI 于 10 月 18 日收到报告，10 月 26 日前在两个前端版本中完成修复，严重等级从 P2 上调为最严重的 P1。

**详细内容**

攻击载体是任意一次通过公开链接分享的 ChatGPT 对话，可经邮件、聊天消息、工单或社交帖传播，受害者无需安装任何东西。最可靠的利用方式是打开链接并点击一次 ChatGPT 的 Preview 按钮；后续版本中，Parameter 让页面自动打开 Preview，打开链接即是全部步骤。

据 Parameter 的说明，ChatGPT 的 Preview 功能会把对话中的 HTML 变成一个独立地址上的小网页，运行在受限框架内，本无法读取主页面。突破口来自同一对话中的另一个功能：交互式图表加载了数学库 MathLive，其键盘监听器接受来自任意发送方的消息，且消息允许携带原始 HTML，从而让 Preview 跨过边界把攻击者的 HTML 交给主页面。新建的框架被浏览器视为 chatgpt.com 的一部分，再由一个 YouTube 来源的脚本提供实际代码——内容安全策略拦截了内联脚本，但放行了来自 YouTube 的脚本。攻击代码可直接调用 ChatGPT 的已登录 API，列出受害者最近的对话并把私有内容发送到攻击者服务器。

OpenAI 复现了代码执行与私有对话读取两项验证，将等级从 P2 上调至 P1，并在两个前端版本中修复。Parameter 表示这是受控测试，未发现该缺陷被真实利用，其私有对话验证在独立账户之间进行。研究者指出问题源于三处设计选择的叠加。

**相关链接**

- https://thehackernews.com/2026/10/a-shared-chatgpt-link-could-run.html
- https://www.techmeme.com/261031/p11

### 3. Anthropic 称恶意行为者利用 Cursor 市场权限发布「被篡改」的 Claude Code 扩展副本

**导语**

据 Anthropic 方面表示，一起恶意行为者利用其对 Cursor 扩展市场的访问权限，发布了 Claude Code 扩展的「被篡改」副本，该副本并非由 Anthropic 构建或发布。Anthropic 工程师 Felix Rieseberg 对此事作出说明。

**详细内容**

这起事件的性质是 AI 编程工具链的分发环节被利用：攻击者借助市场侧的发布权限上架了外观与官方扩展一致的恶意版本，Anthropic 明确表示该副本不是自家产品。Rieseberg 的公开说明指出，该副本并非 Anthropic 构建或发布的版本。

截至本期截稿，公开信息中未见 Cursor 方面就市场发布权限如何被取得、影响范围多大、是否为单一副本的完整说明，也未见 Anthropic 公布受影响版本与处置细节。编辑提醒：本文仅转述 Anthropic 一侧的公开表述，尚未取得该事件的一手技术说明。

**相关链接**

- https://x.com/felixrieseberg/status/2116170451466543578
- https://www.techmeme.com/261031/p2

## 开发生态

### 4. llama.cpp 连发 b12018–b12024：修复 `/v1/responses` 端点、Gemma 4 图像缩放新增参数

**导语**

llama.cpp 在 10 月 31 日至 11 月 1 日间连续发布 7 个版本 b12018 至 b12024。其中 b12022 修复了 `/v1/responses` 端点不接受 `extra_params` 的问题，b12021 让 Gemma 4 图像缩放不再带 letterbox 填充，b12023 限制共享决策前缀的长度。

**详细内容**

具体变更包括：b12018 修复 sycl 后端 f32 到 q2_0/q4_0/q5_0 的 CPY 舍入；b12019 在 `reasoning_format none` 时剥离 qwen3-coder 响应中的 think 块；b12020 为 OpenCL 增加 fwht；b12021 修改 mtmd 的图像缩放路径，使 Gemma 4 图像不再出现 letterbox 填充；b12022 修复 server 的 `/v1/responses` 端点以接受 `extra_params`；b12023 在 server 侧把共享决策前缀限制在第一个输出位置，解决多个子任务共享选项 token 时决策输出 embedding 在最终批中缺失的问题（对应 issue #30482）；b12024 把多模态处理改为在 2D 而非 3D 张量上做 reshape，用于 lfm sc 模型。

**相关链接**

- https://github.com/ggml-org/llama.cpp/releases
- https://github.com/ggml-org/llama.cpp/pull/30959

### 5. OpenAI Python SDK v3.42.0 加入 agent 上下文压缩与会话复审设置

**导语**

openai-python 在 10 月 31 日发布 v3.42.0，新增多项 API 参数，其中与 agent 相关的有三项：agent 上下文压缩设置、agent 会话复审与工具设置，以及实验性的 agent 时间感知。

**详细内容**

该版本新增的 API 能力包括：`agent context compaction settings`（PR #4209）、`agent session review and tool settings`（#4217）、实验性的 `agent time awareness`（#4211）、图像编辑的标记叠加（#4210）、组织外部密钥管理（#4205），以及 SIP 的 DTMF 命令与投递事件（#4208）。

从功能结构看，这批参数把 agent 的上下文长度管理、会话质量复审与工具调用策略三项能力推到了 SDK 层，配合此前的 agent 相关改动，OpenAI 正在把 agent 运行时的可调项向开发者开放。

**相关链接**

- https://github.com/openai/openai-python/releases/tag/v3.42.0
- https://github.com/openai/openai-python/compare/v3.41.0...v3.42.0

### 6. Claude Code v2.1.316 新增 `CLAUDE_CODE_DISABLE_ULTRATHINK` 与 group 共享预算

**导语**

anthropics/claude-code 在 10 月 31 日发布 v2.1.316，新增 `CLAUDE_CODE_DISABLE_ULTRATHINK` 开关用于关闭 `ultrathink` 关键词，并为 Claude apps 网关加入 group 层面的共享预算。

**详细内容**

该版本的其他变更包括：`CLAUDE_CODE_DISABLE_LOOPED_CROSS_CERT_DROP`，用于保留互相循环背书的系统交叉证书（面向私有 CA 的服务器）；`CLAUDE_CODE_SUBAGENT_EFFORT`，用于设定在无其他指定时子代理的运行 effort 等级，而不再继承会话等级。

group 共享预算的具体形态是：一个按月计算的预算，由组内成员共享，叠加在每位成员各自的额度之上。

**相关链接**

- https://github.com/anthropics/claude-code/releases/tag/v2.1.316
- https://github.com/anthropics/claude-code/releases

### 7. Nvidia 洽谈为 Nscale 西弗吉尼亚 Anthropic 数据中心债务融资提供担保

**导语**

据《The Information》报道，Nvidia 正洽谈为 AI 云服务商 Nscale 位于西弗吉尼亚州的 Anthropic 数据中心提供数十亿美元债务融资担保，Bloomberg 随后证实了这一报道。Nscale 的 IPO 文件显示，Anthropic 已就该项目首栋建筑签署 446 亿美元合同。

**详细内容**

按 TechCrunch 的描述，这一安排实质上是芯片厂商为客户的贷款提供共同签署，等同于 Nvidia 与 Nscale 的融资安排。拟议结构属于 residual value guarantee 机制：若 Nscale 在建设付款上违约，Nvidia 将介入，暂时接管该设施，并协助寻找买家与新租户。相关融资用于 Nscale 西弗吉尼亚园区的电力与建设成本。

**相关链接**

- https://techcrunch.com/2026/10/30/nvidia-weighs-playing-the-cosigner-for-nscales-ai-data-center-in-west-virginia/
- https://www.techmeme.com/261030/p31

## 模型发布

### 8. Transformers 与推理框架侧新增 Gemma 4 图像处理与 Mistral Large 4 支持延续

**导语**

在本地推理框架侧，本期可核查的进展来自 llama.cpp：b12021 修改多模态图像缩放路径，使 Gemma 4 图像缩放不再带 letterbox 填充；b12024 为 lfm sc 模型的图像处理改为 2D 张量 reshape。上一期已报道的 transformers v5.22.0 加入 Mistral Large 4（Le Chonk）支持，本期未见新的 transformers 正式版本发布。

**详细内容**

Mistral Large 4 是 Mistral 迄今规模最大、能力最强的模型：1 万亿参数、原生多模态的混合专家架构，49B 激活参数。transformers v5.22.0 于 10 月 29 日为其加入支持，llama.cpp 自 b12007 起为 `mistral-large4` 启用逐层 KV rotation。

本期需要标注的边界：llama.cpp b12018–b12024 中没有任何一个新版本是模型发布本身，全部为端点修复、图像处理与算子层面的改动；本期没有新的开源模型权重发布或新的旗舰模型上线。

**相关链接**

- https://github.com/ggml-org/llama.cpp/releases
- https://github.com/huggingface/transformers/releases

## 产品应用

### 9. 苹果 CEO Ternus：苹果不打算「为 AI 而 AI」出货 AI

**导语**

苹果 CEO John Ternus 在接受《连线》采访时表示，苹果不打算「为 AI 而 AI」出货 AI，并称 Tim Cook「在任何地方都愿意提供帮助」。他承认过去几年外界常认为苹果在 AI 上落后，尤其在其推迟了功能更强的 Siri 之后——该版本于今年夏天才推出。

**详细内容**

Ternus 在访谈中表示「每个人都有自己的看法」，但他称「我真的很满意我们所处的位置」。背景上，苹果在过去几年多次被描述为在 AI 竞赛中处于落后位置，一个重要原因是更强大的 Siri 版本一再推迟，直到今年夏天才正式上线。Ternus 于 9 月初正式出任苹果 CEO。

本次表态属于 CEO 层面的公开采访，尚未附带具体的产品时间表或功能承诺。

**相关链接**

- https://techcrunch.com/2026/10/31/apple-ceo-says-the-company-doesnt-want-to-ship-ai-for-ais-sake/
- https://www.wired.com/story/i-spent-30-minutes-with-apples-ceo-now-i-know-why-john-ternus-got-the-job/

## 技术与洞察

### 10. Sam Altman：供应链受限的 DRAM 更应留在数据中心，而非闲置在 PC 里

**导语**

在谈及本地推理时，OpenAI CEO Sam Altman 表示，供应受限的 DRAM 放在数据中心比放在 PC 里更合适，因为 PC 中的内存「只有 5% 的时间在被使用」。据 Tom's Hardware 报道，这番表述针对的是本地推理对内存的占用与实际利用率之间的落差。

**详细内容**

这与本期其他两条基础设施线索指向同一方向：内存供应紧张使 DRAM 的去向成为产业级议题。当数据中心侧的采购能力更强、且内存有更高的实际使用率时，把稀缺 DRAM 分散到消费级设备上的边际收益下降。Altman 的表述同时回应了本地推理的成本讨论——内存既是本地运行大模型的主要硬件成本，也是供应受限环节的主要瓶颈。

编辑说明：该引述经聚合源转述取得，原文未取到，本条按「据报道」处理。

**相关链接**

- https://www.tomshardware.com/tech-industry/data-centers/openai-ceo-says-its-quite-terrible-for-your-pc-to-have-ram-sam-altman
- https://www.techmeme.com/261031/p5

## 行业动态

### 11. S&P 将 Meta 展望下调至负面，理由是高资本开支与自由现金流为负

**导语**

标普全球评级将 Meta 的展望从稳定下调至负面，理由是高资本开支与自由现金流为负。CNBC 报道称，Meta 股价 10 月下跌 15%，为四年来最差月份。

**详细内容**

这一评级动作把 EP005 报道过的「AI 资本开支引发自由现金流担忧」推进到了评级层面——从股价反应转为评级机构对现金流的正式判断。Meta 10 月单月 15% 的跌幅，是其 2022 年以来最差的月度表现之一。

编辑提示：Meta 的具体资本开支数字、评级原文措辞与现金流口径未在本期取得一手来源（CNBC 原文 404），本条按聚合报道的转述口径给出。

**相关链接**

- https://www.cnbc.com/2026/10/30/meta-outlook-to-revised-to-negative-by-sp-after-cash-flow-negative.html
- https://www.techmeme.com/261031/p3

### 12. 联邦法官准许 NAACP 起诉 xAI Colossus 数据中心污染案继续推进

**导语**

美国联邦法官驳回了 xAI 请求驳回 NAACP 诉讼的动议，允许该案继续推进。南方环境法律中心代 NAACP 起诉，指控 SpaceX 旗下 xAI 在孟菲斯郊外的 Colossus 数据中心运营燃气轮机时未取得所需许可。

**详细内容**

据 TechCrunch 报道，南方环境法律中心称，xAI 在 Colossus 场址「安装并运行了至少 35 台燃烧式涡轮机及其他空气污染源，却从未取得必要的施工前或运营空气许可」，并指控 xAI 违反《清洁空气法》。该数据中心为 xAI 的旗舰算力设施，xAI 寻求的驳回动议被联邦法官驳回后，案件进入实质审理阶段。

这是本期唯一一条涉及环境与合规的司法进展。xAI 方面在报道中未就该裁决作出回应。

**相关链接**

- https://techcrunch.com/2026/10/31/judge-allows-naacp-lawsuit-over-xai-data-center-pollution-to-move-forward/
- https://www.techmeme.com/261031/p7

## 前瞻与传闻

以下条目为线索雷达，均为单一来源、未获官方确认，不展开细节。

- 线索雷达｜Meta 与中国傅利叶三个月造出原型人形机器人，正造第二台 —— The Information（经 Techmeme 聚合，标 Sources）｜2026-11-01 00:20 CST｜https://www.techmeme.com/261031/p10
- 线索雷达｜Baseten 分两笔融资约 20 亿美元，一笔估值 260 亿、另一笔 300 亿美元 —— Bloomberg（经 Techmeme 聚合，标 Sources）｜2026-11-01 08:20 CST｜https://www.techmeme.com/261030/p29
- 线索雷达｜neoclouds（CoreWeave、Nebius、Nscale）近几周在债券市场被有效排除，AI 建设新瓶颈为廉价资金短缺 —— WSJ（经 Techmeme 聚合，标 Sources）｜2026-11-01 13:15 CST｜https://www.techmeme.com/261031/p4
- 线索雷达｜亚利桑那州两党反对新建 AI 数据中心，与当年 TSMC 晶圆厂获欢迎形成对比 —— The Verge（经 Techmeme 聚合）｜2026-11-01 17:25 CST｜https://www.techmeme.com/261031/p7
- 线索雷达｜AI 探测器（如 Pangram）正在改变人类写作习惯，作者改用破折号与「不是 X 而是 Y」句式 —— Bloomberg（经 Techmeme 聚合）｜2026-11-01 21:40 CST｜https://www.techmeme.com/261031/p8

## 编辑备注

1. **本期真实检索时间窗**：2026-10-31 07:00 – 2026-11-01 07:00（Asia/Shanghai），共 24 小时，以事件首次公开时间为准；72 小时补收范围自 2026-10-29 07:00 起，本期实际未从 72 小时窗口补入任何条目。
2. **来源抓取限制**：`openai.com/index/*` 正文在本环境返回 HTTP 403（与前 5 期一致）；FT、WSJ、Bloomberg、CNBC、The Verge、Wired、Tom's Hardware、The Information 原文因付费墙或 404 未能取到，相关事实改由可取回正文的二级源（TechCrunch、The Hacker News、Techmeme 聚合摘要）交叉核实，故第 1、4、5、6、9、10、11 条及全部线索雷达条目均标注为单一来源或媒体转述口径。
3. **无正文抓取的条目**：第 3 条（Anthropic / Cursor 被篡改扩展）的一手说明为 X 帖子，本环境未能取到正文，仅取到 Anthropic 方面的公开表述与要点；编辑保留该条目是因其涉及重点追踪对象 Anthropic 与开发者工具链安全，事实主体已按「据 Anthropic 方面表示」归属。
4. **金融类数字口径**：第 1 条的 300 亿 / 200 亿 / 1.4 万亿 / 1.25 万亿 / 110 亿承诺，第 7 条的 446 亿美元合同，第 11 条的 15% 跌幅，均为原文数字并标注出处；发行价未定，不做估值推测。
5. **本期模型发布栏偏薄**：24 小时窗口内没有新的旗舰模型上线或开源权重发布。第 8 条据此只写推理框架侧的模型适配进展，并显式说明本期无模型发布本身，以避免把框架更新包装为模型新闻。
6. **官方宣称归属**：第 8 条中「1 万亿参数、49B 激活」来自 Mistral 官方发布文转述，属官方宣称，未经独立验证。
7. **与上期的重复检查**：EP005 已报道的 robots.txt 标准、Project Suncatcher、Anthropic 套餐改名、OpenAI 社区安全报告、llama.cpp b12007–b12017、transformers v5.22.x、Gemini 4 Carbon、DoorDash 代理订单、Ollie 关停、资本开支与纳指下跌、Salesforce 收购 Rune、Anthropic 垃圾债评级预期等，本期均未重复收录，仅在「后续追踪」中作为背景提及。
