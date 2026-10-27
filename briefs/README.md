# 期次目录

每一期一个文件夹，文件夹名就是发布日期：

```text
briefs/YYYY-MM-DD/index.md
briefs/YYYY-MM-DD/index.html
briefs/YYYY-MM-DD/sources.md
```

正文由内容负责人写入这三份文件。构建脚本只复制和包装，不改写早报内容。

`index.html` 不得包含 `<script>` 或 `javascript:` 链接，否则构建会拒绝发布。
