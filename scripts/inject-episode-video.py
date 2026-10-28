#!/usr/bin/env python3
"""Insert the CMP-231 video player into one episode page.

The block is the video-hosting-plan section 4 snippet. A second run for the
same date does not insert another copy. A player whose stable URL belongs to
another date is left untouched.

Usage:
  python3 scripts/inject-episode-video.py YYYY-MM-DD [--html PATH]
      [--theme auto|dark|light] [--repo OWNER/NAME] [--check]
"""

from __future__ import annotations

import argparse
import re
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_REPO = "fengqiaozhu/ai-daily-brief"
DISCLOSURE = "本期视频由 AI 生成，内容以图文版为准。"
DATE_RE = re.compile(r"^\d{4}-\d{2}-\d{2}$")
REPO_RE = re.compile(r"^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$")
WRAP_RE = re.compile(
    r"""<div\b[^>]*\bclass=["'][^"']*\bwrap\b[^"']*["'][^>]*>""",
    re.IGNORECASE,
)
MAST_RE = re.compile(
    r"""<header\b[^>]*\bclass=["'][^"']*\bmast\b[^"']*["'][^>]*>""",
    re.IGNORECASE,
)
HEADER_END_RE = re.compile(r"</header\s*>", re.IGNORECASE)
TOC_RE = re.compile(
    r"""<nav\b[^>]*\bclass=["'][^"']*\btoc\b""",
    re.IGNORECASE,
)


def stable_url(repo: str, date: str) -> str:
    return (
        f"https://github.com/{repo}/releases/download/"
        f"video-{date}/ai-daily-{date}.mp4"
    )


def video_src_pattern(url: str) -> re.Pattern[str]:
    return re.compile(
        r"""<video\b[^>]*\bsrc=["']""" + re.escape(url) + r"""["']""",
        re.IGNORECASE,
    )


def missing_player(html: str, repo: str, date: str) -> list[str]:
    url = stable_url(repo, date)
    missing: list[str] = []
    if video_src_pattern(url).search(html) is None:
        missing.append(f"缺少：<video src=\"{url}\">")
    if DISCLOSURE not in html:
        missing.append(f"缺少：披露语「{DISCLOSURE}」")
    return missing


def choose_theme(html: str, requested: str) -> str:
    if requested in ("dark", "light"):
        return requested
    if requested != "auto":
        raise SystemExit("theme must be auto, dark, or light")
    # Fixed-dark episode designs use this page background. build.py pages do not.
    if "#070a12" in html.lower():
        return "dark"
    return "light"


def render_block(repo: str, date: str, theme: str) -> str:
    url = stable_url(repo, date)
    if theme == "dark":
        style = """figure.episode-video {
  color-scheme: dark;
  margin: 1rem 0 1.25rem;
  padding: 0.9rem 1rem 0.75rem;
  border-radius: 12px;
  width: 100%;
  max-width: 48rem;
  background: #141820;
  color: #e8ecf6;
  border: 1px solid rgba(255,255,255,.14);
}
figure.episode-video video {
  width: 100%;
  height: auto;
  aspect-ratio: 16 / 9;
  max-height: 70vh;
  display: block;
  margin: 0.4rem 0 0.45rem;
  background: #000;
  object-fit: contain;
  border-radius: 8px;
}
.episode-video-label { font-size: 0.8rem; letter-spacing: 0.08em; }
.episode-video-note { margin: 0; font-size: 0.85rem; line-height: 1.5; }
@media (max-width: 375px) {
  figure.episode-video { padding: 0.75rem 0.7rem 0.65rem; }
}"""
    elif theme == "light":
        style = """figure.episode-video {
  color-scheme: light;
  margin: 1rem 0 1.25rem;
  padding: 0.9rem 1rem 0.75rem;
  border-radius: 12px;
  width: 100%;
  max-width: 48rem;
  background: #f4f1ea;
  color: #1c1915;
  border: 1px solid #e0d9cc;
}
figure.episode-video video {
  width: 100%;
  height: auto;
  aspect-ratio: 16 / 9;
  max-height: 70vh;
  display: block;
  margin: 0.4rem 0 0.45rem;
  background: #000;
  object-fit: contain;
  border-radius: 8px;
}
.episode-video-label { font-size: 0.8rem; letter-spacing: 0.08em; }
.episode-video-note { margin: 0; font-size: 0.85rem; line-height: 1.5; }
@media (max-width: 375px) {
  figure.episode-video { padding: 0.75rem 0.7rem 0.65rem; }
}
@media (prefers-color-scheme: dark) {
  figure.episode-video {
    color-scheme: dark;
    background: #141820;
    color: #e8ecf6;
    border-color: rgba(255,255,255,.14);
  }
}"""
    else:
        raise SystemExit(f"unknown theme {theme}")
    return (
        '<figure class="episode-video">\n'
        '  <figcaption class="episode-video-label">收看本期</figcaption>\n'
        '  <video controls preload="metadata" playsinline '
        f'src="{url}">\n'
        f'    <a href="{url}">下载本期视频（mp4）</a>\n'
        "  </video>\n"
        f'  <p class="episode-video-note">{DISCLOSURE}</p>\n'
        "</figure>\n"
        "<style>\n"
        f"{style}\n"
        "</style>"
    )


def find_insert_at(html: str) -> int:
    wrap = WRAP_RE.search(html)
    if wrap is None:
        raise SystemExit("error_stage=inject_anchor\nmissing <div class=\"wrap\">")
    mast = MAST_RE.search(html, wrap.end())
    if mast is None:
        raise SystemExit(
            "error_stage=inject_anchor\nmissing <header class=\"mast\"> inside .wrap"
        )
    end = HEADER_END_RE.search(html, mast.end())
    if end is None:
        raise SystemExit("error_stage=inject_anchor\nmissing </header> for .mast")
    toc = TOC_RE.search(html)
    if toc is not None and toc.start() < end.end():
        raise SystemExit(
            "error_stage=inject_anchor\nnav.toc appears before the end of .mast"
        )
    return end.end()


def write_atomic(path: Path, text: str) -> None:
    fd, name = tempfile.mkstemp(prefix=".inject-", dir=path.parent)
    tmp = Path(name)
    try:
        with open(fd, "w", encoding="utf-8", newline="") as handle:
            handle.write(text)
        tmp.replace(path)
    finally:
        if tmp.exists():
            tmp.unlink()


def run(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description="Inject one episode video player")
    parser.add_argument("date")
    parser.add_argument("--html", default="")
    parser.add_argument("--theme", default="auto")
    parser.add_argument("--repo", default=DEFAULT_REPO)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args(argv)
    if DATE_RE.fullmatch(args.date) is None:
        print("date must look like YYYY-MM-DD", file=sys.stderr)
        return 2
    if REPO_RE.fullmatch(args.repo) is None:
        print("repo must look like owner/name", file=sys.stderr)
        return 2
    if args.theme not in ("auto", "dark", "light"):
        print("theme must be auto, dark, or light", file=sys.stderr)
        return 2
    html_path = Path(args.html) if args.html else ROOT / "briefs" / args.date / "index.html"
    if not html_path.is_file():
        print(f"missing {html_path}", file=sys.stderr)
        return 1
    html = html_path.read_text(encoding="utf-8", newline="")
    if args.check:
        missing = missing_player(html, args.repo, args.date)
        if missing:
            print("\n".join(missing))
            return 1
        print("ok")
        return 0

    url = stable_url(args.repo, args.date)
    if url in html:
        if video_src_pattern(url).search(html) and DISCLOSURE in html:
            print("unchanged")
            return 0
        print("error_stage=inject_incomplete", file=sys.stderr)
        print(
            "this date's video URL is already in the file but the player or "
            "disclosure is incomplete; not inserting a second copy",
            file=sys.stderr,
        )
        return 1

    try:
        insert_at = find_insert_at(html)
    except SystemExit as exc:
        print(exc, file=sys.stderr)
        return 1
    theme = choose_theme(html, args.theme)
    block = render_block(args.repo, args.date, theme)
    updated = html[:insert_at] + "\n" + block + "\n" + html[insert_at:]
    if "<script" in block.lower() or "javascript:" in block.lower():
        print("error_stage=inject_script\nrefusing to insert a script", file=sys.stderr)
        return 1
    write_atomic(html_path, updated)
    print("inserted")
    return 0


def main() -> None:
    sys.exit(run(sys.argv[1:]))


if __name__ == "__main__":
    main()
