# AI 早报

小小工作室的每日 AI 早报静态站。正文不在这个仓库里生成。内容负责人把某一期的三份文件放进 `briefs/YYYY-MM-DD/`，然后用一条命令提交。GitHub Actions 负责构建并部署到 GitHub Pages。

## 目录

```text
briefs/YYYY-MM-DD/index.md      正文母版
briefs/YYYY-MM-DD/index.html    正文页面（不得含脚本）
briefs/YYYY-MM-DD/sources.md    来源清单
dist/                           构建产物，不提交
```

发布后的地址：

- 首页：`/`
- 某一期：`/YYYY-MM-DD/`（同时提供 `index.html` 与 `index.md`）
- 来源清单：`/briefs/YYYY-MM-DD/sources.md`

项目页的实际前缀是仓库名，例如 `https://<owner>.github.io/ai-daily-brief/`。

## 程心如何发布一期

1. 把 `index.md`、`index.html`、`sources.md` 放进 `briefs/YYYY-MM-DD/`。可选再放 `blurb.txt`，最新一期的这段文字会显示在首页。不要在这个仓库里改写正文。
2. 在仓库根目录执行：

```sh
scripts/publish.sh YYYY-MM-DD
```

这条命令会检查三份文件是否齐全、拒绝带脚本的 HTML、构建 `dist/`、提交并推送。推送后，`.github/workflows/pages.yml` 完成部署。构建时会在首页、404 和各期页面页脚加上「更正与反馈」，地址取自 `site.json` 的 `feedbackUrl`（必须是 https）。正文文件保持原样，不用为了这个入口改写。

`briefs/YYYY-MM-DD/` 里只会暂存白名单：`index.md`、`index.html`、`sources.md`，以及可选的 `blurb.txt`。目录中若还有别的文件，或任一文件超过 1 MB（1048576 字节），或文件名是音频扩展名（`.m4a`、`.mp3`、`.wav`、`.aac`、`.ogg`、`.flac`、`.m4b`）或视频扩展名（`.mp4`、`.webm`、`.mov`、`.mkv`、`.m4v`），发布命令会告警并以非零状态退出，不暂存、不推送。暂存区里已有这些影音文件时也会直接失败，并写出文件名。这些文件不进仓库。影音走 GitHub Releases 外链，不把 m4a 或 mp4 提交进站点 git 仓库。`.gitignore` 忽略这些扩展名。Pages 工作流在构建前会拒绝仓库里已跟踪的同类文件。

当期视频的上传、播放器注入、校验和回滚命令见 `docs/video-publish-runbook.md`。若 GitHub 上已有 `video-YYYY-MM-DD` 这个 Release，或工作区里有本地标记 `video-markers/YYYY-MM-DD`，则 `index.html` 必须已经包含对应的 `<video src="https://github.com/fengqiaozhu/ai-daily-brief/releases/download/video-YYYY-MM-DD/ai-daily-YYYY-MM-DD.mp4">` 和披露语「本期视频由 AI 生成，内容以图文版为准。」，否则发布命令失败，不改页面、不推送。没有视频的期次仍按原来的图文流程发布。

只想本地预览、先不推送：

```sh
scripts/publish.sh YYYY-MM-DD --no-push
python3 -m http.server 4173 --directory dist
```

浏览器打开 `http://127.0.0.1:4173/`。本地预览使用 `site.json` 里的 `base`。若链接带仓库前缀导致本地 404，可临时执行 `python3 scripts/build.py --base ""` 后再开本地服务器。

## 撤下某一期

删除该期目录并推送，下一次构建不再包含这个路径。

```sh
git rm -r briefs/YYYY-MM-DD && git commit -m "unpublish YYYY-MM-DD" && git push
```

## 凭据

部署使用 GitHub Actions 自带的 `GITHUB_TOKEN` 与仓库的 GitHub Pages，不把密钥写入仓库。站点挂在当前已授权 GitHub 账号名下。缺组织账号、自定义域名或 Pages 权限时，以工单里的缺口清单为准，不在本仓库记录密钥。

## 发布步骤状态

发布步骤已启用（2026-10-27 起）。内容负责人在终审通过后，用上面的一条命令即可独立完成「提交内容 → 构建 → 部署」。

发布门不变：先终审通过，再发布；未获批不得推送、不得发布。回滚某一期用上面的 `unpublish` 命令。
