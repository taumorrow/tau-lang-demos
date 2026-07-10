#!/usr/bin/env bash
# nomic_run_all.sh - self-check for the tau-nomic tutorial series.
#
# Every nomic_*.tau file declares its expected outputs as a machine-readable
# contract in its header:
#   # EXPECTED-RESULTS: T F ...     (values of the %N result lines, in order)
#   # EXPECTED-CODES:   0,9,8,...   (o0res verdict codes, run-based parts)
# This script runs every file against those contracts and reports PASS/FAIL.
#
#   TAU_BIN=/path/to/tau ./nomic_run_all.sh      (default: `tau` on PATH)
#   TAU_TIMEOUT=600 ./nomic_run_all.sh           (seconds per file)
set -u
TAU_BIN="${TAU_BIN:-tau}"
TAU_TIMEOUT="${TAU_TIMEOUT:-600}"
cd "$(dirname "$0")"
strip_ansi() { sed 's/\x1b\[[0-9;?]*[a-zA-Z]//g'; }
fail=0; total=0

for f in nomic_0*.tau; do
  total=$((total+1))
  exp_res=$(grep -m1 '^# EXPECTED-RESULTS:' "$f" | sed 's/^# EXPECTED-RESULTS: *//')
  exp_codes=$(grep -m1 '^# EXPECTED-CODES:' "$f" | sed 's/^# EXPECTED-CODES: *//')
  if [ -z "$exp_res" ] && [ -z "$exp_codes" ]; then
    echo "SKIP  $f (no contract)"; continue
  fi
  if LC_ALL=C grep -qP '[^\x00-\x7F]' "$f"; then
    echo "FAIL  $f (non-ASCII content - would silently break piped runs)"
    fail=$((fail+1)); continue
  fi
  out=$(timeout "$TAU_TIMEOUT" "$TAU_BIN" -q < "$f" 2>&1 | strip_ansi)
  ok=1; detail=""
  if [ -n "$exp_res" ]; then
    act_res=$(printf '%s\n' "$out" | grep -oE '^%[0-9]+: .*' | sed 's/^%[0-9]*: //' | paste -sd' ' -)
    [ "$act_res" = "$exp_res" ] || { ok=0; detail="results: got [$act_res] want [$exp_res]"; }
  fi
  if [ -n "$exp_codes" ]; then
    act_codes=$(printf '%s\n' "$out" | grep -v '^tau> ' | grep -oE 'o0res\[[0-9]+\] *:= *[0-9]+' | grep -oE '[0-9]+$' | paste -sd, -)
    [ "$act_codes" = "$exp_codes" ] || { ok=0; detail="$detail codes: got [$act_codes] want [$exp_codes]"; }
  fi
  if [ "$ok" = 1 ]; then echo "PASS  $f"; else echo "FAIL  $f ($detail)"; fail=$((fail+1)); fi
done

echo
if [ "$fail" = 0 ]; then
  echo "ALL PASS ($total files) - every annotated claim in the series holds on this binary."
else
  echo "$fail of $total files FAILED - see above."
fi
exit "$fail"
