#!/usr/bin/env python3
"""Build contract checks. Run: python3 tests/test_build.py"""

import tempfile
import unittest
from pathlib import Path

import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
import build as site_build  # noqa: E402


class BuildTests(unittest.TestCase):
    def test_homepage_issue_sources_and_no_scripts(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            issue = root / "briefs" / "2026-10-27"
            issue.mkdir(parents=True)
            (issue / "index.md").write_text(
                "# 测试期\n\n这是**管道**测试，不是对外正文。\n\n- 一条\n",
                encoding="utf-8",
            )
            (issue / "sources.md").write_text("# 来源\n\n- [示例](https://example.com)\n", encoding="utf-8")
            (root / "site.json").write_text('{"description":"测试"}\n', encoding="utf-8")
            dist = root / "dist"
            dates = site_build.build(root, dist, "")
            self.assertEqual(dates, ["2026-10-27"])
            home = (dist / "index.html").read_text(encoding="utf-8")
            page = (dist / "2026-10-27" / "index.html").read_text(encoding="utf-8")
            sources = (dist / "briefs" / "2026-10-27" / "sources.md").read_text(encoding="utf-8")
            self.assertIn("测试期", home)
            self.assertIn('name="viewport"', page)
            self.assertIn("overflow-wrap: anywhere", page)
            self.assertNotIn("<script", home.lower())
            self.assertNotIn("<script", page.lower())
            self.assertIn("https://example.com", sources)
            self.assertTrue((dist / "2026-10-27" / "index.md").is_file())
            self.assertTrue((dist / "2026-10-27" / "sources.md").is_file())
            self.assertTrue((dist / "404.html").is_file())

    def test_rejects_script_in_supplied_html(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            issue = root / "briefs" / "2026-10-27"
            issue.mkdir(parents=True)
            (issue / "index.md").write_text("# 测试\n", encoding="utf-8")
            (issue / "index.html").write_text("<html><script>alert(1)</script></html>", encoding="utf-8")
            with self.assertRaises(SystemExit):
                site_build.build(root, root / "dist", "")

    def test_empty_site_still_builds_home(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "briefs").mkdir()
            dist = root / "dist"
            dates = site_build.build(root, dist, "/ai-daily-brief")
            self.assertEqual(dates, [])
            home = (dist / "index.html").read_text(encoding="utf-8")
            self.assertIn("尚无已发布期次", home)
            self.assertIn('href="/ai-daily-brief/"', home)
            self.assertNotIn("<script", home.lower())

    def test_feedback_link_is_added_without_rewriting_source(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            issue = root / "briefs" / "2026-10-27"
            issue.mkdir(parents=True)
            source = (
                "<!DOCTYPE html><html><body>"
                "<p>请通过站点页脚「更正与反馈」入口提交。</p>"
                "<footer><p>署名</p></footer>"
                "</body></html>"
            )
            (issue / "index.md").write_text("# 测试期\n", encoding="utf-8")
            (issue / "index.html").write_text(source, encoding="utf-8")
            (issue / "sources.md").write_text("# 来源\n", encoding="utf-8")
            (root / "site.json").write_text(
                '{"feedbackUrl":"https://github.com/example/ai-daily-brief/issues/new"}\n',
                encoding="utf-8",
            )
            site_build.build(root, root / "dist", "")
            link = '<a href="https://github.com/example/ai-daily-brief/issues/new">更正与反馈</a>'
            for rel in ("index.html", "404.html", "2026-10-27/index.html"):
                text = (root / "dist" / rel).read_text(encoding="utf-8")
                self.assertIn(link, text)
                self.assertNotIn("<script", text.lower())
            self.assertEqual((issue / "index.html").read_text(encoding="utf-8"), source)


if __name__ == "__main__":
    unittest.main()
