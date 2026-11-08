# AI 早报 2026-11-09

> 检索时间窗：2026-11-08 07:00 ~ 2026-11-09 07:00（Asia/Shanghai，24 小时），重要遗漏补至 72 小时（2026-11-05 07:00 起）。
> 目标读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者。

## 今日概览

**要闻**

1. Nvidia 董事会就黄仁勋是否遭外国间谍策动启动调查，称无迹象显示公司机密外泄；黄仁勋内部邮件承认婚外情并称「承担全部责任」

**开发生态**

2. llama.cpp 一晚连发 16 个构建：SSM_SCAN 为 d_state=64 增加 GPU 快路径，radix Top-K 并列结果改为确定性选择
3. OpenAI Agents SDK v0.24.0-alpha.7：原生执行之外保留 Classic 工作流，新增持久化根 Session 与语音、托管工具
4. Open WebUI v0.13.1 与 v0.13.2：把 Claude Code、Codex、Pi 等编码 agent 接入模型选择器，并修复明文 HTTP 下的会话加载失败
5. LiteLLM v1.110.0-dev.2：Docker 镜像开始用 cosign 签名，路由重试、Responses SSE 帧、Vertex AI 鉴权等 12 项修复
6. crewAI 1.15.38：默认模型切换为 gpt-6-luna，agent 输入支持表格 URL，eval 新增无头模式

**模型发布**

7. Nous Research 发布 Arete-27B：在 Qwen3.8-27B 上做后训练，Apache-2.0 开源，官方称含宣传内容回答从 22% 降至 0.9%
8. Mistral 开源 Le Chonk 权重，定位为 agentic 编码与网络安全方向的开放模型

**产品应用**

9. OpenAI 状态页：图像生成相关服务错误率升高，11 月 8 日 23:11 CST 起，约 1 小时 49 分后恢复
10. DeepSeek 称开源 agent 应用 Harness 日活达 154 万，日均消耗约 92 万亿 token

**前瞻与传闻**

- Anthropic 据报向 OnePWR 采购 1.7GW 燃气发电机承诺，金额 34 亿美元（金融时报，经 Techmeme 聚合）https://www.techmeme.com/261108/p8
- 美国商务部 AI 安全中心 CAISSI 官员被要求非正式向白宫某办公室汇报（美联社，经 Techmeme 聚合）https://www.techmeme.com/261108/p16
- 苹果高管 John Ternus 推动公司加快 AI 进展，矛头指向 Siri 之外的 agent 能力（彭博社，经 Techmeme 聚合）https://www.techmeme.com/261108/p9
- 2026 年 AI 公司已卖出或定价 3000 亿美元以上股票，另有约 1000 亿美元待发（The Information，经 Techmeme 聚合）https://www.techmeme.com/261108/p10
- 内蒙古成为中国增长最快的 AI 数据中心区域（SemiAnalysis，经 Techmeme 聚合）https://www.techmeme.com/261108/p7

## 要闻

### 1. Nvidia 董事会就黄仁勋是否遭外国间谍策动启动调查，称无迹象显示公司机密外泄；黄仁勋内部邮件承认婚外情并称「承担全部责任」

**导语**

据彭博社与 Axios 报道，Nvidia 董事会已就其 CEO 黄仁勋是否被外国间谍策动一事启动内部调查，董事会称没有理由相信 Nvidia 机密遭到泄露。据 Axios 获得的内部邮件，黄仁勋承认婚外情并称「承担全部责任」，称自己未能履行对董事会、股东与员工的职责。TechCrunch 同日报道称 Nvidia 将就黄仁勋与「可能的中国间谍」的关系展开调查。

**详细内容**

彭博社报道的核心是调查范围与官方表述：调查由董事会发起，重点在于黄仁勋是否被外国情报策动，董事会表示没有理由相信公司机密已被泄露。Axios 获得的内部邮件显示，黄仁勋在其中承认了一段婚外情，称自己「承担全部责任」，并表示未能达到董事会、股东与员工对他的要求。

TechCrunch 报道的对外表述与彭博口径一致：Nvidia 方面确认将就 CEO 与「可能的中国间谍」的关系展开调查。前一日 TechCrunch 与 Techmeme 聚合的另一条报道援引美国情报备忘录称，一名 Megaspeed 高管被招募为针对 Nvidia CEO 的间谍，该条线索尚未见官方确认，本期不据此展开推断。

三条报道指向同一事件的不同侧面：董事会调查（彭博）、CEO 内部邮件（Axios）、公司对外表态（TechCrunch）。本期未获取 Nvidia 官方新闻稿原文，涉事细节以媒体转述口径表述。

**相关链接**

- Techmeme 聚合页（彭博社报道）：https://www.techmeme.com/261108/p13
- Techmeme 聚合页（Axios 报道）：https://www.techmeme.com/261108/p14
- TechCrunch 报道：https://techcrunch.com/2026/11/08/nvidia-says-its-investigating-ceo-jensen-huangs-relationship-with-possible-chinese-spy/

## 开发生态

### 2. llama.cpp 一晚连发 16 个构建：SSM_SCAN 为 d_state=64 增加 GPU 快路径，radix Top-K 并列结果改为确定性选择

**导语**

2026-11-08 07:45 至 2026-11-09 00:48（CST），llama.cpp 依次发布 b12193 至 b12211 共 16 个构建。其中 b12207 为 SSM_SCAN 内核增加 d_state=64 的 GPU 快路径，官方称在 Zamba2-7B-Instruct 上吞吐从 11 tok/s 提升到 15.1 tok/s；b12208 把 CUDA 与 Metal 的 radix Top-K 并列结果选择改为确定性。

**详细内容**

b12207（#31818）针对 Zamba2 一类状态尺寸为 64 的递归扫描架构补充第 4 个模板实例，此前只有 96、128、256 三个快路径，状态尺寸 64 的扫描步会全部回落到 CPU。官方给出的实测是在 Zamba2-7B-Instruct 上吞吐从 11 tok/s 提升到 15.1 tok/s，官方称整体提升约 35%，并说明仍有约 28% 的 scan 调用因另一未定位原因回落 CPU。

b12208（#31084）修复 radix Top-K 内核的线程时序问题：旧实现用原子计数器收集被选索引，阈值处并列候选的顺序取决于线程调度，官方改用确定性的计数与压缩方案，并把 Metal、ROCm、Vulkan、SYCL 排除在本改动之外。b12202（#31851）按参考实现统一精度调用：GLM4 的下投影与输出投影、MiMoVL 的视觉矩阵乘、Qwen3-TTS 的说话人编码器 conv1d 改为 GGML_PREC_BF16，而 DeepSeek V4 与 V4.1 的 router、minimax-M3 的 indexer 保持 F32。

其余构建覆盖推测解码、缓存调度与后端：b12201（#31497）不再对 draft 模型套用 MoE 缓存；b12206（#31888）让 moe-cache 的 CPU 部分不再等待已缓存专家；b12200（#31831）改善 OpenCL 的 q8_0 与小 n MoE 验证路径；b12210（#31776）为 SpacemiT IME2 启用 MXFP4 dense repack；b12199（#31861）清理 PEG 工具调用参数中的非法 UTF-8；b12211（#31865）重构 mtmd、移除 clip.h；b12209（#31866）为 llamafile 实现 bf16 与 q8_0 的 vxe 路径。

**相关链接**

- llama.cpp Releases：https://github.com/ggml-org/llama.cpp/releases
- b12207（SSM_SCAN d_state=64 快路径）：https://github.com/ggml-org/llama.cpp/releases/tag/b12207
- b12208（radix Top-K 确定性）：https://github.com/ggml-org/llama.cpp/releases/tag/b12208
- b12202（精度对齐参考实现）：https://github.com/ggml-org/llama.cpp/releases/tag/b12202

### 3. OpenAI Agents SDK v0.24.0-alpha.7：原生执行之外保留 Classic 工作流，新增持久化根 Session 与语音、托管工具

**导语**

openai/openai-agents-python 于 2026-11-08 15:05（CST）发布 v0.24.0-alpha.7。官方发布说明列出四项重点：可在原生执行之外继续使用 Classic 工作流、用自有存储保存会话、把语音与托管工具接入原生 agent、以及更细地控制上下文、生成与用量。

**详细内容**

第一项重点是 Classic 工作流与原生执行并存。官方说明可从 `agents.classic` 导入保留下来的 v0 运行时，并提示本次 alpha 同时改动了执行器的写入默认行为，升级前需阅读升级说明再改动既有环境。

第二项是持久化：官方新增带有 `CustomStorage` 的持久化根 Session，并说明恢复工作前需要先对状态不确定的工具效果做对账。第三项把语音工作流接到 Session，并支持通过兼容的 Responses 提供方使用 `FileSearch`、`CodeInterpreter` 与 `ImageGeneration` 等托管工具。第四项是控制面：官方列出可变换模型输入、保留特定上下文等上下文、完成与用量相关能力。

**相关链接**

- Agents SDK v0.24.0-alpha.7 发布说明：https://github.com/openai/openai-agents-python/releases/tag/v0.24.0-alpha.7
- Agents SDK 仓库：https://github.com/openai/openai-agents-python

### 4. Open WebUI v0.13.1 与 v0.13.2：把 Claude Code、Codex、Pi 等编码 agent 接入模型选择器，并修复明文 HTTP 下的会话加载失败

**导语**

open-webui 于 2026-11-08 19:07 与 19:53（CST）先后发布 v0.13.1 与 v0.13.2。v0.13.1 的主要新增是把编码 agent 作为模型呈现：提供 agent 的 Open Terminal 中，Claude Code、Codex 与 Pi 会出现在模型选择器里；v0.13.2 修复了明文 HTTP 场景下会话一直停留在加载状态的问题。

**详细内容**

v0.13.1 的官方说明描述了这条新链路：在提供 agent 的 Open Terminal 中，Claude Code、Codex、Pi 等编码 agent 出现在模型选择器，用户可以与它们对话或用语音调用，可选择其推理强度与服务层级，并在对话中批准其工具请求。官方同时说明限制：每个会话只使用一个 agent，agent 对话不能重新生成、继续或编辑后重发；agent 所在终端消失时，该会话与新会话会回落到默认模型，早先回复仍保留 agent 名称；agent 对话中的自动补全使用任务模型，没有任务模型时跳过。

v0.13.2 为修复版本。其一，在局域网或 Docker 地址上以明文 HTTP 打开 Open WebUI 时，新建与已有会话不再卡在加载状态并报 `crypto.randomUUID is not a function`（#33919）；其二，明文 HTTP 下创建、回复、编辑评论以及编辑含 Mermaid 图、callout 等渲染块的 Markdown 文件时，不再因同一 UUID 报错失败；其三，Side Chat 的允许开关即使在特定配置下也保持可见。

**相关链接**

- open-webui v0.13.1 发布说明：https://github.com/open-webui/open-webui/releases/tag/v0.13.1
- open-webui v0.13.2 发布说明：https://github.com/open-webui/open-webui/releases/tag/v0.13.2

### 5. LiteLLM v1.110.0-dev.2：Docker 镜像开始用 cosign 签名，路由重试、Responses SSE 帧、Vertex AI 鉴权等 12 项修复

**导语**

LiteLLM 于 2026-11-08 10:25（CST）发布 v1.110.0-dev.2。官方发布说明的主线是镜像供应链：所有 LiteLLM Docker 镜像开始用 cosign 签名，本版使用 commit `e82a3c6` 引入的公钥，并给出以固定 commit 哈希与以版本标签两种校验方式。

**详细内容**

镜像签名方面，官方给出的推荐做法是用不可变的 commit 哈希拉取公钥后执行 `cosign verify`，并说明本仓库的标签受保护、也解析到同一把密钥。变更清单共 12 项，集中在网关可靠性：路由会记录请求首次失败之后的重试与回落跳数（#50445）；代理保留 Responses 的 SSE 事件分帧（#47980）；Vertex AI 直通请求改为只鉴权一次（#48942）；RedisCache 与 Rust 存储共用同一个原生熔断器（#50473）；流式响应中 Anthropic 的工具参数分片按原样保留（#50470）。

其余变更涉及成本与错误码：按 key 或团队关闭 spend log 的提示词存储（#50135）；没有输出的回复不再被缓存或重放（#50057）；Gemini 2.5 Pro flex 在 20 万 token 以上补充缓存价格（#50480）；Azure 侧新增 cohere-rerank-v5-pro 与 -fast（#50499）、对齐 chat-latest 的退役元数据（#50509）、补充 gpt-realtime-2.1 等型号的数据区行（#50519）；Gemini 图片编辑无图片时返回 400 而不是 500（#50244）。

**相关链接**

- LiteLLM v1.110.0-dev.2 发布说明：https://github.com/BerriAI/litellm/releases/tag/v1.110.0-dev.2
- LiteLLM 版本列表：https://github.com/BerriAI/litellm/releases

### 6. crewAI 1.15.38：默认模型切换为 gpt-6-luna，agent 输入支持表格 URL，eval 新增无头模式

**导语**

crewAI 于 2026-11-09 03:39（CST）发布 1.15.38。官方发布说明列出四项新增：把 gpt-6-luna 设为 crewAI 全局默认模型、让 agent 用工具逐行读取输入中的表格 URL、给 eval 用量打上目标与单次评估 id、以及为 `crewai eval` 增加 `--no-open` 无头开关。

**详细内容**

四项新增之外，本次版本还带来一批 eval 与运行行为修复：eval 运行出错退出时按 run_failed 计数；开启 tracing 时创建的 `.env` 归项目所有者独占；eval 发起的匿名运行在失败后仍会上传；在首次调用时检查兼容 OpenAI 的各提供商 API key；memoized 的 crew 方法限定在自身实例内；`crewai run` 的项目脚本失败时以非零码退出。官方还说明 eval 在询问是否共享 trace 时以回车表示同意。

**相关链接**

- crewAI 1.15.38 发布说明：https://github.com/crewAIInc/crewAI/releases/tag/1.15.38
- crewAI 版本列表：https://github.com/crewAIInc/crewAI/releases

## 模型发布

### 7. Nous Research 发布 Arete-27B：在 Qwen3.8-27B 上做后训练，Apache-2.0 开源，官方称含宣传内容回答从 22% 降至 0.9%

**导语**

Nous Research 于 2026-11-08（CST）公布 Arete-27B，官方说明该模型是在阿里巴巴 Qwen3.8-27B 上做后训练的结果，用意是强化西方价值观。Hugging Face 模型卡显示其为 Apache-2.0 许可、27B 参数、纯 SFT 后训练、训练上下文 64k；官方称事实得分从 2.32 提升到 2.98（满分 5），含宣传内容的回答从 22% 降至 0.9%。

**详细内容**

模型卡给出的训练细节为：后训练方式只有监督微调，没有强化学习、没有偏好优化，也没有改动架构；评测检查点为 step 1,202，教师模型为 Inkling，训练数据为纯文本，训练上下文 64k。数据集为 `NousResearch/arete-data-pairs`，评测集为 `Propaganda_Eval`。模型卡列出的七个价值类别是表达自由、国家意识形态、国家与自由市场、教育、数据隐私与监控、民主、环境政策。

官方给出的结果是：在其评测中事实得分从 2.32 提升到 2.98（满分 5），含宣传内容的回答比例从 22% 降到 0.9%，官方称该提升在七个价值类别上均成立，且在通用能力与 agentic 基准上没有明显回退。官方同时明确这不等于已消除与该立场相关的全部行为。上述数字均为发布方口径，未见独立第三方复测。抓取时该模型在 Hugging Face 的下载量约 1,747、点赞 280，模型卡最近更新时间为 2026-11-06。

**相关链接**

- Nous Research 官方博客：https://nousresearch.com/arete
- Hugging Face 模型卡：https://huggingface.co/NousResearch/Arete-27B
- 评测数据集：https://huggingface.co/datasets/NousResearch/Propaganda_Eval

### 8. Mistral 开源 Le Chonk 权重，定位为 agentic 编码与网络安全方向的开放模型

**导语**

Mistral 官方新闻页于 2026-11-05 发布「Le Chonk: Built for Coders, Trusted by Defenders」，官方说明该版本开放了 Le Chonk 的权重，定位为 agentic 编码与网络安全方向开放模型的前沿推进。该条首次公开日期早于本期 24 小时主窗口，属 72 小时补收条目。

**详细内容**

官方条目标题同时点出两个定位方向：面向编码者的构建，以及面向防御者的可信度，官方措辞是开放 Le Chonk 的权重，以推进 agentic 编码与网络安全类开放模型的前沿。本期未从 Mistral 官方页面取得该模型的参数规模、上下文长度、基准数据、许可协议与下载地址等条目，官方页面上也未列出对应数值，因此这些参数本期不予补写，也不做推测。

**相关链接**

- Mistral 官方新闻页：https://mistral.ai/news/
- 官方条目「Le Chonk: Built for Coders, Trusted by Defenders」（2026-11-05）：https://mistral.ai/news/

## 产品应用

### 9. OpenAI 状态页：图像生成相关服务错误率升高，11 月 8 日 23:11 CST 起，约 1 小时 49 分后恢复

**导语**

OpenAI 状态页记录了一次影响 minor 级别的事件「Elevated errors with image generation」。事件于 2026-11-08 15:11 UTC（23:11 CST）创建，官方在 15:43 UTC 说明已实施缓解措施并进入观察状态，17:00 UTC 确认全部受影响服务恢复正常。从创建到恢复约 1 小时 49 分。

**详细内容**

官方状态页给出的处置过程为三步：15:11 UTC 识别出问题并说明用户出现错误升高、正在实施缓解；15:43 UTC 说明已应用缓解措施并正在观察以确认恢复；17:00 UTC 说明全部受影响服务已恢复正常运营并致歉。事件影响等级标注为 minor，状态页给出的时间线覆盖识别、缓解与监控、恢复三个节点。

**相关链接**

- OpenAI 状态页事件页：https://status.openai.com/incidents/01M6XVDCKRT3PSB0YP8J30GTD5
- OpenAI 状态页首页：https://status.openai.com/

### 10. DeepSeek 称开源 agent 应用 Harness 日活达 154 万，日均消耗约 92 万亿 token

**导语**

据彭博社 2026-11-08 报道（Techmeme 于 11 月 9 日 04:10 CST 聚合），DeepSeek 称其开源 agent 应用 Harness 在 11 月 4 日的日活跃用户达到 154 万，发布不足三个月；日均消耗约 92 万亿 token，折合每个用户约 6000 万 token。TechNode 此前报道 DeepSeek 正筹备官方插件市场，官方 API 文档也已将 Harness 列为面向 agent 开发者的开发者预览。

**详细内容**

彭博社给出的三个数字是：11 月 4 日日活 154 万、上线不足三个月、日均约 92 万亿 token（人均约 6000 万）。日活数字可与 TechNode 2026-11-06 的报道相互印证，该报道同时称 DeepSeek 正计划建立官方插件市场；DeepSeek 官方 API 文档在 DeepSeek Harness 指南中说明 Harness 现已进入面向全球 agent harness 开发者的开发者预览状态。

同一份官方文档还写明当前可用模型口径：模型名 `deepseek-flash` 现由 DeepSeek-V4.1-Flash-1017 提供，调用方式不变；旧名 `deepseek-v4-flash` 与 `deepseek-v4-flash-vision-exp` 仍被接受，但对应模型已退役，请求由 DeepSeek-V4.1-Flash-1017 按 Flash 价格计费。官方文档同时说明 DeepSeek API 兼容 OpenAI 与 Anthropic 格式，可直接作为 Claude Code、GitHub Copilot、OpenCode 等工具的后端模型。

**相关链接**

- Techmeme 聚合页（彭博社报道）：https://www.techmeme.com/261108/p12
- TechNode 报道：https://technode.com/2026/11/06/deepseek-plans-official-plugin-marketplace-as-harness-daily-users-reach-1-54-million/
- DeepSeek API 官方文档：https://api-docs.deepseek.com/zh-cn/quick_start/pricing

## 后续追踪

- **DeepSeek Harness 的用户规模与插件生态**：此前已确认 Harness 以开源 agent 应用的形态对外提供 → 本期彭博社给出 11 月 4 日日活 154 万、日均约 92 万亿 token，官方文档把 Harness 列为开发者预览 → 下一步关注官方插件市场是否上线、日活与 token 量是否继续增长，以及 Harness 与 DeepSeek API 模型线（`deepseek-flash` 指向 V4.1-Flash-1017、旧名退役后按 Flash 计价）的联动。
- **llama.cpp 的 MoE 缓存与精度对齐路线**：此前已确认 b12185 修复 CUDA lightning indexer 共享内存冲突、b12191 支持把 MoE 缓存未命中分给 CPU → 本期 b12201 不再对 draft 模型套用 MoE 缓存、b12206 让 CPU 部分不等待已缓存专家、b12202 按参考实现把 GLM4/MiMoVL/Qwen3-TTS 相关调用改为 BF16 并保持 DeepSeek V4 与 minimax-M3 indexer 为 F32 → 下一步关注 Zamba2 一类 d_state=64 架构是否还有约 28% 的 scan 调用回落 CPU，以及各后端对 BF16 的支持差异带来的兼容性影响。
- **Anthropic 的算力与电力采购**：此前已确认 Anthropic 已向 SEC 提交 S-1 上市文件 → 本期新增线索为金融时报报道其向 OnePWR 采购 1.7GW 燃气发电机承诺、金额 34 亿美元 → 下一步关注该采购是否获得 Anthropic 官方确认，以及 2026 年内 AI 实验室自建电力容量的披露口径。

## 编辑备注

- **本期真实检索时间窗**：2026-11-08 07:00 ~ 2026-11-09 07:00 CST（24 小时）。因窗口内官方博客更新稀少，重要遗漏补检至 72 小时（2026-11-05 07:00 起），本期第 8 条 Mistral Le Chonk 属补收条目，已在正文标注其首次公开日期。
- **采集方式**：NotebookLM research 三轮检索用于线索发现（Q1 模型发布与开发生态、Q2 厂商官方更新细节、Q3 安全与合规）；一期源直采覆盖企业官方新闻页与 GitHub Release API、Techmeme 与 TechCrunch RSS、Hugging Face 模型与趋势接口、OpenAI 状态页事件接口；入选条目均逐条打开原始页面或原始接口核实。
- **链接可用性**：金融时报原文页与美联社原文页在本环境返回安全校验页，无法读取正文，两条均只保留标题、链接与日期并列入「前瞻与传闻」，未展开细节；Techmeme 聚合页与 TechCrunch 报道页可正常打开。
- **来源缺口**：本期未获取 Nvidia 针对董事会调查的官方新闻稿，第 1 条以彭博、Axios、TechCrunch 三方报道口径表述；OpenAI 官方新闻页在本环境返回 JavaScript 质询页，故模型与产品侧无 OpenAI 一级源条目，改由状态页事件接口取得官方口径。
- **已排除**：EP013（2026-11-08 期）与 EP012（2026-11-07 期）已收录条目不重复报道，含 llama.cpp b12182–b12192、LiteLLM v1.108.3 (LTS)、Claude Code 密钥泄露研究、Ocient C 轮融资、中期选举与数据中心审批；llama.cpp b12193 之前、LiteLLM v1.110.0-dev.2 之前、vercel/ai 与 codex 的 alpha 构建均在本窗口之外；Mistral Le Chonk 之外的 Mistral 条目、xAI 官方新闻（最新为 11 月 2 日）、Anthropic 官方 newsroom（最新一条为 9 月 22 日）在窗口内无新增；OpenAI Codex CLI `rust-v0.169.0-alpha.3` 发布说明仍仅含版本号，按价值门槛未单独立条；Hugging Face 模型流中本窗口的新增条目多为个人账号的零下载测试仓库，未纳入。
- **官方宣称与独立验证的区分**：第 2 条的 Zamba2 吞吐数字（11 → 15.1 tok/s、约 35% 提升）与第 7 条的事实得分（2.32 → 2.98）、宣传内容比例（22% → 0.9%）均为发布方口径，正文已标注「官方称」，未表述为已独立验证。
- **数量说明**：本窗口含周末时段，官方发布量低于工作日，本期共 10 条完整条目与 5 条线索雷达，未为凑数收录低价值内容。
