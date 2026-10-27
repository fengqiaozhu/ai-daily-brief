#!/usr/bin/env python3
"""Build the AI daily brief static site into dist/.

No third-party packages. Generated pages contain no script tags.
"""

from __future__ import annotations

import argparse
import html
import json
import re
import shutil
import sys
from pathlib import Path

DATE_RE = re.compile(r"^\d{4}-\d{2}-\d{2}$")
SCRIPT_RE = re.compile(r"<\s*script\b|javascript\s*:", re.IGNORECASE)
LINK_RE = re.compile(r"\[([^\]]+)\]\(([^)\s]+)\)")
CODE_RE = re.compile(r"`([^`]+)`")
BOLD_RE = re.compile(r"\*\*([^*]+)\*\*")
EM_RE = re.compile(r"(?<!\*)\*([^*]+)\*(?!\*)")

CSS = """
:root { color-scheme: light dark; }
* { box-sizing: border-box; }
html, body { margin: 0; padding: 0; overflow-x: hidden; }
body {
  font: 16px/1.65 "Iowan Old Style", "Palatino Linotype", Palatino, "Songti SC",
    "Source Han Serif SC", "Noto Serif CJK SC", serif;
  background: #f6f4ef;
  color: #1c1915;
}
header, main, footer { width: min(40rem, calc(100% - 2rem)); margin: 0 auto; }
header { padding: 1.25rem 0 0.25rem; }
main { padding-bottom: 2.5rem; }
a { color: #0b3d91; overflow-wrap: anywhere; }
a:hover { text-decoration: none; }
.brand { font-weight: 700; text-decoration: none; letter-spacing: 0.02em; }
.sub { color: #5c564c; font-size: 0.95rem; }
h1 { font-size: 1.7rem; line-height: 1.25; margin: 0.6rem 0 0.8rem; }
h2 { font-size: 1.25rem; line-height: 1.3; margin: 1.4rem 0 0.4rem; }
h3 { font-size: 1.05rem; margin: 1.1rem 0 0.3rem; }
ul, ol { padding-left: 1.2rem; }
li { margin: 0.25rem 0; }
blockquote {
  margin: 0.8rem 0;
  padding: 0.2rem 0 0.2rem 0.9rem;
  border-left: 3px solid #c8b99a;
  color: #3f3a33;
}
pre, code { font-family: ui-monospace, "SFMono-Regular", Menlo, Consolas, monospace; }
pre {
  white-space: pre-wrap;
  overflow-wrap: anywhere;
  background: #efeae2;
  padding: 0.75rem;
  border-radius: 6px;
}
code { font-size: 0.92em; }
.issue-list { list-style: none; padding: 0; }
.issue-list a {
  display: block;
  padding: 0.75rem 0;
  border-top: 1px solid #e0d9cc;
  text-decoration: none;
}
.issue-list li:last-child a { border-bottom: 1px solid #e0d9cc; }
.date { display: block; font-variant-numeric: tabular-nums; font-weight: 700; }
.tools { font-size: 0.92rem; color: #5c564c; }
footer { padding-bottom: 2rem; font-size: 0.85rem; color: #5c564c; }
@media (max-width: 375px) {
  body { font-size: 15.5px; }
  header, main, footer { width: min(40rem, calc(100% - 1.5rem)); }
  h1 { font-size: 1.45rem; }
}
@media (prefers-color-scheme: dark) {
  body { background: #161411; color: #f3efe6; }
  a { color: #9ec1ff; }
  .sub, .tools, footer { color: #c3baab; }
  blockquote { color: #e6dfd2; border-left-color: #8a7352; }
  pre { background: #241f19; }
  .issue-list a { border-color: #3a342c; }
}
"""


def escape(text: str) -> str:
    return html.escape(text, quote=True)


def inline(text: str) -> str:
    escaped = escape(text)

    def link(match: re.Match[str]) -> str:
        label = match.group(1)
        href = html.escape(html.unescape(match.group(2)), quote=True)
        return f'<a href="{href}">{label}</a>'

    # Link labels and code spans are already escaped. Restore markdown
    # punctuation only for the patterns we re-apply below.
    rendered = CODE_RE.sub(r"<code>\1</code>", escaped)
    rendered = BOLD_RE.sub(r"<strong>\1</strong>", rendered)
    rendered = EM_RE.sub(r"<em>\1</em>", rendered)
    rendered = LINK_RE.sub(link, rendered)
    return rendered


def markdown_to_html(source: str) -> str:
    lines = source.replace("\r\n", "\n").replace("\r", "\n").split("\n")
    out: list[str] = []
    paragraph: list[str] = []
    list_tag: str | None = None
    quote: list[str] = []
    code: list[str] | None = None

    def close_paragraph() -> None:
        nonlocal paragraph
        if paragraph:
            out.append(f"<p>{inline(' '.join(paragraph))}</p>")
            paragraph = []

    def close_list() -> None:
        nonlocal list_tag
        if list_tag:
            out.append(f"</{list_tag}>")
            list_tag = None

    def close_quote() -> None:
        nonlocal quote
        if quote:
            out.append(f"<blockquote><p>{inline(' '.join(quote))}</p></blockquote>")
            quote = []

    for raw in lines:
        line = raw.rstrip()
        if code is not None:
            if line.strip().startswith("```"):
                out.append("<pre><code>" + escape("\n".join(code)) + "</code></pre>")
                code = None
            else:
                code.append(raw)
            continue
        if line.strip().startswith("```"):
            close_paragraph()
            close_list()
            close_quote()
            code = []
            continue
        if not line.strip():
            close_paragraph()
            close_list()
            close_quote()
            continue
        if line.startswith("#"):
            close_paragraph()
            close_list()
            close_quote()
            level = len(line) - len(line.lstrip("#"))
            level = min(max(level, 1), 3)
            text = line[level:].strip()
            out.append(f"<h{level}>{inline(text)}</h{level}>")
            continue
        if line.startswith(">"):
            close_paragraph()
            close_list()
            quote.append(line[1:].strip())
            continue
        bullet = re.match(r"^[-*]\s+(.*)", line)
        numbered = re.match(r"^\d+[.)]\s+(.*)", line)
        if bullet or numbered:
            close_paragraph()
            close_quote()
            tag = "ul" if bullet else "ol"
            if list_tag and list_tag != tag:
                close_list()
            if not list_tag:
                out.append(f"<{tag}>")
                list_tag = tag
            item = bullet.group(1) if bullet else numbered.group(1)
            out.append(f"<li>{inline(item)}</li>")
            continue
        if re.fullmatch(r"(-{3,}|\*{3,})", line.strip()):
            close_paragraph()
            close_list()
            close_quote()
            out.append("<hr>")
            continue
        close_list()
        close_quote()
        paragraph.append(line.strip())
    if code is not None:
        out.append("<pre><code>" + escape("\n".join(code)) + "</code></pre>")
    close_paragraph()
    close_list()
    close_quote()
    return "\n".join(out)


def first_heading(markdown: str) -> str:
    for line in markdown.splitlines():
        if line.startswith("#"):
            return line.lstrip("#").strip() or "AI 早报"
    return "AI 早报"


def reject_scripts(document: str, label: str) -> None:
    if SCRIPT_RE.search(document):
        raise SystemExit(f"{label} contains a script or javascript: URL; refusing to publish")


def page(title: str, body: str, base: str, depth: int) -> str:
    home = f"{base}/" if base else "./" if depth == 0 else "../" * depth
    if base:
        home = f"{base}/"
    document = f"""<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{escape(title)}</title>
<style>{CSS}</style>
</head>
<body>
<header><a class="brand" href="{home}">AI 早报</a></header>
<main>
{body}
</main>
<footer>小小工作室 · 静态发布 · 无外部脚本</footer>
</body>
</html>
"""
    reject_scripts(document, title)
    return document


def issue_dirs(briefs: Path) -> list[Path]:
    if not briefs.is_dir():
        return []
    found = []
    for path in sorted(briefs.iterdir()):
        if path.is_dir() and DATE_RE.match(path.name):
            found.append(path)
    return found


def build(root: Path, dist: Path, base: str) -> list[str]:
    base = base.rstrip("/")
    if base and not base.startswith("/"):
        base = "/" + base
    briefs = root / "briefs"
    if dist.exists():
        shutil.rmtree(dist)
    dist.mkdir(parents=True)
    (dist / ".nojekyll").write_text("", encoding="utf-8")

    published: list[tuple[str, str]] = []
    for folder in issue_dirs(briefs):
        date = folder.name
        markdown_path = folder / "index.md"
        if not markdown_path.is_file():
            raise SystemExit(f"missing {markdown_path}")
        markdown = markdown_path.read_text(encoding="utf-8")
        title = first_heading(markdown)
        html_path = folder / "index.html"
        if html_path.is_file():
            issue_html = html_path.read_text(encoding="utf-8")
            reject_scripts(issue_html, str(html_path))
        else:
            tools = (
                f'<p class="tools"><a href="{base}/briefs/{date}/sources.html">来源清单</a>'
                f' · <a href="{base}/briefs/{date}/sources.md">sources.md</a>'
                f' · <a href="{base}/{date}/index.md">Markdown</a></p>'
            )
            issue_html = page(f"{title} · {date}", markdown_to_html(markdown) + "\n" + tools, base, 1)
        target = dist / date
        target.mkdir(parents=True)
        (target / "index.html").write_text(issue_html, encoding="utf-8")
        (target / "index.md").write_text(markdown, encoding="utf-8")

        archive = dist / "briefs" / date
        archive.mkdir(parents=True)
        (archive / "index.md").write_text(markdown, encoding="utf-8")
        (archive / "index.html").write_text(issue_html, encoding="utf-8")
        sources = folder / "sources.md"
        if sources.is_file():
            source_text = sources.read_text(encoding="utf-8")
            # The supplied issue page links to ./sources.md beside index.html.
            (target / "sources.md").write_text(source_text, encoding="utf-8")
            (archive / "sources.md").write_text(source_text, encoding="utf-8")
            source_page = page(
                f"来源清单 · {date}",
                markdown_to_html(source_text)
                + f'\n<p class="tools"><a href="{base}/briefs/{date}/sources.md">sources.md</a></p>',
                base,
                2,
            )
            (archive / "sources.html").write_text(source_page, encoding="utf-8")
        published.append((date, title))

    published.sort(reverse=True)
    latest_blurb = ""
    if published:
        blurb_path = briefs / published[0][0] / "blurb.txt"
        if blurb_path.is_file():
            latest_blurb = blurb_path.read_text(encoding="utf-8").strip()
    if published:
        items = []
        for date, title in published:
            items.append(
                "<li><a href=\"{href}\"><span class=\"date\">{date}</span>{title}</a></li>".format(
                    href=f"{base}/{date}/",
                    date=escape(date),
                    title=escape(title),
                )
            )
        listing = '<ul class="issue-list">\n' + "\n".join(items) + "\n</ul>"
    else:
        listing = "<p>尚无已发布期次。新一期放到 <code>briefs/YYYY-MM-DD/</code> 后执行发布命令。</p>"
    config_path = root / "site.json"
    description = "每日人工智能早报。"
    if config_path.is_file():
        config = json.loads(config_path.read_text(encoding="utf-8"))
        description = str(config.get("description") or description)
    blurb_html = f"<p>{escape(latest_blurb)}</p>\n" if latest_blurb else ""
    home = page(
        "AI 早报",
        f"<h1>AI 早报</h1>\n<p class=\"sub\">{escape(description)}</p>\n{blurb_html}{listing}",
        base,
        0,
    )
    (dist / "index.html").write_text(home, encoding="utf-8")
    missing = page(
        "未找到这一期",
        f"<h1>未找到这一期</h1>\n<p>该日期还没有发布，或已经撤下。</p>\n<p><a href=\"{base or ''}/\">返回首页</a></p>",
        base,
        0,
    )
    (dist / "404.html").write_text(missing, encoding="utf-8")
    return [date for date, _title in published]


def main() -> None:
    parser = argparse.ArgumentParser(description="Build the AI daily brief site")
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--dist", type=Path, default=None)
    parser.add_argument("--base", default=None, help="URL prefix, for example /ai-daily-brief")
    args = parser.parse_args()
    root = args.root
    dist = args.dist or (root / "dist")
    base = args.base
    if base is None:
        config_path = root / "site.json"
        base = "/ai-daily-brief"
        if config_path.is_file():
            config = json.loads(config_path.read_text(encoding="utf-8"))
            base = str(config.get("base") or "")
    dates = build(root, dist, base)
    print(f"built {dist} issues={','.join(dates) if dates else '(none)'}")


if __name__ == "__main__":
    try:
        main()
    except BrokenPipeError:
        sys.exit(0)
