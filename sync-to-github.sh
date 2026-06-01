#!/bin/bash
# sync-to-github.sh
# Copy latest 夹缝中的光芒 DLC files from Dropbox → this repo → commit + push.
# Run from anywhere: ./sync-to-github.sh ["optional commit message"]
#
# Dependencies: soffice (LibreOffice headless, for docx→PDF), git, gh (optional)

set -e

SRC="/Users/sun.k/Library/CloudStorage/Dropbox/#26CLNEW/夹缝中的光芒 DLC"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d "$SRC" ]; then
  echo "❌ Source not found: $SRC"
  echo "   (Are you on the right Mac? Dropbox synced?)"
  exit 1
fi

cd "$REPO_DIR"
echo "==> Syncing from Dropbox source"
echo "    $SRC"
echo "==> Into: $REPO_DIR"
echo ""

# ---------- 1. Lesson 1-9 HTMLs (rename L<N>_*.html → lesson-0<N>-*.html) ----------
echo "==> Copying + renaming lesson HTMLs"
for i in 1 2 3 4 5 6 7 8 9; do
  ii=$(printf "%02d" $i)
  if [ -d "$SRC/L$i" ]; then
    mkdir -p "lessons/lesson-$ii"
    if [ -f "$SRC/L$i/L${i}_slides.html" ]; then
      cp "$SRC/L$i/L${i}_slides.html" "lessons/lesson-$ii/lesson-$ii-slides.html"
    fi
    if [ -f "$SRC/L$i/L${i}_学生工作纸.html" ]; then
      cp "$SRC/L$i/L${i}_学生工作纸.html" "lessons/lesson-$ii/lesson-$ii-worksheet.html"
    fi
    echo "    lesson-$ii ✓"
  else
    echo "    L$i ⚠ missing in source"
  fi
done

# ---------- 2. Analysis HTMLs (rename Chinese filenames → English URLs) ----------
echo ""
echo "==> Copying + renaming analysis HTMLs"
declare -a PAIRS=(
  "章节分析_全8章.html|chapter-analysis-all-8.html"
  "附录A_叙事手法库.html|appendix-a-narrative-techniques.html"
  "附录B_议题词典.html|appendix-b-issue-dictionary.html"
  "附录C_人物议题表.html|appendix-c-character-grid.html"
  "附录D_HSC考试模板.html|appendix-d-hsc-templates.html"
  "课程导航_课文Lesson议题对照.html|chapter-lesson-issue-map.html"
)
for pair in "${PAIRS[@]}"; do
  zh="${pair%%|*}"
  en="${pair##*|}"
  if [ -f "$SRC/$zh" ]; then
    cp "$SRC/$zh" "analysis/$en"
    echo "    $zh → $en ✓"
  else
    echo "    $zh ⚠ missing in source"
  fi
done

# ---------- 3. Q3 + Q4 practice (HTML + docx + regenerate PDF) ----------
echo ""
echo "==> Copying Q3+Q4 practice HTML + docx + regenerating PDF"
Q_DOCX="$SRC/夹缝中的光芒Q3&4.docx"
Q_HTML="$SRC/夹缝中的光芒Q3&4.html"
if [ -f "$Q_HTML" ]; then
  cp "$Q_HTML" practice/q3-q4-practice-set.html
  echo "    q3-q4-practice-set.html ✓"
else
  echo "    Q3+Q4 html ⚠ missing in source"
fi
if [ -f "$Q_DOCX" ]; then
  cp "$Q_DOCX" practice/q3-q4-practice-set.docx
  if command -v soffice >/dev/null; then
    soffice --headless --convert-to pdf --outdir practice "$Q_DOCX" >/dev/null 2>&1
    mv "practice/夹缝中的光芒Q3&4.pdf" practice/q3-q4-practice-set.pdf 2>/dev/null || true
    echo "    q3-q4-practice-set.docx + .pdf ✓"
  else
    echo "    q3-q4-practice-set.docx ✓ (no soffice — PDF not regenerated)"
  fi
else
  echo "    Q3+Q4 docx ⚠ missing in source"
fi

# ---------- 4. Git status check ----------
echo ""
echo "==> Git status:"
git add .
if git diff --cached --quiet; then
  echo ""
  echo "✅ No changes detected. Repo is already up to date."
  exit 0
fi
git status --short

# ---------- 5. Commit + push ----------
echo ""
MSG="${1:-Sync from Dropbox $(date '+%Y-%m-%d %H:%M')}"
echo "==> Committing: \"$MSG\""
git commit -m "$MSG

🤖 Synced via sync-to-github.sh

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"

echo ""
echo "==> Pushing to GitHub..."
git push

echo ""
echo "🚀 Done. GitHub Pages will rebuild in ~1 minute."
echo "🌐 Live site: https://nothingcomesone.github.io/jiafeng-hsc-revision/"
