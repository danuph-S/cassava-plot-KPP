"""Render a local HTML file to PNG with headless Chromium (Playwright).

Usage: python render.py input.html output.png [--width 1080] [--height 1350] [--scale 1]
"""
import argparse
import pathlib
import sys

from playwright.sync_api import sync_playwright


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("html")
    parser.add_argument("png")
    parser.add_argument("--width", type=int, default=1080)
    parser.add_argument("--height", type=int, default=1350)
    parser.add_argument("--scale", type=float, default=1, help="2 = sharper image for print")
    parser.add_argument("--browser-path", help="use an existing Chrome/Chromium instead of Playwright's")
    args = parser.parse_args()

    html = pathlib.Path(args.html).resolve()
    if not html.is_file():
        print(f"not found: {html}", file=sys.stderr)
        return 1

    with sync_playwright() as p:
        browser = p.chromium.launch(executable_path=args.browser_path)
        page = browser.new_page(
            viewport={"width": args.width, "height": args.height},
            device_scale_factor=args.scale,
        )
        page.goto(html.as_uri(), wait_until="networkidle")
        page.evaluate("document.fonts.ready")
        page.screenshot(path=args.png, full_page=False)
        browser.close()
    print(f"saved {args.png} ({args.width}x{args.height} @{args.scale}x)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
