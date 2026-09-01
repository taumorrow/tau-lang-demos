# Tau Language Demos

Runnable demos and tutorials for the [Tau Language](https://github.com/IDNI/tau-lang) —
a language whose specifications are first-class values of a decidable algebra.

The centerpiece is the **Tau-Nomic Tutorial Series**: a living, self-amending
constitution, explained in eleven self-contained `.tau` files. Every claim in
the series is a runnable query, and every file declares its expected outputs
as a machine-readable contract — so the series **checks itself** against your
binary.

## The Tau-Nomic Tutorial Series

| Part | File | What it shows |
|------|------|---------------|
| 00 | `nomic_00_read_me_first.tau` | Orientation: what tau-nomic is, how to read the series |
| 01 | `nomic_01_specs_as_values.tau` | Specifications as decidable values: meet, entailment, self-reference without paradox |
| 02 | `nomic_02_decide_not_vote.tau` | Idempotence: why a deciding kernel has no use for majorities |
| 03 | `nomic_03_living_constitution.tau` | The kernel starts to run: law as temporal state, adopt/reject as arithmetic |
| 04 | `nomic_04_actions.tau` | Judging deeds under the law: legal / irregular / unconstitutional |
| 05 | `nomic_05_ratchet.tau` | Irreversibility and path-dependence |
| 06 | `nomic_06_eternity_clause.tau` | A real constitution's core (German Basic Law, Art. 79(3)) mechanized |
| 07 | `nomic_07_the_map.tau` | What reduces to SAT, what is irreplaceable, which query form scales |
| 08 | `nomic_08_the_edges.tau` | What honestly stays outside: translation, enforcement, identity, choice |
| 09 | `nomic_09_the_full_palette.tau` | Appendix: scoped, quantitative and temporal rights; a guarantee over all future amendments |
| 10 | `nomic_10_the_trilemma.tau` | Appendix II: who amends the amendment rule? |

Read them in order — each part builds on the last. Three parts replay entire
constitutional histories by themselves when you run the file.

### Running the series

You need a `tau` binary (build it from [IDNI/tau-lang](https://github.com/IDNI/tau-lang);
the series was developed against 0.7.0-alpha builds). Then:

```bash
# the whole series, checked against the contracts in each file header:
TAU_BIN=/path/to/tau ./nomic_run_all.sh

# a single part:
/path/to/tau -q < nomic_01_specs_as_values.tau
```

`nomic_run_all.sh` runs every file and compares the actual outputs against the
`EXPECTED-RESULTS` / `EXPECTED-CODES` / `EXPECTED-TF` headers. On a matching
binary it ends with `ALL PASS`. If a file fails on your build, the script
tells you exactly which claim diverged — the contracts are the documentation.

Two practical notes:

- Always **pipe a whole file** into `tau` as shown (one file = one session).
  Typing the parts interactively works too, but the replay parts are designed
  to run end-to-end.
- The files are pure ASCII on purpose; the runner enforces this.

## Classic demos

Smaller stand-alone demos, from the early days of this repository:

- **Arithmetic as logic:** `4bit_binary_adder.tau` (+ `_io`, `_sbf` variants),
  `4bit_binary_substractor.tau`, `4bit_binary_multiplier.tau`, `logic_gates.tau`,
  `binary_encoding.tau`, `bitvector_tutorial.tau`
- **Abstract data types** (needs a 2026-08-28+ build): `adt_tutorial_basic.tau` -
  hands-on mechanics: aliases, tuples, solve (incl. --min/--max), inheritance,
  member paths, mixed algebras (sbf/bv/tau in one record), typed streams and
  their wire format. `adt_tutorial_advanced.tau` - the meaning layer: tuple
  equality as theorems, name binding in constants, guarantees over a
  structured space.
- **Tables with ADTs** (needs a 2026-08-28+ build): `adt_tables_basic.tau` -
  fixed tables as tuples of rows: cells by member path, lookups, proven
  totals, derived columns, functional updates. `adt_tables_advanced.tau` -
  growing tables: rows as facts, a table as ONE tau value (SELECT as meet),
  and an append-only ledger over tuple streams. All four carry annotated,
  machine-checkable expected outputs.
- **Self-reference:** `barber_demo_1.tau`, `barber_demo_2.tau` (Russell's barber,
  handled without paradox)
- **Temporal behavior:** `temporal_state_machine.tau`, `temporal_stability.tau`,
  `temporal_meta_prediction.tau`, `delayed_signal.tau`, `feedback_loop.tau`,
  `adaptive_memory_management.tau`
- **Applications:** `casino.tau` (provably fair gaming — see LICENSE)

The `io/` directory holds sample input streams (`.in` files) used by the
IO-variant demos.

These predate the tutorial series and carry no self-check contracts; run them
the same way (`tau -q < file.tau`). Some were written against older alpha
builds and may need small adjustments on current ones.

## Legacy: Tau Demo Runner

`tdr-0.5-windows-TAUMORROW.zip` is an archived Windows GUI runner for these
demos (C#, themes, syntax highlighting). It predates the current Tau builds
and is **no longer maintained** — kept for the archive only. Use the shell
workflow above instead.

## License

See [LICENSE](LICENSE) (v2.0): the Tau-Nomic Tutorial Series is free for
research, education, verification and the Tau-Net ecosystem (other commercial
use requires a written license); the provably-fair-gaming architecture carries
its own commercial restriction; the remaining classic demos are MIT.

Tau Language itself is (c) IDNI AG under
[its own license](https://github.com/IDNI/tau-lang/blob/main/LICENSE.md).

(c) 2025-2026 Taumorrow (taumorrow@gmail.com)
