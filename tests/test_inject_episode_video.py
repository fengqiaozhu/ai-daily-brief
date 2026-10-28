#!/usr/bin/env python3
"""Player injection is idempotent and does not edit another date or the live briefs."""

from __future__ import annotations

import hashlib
import re
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "inject-episode-video.py"
DISCLOSURE = "本期视频由 AI 生成，内容以图文版为准。"
DATE = "2099-12-31"
URL = (
    "https://github.com/fengqiaozhu/ai-daily-brief/releases/download/"
    f"video-{DATE}/ai-daily-{DATE}.mp4"
)
def video_src_hits(html: str, url: str) -> list[re.Match[str]]:
    return list(
        re.finditer(
            r"""<video\b[^>]*\bsrc=["']""" + re.escape(url) + r"""["']""",
            html,
            re.IGNORECASE,
        )
    )


OTHER = """<figure class="episode-video">
  <figcaption class="episode-video-label">收看本期</figcaption>
  <video controls preload="metadata" playsinline src="https://github.com/fengqiaozhu/ai-daily-brief/releases/download/video-2020-01-01/ai-daily-2020-01-01.mp4"></video>
  <p class="episode-video-note">本期视频由 AI 生成，内容以图文版为准。</p>
</figure>"""


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(args: list[str]) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        [sys.executable, str(SCRIPT), *args],
        cwd=ROOT,
        text=True,
        capture_output=True,
        check=False,
    )


def fail(message: str) -> None:
    print(f"FAIL: {message}", file=sys.stderr)
    sys.exit(1)


def main() -> None:
    live = {
        path: sha256(path)
        for path in (
            ROOT / "briefs" / "2026-10-27" / "index.html",
            ROOT / "briefs" / "2026-10-28" / "index.html",
        )
    }
    source = (ROOT / "briefs" / "2026-10-28" / "index.html").read_text(encoding="utf-8")
    if 'class="wrap"' not in source or 'class="mast"' not in source or 'class="toc"' not in source:
        fail("fixture page lost wrap/mast/toc")
    header_end = source.find("</header>")
    toc_at = source.find('<nav class="toc">')
    if header_end < 0 or toc_at < header_end:
        fail("fixture mast/toc order")
    with_other = source[: header_end + len("</header>")] + "\n" + OTHER + source[header_end + len("</header>") :]

    with tempfile.TemporaryDirectory() as tmp:
        page = Path(tmp) / "index.html"
        page.write_text(with_other, encoding="utf-8")
        first = run([DATE, "--html", str(page)])
        if first.returncode != 0 or first.stdout.strip() != "inserted":
            fail(f"first insert rc={first.returncode} out={first.stdout!r} err={first.stderr!r}")
        text = page.read_text(encoding="utf-8")
        if text.count(URL) != 2:
            fail(f"url count {text.count(URL)} (expected src and download link)")
        if len(video_src_hits(text, URL)) != 1:
            fail("video src was not unique")
        if text.count(OTHER) != 1:
            fail("other date player was modified")
        figure_at = text.find('<figure class="episode-video">')
        toc_at = text.find('<nav class="toc">')
        header_at = text.find("</header>")
        if not (header_at < figure_at < toc_at):
            fail(f"player position header={header_at} figure={figure_at} toc={toc_at}")
        if figure_at == text.find(OTHER):
            fail("first figure is the other date, ours was not placed after mast")
        if DISCLOSURE not in text:
            fail("missing disclosure")
        if "<script" in text[header_at:toc_at].lower():
            fail("inserted a script")
        inserted = text[header_at:text.find(OTHER)]
        if "color-scheme: dark" not in inserted or "#141820" not in inserted:
            fail("dark page did not receive the dark player")
        if "#f4f1ea" in inserted:
            fail("dark page received the light player background")

        before = page.read_bytes()
        second = run([DATE, "--html", str(page)])
        if second.returncode != 0 or second.stdout.strip() != "unchanged":
            fail(f"second insert rc={second.returncode} out={second.stdout!r} err={second.stderr!r}")
        if page.read_bytes() != before:
            fail("idempotent run rewrote the file")
        if len(video_src_hits(page.read_text(encoding="utf-8"), URL)) != 1:
            fail("second run duplicated the video src")

        checked = run(["--check", DATE, "--html", str(page)])
        if checked.returncode != 0 or checked.stdout.strip() != "ok":
            fail(f"check failed {checked.stdout!r} {checked.stderr!r}")

        bare = Path(tmp) / "bare.html"
        bare.write_text("<p>没有页头</p>\n", encoding="utf-8")
        bare_before = bare.read_bytes()
        refused = run([DATE, "--html", str(bare)])
        if refused.returncode == 0 or bare.read_bytes() != bare_before:
            fail("missing anchor still changed the file")
        if "error_stage=inject_anchor" not in refused.stderr:
            fail(f"anchor error missing: {refused.stderr!r}")

        light = Path(tmp) / "light.html"
        light.write_text(
            "<!DOCTYPE html><body><div class=\"wrap\"><header class=\"mast\">t</header>"
            "<nav class=\"toc\"></nav></div></body>",
            encoding="utf-8",
        )
        light_run = run(["2099-01-02", "--html", str(light), "--theme", "auto"])
        if light_run.returncode != 0:
            fail(light_run.stderr)
        light_text = light.read_text(encoding="utf-8")
        if "color-scheme: light" not in light_text or "#f4f1ea" not in light_text:
            fail("light page did not receive the light player")
        if "video-2099-01-02/ai-daily-2099-01-02.mp4" not in light_text:
            fail("light player url")

    for path, digest in live.items():
        if sha256(path) != digest:
            fail(f"live brief changed: {path}")
    print("ALL_OK")


if __name__ == "__main__":
    main()
