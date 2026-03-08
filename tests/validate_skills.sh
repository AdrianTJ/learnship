#!/usr/bin/env bash
# learnship — Skills validation tests
# Checks that bundled skills have the required structure


REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_DIR/.windsurf/skills"
PASS=0
FAIL=0
ERRORS=()

check() {
  local description="$1"
  local result="$2"
  if [ "$result" = "0" ]; then
    echo "  ✓ $description"
    PASS=$((PASS+1))
  else
    echo "  ✗ $description"
    FAIL=$((FAIL+1))
    ERRORS+=("$description")
  fi
}

echo ""
echo "─── Skills Structure Validation ────────────────────────────────────────"

REQUIRED_SKILLS=("agentic-learning" "frontend-design")

for skill in "${REQUIRED_SKILLS[@]}"; do
  skill_dir="$SKILLS_DIR/$skill"
  echo ""
  echo "  Checking skill: $skill"

  # Skill directory exists
  if [ -d "$skill_dir" ]; then
    echo "    ✓ Directory exists"
    PASS=$((PASS+1))
  else
    echo "    ✗ Directory missing: $skill_dir"
    FAIL=$((FAIL+1))
    ERRORS+=("Missing skill directory: $skill")
    continue
  fi

  # SKILL.md exists
  if [ -f "$skill_dir/SKILL.md" ]; then
    echo "    ✓ SKILL.md present"
    PASS=$((PASS+1))
  else
    echo "    ✗ SKILL.md missing in $skill"
    FAIL=$((FAIL+1))
    ERRORS+=("Missing SKILL.md in $skill")
  fi

  # SKILL.md is non-empty (>100 chars)
  if [ -f "$skill_dir/SKILL.md" ]; then
    size=$(wc -c < "$skill_dir/SKILL.md")
    if [ "$size" -gt 100 ]; then
      echo "    ✓ SKILL.md has content ($size bytes)"
      PASS=$((PASS+1))
    else
      echo "    ✗ SKILL.md too small ($size bytes)"
      FAIL=$((FAIL+1))
      ERRORS+=("SKILL.md too small in $skill")
    fi
  fi
done

echo ""
echo "─── Results ────────────────────────────────────────────────────────────"
echo "  Passed: $PASS"
echo "  Failed: $FAIL"

if [ ${#ERRORS[@]} -gt 0 ]; then
  echo ""
  echo "  Failures:"
  for err in "${ERRORS[@]}"; do
    echo "    - $err"
  done
fi

echo ""
[ "$FAIL" -eq 0 ] && echo "  ALL TESTS PASSED ✓" || { echo "  TESTS FAILED ✗"; exit 1; }
