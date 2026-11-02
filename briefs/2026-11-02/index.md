# AI 早报 2026-11-02

> 第 007 期　｜　检索窗口：2026-11-01 07:00 – 2026-11-02 07:00（Asia/Shanghai）
> 读者：开发者、技术爱好者、AI 工具用户、独立开发者与行业观察者

## 今日概览

**要闻**

1. 沙特阿美以约 26 亿美元现金收购 Humain 49% 股权，PIF 保留 51%
2. OpenAI 中期选举后启动政策攻势：主张对强模型设「限速」，拟把数据中心改称「AI compute campuses」
3. CrowdStrike：国家级组织用 ARTEX 智能体框架规模化入侵 200 余家机构，单次入侵消耗约 14 亿输入 token
4. Anthropic 在 Opus 5.5 系统提示词中加约束，Claude Code 被指暗中打击游戏克隆

**开发生态**

5. llama.cpp b12027–b12032：OpenCL 初步支持 iq3 量化、Hexagon DMA 大步长截断修复、InternVL CLS 顺序修复
6. openai-python v3.42.1：保留 Responses WebSocket 连接行为，校验 realtime beta WebSocket 认证配置
7. DeepSeek 开源 deepseek-harness 与 dsh-superagent-prototype，把 Agent 底座做成插件式（72 小时补收）
8. NVIDIA Nemotron 开源模型进入社区量化阶段，11 月 1 日出现多个 GGUF 仓库（72 小时补收）

**技术与洞察**

9. Cloudflare Q3 报告：网络层 DDoS 攻击 1820 万次环比增 38%，DNS 放大攻击增 215%

**行业动态**

10. 脑机接口创业公司 NeuroXess 完成 7 亿元人民币 B 轮，称已完成 65 例临床植入

**前瞻与传闻**

- 线索雷达｜美国 36 场州长竞选中，支持数据中心暂停令的候选人最多可能拿下 15 场
- 线索雷达｜Google 数据中心能源负责人称太空数据中心成本最高可达地面设施的 100 倍
- 线索雷达｜《华尔街日报》称五大超大规模云厂商的债务违约保险成本创 2021 年以来最高
- 线索雷达｜工业 AI 创业公司 Lumaril 完成 6600 万美元 A 轮，估值 4 亿美元
- 线索雷达｜西湖大学成立世界模型研究中心
- 线索雷达｜清华姚期智团队提出「代数世界模型」，让模型按牛顿式推理求解
- 线索雷达｜Codex CLI 发布 0.167.0-alpha.2 与 alpha.3 预览版，release note 未列明细

## 后续追踪

- **AI 基建融资与信用成本**：EP005 报道四家巨头资本开支超 7400 亿美元 → EP006 报道 neoclouds 在债券市场被有效排除、Nvidia 需为客户债务担保 → 本期《华尔街日报》称五大云厂商债务违约保险成本创 2021 年以来最高 → 下一步关注信用利差是否继续外溢到二级市场发债成本。
- **Claude Code 分发与使用边界**：EP006 报道 Cursor 市场出现被篡改的 Claude Code 扩展副本 → 本期 Anthropic 在 Opus 5.5 系统提示词层面约束「复刻既有游戏」 → 下一步关注 Anthropic 是否公开该约束的技术说明与边界，以及模型侧约束与市场分发侧治理的分工。
- **开源推理链的量化与移动端进度**：EP005–EP006 连续跟进 Gemma 4 在 llama.cpp 的支持 → 本期 b12028 把 Gemma 4 纳入 `test-llama-archs`、b12031 引入 OpenCL iq3 量化路径 → 下一步关注 iq3 在移动 GPU（Adreno 等）上的实际吞吐，以及 Gemma 4 正式版发布节奏。
- **国产开源 Agent 底座**：本期 DeepSeek 公开 deepseek-harness（插件式）与 dsh-superagent-prototype（自主 Agent 系统）两个仓库 → 下一步关注正式发布、许可证与第三方可复用度。

## 要闻

### 1. 沙特阿美以约 26 亿美元现金收购 Humain 49% 股权，PIF 保留 51%

**导语**

沙特阿拉伯国家石油公司（Aramco）宣布收购 AI 公司 Humain 49% 股权，交易涉及 2026 年约 99 亿里亚尔（约 26 亿美元）的现金注资，另加 AI、算力与数字资产。沙特公共投资基金（PIF）保留 51%。Humain 由两家股东共同持有，目标是 2030 年建成 3 吉瓦 AI 数据中心。

**详细内容**

据 GamesBeat 报道，交易由 Aramco 通过全资子公司完成，PIF 持有的 51% 不变。除现金外，双方还向 Humain 注入 AI 资产、能力与人才。Humain 官方声明称，本次交易将加速其建设覆盖全栈的 AI 生态，数据中心与高性能算力、云平台、先进模型（含多模态阿拉伯语大模型 ALLAM）以及面向行业的解决方案四条线并行推进。

Humain 成立于 2025 年 5 月，按其规划，到 2030 年将部署 3 吉瓦 AI 数据中心容量，以成为主要的 AI 算力出口方之一。PIF 中东投资主管兼副Governor Yazeed A. Al-Humied 表示，把 PIF 与 Aramco 在 AI 上的投资组合合并到 Humain 之下，可以形成人才、技术与知识产权的协同。Aramco 总裁兼 CEO Amin Nasser 称，该交易延续了公司自 2023 年以来已累计 113 亿美元「技术已实现价值」（Technology Realized Value），其中相当部分来自 AI 方案。

**相关链接**

- https://gamesbeat.com/saudi-arabias-aramco-buy-49-stake-in-ai-firm-humain-for-2-6b/

### 2. OpenAI 中期选举后启动政策攻势：主张对强模型设「限速」，拟把数据中心改称「AI compute campuses」

**导语**

据 Axios 报道，OpenAI 计划在 11 月 3 日美国中期选举后发起一轮政策与公关攻势，议题包括为强大 AI 模型设定强制「限速」、推动美国参与制定全球标准，以及把数据中心改称「AI compute campuses」。OpenAI 首席全球事务官 Chris Lehane 称，中期选举是「2028 年那场戏的预告片」。

**详细内容**

TechCrunch 转述 Axios 的报道时给出更多细节。Lehane 表示 OpenAI 正在讨论多项提案：制定 AI「限速」；找到办法让人们在日常生活中感到 AI 是赋能的；推动美国在全球标准制定中扮演角色；以及重新命名数据中心。报道把这一系列动作放在数据中心的地方阻力背景下——Amazon 与 Microsoft 已表示在与地方政府谈判时不再使用保密协议，Lehane 把围绕数据中心的这场讨论形容为「良好且健康」。

需要说明的是，本期未取到 Axios 原文正文（该站正文需订阅），上述要点的可核查来源为 TechCrunch 的转述正文与 Techmeme 聚合摘要；「speed limits」的具体定义、时间表与是否强制，OpenAI 尚未公布细节。

**相关链接**

- https://www.axios.com/2026/11/01/scoop-openai-post-midterm-policy
- https://techcrunch.com/2026/11/01/openai-might-rebrand-its-data-centers-as-ai-compute-campuses/
- https://www.techmeme.com/261101/p16

### 3. CrowdStrike：国家级组织用 ARTEX 智能体框架规模化入侵 200 余家机构，单次入侵消耗约 14 亿输入 token

**导语**

CrowdStrike 在周四发布的分析中称，一个使用 Go 编写的 AI 渗透测试框架 ARTEX 被国家级组织用于大规模入侵，自 2026 年 10 月 17 日起针对全球 200 余家不同机构同时展开。CrowdStrike 估计，仅一次入侵中规划类智能体就消耗约 14 亿输入 token。

**详细内容**

报道把攻击方描述为使用 ARTEX 这一「智能体化工具链」配合 DeepSeek 以及一款尚未公开、订阅制的商业大模型，由规划智能体与执行智能体组成队列，在人类操作员监督下推进。目标包括拉美、欧洲、亚洲与中东的多个外交部，美国的半导体、国防与智库机构，以及多地电信运营商。

CrowdStrike 称，已在 9 家机构确认到入侵后的活动，攻击方部署了 ShadowPad 的衍生版 BLOODALCHEMY，随后进行凭据喷洒、网络扫描与侦察。在一次入侵中，人类操作员负责指挥智能体编写 Web shell、提取域管理员口令、枚举端点传感器覆盖范围。分析称，智能体在多条路径上并行推进，覆盖 Web 应用、云服务、容器环境、Active Directory 以及邮件与 VPN 基础设施，并在某条路径失败时切换到替代方法。CrowdStrike 的表述是，这类工具让小规模团队能触及的人工操作无法支撑的目标范围显著扩大，但并非放弃既有的访问获取任务。

本条为 CrowdStrike 官方分析口径（经 The Hacker News 转述），未见受害方或国家安全机构的独立确认，攻击规模与 token 量级均为 CrowdStrike 单方估算。

**相关链接**

- https://thehackernews.com/2026/10/chinese-hackers-use-ai-powered-artex-to.html

### 4. Anthropic 在 Opus 5.5 系统提示词中加约束，Claude Code 被指暗中打击游戏克隆

**导语**

据量子位报道，Anthropic 已在 Opus 5.5 的系统提示词中加入两条引导语，要求模型不要「重新创建一个属于别人的特定游戏」，并允许创建原创游戏、特定类型游戏以及使用用户自有设计与素材的游戏。报道称，此举由开发者社区发现后，Anthropic 方面予以确认。

**详细内容**

报道称，触发点是 Opus 5.5（Anthropic 于 2026 年 9 月 22 日发布）大幅提升代码能力之后，逆向工程、反编译与游戏移植的门槛显著下降，出现多个主机游戏的高完成度复刻版本。开发者社区观察到 Claude Code 正在抑制游戏克隆行为，随后 Anthropic 方面确认了系统提示词层面的改动。

Anthropic 官方发布页可佐证两项背景事实：Opus 5.5 的发布日期为 2026 年 9 月 22 日；官方称早期测试者让多个 Claude 模型从单一提示词构建游戏，Opus 5.5 的得分高于其他模型。需要注意，本条未取到 Anthropic 关于该系统提示词改动的一手技术说明或模型卡更新，具体的约束措辞、适用范围与是否影响 Claude Code 之外的入口，目前均以媒体转述为准。

**相关链接**

- https://www.qbitai.com/2026/11/507038.html
- https://www.anthropic.com/news/claude-opus-5-5

## 开发生态

### 5. llama.cpp b12027–b12032：OpenCL 初步支持 iq3 量化、Hexagon DMA 大步长截断修复、InternVL CLS 顺序修复

**导语**

llama.cpp 在 11 月 1 日连续发布 b12027 至 b12032 共 6 个版本。其中 b12031 为 OpenCL 后端加入 iq3 量化支持（iq3_s 与 iq3_xxs 的 AOS/SOA 矩阵向量乘、分块矩阵乘与 Adreno 专用路径），b12030 修复 Hexagon 后端在 2D DMA 描述符 stride 超过 24 位时被截断导致地址错误的问题。

**详细内容**

b12030 修复的是一个会读出错误地址的越界问题：在 v75 及之后的平台上，2D DMA 描述符以 24 位存储 row_size 与 strides，超大 stride 会被截断，从而产生错误地址；修复改为在这种情况下退化为逐行单独传输，并补充了 stride 超过 16 MB 的 CONT 测试。

其余版本的变更包括：b12027 为 LFM3 启用 tensor split（该提交标注由 Claude Opus 5.5 协助完成）；b12028 在 `test-llama-archs` 中启用 Gemma 4 并改用 GQA；b12029 修复 InternVL 的 CLS token 顺序（mtmd）；b12031 为 OpenCL 引入 iq3_s 与 iq3_xxs 的 AOS/SOA matvec、tiled matmul、noshuffle gemm/gemv（Adreno）以及 dp4a 路径，并优化 Adreno 上的解码与窄批处理；b12032 为 SYCL 后端改用 PkgConfig 查找 LevelZero 的头文件与库。

**相关链接**

- https://github.com/ggml-org/llama.cpp/releases/tag/b12031
- https://github.com/ggml-org/llama.cpp/releases/tag/b12030

### 6. openai-python v3.42.1：保留 Responses WebSocket 连接行为，校验 realtime beta WebSocket 认证配置

**导语**

OpenAI Python SDK 于 11 月 1 日发布 v3.42.1。该版本的两项修复分别为：保持 Responses WebSocket 连接行为不变（#4221），以及校验 realtime 的 beta WebSocket 认证配置（#4218）。同时新增一组由 SDK 自持的 Responses 策略辅助函数（#4219）。

**详细内容**

v3.42.1 是一次以缺陷修复为主的补丁版本，变更集中在 WebSocket 通道。PR #4221 处理的是 Responses WebSocket 连接行为的回归问题，修复后不再改变既有连接语义；PR #4218 为 realtime 的 beta WebSocket 认证配置补充校验逻辑；重构项 #4219 把此前由调用方自行实现的 Responses 策略辅助逻辑收进 SDK 内部维护。

与上一期（EP006）收录的 v3.42.0 相比，v3.42.0 的重点是 agent 上下文压缩与会话复审等新增参数，本次补丁不引入新的对外参数，仅调整 WebSocket 通道行为与策略辅助函数的归属。

**相关链接**

- https://github.com/openai/openai-python/releases/tag/v3.42.1

### 7. DeepSeek 开源 deepseek-harness 与 dsh-superagent-prototype，把 Agent 底座做成插件式

**导语**

DeepSeek 在 GitHub 上公开两个新仓库：deepseek-harness（描述为「一切皆插件」的 Agent 底座）与 dsh-superagent-prototype（面向更自主的 Agent 系统）。量子位在 10 月 31 日的报道中把这一动作描述为「重磅开源 Agent 底座架构」，并提到该系统已能自行发现 Bug 并提交 PR。

**详细内容**

从 DeepSeek 组织的公开仓库列表看，两条主线在时间上紧邻：deepseek-harness 仓库在 10 月 30 日有推送，dsh-superagent-prototype 在 10 月 31 日有推送；仓库内还包含 dsh-node-addon-require-builtin、dsh-libreoffice-kit 等被标注为「DeepSeek Harness 的内部组件」的子仓库，结构上呈现为「底座 + 插件 + 内部组件」的分层。

编辑说明：本期未取到两个仓库的 README 正文与完整提交记录，「一切皆插件」的表述来自仓库自述描述与量子位的转述；量子位提到的「自行发现 Bug 并提交 PR」未在本次抓取范围内找到对应的一手记录。本条为 72 小时补收，仓库首次推送时间落在 10 月 30 日至 31 日区间，未精确到首次公开时间点。

**相关链接**

- https://github.com/deepseek-ai/deepseek-harness
- https://github.com/deepseek-ai/dsh-superagent-prototype
- https://www.qbitai.com/2026/10/506904.html

### 8. NVIDIA Nemotron 开源模型进入社区量化阶段，11 月 1 日出现多个 GGUF 仓库

**导语**

NVIDIA 在 Hugging Face 发布的 Nemotron 文章（10 月 30 日）给出开源模型组合用法：Nemotron 3 ASR 负责听、Nemotron 3.5 Bolt E4B 4GB 负责思考、Magpie TTS Zeroshot 负责说、Audio2Face-3D 负责动画，全部由 Nemotron Voice Agent 在单机工作站上编排。11 月 1 日，社区已出现多个对应 GGUF 量化仓库。

**详细内容**

文章给出的具体组件包括：语音识别用 Nemotron 3 ASR（示例权重 `nemotron-speech-streaming-en-0.6b.q8_0.gguf`）；对话生成用 Nemotron 3.5 Bolt E4B 4GB（官方提供 BF16 权重，社区另发布 GGUF 版本），并以 LoRA 适配器提供角色性格；语音合成用 Magpie TTS Zeroshot；口型动画用 Audio2Face-3D，在 Unreal Engine 5 中驱动。整套方案运行在一台工作站上，硬件为 NVIDIA RTX PRO 6000 Blackwell Max-Q 与 RTX PRO 4000 Blackwell。

多模态部分使用 Nemotron 3 Nano Omni（`Nemotron-3-Nano-Omni-30B-A3B-Reasoning-BF16`）描述访客服装，并用 YOLO 与 ByteTrack 做访客计数与跟踪。11 月 1 日新增的社区仓库包括 `MirrorNeuronLab/NVIDIA-Nemotron-3.5-Bolt-E4B-GGUF`、`tryambientai/nemotron-3.5-asr-streaming-0.6b-gguf` 等，以及多个第三方 Bolk/4-bit 量化变体。

本条为 72 小时补收，NVIDIA 文章首次发布于 10 月 30 日；社区量化仓库的创建时间为 11 月 1 日，落在本期 24 小时窗口内。

**相关链接**

- https://huggingface.co/blog/nvidia/nemotron-halloween
- https://huggingface.co/MirrorNeuronLab/NVIDIA-Nemotron-3.5-Bolt-E4B-GGUF

## 技术与洞察

### 9. Cloudflare Q3 报告：网络层 DDoS 攻击 1820 万次环比增 38%，DNS 放大攻击增 215%

**导语**

Cloudflare 在其季度 DDoS 威胁报告中称，第三季度 2026 年自动缓解了 1820 万次网络层（L3）DDoS 攻击与 14.4 万亿次 HTTP DDoS 请求，折合每天 19.74 万次、平均每 0.44 秒一次。作为对比，第二季度为 1320 万次、第一季度为 1000 万次。

**详细内容**

Cloudflare One 威胁情报团队把环比 38% 的增长归因于 DDoS-for-hire 的 booter/stresser 服务，这类服务可支撑数十万次攻击。结构上出现了两个方向相反的变化：持续 10 分钟以内、带宽低于 1 Gbps 的短促低带宽攻击激增 208%；而超过 1 Tbps 的超大流量攻击环比下降 69%，从第二季度的 805 次降到第三季度的 251 次，Cloudflare 称这可能与今年 3 月针对 AISURU、KimWolf、JackSkid 与 Mossad 的执法行动有关。

协议分布上，无连接轻量目录访问协议（CLDAP）洪泛有所下降，DNS 放大攻击则增长 215%，占全部网络层攻击的 3.43%。受攻击最多的国家为美国、中国、印度尼西亚、英国与土耳其；加拿大与以色列首次进入前十，加拿大受袭集中于零售、电信与营销行业。

**相关链接**

- https://thehackernews.com/2026/10/cloudflare-reports-182-million-network.html

## 行业动态

### 10. 脑机接口创业公司 NeuroXess 完成 7 亿元人民币 B 轮，称已完成 65 例临床植入

**导语**

上海脑机接口创业公司 NeuroXess 完成 7 亿元人民币（约 1.05 亿美元）B 轮融资，由国投证券旗下 SDIC Juli、深创投与翊知资本联合领投。公司称已完成 65 例临床植入，并于今年 7 月启动涉及近 20 家医院的注册试验。

**详细内容**

NeuroXess 的产品是可植入系统，结合柔性电极与无线供电及数据传输，设计目标是支持运动与语音解码，以及外部设备控制。本轮资金用途为多中心临床试验、监管申报、产能建设与下一代产品研发。

产能方面，公司正在建设 14,300 平方米的制造基地，规划年产能 10,000 套系统。本条为 TechNode 报道（引用 PEdaily 中文原始报道），公司口径的临床例数与产能规划尚未见第三方核验。

**相关链接**

- https://technode.com/2026/10/28/brain-computer-interface-startup-neuroxess-raises-rmb-700-million-in-series-b-funding/

## 前瞻与传闻

- 线索雷达｜美国 36 场州长竞选中，支持数据中心暂停令的候选人最多可能拿下 15 场（含德州、俄亥俄、密歇根、纽约）——单一来源 · 未核实：https://www.theinformation.com/articles/candidates-backing-data-center-pauses-win-15-governors-races
- 线索雷达｜Google 数据中心能源负责人称太空数据中心成本最高可达地面设施的 100 倍，美国电力供应充足但审批偏慢——单一来源 · 未核实：https://www.theinformation.com/articles/google-energy-chief-space-data-centers-cost-100-times-earth
- 线索雷达｜《华尔街日报》称 Amazon、Alphabet、Microsoft、Meta、Oracle 的债务违约保险成本创 2021 年以来最高——单一来源 · 未核实：https://www.wsj.com/finance/stocks/ai-investors-are-racing-to-get-insurance-on-the-biggest-market-bet-in-history-a60e296f
- 线索雷达｜工业 AI 创业公司 Lumaril 完成 6600 万美元 A 轮，估值 4 亿美元，产品为连接既有控制系统优化工业生产的 AI 软件——单一来源 · 未核实：https://www.wsj.com/pro/venture-capital/ai-startup-lumaril-wants-to-make-factories-the-best-version-of-themselves-b65ea83d
- 线索雷达｜西湖大学成立世界模型研究中心——单一来源 · 未核实：https://www.qbitai.com/2026/11/507076.html
- 线索雷达｜清华姚期智团队提出「代数世界模型」，目标为让模型按牛顿式推理方式求解问题——单一来源 · 未核实：https://www.qbitai.com/2026/11/507031.html
- 线索雷达｜OpenAI Codex CLI 发布 0.167.0-alpha.2 与 0.167.0-alpha.3 预览版，release note 未列明细——单一来源 · 未核实：https://github.com/openai/codex/releases

## 编辑备注

1. **本期真实检索时间范围**：主窗口 2026-11-01 07:00 – 2026-11-02 07:00（Asia/Shanghai）；第 7、8 条为 72 小时补收（DeepSeek 仓库 10 月 30–31 日、NVIDIA Nemotron 文章 10 月 30 日），已在正文标注。
2. **来源分级**：第 1 条为 GamesBeat 取到的双方高管声明口径；第 2 条为 Axios 独家报道经 TechCrunch 转述（Axios 原文需订阅，未取到正文）；第 3 条为 CrowdStrike 官方分析经 The Hacker News 转述，为攻击方单方估算；第 4 条为 Anthropic 官方表态经量子位转述，未取到一手技术说明；第 5–9 条均为一级来源原文（GitHub Release 正文、Hugging Face 仓库时间戳、Cloudflare 季度报告经 THN 转述）；第 10 条为公司口径经 TechNode 报道。线索雷达 7 条均为单一来源，未展开细节，不做推断。
3. **官方宣称归属**：第 8 条的组件与硬件配置为 NVIDIA 文章自述；第 9 条的流量与攻击次数为 Cloudflare 自报数据；第 10 条的 65 例临床与 10,000 套年产能为公司口径。以上均未表述为已独立验证的事实。
4. **去重**：EP001–EP006 已报道的 OpenAI 融资目标下调、ChatGPT 分享链接 P1 漏洞、Cursor 市场被篡改的 Claude Code 扩展、Apple CEO「不为 AI 而 AI」表态、Nvidia 为 Nscale 担保、S&P 下调 Meta 展望、xAI 数据中心污染诉讼、Anthropic IPO 垃圾债评级、Deepgram 收购 Daily/Pipecat、Mistral Le Chonk 权重、Gemini 4 Carbon、Codex CLI rust-v0.166.0、llama.cpp b11982–b12024、Ollie 关停、DoorDash AI 代理订单数等，本期均未重复收录，仅在「后续追踪」中交代新增进展。
5. **未收录说明**：Binance 黑客事件及资金流出、ServiceNow 收购 Sweep、Freecash「付费刷手机」应用、Colossus 杂志探访、俄罗斯关联黑客网络攻击、NSA/CrowdStrike 之外的常规漏洞更新等，与本期监测领域（全球 AI 及相关技术生态）关联度不足或无实质新增 AI 事实，未予收录；未为凑条目收录 TechCrunch 的观点型文章与聚合站重复条目。
6. **采集限制**：Axios、FT、WSJ、Bloomberg、The Information、The Verge、Wired 等原文因付费墙或需订阅未取到正文；本期未发现失效链接，需人工打开的付费墙链接已在来源清单单独列出。
