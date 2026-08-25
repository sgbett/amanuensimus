# Roadmap

The execution tracker for Amanuensimus. VISION.md holds the *why* and the four pillars in full; this holds *where we are* and *what's next*, phrased so issues can hang off it. A living document — amend it, don't preserve it.

## Status — 2026-08-17

- **Phase 0 (grounding): done.** CLAUDE.md, VISION.md, ETHICS.md stable.
- **Site: live.** amanuensimus.com — the first working demonstration of the disclosure pillar. Public repo (MIT), README, favicon, OG card, footer.
- **Licence: decided** — MIT (resolves VISION open question 1).
- **Code: none yet.** The Python package is still target.
- **2026-08-25:** direction note added — [procedural-abundance.md](procedural-abundance.md), reading Craig Wright's academia essay into the framework. Sharpens the purpose of the reading and writing tools; new items below carry the tag *(PA)*. Its four amendments to CLAUDE/VISION/ETHICS are accepted and landed.

## Pillars — status and next work

Each pillar owns an interface (VISION has the detail). The items below are issue-sized.

### 1 · Voice fidelity — *seeded, unbuilt*
Origin: the stylometry enquiry that revealed measurement-alone is insufficient — the reframe that started this project. The measurement math already exists there to lift.
- [ ] Lift the measurement math into a library (`voice.measure`, `voice.detect_ai`).
- [ ] Retrieval interface: rank the author's corpus by stylometric similarity, feed top-K as conditioning (`voice.retrieve`).
- [ ] Grounding experiment (Phase 1): blind-test prompted transfer vs retrieval-augmented few-shot, scored by the diagnostic layer.
- [ ] Multi-author profiles (needed downstream; see Open decisions).
- [ ] *(PA)* Directional drift: treat the machine exemplar as a named attractor, not just distance-from-author — drift *toward* it is the failure mode. Fidelity as anti-laundering.

### 2 · Disclosure integrity — *most-demonstrated, unbuilt as code*
§1.2 is the exemplar; the site runs a hand-authored version now.
- [ ] Machine-readable provenance manifest schema.
- [ ] *(PA)* Schema requirement: task-level AI involvement plus the locus of human verification — "AI was used" is nearly useless (Wright's seventh reform).
- [ ] Venue renderers (`provenance.render(venue=…)`): academic long-form, professional, popular, transactional.
- [ ] Verify a rendered disclosure against the §1.2 reference.
- [ ] Make the site's right column the renderer's first target (currently hand-authored).

### 3 · Bias mitigation — *method proven, harness unbuilt*
The method comes from the abandoned crypto-review v1; the harness enforces it rather than leaving it to discipline.
- [ ] Session-runner: spawn independent contexts for adversarial passes (session hygiene, enforced).
- [ ] Evidence-first pipeline scaffolding (extract sources before framework; refuse the thesis until evidence is in).
- [ ] Case study: apply the harness to the *Bias in AI synthesis* paper.

### 4 · Reader-side integrity — *specified, least-developed*
The parallel practice for reading — the fuzziest pillar, even in VISION. Sharpened considerably by procedural-abundance.md: the reading tool is the driver of the counter-loop, and it routes attention rather than certifying anything.
- [ ] Reading probe: flag novelty, weak claims, missing citations, structural bias (`reading.probe`).
- [ ] *(PA)* Negative-inference probe: score deviation from the machine's own exemplar (the `voice.detect_ai` math, inverted), tempered by semantic coherence; patterns in the deviations become attention-routing signals.
- [ ] *(PA)* Design constraint, load-bearing: the probe emits questions localised to the text, never transferable scores — anti-Campbell by construction. Measurement proposes, dialogue disposes.
- [ ] Reader-side provenance: record how a work was engaged with (`reading.record`).
- [ ] Paired reader disclosure templates.
- [ ] Defensibility-probe: adversarially test your own claims.

## Delivery forms — Phase 5
- [ ] Package as a Python library.
- [ ] CLI for interactive writing/reading sessions.
- [ ] MCP server, so agent frontends can call the tools.
- [ ] Migrate the downstream consumer (support-responder) onto the voice module.

## The trilogy
1. **Bias in AI synthesis** — *planned.* Data: the abandoned crypto-review v1. Sits on the bias pillar.
2. **The authorship paper** — *done.* The published crypto review; §1.2 is the canonical disclosure. The proof case.
3. **Reading in the age of collaborative authorship** — *planned.* The reader-side pillar; arguably the most important — the reading norms the other two depend on. Wright (2026) and the audit-culture literature it assembles are source material — see procedural-abundance.md.

## Site — v2 design backlog
Explored, reconciled and deferred from v1 (detail in creative-direction.md; raw sketches archived under `design-exploration/`):
- [ ] Pigment arc / rubrication — colour by amendment (minium = the model's hand, azurite = the reader's).
- [ ] Voicing gauge — declare how voiced the prose is; advance it *with* the voice pillar.
- [ ] Design-as-amendment — the visual system as an anti-erasure ledger.
- [ ] Publish VISION/ETHICS as pages and restore the in-page doors (currently linked to GitHub).
- [ ] Restore the "proof case" door once the crypto review has a public home.

## Open decisions — gates, not deliverables
- Multi-author profiles — the downstream consumer needs several authors.
- Provenance during private drafting vs the published artefact — how much process is captured.
- Reader-side scope — how far before it becomes a separate project.
- Trademark "Amanuensimus" — depends on the distribution model.
- The norm-change problem — readers who won't adopt the tooling.

## Provenance
Drafted with Simon Bettison in a Claude Code session (Claude Opus 4.8, Anthropic, 17 August 2026), consolidating VISION.md and ETHICS.md into a tracker. A living document — amend it as the work moves.
