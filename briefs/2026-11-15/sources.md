# AI 早报 2026-11-15 来源清单（EP020）

> 采集窗口：2026-11-14 07:00 ~ 2026-11-15 07:00（Asia/Shanghai）。一级来源优先，媒体口径逐条标注。
> 采集方式：NotebookLM research 四轮（fast，Q1 发布与开发生态 / Q2 各厂商官方更新 / Q3 安全与合规 / Q4 额度与限流类小更新，每轮返回 10 条来源线索）、官方博客与公告 RSS（OpenAI、Google AI、NVIDIA、Hugging Face Blog、GitHub Blog 与 Changelog、TechCrunch AI、Techmeme、The Hacker News）、GitHub Releases API（20 个仓库）、以及把窗口内公开条目摘要作为 source 送入 NotebookLM 做研判排序（`ep020/work/nblm_chat.json`）。窗口内命中带时间戳条目 34 条（不含 arXiv）。
> 链接核验：公开条目与来源清单链接共 22 条，逐条实际访问 —— 可达 22 条（HTTP 200/206），**失效 0 条**（初稿中的 `https://www.techmeme.com/261114/p24` 核验返回 404，已按「不猜测替换链接」删除）。核验脚本与原始输出：`ep020/work/linkcheck.py`、`ep020/work/linkcheck.txt`。
> 证据等级口径：**官方已确认** = 已取得官方原文；**多源交叉** = 两个及以上独立来源互证；**媒体转述** = 媒体对官方文件的转述；**单一来源 · 未核实** = 只进「前瞻与传闻」。

## 一手来源（官方公告 / 官方仓库 Release / 官方博客）

| # | 条目 | 来源 | 证据等级 | 链接 |
| --- | --- | --- | --- | --- |
| S-01 | langgraph 1.2.22：子图改为在独立线程上流式输出；配套 checkpoint 4.3.2、checkpoint-postgres 3.2.1、prebuilt 1.1.2 同批发布 | langchain-ai/langgraph Release（2026-11-14 09:31–09:43 CST） | 官方已确认 | https://github.com/langchain-ai/langgraph/releases/tag/1.2.22 |
| S-02 | langgraph-checkpoint 4.3.2：InMemoryStore 搜索按请求页停止；批量 store 读取用字典去重 | langchain-ai/langgraph Release（2026-11-14 09:31 CST） | 官方已确认 | https://github.com/langchain-ai/langgraph/releases/tag/checkpoint%3D%3D4.3.2 |
| S-03 | llama.cpp b12385：修复 qwen2vl 图未应用通用 pass 加载的 NVFP4 逐张量缩放，导致模型输出乱码（PPL 约 1e6） | ggml-org/llama.cpp Release（2026-11-15 02:48 CST） | 官方已确认 | https://github.com/ggml-org/llama.cpp/releases/tag/b12385 |
| S-04 | llama.cpp 1.0.0 之后的构建序列 b12378–b12387（mtmd 自定义视频解码器、视频纵横比与旋转修复、jinja 渲染开销、ggml-backend 分片、hexagon fa no-mask 尾部、32 位 ctz64） | ggml-org/llama.cpp Releases | 官方已确认 | https://github.com/ggml-org/llama.cpp/releases |
| S-05 | Vercel AI SDK ai@5.0.290：失败工具调用的错误文本默认与模型消息历史保持一致（`redactToolErrors: true` 可改为 `onError` 结果）、防止过度内存与 CPU 占用 | vercel/ai Release（2026-11-14 07:43 CST） | 官方已确认 | https://github.com/vercel/ai/releases/tag/ai%405.0.290 |
| S-06 | Vercel AI SDK ai@6.0.332：依赖更新，@ai-sdk/gateway 升至 3.0.237 | vercel/ai Release（2026-11-14 07:44 CST） | 官方已确认 | https://github.com/vercel/ai/releases/tag/ai%406.0.332 |
| S-07 | CISA 已知被利用漏洞（KEV）目录官方入口，用于核对 CVE-2026-114713 的收录状态 | CISA 官方 | 官方已确认（目录入口可达，条目口径以 S-11 为准） | https://www.cisa.gov/known-exploited-vulnerabilities-catalog |

## 媒体报道（多源交叉，官方原文未取得）

| # | 条目 | 来源 | 证据等级 | 链接 |
| --- | --- | --- | --- | --- |
| M-01 | 两大 Nvidia 股东 Altimeter（Brad Gerstner）与 Atreides（Gavin Baker）联名致信董事会要求考虑「黄仁勋回归」；两家合计持股 21.3 亿美元 | CNBC 首报（2026-11-15 03:55 CST）；纽约时报、GeekWire、华盛顿观察家报、24/7 Wall St.、The Hill 跟进 | 多源交叉 · 官方原文未取得 | https://www.techmeme.com/261114/p18 |
| M-02 | 复职请愿签名超 115,000（周六下午口径），含马斯克、Tim Sweeney、Garry Tan、Amjad Masad；分项 5,965 名现任员工、1,108 名前员工、63,063 名股东；请愿要求「在独立调查查明事实的同时把他请回来」 | TechCrunch（2026-11-15 05:41 CST）、Business Insider（03:01 CST）、彭博、Yahoo Finance 等跟进 | 多源交叉 · 官方原文未取得 | https://techcrunch.com/2026/11/14/elon-musk-other-tech-execs-sign-petition-calling-on-nvidia-to-reinstate-jensen-huang/ |
| M-03 | 请愿签名规模的较早口径（约 97,000 份、5,000+ 现任员工） | Business Insider，经 Techmeme 聚合（2026-11-15 03:01 CST） | 多源交叉 | https://www.techmeme.com/261114/p17 |
| M-04 | 意大利数据保护局对 Meta 处以 8.05 亿欧元（约 8.87 亿美元）罚款，指其未经同意、未告知即访问 Android 用户照片与视频 | 路透社（2026-11-14 23:10 CST）；AP、CNBC、CBS、BBC、彭博等跟进 | 多源交叉 · 意大利监管机构公告原文未取得 | https://www.techmeme.com/261114/p11 |
| M-05 | FAA 全国性停飞初步归因：偏远站点铜改光纤施工，承包商 L3Harris 可能安装「故障路由器」；L3Harris 股价承压 | 华尔街日报（2026-11-15 01:15 CST），30 余家媒体跟进 | 多源交叉 · FAA 正式调查报告未发布 | https://www.techmeme.com/261114/p14 |
| M-06 | 微软宣布全部 Microsoft 365 产品恢复服务，故障持续约 36 小时、波及 74 个国家；部分企业可申请最高 100% 服务积分，12 月 31 日截止 | 彭博社（2026-11-14 16:03 CST）；BBC、AP、Wired、Forbes 等跟进 | 多源交叉 | https://www.techmeme.com/261114/p8 |
| M-07 | Databento 完成 1 亿美元 C 轮、估值 11 亿美元；公司称与六大前沿 AI 实验室中的五家签有合同 | FinTech Global（2026-11-15 02:35 CST）；Databento 官方渠道、The SaaS News、FinSMEs 等跟进 | 多源交叉 · 公司口径 | https://www.techmeme.com/261114/p16 |
| M-08 | 特斯拉 Cybercab 自动驾驶订阅协议：车辆仅在 Tesla 启用的地理围栏内可用，围栏可随时变更；Cybercab 售价 29,990 美元 | Electrek（2026-11-15 00:01 CST）；The Verge、路透、PCMag 等跟进 | 多源交叉 · 协议原文未逐条核对 | https://www.techmeme.com/261114/p12 |
| M-09 | UnrealIRCd 缺陷 CVE-2026-114713（CVSS 8.6，分隔符不当处理导致服务器级命令注入）被 CISA 于 11 月 13 日列入 KEV 目录，已收到在野利用报告 | The Hacker News（2026-11-14 20:38 CST） | 媒体转述官方目录 · CISA 通告原文未取回 | https://thehackernews.com/2026/11/attackers-exploit-unrealircd-flaw-that.html |

## 单一来源 · 未核实（仅进「前瞻与传闻」）

| # | 条目 | 来源 | 证据等级 | 链接 |
| --- | --- | --- | --- | --- |
| R-01 | 亚洲多国政府就黄仁勋离职表态：部分确认芯片供应承诺，其他国家评估本地项目影响或处理在办调查 | TechCrunch（2026-11-14） | 单一来源 · 未核实 | https://techcrunch.com/2026/11/14/asian-governments-react-to-nvidia-ceo-jensen-huangs-exit/ |
| R-02 | 华盛顿邮报：Rubio 使用一份关于 Alice Huang 的 CIA 报告改写自身立场，推动更严对华限制并促成黄仁勋去职 | 华盛顿邮报，经 Techmeme 聚合（2026-11-14 22:30 CST） | 单一来源 · 未核实 | https://www.techmeme.com/261114/p10 |
| R-03 | 黄仁勋在 Nvidia 不持超级投票权，公司治理结构放大人事变动影响 | Forbes，经 Techmeme 聚合（2026-11-15 06:05 CST） | 单一来源 · 分析性报道 | https://www.techmeme.com/261114/p20 |
| R-04 | 黄仁勋辞职对美国开源模型是打击，其对开源开发者的资助「很可能枯竭」 | Nathan Lambert / Interconnects AI，经 Techmeme 聚合（2026-11-15 02:05 CST） | 单一来源 · 观点评论 | https://www.techmeme.com/261114/p15 |

## 采集路径与命中情况

| 路径 | 工具 / 来源 | 窗口内命中 |
|---|---|---|
| NotebookLM research（fast，四轮） | `notebooklm-research-start` / `-status` | 四轮各返回 10 条来源线索，共 40 条；report 字段为空，改由 chat 研判补位 |
| NotebookLM 研判 | `notebooklm-source-add`（窗口摘要）+ `notebooklm-chat-start` / `-status` | 输出对窗口条目做了影响力排序并标出旧闻重复项，落盘 `ep020/work/nblm_chat.json` |
| 官方 RSS | OpenAI、Google AI、NVIDIA、Hugging Face Blog、GitHub Blog / Changelog / 主站、TechCrunch AI、Techmeme、The Hacker News | 窗口内命中 19 条（OpenAI RSS 最新条目为 11-13 23:00，窗口内无更新） |
| GitHub Releases API | 20 个仓库（langgraph、llama.cpp、vercel/ai、codex、claude-code、openai-python、transformers、litellm、vllm、sglang、ollama、MCP SDK、langchain、agents-python、adk、cline、pytorch、trl、whisper.cpp 等） | 窗口内命中 15 个版本（langgraph 4、llama.cpp 9、vercel/ai 2），其余仓库窗口内无发布 |
| 页面直取 | 22 个一手与聚合页面 | 22 个 HTTP 200/206 |

## 本期未采用的候选（说明）

1. TechCrunch《The AI graveyard》是长期维护的盘点专栏，内容为此前已报道项目的汇总，不属于窗口内新事件。
2. Codex 0.171.0-alpha.5（11-14 09:20 CST）Release 正文仅有一行版本标题，无可核实功能说明，按「无实质内容」不收录。
3. LiteLLM v1.106.10 与 v1.108.9（11-14 08:34 / 11-15 06:00 CST）Release 正文仅为 cosign 镜像签名校验说明，实用信息量低于收录门槛。
4. arXiv cs.AI/cs.CL 窗口内论文数量较多，但本期无与日报主线强相关且已被广泛跟进的条目；周末窗口亦无 arXiv cs.CL 新条目（feed 解析失败）。
5. Techmeme 聚合的其他条目（加密货币相关如 Lugano 代币、Trump Media 可转债、拉丁美洲稳定币占比等）与 AI 生态主线弱相关，未收录。
