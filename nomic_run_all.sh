#!/usr/bin/env bash
# nomic_run_all.sh - self-check for the tau-nomic tutorial series.
#
# Every nomic_*.tau file declares its expected outputs as a machine-readable
# contract in its header:
#   # EXPECTED-RESULTS: T F ...     (values of the %N result lines, in order)
#   # EXPECTED-CODES:   0,9,8,...   (o0res verdict codes, run-based parts)
#   # EXPECTED-TF:      F F T ...   (T/F values of all oN[k] output lines,
#                                    in order - u-stream sessions, parts 10/10b)
#   # EXPECTED-OUT:     1 1 0 ...   (values of every oN[k] := line of every
#                                    run in the file, in order; 0/1 or T/F)
# This script runs every file against those contracts and reports PASS/FAIL.
#
#   TAU_BIN=/path/to/tau ./nomic_run_all.sh      (default: `tau` on PATH)
#   TAU_TIMEOUT=600 ./nomic_run_all.sh           (seconds per file)
set -u
TAU_BIN="${TAU_BIN:-tau}"
TAU_TIMEOUT="${TAU_TIMEOUT:-600}"
cd "$(dirname "$0")"

# Minimal-cost invocation (2026-09-01): both switches change COST only, never
# a verdict - every contract in the series is switch-invariant. The env var
# enables per-component deciding of accumulated laws; the flag caps the
# anti-prenexing block split (without it, the accumulating parts 05/06 blow
# past any sane timeout on 2026 main builds). The flag is probed so the
# script still works on builds that predate it.
export TAU_BA_COMPONENT_FACTORING="${TAU_BA_COMPONENT_FACTORING:-1}"
TAU_ARGS="${TAU_ARGS-}"
if [ -z "$TAU_ARGS" ] && "$TAU_BIN" --help 2>&1 | grep -q 'block-max-splits'; then
  TAU_ARGS="--block-max-splits 1"
fi
strip_ansi() { sed 's/\x1b\[[0-9;?]*[a-zA-Z]//g'; }
fail=0; total=0

for f in nomic_[0-9]*.tau adt_tutorial_*.tau adt_tables_*.tau values_*.tau testing_*.tau consensus_*.tau; do
  total=$((total+1))
  exp_res=$(grep -m1 '^# EXPECTED-RESULTS:' "$f" | sed 's/^# EXPECTED-RESULTS: *//')
  exp_codes=$(grep -m1 '^# EXPECTED-CODES:' "$f" | sed 's/^# EXPECTED-CODES: *//')
  exp_tf=$(grep -m1 '^# EXPECTED-TF:' "$f" | sed 's/^# EXPECTED-TF: *//')
  exp_tres=$(grep -m1 '^# EXPECTED-TUPLE-RES:' "$f" | sed 's/^# EXPECTED-TUPLE-RES: *//')
  exp_out=$(grep -m1 '^# EXPECTED-OUT:' "$f" | sed 's/^# EXPECTED-OUT: *//')
  if [ -z "$exp_res" ] && [ -z "$exp_codes" ] && [ -z "$exp_tf" ] && [ -z "$exp_tres" ] && [ -z "$exp_out" ]; then
    echo "SKIP  $f (no contract)"; continue
  fi
  if LC_ALL=C grep -qP '[^\x00-\x7F]' "$f"; then
    echo "FAIL  $f (non-ASCII content - would silently break piped runs)"
    fail=$((fail+1)); continue
  fi
  out=$(timeout "$TAU_TIMEOUT" "$TAU_BIN" -q $TAU_ARGS < "$f" 2>&1 | strip_ansi)
  ok=1; detail=""
  if [ -n "$exp_res" ]; then
    act_res=$(printf '%s\n' "$out" | grep -oE '^%[0-9]+: .*' | sed 's/^%[0-9]*: //' | paste -sd' ' -)
    [ "$act_res" = "$exp_res" ] || { ok=0; detail="results: got [$act_res] want [$exp_res]"; }
  fi
  if [ -n "$exp_codes" ]; then
    act_codes=$(printf '%s\n' "$out" | grep -v '^tau> ' | grep -oE 'o0res\[[0-9]+\] *:= *[0-9]+' | grep -oE '[0-9]+$' | paste -sd, -)
    [ "$act_codes" = "$exp_codes" ] || { ok=0; detail="$detail codes: got [$act_codes] want [$exp_codes]"; }
  fi
  if [ -n "$exp_out" ]; then
    act_out=$(printf '%s\n' "$out" | grep -v '^tau> ' | grep -oE '^o[0-9]+\[[0-9]+\] := [01TF]' | grep -oE '[01TF]$' | paste -sd' ' -)
    [ "$act_out" = "$exp_out" ] || { ok=0; detail="$detail out: got [$act_out] want [$exp_out]"; }
  fi
  if [ -n "$exp_tf" ]; then
    act_tf=$(printf '%s\n' "$out" | grep -v '^tau> ' | grep -oE 'o[0-9]+\[[0-9]+\] := [TF]' | grep -oE '[TF]$' | paste -sd' ' -)
    [ "$act_tf" = "$exp_tf" ] || { ok=0; detail="$detail tf: got [$act_tf] want [$exp_tf]"; }
  fi
  if [ -n "$exp_tres" ]; then
    # tuple-typed run outputs: o[k] := { ..., res: "N" } - the res member
    # carries the verdict code (part 11)
    act_tres=$(printf '%s\n' "$out" | grep -v '^tau> ' | grep -oE '^o[a-z0-9]*\[[0-9]+\] := \{.*res: "[0-9]+"' | grep -oE '[0-9]+"$' | tr -d '"' | paste -sd, -)
    [ "$act_tres" = "$exp_tres" ] || { ok=0; detail="$detail tuple-res: got [$act_tres] want [$exp_tres]"; }
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
