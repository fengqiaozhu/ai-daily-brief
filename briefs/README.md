# 期次目录

每一期一个文件夹，文件夹名就是发布日期：

```text
briefs/YYYY-MM-DD/index.md
briefs/YYYY-MM-DD/index.html
briefs/YYYY-MM-DD/sources.md
```

正文由内容负责人写入这三份文件。构建脚本只复制和包装，不改写早报内容。

`index.html` 不得包含 `<script>` 或 `javascript:` 链接，否则构建会拒绝发布。

不要把音频、视频、备份或其他额外文件放进期次目录。发布脚本只暂存上面三份文件和可选的 `blurb.txt`。其余文件、超过 1 MB 的文件，以及 `.m4a`、`.mp3`、`.wav`、`.aac`、`.ogg`、`.flac`、`.m4b`、`.mp4`、`.webm`、`.mov`、`.mkv`、`.m4v` 都会让发布命令拒绝。影音文件不进这个仓库。
