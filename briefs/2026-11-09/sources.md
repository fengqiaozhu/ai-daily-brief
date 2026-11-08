# AI 早报 2026-11-09 来源清单（EP014）

检索窗口：2026-11-08 07:00 ~ 2026-11-09 07:00（Asia/Shanghai，24 小时），重要遗漏补至 72 小时（2026-11-05 07:00 起）。
证据分级：官方已确认 / 多源交叉 / 单一来源 · 未核实（线索雷达）。

## 完整条目来源

| 编号 | 条目 | 证据等级 | 来源 |
| --- | --- | --- | --- |
| 1 | Nvidia 董事会调查黄仁勋、CEO 内部邮件 | 多源交叉 | https://www.techmeme.com/261108/p13 （彭博社）<br>https://www.techmeme.com/261108/p14 （Axios）<br>https://techcrunch.com/2026/11/08/nvidia-says-its-investigating-ceo-jensen-huangs-relationship-with-possible-chinese-spy/ （TechCrunch） |
| 2 | llama.cpp b12193–b12211 共 16 个构建 | 官方已确认 | https://github.com/ggml-org/llama.cpp/releases<br>https://github.com/ggml-org/llama.cpp/releases/tag/b12207<br>https://github.com/ggml-org/llama.cpp/releases/tag/b12208<br>https://github.com/ggml-org/llama.cpp/releases/tag/b12202 |
| 3 | OpenAI Agents SDK v0.24.0-alpha.7 | 官方已确认 | https://github.com/openai/openai-agents-python/releases/tag/v0.24.0-alpha.7<br>https://github.com/openai/openai-agents-python |
| 4 | Open WebUI v0.13.1 / v0.13.2 | 官方已确认 | https://github.com/open-webui/open-webui/releases/tag/v0.13.1<br>https://github.com/open-webui/open-webui/releases/tag/v0.13.2 |
| 5 | LiteLLM v1.110.0-dev.2 | 官方已确认 | https://github.com/BerriAI/litellm/releases/tag/v1.110.0-dev.2<br>https://github.com/BerriAI/litellm/releases |
| 6 | crewAI 1.15.38 | 官方已确认 | https://github.com/crewAIInc/crewAI/releases/tag/1.15.38<br>https://github.com/crewAIInc/crewAI/releases |
| 7 | Nous Research Arete-27B | 官方已确认 | https://nousresearch.com/arete<br>https://huggingface.co/NousResearch/Arete-27B<br>https://huggingface.co/datasets/NousResearch/Propaganda_Eval |
| 8 | Mistral 开源 Le Chonk 权重（72 小时补收，首次公开 2026-11-05） | 官方已确认 | https://mistral.ai/news/ |
| 9 | OpenAI 状态页图像生成错误率升高事件 | 官方已确认 | https://status.openai.com/incidents/01M6XVDCKRT3PSB0YP8J30GTD5<br>https://status.openai.com/ |
| 10 | DeepSeek Harness 日活 154 万、日均约 92 万亿 token | 多源交叉 | https://www.techmeme.com/261108/p12 （彭博社）<br>https://technode.com/2026/11/06/deepseek-plans-official-plugin-marketplace-as-harness-daily-users-reach-1-54-million/ （TechNode）<br>https://api-docs.deepseek.com/zh-cn/quick_start/pricing （DeepSeek 官方文档） |

## 线索雷达来源（单一来源 · 未核实，只保留标题、链接与日期）

| 线索 | 来源 | 链接 |
| --- | --- | --- |
| Anthropic 据报向 OnePWR 采购 1.7GW 燃气发电机承诺、金额 34 亿美元 | 金融时报（经 Techmeme 聚合，FT 原文页返回安全校验，无法读取正文） | https://www.techmeme.com/261108/p8 |
| 美国商务部 AI 安全中心 CAISSI 官员被要求非正式向白宫某办公室汇报 | 美联社（经 Techmeme 聚合，AP 原文页返回安全校验，无法读取正文） | https://www.techmeme.com/261108/p16 |
| 苹果高管 John Ternus 推动公司加快 AI 进展 | 彭博社（经 Techmeme 聚合） | https://www.techmeme.com/261108/p9 |
| 2026 年 AI 公司已卖出或定价 3000 亿美元以上股票 | The Information（经 Techmeme 聚合） | https://www.techmeme.com/261108/p10 |
| 内蒙古成为中国增长最快的 AI 数据中心区域 | SemiAnalysis（经 Techmeme 聚合） | https://www.techmeme.com/261108/p7 |

## 一期源直采清单

- 官方新闻页：Anthropic Newsroom、OpenAI News、Mistral News、xAI News、Google Blog、Microsoft AI Blog、DeepSeek API Docs、Nous Research Blog、TechNode GenRobot 报道页、TechCrunch AI 频道 RSS。
- GitHub Release API：llama.cpp、LiteLLM、crewAI、open-webui、openai-agents-python、claude-code、codex、openai-python、transformers、vllm、pytorch、langchain、MCP Python/TypeScript/Go/C# SDK、goose、dspy、sglang、mlx-lm、vercel/ai 等 30 余个仓库。
- Hugging Face：模型搜索接口、trending 模型接口、Arete-27B 模型卡与 Propagna_Eval 数据集。
- OpenAI 状态页事件接口：status.openai.com 事件列表。

## 链接可用性核查

- 第 9 条状态页事件页、Nous Research 博客、Hugging Face 模型卡、open-webui v0.13.1 发布页均返回 HTTP 200。
- 金融时报原文页与美联社原文页在本环境返回安全校验页（403 / JS 质询），相关线索已降级为线索雷达，仅保留标题、链接与日期，未展开细节。
- OpenAI 官方新闻页返回 JavaScript 质询页，本期改用状态页事件接口取官方口径。
