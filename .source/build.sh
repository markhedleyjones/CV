#!/usr/bin/env bash
# Build a design twice with xelatex, report pages + warnings, render preview PNGs.
# Usage: ./build.sh v1-editorial
set -euo pipefail
name="${1%.tex}"
cd "$(dirname "$0")"
xelatex -interaction=nonstopmode -halt-on-error "$name.tex" >/tmp/"$name".log 2>&1 || {
	echo "FAILED"
	tail -30 /tmp/"$name".log
	exit 1
}
xelatex -interaction=nonstopmode -halt-on-error "$name.tex" >/tmp/"$name".log 2>&1
echo "pages: $(pdfinfo "$name.pdf" | awk '/Pages/{print $2}')"
grep -iE 'overfull|underfull' /tmp/"$name".log | head -8 || true
rm -f "$name".aux "$name".log "$name".out
rm -f /tmp/"${name}"_p*.png
pdftoppm -png -r 120 "$name.pdf" /tmp/"${name}"_p
ls /tmp/"${name}"_p*.png
