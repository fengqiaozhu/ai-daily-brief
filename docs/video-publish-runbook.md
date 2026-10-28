# 视频发布操作说明

把某一期的 mp4 放到 GitHub Release，再把播放器写进该期 `briefs/YYYY-MM-DD/index.html`，最后用原来的站点发布命令提交图文。mp4 不进 git，也不使用 Git LFS。

本说明不发布正式期次。第 002 期及以后的正式补发不在这里执行。

## 1. 文件与命令

| 用途 | 命令 |
| --- | --- |
| 上传并等到匿名直链的 sha256 一致 | `scripts/publish-video.sh YYYY-MM-DD --file MP4 --sha256 HEX` |
| 预演（Release 标成 prerelease，标题写明不是正式期次） | 同上，加 `--prerelease` |
| 把播放器注入当期页 | `python3 scripts/inject-episode-video.py YYYY-MM-DD` |
| 只检查页面里有没有这一期的播放器和披露语 | `python3 scripts/inject-episode-video.py --check YYYY-MM-DD` |
| 发布站点（图文 + 已注入的 HTML） | `scripts/publish.sh YYYY-MM-DD` |

仓库固定为 `fengqiaozhu/ai-daily-brief`。换仓库时两边都加 `--repo OWNER/NAME`，或设置 `AI_DAILY_REPO`。

成功时 `scripts/publish-video.sh` 的标准输出只有这一行：

```text
https://github.com/fengqiaozhu/ai-daily-brief/releases/download/video-YYYY-MM-DD/ai-daily-YYYY-MM-DD.mp4
```

失败时标准输出为空，标准错误是一个 JSON 对象，进程以非零状态退出。页面、git 提交和已有的其他公开 Release 都不会被这个失败改掉。

```json
{"ok":false,"stage":"upload","error":"原始错误","rollback":"none"}
```

`stage` 取值：

| stage | 含义 |
| --- | --- |
| `args` | 日期、`--file` 或 `--sha256` 不合格 |
| `file` | 路径不是普通文件 |
| `file_location` | 文件在站点仓库里面。先挪到仓库外 |
| `size_limit` | 达到或超过 1.5 GiB，停手上报 |
| `sha256_local` | 本地文件的 sha256 和参数不一致。还没有请求 GitHub |
| `target_sha` | 读不到 GitHub `main` 的当前提交 |
| `permission` | 令牌无效或没有写 Release 的权限 |
| `create_release` | 创建草稿失败 |
| `upload` | 上传失败，或对象的 `content_type` 不是 `video/mp4` |
| `draft_visibility` | 发布前，刚上传资产的草稿直链对匿名用户不是 404 |
| `publish_release` | 把草稿改成公开失败 |
| `poll_url` | 60 秒内匿名稳定直链没有同时达到 HTTP 200 和期望的 sha256 |

`rollback` 为 `none` 表示这次运行没有创建 Release。`deleted_release_created_by_this_run` 表示只删除了这次运行自己创建的那个 Release id。脚本不会按标签去删一个早就存在的公开 Release。

## 2. 上传

mp4 放在仓库外面，例如操作者主目录下的 `video-inbox/`。不要放进 `ai-daily-brief/`，也不要放进 `briefs/YYYY-MM-DD/`。

期望的 sha256 用当期终审记录里的值，不要临时改成「算出来的就算数」来绕过不一致。下面的 `sha256sum` 只是在你已经核对过终审值之后，取出十六进制串：

```sh
export NO_COLOR=1
export GH_FORCE_TTY=0
unset FORCE_COLOR || true

DATE=YYYY-MM-DD
FILE="$HOME/video-inbox/ai-daily-$DATE.mp4"
SHA=$(sha256sum "$FILE" | awk '{print $1}')

scripts/publish-video.sh "$DATE" --file "$FILE" --sha256 "$SHA"
```

脚本内部会做这些事：

1. 文件不在仓库内，且小于 1.5 GiB（1610612736 字节）。达到或超过就停。
2. 本地 sha256 必须和 `--sha256` 一致。
3. `target_commitish` 用 `git ls-remote https://github.com/fengqiaozhu/ai-daily-brief.git refs/heads/main` 的当前 SHA，不用本地可能过期的 `origin/main`。
4. 创建前先 `gh release view video-YYYY-MM-DD`。标签已经存在就以 `stage=create_release` 停止，不修改、不删除那个 Release。
5. 创建草稿 Release，标签 `video-YYYY-MM-DD`，`draft: true`，`make_latest: "false"`。`target_commitish` 是上面读到的 `main` SHA。
6. 上传 `ai-daily-YYYY-MM-DD.mp4`，请求头 `Content-Type: video/mp4`。
7. 只匿名请求刚上传资产的 `browser_download_url`，并且带 `Cache-Control: no-cache`。它必须是 404，然后才 PATCH 成公开。正式发布用 `prerelease: false`。预演加 `--prerelease`。发布前不要请求稳定直链。那次请求会把 404 缓存在直链上，公开之后 60 秒轮询仍然 404。
8. 最多约 60 秒轮询稳定直链（同样带 `Cache-Control: no-cache`），直到 HTTP 200 且 sha256 一致。

判断草稿是否已经公开时，用 `jq -r '.draft | tostring'`。`jq` 的 `//` 会把 JSON 布尔值 `false` 当成空，已经公开的 Release 会被误判成「仍是草稿」。

GitHub 返回的 `created_at` 不一定是这次创建的墙上时钟，有时会印成目标提交的提交时间。不要用它判断「这是不是旧 Release」。存在性预检才是边界：标签已在，就停，并且不删。

令牌用已经授权的 `gh`。不要把令牌写进仓库、工单、文档或脚本默认值。托管环境下把 `GH_TOKEN` 设成无效值，不一定能拦住已经登录的 `gh`。`stage=permission` 会在接口返回 401、403 或凭据错误时触发；本说明第 9 节的演练没有用假令牌打出这条路径。

## 3. 注入播放器

上传成功并拿到标准输出里的那条直链之后再改页面。注入的是 [CMP-231](/CMP/issues/CMP-231) `video-hosting-plan` 第 4 节的 `<figure class="episode-video">`：有 `controls`、`preload="metadata"`、`playsinline`，没有 `autoplay`，没有 `crossorigin`，披露语是「本期视频由 AI 生成，内容以图文版为准。」

```sh
python3 scripts/inject-episode-video.py YYYY-MM-DD
```

默认改 `briefs/YYYY-MM-DD/index.html`。演练时改副本：

```sh
python3 scripts/inject-episode-video.py YYYY-MM-DD --html /path/to/test-index.html
```

位置：`.wrap` 里面、`header.mast` 结束之后、`nav.toc` 外面。页面是固定深色设计（含 `#070a12`）时用深色播放器，否则用浅色播放器。可以用 `--theme dark` 或 `--theme light` 指定。

同一天再跑一次会打印 `unchanged`，不会插入第二份。文件里如果已经有其他日期的播放器，那段 HTML 保持原样。页面缺少 `.wrap` 或 `header.mast` 时退出非零，并且不改文件。

## 4. 发布站点与硬校验

播放器写进 `index.html` 之后：

```sh
scripts/publish.sh YYYY-MM-DD
```

只想构建、不推送：

```sh
scripts/publish.sh YYYY-MM-DD --no-push
```

下面任一情况成立时，`index.html` 里必须有对应的

`<video src="https://github.com/fengqiaozhu/ai-daily-brief/releases/download/video-YYYY-MM-DD/ai-daily-YYYY-MM-DD.mp4">`

以及披露语。否则命令以 `error_stage=video_html` 退出，不构建之后的提交，不推送，也不改页面：

- GitHub 上能看到 Release `video-YYYY-MM-DD`。`scripts/publish.sh` 在 origin 是 GitHub 时会自己查。本地演练仓库没有 GitHub origin 时，设置 `AI_DAILY_VIDEO_LOOKUP=1` 仍会查 `fengqiaozhu/ai-daily-brief`。查不到（`release not found`）就不当作有视频。查询本身失败（例如 401）则 `error_stage=release_lookup`，停止，避免在不确定时放行。
- 或者工作区有本地标记文件 `video-markers/YYYY-MM-DD`。这个目录写在 `.gitignore` 里，不会进 git。内容可以是 sha256，脚本只看文件在不在。

没有 Release、也没有这个标记的期次，仍按原来的图文流程发布。

## 5. mp4 不进 git

三道都要生效：

1. `.gitignore` 忽略 `*.mp4`、`*.webm`、`*.mov`、`*.mkv`、`*.m4v`，以及原来的音频扩展名。`video-markers/` 也忽略。
2. `scripts/publish.sh` 在 `briefs/YYYY-MM-DD/` 里看到视频扩展名时，以「视频扩展名」拒绝，并且不 `git add`。白名单仍然只有 `index.md`、`index.html`、`sources.md` 和可选的 `blurb.txt`。暂存区里已经有影音文件时，以 `error_stage=staged_media` 拒绝，并写出文件名。
3. `.github/workflows/pages.yml` 在构建前拒绝 git 已跟踪的同类文件。Pages 工作流保持 `contents: read`，不负责上传 mp4。

`git add -f` 可以绕过 `.gitignore`，所以第 2 和第 3 道仍然要留着。不要启用 Git LFS。

## 6. 1.5 GiB 停手上报线

单个 mp4 达到或超过 **1610612736 字节（1.5 GiB）** 时，`scripts/publish-video.sh` 以 `stage=size_limit` 退出。不要上传，不要改页面，不要推送，不要改用 Git LFS。把文件大小和期次记到工单里，交给负责人决定。GitHub Release 的硬上限是 2 GiB；1.5 GiB 是这里的停手线，不是「再试一次」。

## 7. 失败时停在哪里

无 GitHub 写权限、Release 创建或上传失败、sha256 不符、直链超时，都停。不改页面，不推送。不要手工删别的公开期次。

这次运行如果已经创建了草稿或刚刚公开的 Release，脚本只删除那个新 id。标签在 PATCH 成功之后才删。删除是为了不留下半截预演；删除失败时 `rollback` 为 `delete_failed`，错误文本里带有原始信息，到此停止，不要再去删其他标签。创建前发现标签已经存在时，`rollback` 为 `none`，那个已有 Release 保持不动。

本地 sha256 不符时还没有请求 GitHub，`rollback` 为 `none`。

## 8. 回滚

只撤页面上的入口：从 `briefs/YYYY-MM-DD/index.html` 去掉这一期的 `<figure class="episode-video">` 及其紧随的播放器 `<style>`，保留其他日期的播放器，然后：

```sh
scripts/publish.sh YYYY-MM-DD
```

连整期图文一起撤下：

```sh
git rm -r briefs/YYYY-MM-DD && git commit -m "unpublish YYYY-MM-DD" && git push
```

撤下文件本身。先删这次的 Release，再删标签。`$REL` 是创建时返回的数字 id。草稿还没有标签时，只删 id：

```sh
export NO_COLOR=1 GH_FORCE_TTY=0
unset FORCE_COLOR || true
gh api --method DELETE "repos/fengqiaozhu/ai-daily-brief/releases/$REL"
gh api --method DELETE "repos/fengqiaozhu/ai-daily-brief/git/refs/tags/video-YYYY-MM-DD"
```

已经公开的也可以：

```sh
gh release delete "video-YYYY-MM-DD" --repo fengqiaozhu/ai-daily-brief --yes --cleanup-tag
```

API 删除成功后，匿名直链可能还会返回 200 一段时间。GitHub 免费版没有缓存清除接口。页面回滚和 Release 删除都要做。只删页面、不删 Release 时，知道直链的人仍可下载。

替换已经公开的文件时，使用新文件名（例如 `ai-daily-YYYY-MM-DD-r2.mp4`）并改 HTML。不要在删除后立刻用同一个标签和同一个文件名再传。

## 9. 演练记录

对象不是正式期次。没有改 `briefs/2026-10-27/` 或 `briefs/2026-10-28/` 的公开页面。测试片由 ffmpeg 在仓库外生成，画面是纯色测试图，不是早报成片。演练 Release 用完即删。仓库上现在没有 Release。

测试文件（仓库外，文件名写明不是期次成片）：

| 项 | 值 |
| --- | --- |
| 文件 | `cmp245-rehearsal-NOT-AN-EPISODE.mp4` |
| 时长 | 8.000000 秒 |
| 大小 | 79082 字节 |
| 编码 | h264，1280×720，aac |
| sha256 | `70590d51d2f1436ae710d7610907de8081eb6254b23b88e6977b58f61124a4f6` |

三次失败都用过标签 `video-2099-12-31`，随后都已删除。成功的一次换了新标签 `video-2099-12-29`，避免上一轮缓存在稳定直链上的 404。

### 失败 1：`jq` 把 `false` 当成空

时间 2026-10-28T02:41:38Z 到 02:41:52Z，耗时 13.793 秒。Release id `426206008`，资产 id `683597364`，`content_type=video/mp4`，`state=uploaded`，大小 79082，digest 与上表 sha256 一致，草稿直链检查已是 404。PATCH 后响应里 `"draft":false`，`published_at=2026-10-28T02:41:49Z`。脚本用 `jq` 的 `//` 读 `draft`，把 `false` 读成空，误报 `stage=publish_release`，`rollback=deleted_release_created_by_this_run`。页面未改，没有推送。修正：改用 `.draft | tostring`。本地回归在 `tests/test_publish_video_local.sh`。

### 失败 2：用 `created_at` 误判成旧 Release

时间 2026-10-28T02:44:25Z 到 02:44:30Z，耗时 4.673 秒。脚本刚创建的 Release id `426207543`，返回的 `created_at` 是 `2026-10-28T01:56:10Z`。这个时间是目标提交 `6e5022a84467e4ba20378a0a1c9d2606dcefcbea`（「publish 2026-10-28」）的提交时间，不是一个事先存在的别人的 Release。当时的年龄检查把它拒绝为 `stage=create_release`，`rollback=none`（脚本没有删）。演练清理随后删掉了这次自己创建、还没有上传文件的 Release。修正：删掉年龄检查。创建前如果 `gh release view` 看到标签已存在，才拒绝，并且不删除它。

### 失败 3：发布前请求稳定直链，404 被缓存

时间 2026-10-28T02:45:34Z 到 02:46:50Z，耗时 75.817 秒。上传和 PATCH 都成功，草稿资产直链是 404，然后 `stage=poll_url`，20 次尝试、约 60 秒内 `last_http=404`，`rollback=deleted_release_created_by_this_run`。原因是发布前还请求了一次稳定直链，CDN 把 404 留过了轮询窗口。修正：发布前只检查草稿资产的 `browser_download_url`；轮询稳定直链时加 `Cache-Control: no-cache`。这条失败的 Release id 没有留在最终日志里，不在这里补写。

### 成功：`video-2099-12-29`

命令：`scripts/publish-video.sh 2099-12-29 --file <仓库外测试片> --sha256 70590d51d2f1436ae710d7610907de8081eb6254b23b88e6977b58f61124a4f6 --prerelease`

| 项 | 值 |
| --- | --- |
| 上传开始 / 结束 | 2026-10-28T02:48:05Z / 02:48:18Z |
| 耗时 | 13.349 秒，退出码 0 |
| 标准输出 | 只有 `https://github.com/fengqiaozhu/ai-daily-brief/releases/download/video-2099-12-29/ai-daily-2099-12-29.mp4` |
| 标准错误 | 空 |
| `target_sha` | `6e5022a84467e4ba20378a0a1c9d2606dcefcbea`（2294 ms） |
| 创建 | 1863 ms，Release id `426209462`，`created_at=2026-10-28T02:48:10Z` |
| 上传 | 2152 ms，`content_type=video/mp4` |
| 草稿直链 | HTTP 404 |
| PATCH | 2078 ms。响应里的 `make_latest` 是 JSON 里没有该字段时的 `null`；请求仍然发送 `make_latest: "false"` |
| 轮询 | 1 次即 HTTP 200，sha256 与期望一致 |
| 匿名再下载 | sha256 相同 |

播放器注入的是 `briefs/2026-10-28/index.html` 的仓库外副本，不是公开文件。结果 `inserted`。字符偏移：`</header>` 在 11496，`<figure class="episode-video">` 在 11506，`<nav class="toc">` 在 13092。稳定直链在副本里出现 2 次（`video src` 和下载链接），披露语在。公开的两期 HTML 未改。

硬校验用临时克隆，origin 是本地裸仓库，并设置 `AI_DAILY_VIDEO_LOOKUP=1`。没有播放器时 `scripts/publish.sh 2099-12-29 --no-push` 退出码 1，HEAD 不变（2026-10-28T02:48:29Z）。标准错误：

```text
error_stage=video_html
拒绝发布 briefs/2099-12-29：该期已有视频，但 index.html 未包含对应播放器。未改页面，未提交，未推送。
依据：视频 Release video-2099-12-29
缺少：<video src="https://github.com/fengqiaozhu/ai-daily-brief/releases/download/video-2099-12-29/ai-daily-2099-12-29.mp4">
缺少：披露语「本期视频由 AI 生成，内容以图文版为准。」
补上播放器：python3 scripts/inject-episode-video.py 2099-12-29
```

注入临时页之后，同一条 `--no-push` 退出码 0（2026-10-28T02:48:32Z）。

删除：2026-10-28T02:48:32Z 开始，2026-10-28T02:48:36Z `gh release delete video-2099-12-29` 结束。随后 `gh release view` 为 `release not found`。匿名直链在 02:48:37Z 到 02:50:21Z 仍返回 HTTP 200（第 1 到第 10 次），第 11 次于 **2026-10-28T02:50:33Z** 返回 HTTP 404。02:50:34Z 到 02:50:37Z 复核 `video-2099-12-29`、`video-2099-12-30`、`video-2099-12-31`，均为 `release not found`。

演练结束后两期公开页 sha256 与开始时相同：

- `briefs/2026-10-27/index.html` `13b8199c57958868af5e1624bd170a13a8ba293a34d4d4e146dc129913b73de1`
- `briefs/2026-10-28/index.html` `af991b93a5d7923a7e0c9449ffe2da520da2e9228d8afd288141ce5f93f8e35d`

权限路径：演练曾把 `GH_TOKEN` 设成无效值再调用 `gh`，退出码仍是 0，登录身份没有变成未授权。没有为了打出 401 再去创建 Release。`stage=permission` 留在脚本里，这次没有实弹触发。

本地、不访问 GitHub 的失败路径由 `tests/test_publish_video_local.sh` 覆盖：参数错误、文件不存在、文件在仓库内、sha256 不符、1.5 GiB 停手，以及 `jq` 对 `draft:false` 的回归。这些路径的标准输出为空，并且没有调用 `gh`。`tests/test_publish_guard.sh` 覆盖 mp4 白名单、暂存区文件名、视频标记缺播放器、其他期次播放器不能冒充本期，以及 Release 查询失败时停止。`tests/test_inject_episode_video.py` 覆盖注入位置、幂等，以及不改其他期次、不改已发布的两期 HTML。上述三项在写入本记录前均已通过。
