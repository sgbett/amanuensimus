# Vision: Amanuensimus

> A framework for AI-collaborative authorship and reading that makes honest collaboration tractable, so ideas remain the author's, the labour is honestly divided, and the reader can evaluate accordingly.

## The problem

AI-assisted writing is currently caught between two failure modes:

1. **Undisclosed use with intent to deceive** — genuinely dishonest; produces the "AI slop" flood that trains the field's reflexive rejection.
2. **Reflexive rejection of any AI-touched work** — a gatekeeping heuristic disguised as an attention filter. Targets *rendering* (does this look AI-generated?) rather than the thing that should matter (was this *thought through*?).

Between them sits the case Simon has demonstrated with the crypto paper: heavily-thought-through AI-collaborative work with rigorous disclosure. That case is currently penalised by the second failure mode, and the first failure mode makes the second superficially defensible.

Amanuensimus is the infrastructure that makes the middle case (a) technically robust, (b) honestly disclosable, and (c) evaluable by readers with matching integrity practices. If it works, the framework doesn't just serve Simon's writing — it contributes to the norms the field needs to develop for the middle case to become the default.

## Four pillars

### 1. Voice fidelity

AI-generated prose that preserves the author's voice, verified by measurement. Not achieved by prompting ("rewrite as Simon") — that hit the model-fingerprint floor in the stylometry work. Achieved by:

- **Retrieval-augmented few-shot** — rank the author's corpus by stylometric similarity to the target prompt, feed top-K exemplars as generation conditioning
- **Structural conditioning** — the axis that *is* movable via prompting (per stylometry's syncopate finding), used deliberately
- **Constrained decoding** — hard-enforce lexical constraints (British spelling, forbidden phrases, function-word frequency bands)
- **Drift measurement** — score generated output against author profile; alert on divergence; guide iteration

The purpose is anti-laundering, not vanity. Generic AI polish strips the diagnostic signal — a weak idea given excellent grammar, an invalid one a paragraph of caveats; a confused methods section that once *sounded* confused now reads clean. A voice-faithful rendering preserves that signal: if the thinking is confused, the prose stays legibly confused. So drift *toward* the machine's fluent, neutral register — not merely distance from the author — is the failure mode that matters, and fidelity will sometimes mean text measurably worse on the axes an LLM optimises for. Fidelity is the commitment not to let the model's fluency stand in for thinking that didn't happen. (See `docs/procedural-abundance.md`.)

Owns and exposes: `voice.retrieve()`, `voice.measure()`, `voice.detect_ai()` — the last being the diagnostic capability from stylometry, used as self-check on generated output.

### 2. Disclosure integrity

Every artefact carries a machine-readable provenance manifest that renders into human-readable disclosure. The canonical shape is section 1.2 of the crypto paper. The system:

- **Records the collaboration** — models used, sessions, prompts and iterations, human edits, adversarial reviews
- **Distinguishes contribution types** — framework/argument/conclusion (human) vs prose/rendering (collaborative)
- **Generates venue-appropriate disclosure** — academic long-form (section 1.2 shape), professional (footer note), popular (byline addendum), transactional (message-level flag)
- **Verifies against templates** — does this disclosure meet the bar for target venue X?

Owns and exposes: `provenance.record()`, `provenance.manifest()`, `provenance.render(venue=...)`.

### 3. Bias mitigation

The methodology Simon evolved through the abandoned first version of the crypto paper, encoded as workflow:

- **Evidence-first, not thesis-first** — extract sources without an analytical framework; construct the framework from the evidence; refuse to reference the predetermined thesis until evidence collection is complete
- **Session hygiene** — adversarial review conducted in *fresh sessions* with no exposure to prior phases; the harness enforces this rather than relying on discipline
- **Artefact preservation** — abandoned versions are archived, not deleted; they may themselves become research contributions (as the abandoned crypto-review version has)

Owns and exposes: workflow scaffolding for the evidence-first pipeline; a session-runner that spawns independent contexts for adversarial passes.

### 4. Reader-side integrity

The parallel responsibility frame for AI-assisted reading. Without it, the authorship norms are stranded — everyone who accepts responsibility-based authorship will remain marginal for as long as reading practice hasn't caught up. Amanuensimus explicitly builds reader-side tooling because the compact only holds if both sides can honour it.

- **AI-assisted reading tools** — highlight novelty, weak claims, missing citations, structural bias
- **Reader-side provenance** — record how a work was engaged with (direct read? summary? adversarial probe?)
- **Reader disclosure templates** — paired with author-side templates; when citing a work read with AI assistance, disclose the mode of engagement
- **Defensibility-probe tooling** — adversarially test your own claims to confirm you can defend them under questioning you didn't rehearse for

Two design commitments, load-bearing. The probe works by *negative inference* — occluding machine-typical value rather than rubricking human value, because the things that matter (spotting that a standard model is wrong, designing a decisive test, knowing the output is nonsense) are precisely what cannot be rubric'd. And it emits *questions localised to the text*, never transferable scores: measurement proposes, dialogue disposes. A reading tool whose output became a number an institution could put in a spreadsheet would *be* the machine-readable criterion of the treadmill it exists to break. (See `docs/procedural-abundance.md`.)

Owns and exposes: `reading.probe()`, `reading.summarise()`, `reading.record()`.

## Why the reframe from stylometry / from "ghostwriter"

**From stylometry:** the mission (single-author style transfer) was diagnosed as wrong during the founding conversation. The technique (prompted rewriting) hit a model-fingerprint floor. The measurement math is genuinely strong and gets lifted; the standalone-transfer approach is abandoned. Stylometry is retained as a frozen historical artefact, not evolved.

**From "ghostwriter":** the name accurately captured the ethical framing (ghostwriting is legitimate, disclosed, respectable) but was too on-the-nose and risked triggering the wrong classifiers. Amanuensimus retains the ghostwriter analogy in the ETHICS document but names the project literarily rather than transactionally. The Jungian gesture (animus-as-interior-interlocutor) also matches the extended-mind philosophical grounding the project rests on.

## Trust asymmetry and cognitive collaboration

Amanuensimus operates on three asymmetric sources:

| Source | Trust | Role |
|---|---|---|
| Author's own past writing | Stylistic ground truth | Voice conditioning, retrieval exemplars |
| Cited sources / evidence | Authoritative | Framework construction, factual content |
| Model-generated prose | Rendering | Formulation of ideas the author is responsible for |

Under the extended-mind frame, the model is a genuine collaborator — an interior-exterior partner — but responsibility for the output rests with the author. Provenance records the collaboration; disclosure surfaces it; measurement verifies the author's voice is preserved through it.

## Boundaries with other projects

- **`stylometry`** — frozen. Math lifted. Do not modify.
- **`support-responder`** — downstream consumer. Uses Amanuensimus for voice fidelity in the specific domain of transactional support drafts. Adds ticket state, tenant scoping, macros, edit-delta learning. Not a peer project.
- **`hand-rolled-secp256k1-lit-review`** — proof case. The paper (with its section 1.2 disclosure) is the demonstration Amanuensimus generalises. The abandoned first version is the founding case study for the bias-mitigation pillar.

## Roadmap (lean)

This is a framework and philosophical contribution more than a shipping product. Phasing reflects that:

**Phase 0 — Documentation and grounding.** CLAUDE.md, VISION.md, ETHICS.md (this milestone, 2026-07-16). Define the four pillars in enough depth that scope questions have answers. No code.

**Phase 1 — Voice-fidelity lift.** Import measurement code from stylometry, wrap as library. Expose retrieval interface (`bin/rank` or equivalent). Blind test: prompted transfer vs retrieval-augmented few-shot on held-out author paragraphs, scored by the diagnostic layer. Grounds subsequent decisions in evidence.

**Phase 2 — Provenance manifest and disclosure generation.** Machine-readable schema. Template renderers for venue-specific disclosure. Verification against the crypto paper's section 1.2 as reference.

**Phase 3 — Bias-mitigation workflow harness.** Session-runner, evidence-first pipeline scaffolding. Case study: apply to the *next* paper in the trilogy (bias-in-AI-synthesis, using the abandoned crypto-review version as data).

**Phase 4 — Reader-side tooling.** AI-assisted reading harness, reader-side provenance, defensibility-probe tools. Produces the empirical basis for the "reading in the age of collaborative authorship" paper.

**Phase 5 — Consolidation.** Package as library + CLI + MCP server. Support-responder migrates to Amanuensimus's voice-fidelity module.

## Success criteria

Not "downloads" or "adoption". This is a framework project; success looks like:

- Simon's next serious paper (bias-in-AI-synthesis) is produced with the framework and shows measurably lower structural bias than the abandoned first version
- The disclosure practice Simon has been using solo becomes reproducible by others without them needing to reinvent it
- Reader-side norms exist as concrete artefacts (tools, templates) that early adopters can point to
- The three-paper trilogy is completed and each paper visibly embodies the framework
- The framework serves as a working reference for Simon's potential thesis on AI-collaborative cognition

## Open questions

1. **Distribution and licensing.** Is this open-source from day one? Licence choice matters — permissive vs copyleft affects who adopts and how. Also feeds into the trademark question.
2. **Where does the bias-in-AI-synthesis study live?** Currently pointed at Amanuensimus as founding case study. Alternative: sibling project. Inclination: keep together during formation, split if it grows.
3. **Reading-side scope.** How far into reading tools does Amanuensimus go before it's a separate project? First cut: as far as it takes to demonstrate the parallel-integrity thesis; beyond that, spin out.
4. **Multi-author profiles.** Framework is single-author by default. Support-responder needs several author profiles. Amanuensimus should support this from the start rather than retrofit.
5. **Provenance during private drafting vs published artefact.** How much of the working process is captured? Every session verbatim? Summary manifests? Tension between fidelity and readability of the disclosure.
6. **Trademark.** Simon has the domains; does he trademark "Amanuensimus"? Depends on distribution model in (1).
7. **The reader whose norms haven't caught up.** Even with perfect reader-side tooling, mainstream readers won't use it. Does Amanuensimus (or its ETHICS document) speak to the norm-change problem, or only to those already willing?
