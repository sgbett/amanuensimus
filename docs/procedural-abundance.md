# Procedural abundance and the counter-loop

What Craig Wright's essay on academia sharpens in Amanuensimus — chiefly, the purpose of the reading and writing tools.

Source: Craig Wright, "The Slow Decline of Academia: When Methodology Became a Dropdown Menu", *Singular Grit*, 24 August 2026 ([link](https://singulargrit.substack.com/p/the-slow-decline-of-academia-when)). Read together with Simon's notes on it (25 August 2026), from which several of the moves below are taken directly.

The essay is about institutions; Amanuensimus is individual-practice infrastructure. This note does not adopt its institutional programme. What it takes is the mechanism the essay identifies — and the design obligations that mechanism places on tools that sit exactly where the mechanism operates.

## The same thesis, arrived at from the institution

Wright's central claim: "Generative AI weakens the inference from output to competence." Polished artefacts were only ever proxies for understanding, and AI has decoupled the proxy from the thing.

That is the trilogy thesis, stated in ETHICS as the gatekeeping observation: labour used to be a proxy for thinking; the proxy is broken. Wright derives it from the institutional side — Campbell's law, audit culture, metric reactivity — and supplies the literature (Campbell 1979; Power 1997; Espeland & Sauder 2007; de Rijcke et al. 2016; Smaldino & McElreath 2016) that the reading paper (trilogy §3) will need. Independent convergence from a different starting point is worth having on the record.

His SPSS anecdote is our second failure mode wearing academic dress. An analysis judged suspect because the examiner doesn't recognise the software is the same epistemic failure as writing judged suspect because the reader recognises the model: evaluator familiarity used as a proxy for quality. VISION calls this "a gatekeeping heuristic disguised as an attention filter" — filtering on *rendering* rather than *thinking*. Wright shows the heuristic is not an AI-era novelty but standard audit-culture equipment; the reflexive rejection of AI-touched work is template-thinking practised by readers.

And rendering-filtering now fails in both directions at once. It rejects honest, disclosed, thought-through collaboration (the case this framework exists for), and it passes laundered slop — because, as Wright argues, AI's first effect is not a flood of obviously dreadful work but weak work made to *look competent*. A filter on polish is a filter with both error rates rising.

## The treadmill, and what it obliges the tools to refuse

The essay's sharpest warning:

> "Metrics plus AI could therefore create an academic treadmill in which automated literature production feeds increasingly automated evaluation systems, while humans are retained to certify that machine-generated paperwork satisfies machine-readable criteria."

Amanuensimus builds tools at both ends of that loop. A writing tool can become the automated production; a reading tool can become the automated evaluation. The treadmill is what these tools look like when they succeed without their ethics. So the refusals need to be explicit, per end:

**The writing tool is not an output multiplier.** Its purpose is qualitative — preserve the author's ideas, good or bad, in the author's voice — never quantitative. It exists to cope honestly with the collaboration that is happening anyway, not to raise anyone's artefact count. This belongs alongside the existing hard non-goals in CLAUDE.md (proposed amendment, below).

**The reading tool is not an evaluation instrument.** It routes one reader's attention; it does not certify anything to anyone. The moment its output becomes a transferable score — a number an institution could put in a spreadsheet — it *is* the machine-readable criterion of the treadmill, and Campbell's law begins consuming it. Anti-Campbell by construction: the probe emits questions and pointers, never verdicts (developed below).

With the refusals in place, the loop can be run in reverse. Wright's treadmill is automated production feeding automated evaluation; the counter-loop is judgement-preserving production feeding judgement-directed reading. Same technology, opposite telos. And the reading end is the driver — Simon's note: the more important part is that the reading tool does its job filtering. If slop reliably fails to reach human attention, slop stops paying, and the incentive to produce it decays. That is a demand-side theory of change for the norm problem VISION leaves open (open question 7): the reading tool doesn't only serve readers whose norms have caught up — at adoption it changes what it is rational for *writers* to produce.

## Voice fidelity is an anti-laundering property

Wright: "Bad academic writing used to contain useful diagnostic information. A confused methods section often sounded confused." Generic AI polish removes the surface defects without repairing the underlying inference — excellent grammar for a weak idea, a paragraph of caveats for an invalid one. Polish launders.

This gives voice fidelity an epistemic purpose it has so far carried only implicitly. A voice-faithful rendering preserves the diagnostic signal: if the thinking is confused, the prose stays legibly confused; if the idea is bad, it arrives bad — in Simon's phrase, *bad ideas badly written, comfortably honest*. Fidelity is not an aesthetic vanity about sounding like oneself; it is a commitment not to let the model's fluency stand in for thinking that didn't happen.

Two consequences for the voice pillar:

The model-fingerprint floor is reframed. The stylometry work treated the fingerprint as an obstacle to style transfer; it is better understood as *the laundering itself* — the fluent, neutral, wholly coherent register that makes every weak idea look competent. Escaping it is not cosmetic, it is the honesty property.

Drift measurement gains a direction. Distance-from-author-profile is not enough; the machine exemplar is a named attractor, and drift *toward it* is the failure mode that matters. This is also where "improvement" gets its quotation marks: fidelity will sometimes mean making text measurably worse on exactly the axes an LLM is geared to optimise — an interesting adversarial-decoding challenge, and a feature.

The boundary Simon's notes draw is the one ETHICS already holds: the model collaborates on the human work — choosing questions, spotting the wrong assumption, knowing the output is nonsense — but must not compensate for its absence. Compensation is passive use, ownership in the thinnest sense, and the laundering case exactly.

## Don't rubric — negative inference

Wright lists what the human is still for — choosing important questions, recognising when the standard model is wrong, detecting that a dataset doesn't measure what everybody says it measures, knowing that the software output is nonsense — and then lands the line Simon flagged as the important one: **"Those are difficult things to rubric."**

The design conclusion (Simon's, and this note adopts it as doctrine for the reading pillar): *do not try*. A rubric for judgement is a template for judgement, and the essay is one long demonstration of where that ends. The problem becomes: how to recognise that the valuable things have happened without a definitive list of what is valuable.

The proposed approach is negative inference: don't measure human value — occlude machine value. A model is ideally placed to recognise its own exemplary output: low perplexity, low burstiness, fluent, neutral, wholly coherent. Measure a text's deviation from that exemplar along each axis and look for *patterns in the deviations*; certain combinations may emerge as signals worth a human's attention. Perplexity looks most useful for novelty and is also most deceiving — gibberish scores high — so it must be tempered by semantic coherence.

Developing the sketch one step: the occluded exemplar can return as a checksum. Generate the machine's own rendering of the same content and round-trip the claims through it. Deviation that survives paraphrase with meaning intact is style; deviation whose meaning *changes* under machine normalisation marks content the model cannot pattern-complete — which is either noise or novelty, and the coherence test is what splits them. Novelty lives where paraphrase fails.

This is buildable from what the framework already owns. `voice.detect_ai` is a machine-typicality measure; inverted, it is the first instrument of `reading.probe`. The stylometry math (three-axis, Burrows-Δ, Wegmann embeddings, register pattern) supplies the per-axis distances. One codebase, two pillars: pointed at the author's own draft it verifies the voice survived the collaboration; pointed at incoming text it finds the places where something other than pattern completion happened.

Two cautions, both from the essay's own logic. First, no single axis is a verdict — the ensemble and the coherence tempering are load-bearing, or the probe just reinvents the AI-detector arms race on the axis VISION already rejects. Second, Campbell's law applies to us: any published, fixed deviation-signature will be optimised against (models can be prompted into high perplexity too). The defences are that the instrument stays first-person — a reader allocating their own attention, not an institution scoring submissions — and that the signals route to a step no metric can absorb, which is the next section.

## Measurement proposes, dialogue disposes

The probe's output is a set of *questions localised to the text* — "this claim deviates where novelty would deviate; is it defensible?" — and the disposition of every question is human. Measurement proposes; dialogue disposes. The final arbiter is the one thing that cannot be rubric'd: whether the claim survives questioning it didn't rehearse for.

This closes a loop inside the reader-side pillar. `reading.probe` and the defensibility-probe are the same instrument at different orientations — pointed at another's work it generates the questions a careful reader would ask; pointed at one's own it is rehearsal for exactly that questioning. And it converges precisely with Wright's institutional prescription: "assessment increasingly has to become interactive, adversarial and specific to the work actually submitted. A viva matters more in an AI-rich environment, not less." The old model assessed possession of the procedure; the new one must assess command of the reasoning — which is, word for word, the responsibility criterion ETHICS put at the centre of authorship. The defensibility-probe is personal infrastructure for passing the test Wright says institutions must start setting.

Far-future, from Simon's notes and explicitly out of present scope: the same instrument scaled to live examination — AI proposing lines of inquiry to a human assessor like chess lines, human taking the line and adapting, AI listening and adapting, all in real time. Whether that must be face-to-face or can be a controlled real-time exchange is an open question for another year. Noted here so the thread isn't lost; it sits beyond the reader-side scope gate in VISION.

## Disclosure granularity — the seventh reform is a schema requirement

Wright, on disclosure: "'AI was used' is nearly useless as a statement. Used for what? Literature discovery? Translation? Code generation? … An institution concerned with integrity should care about where human verification occurred and who takes responsibility for the result."

That is an external specification of what the Phase 2 provenance manifest must record, and §1.2 already meets it in hand-authored form. Promoted to schema requirements: task-level involvement (which tasks the model touched, not a binary flag), the locus of human verification (what was checked, by whom, how), and the responsibility statement. A manifest that can't answer "used for what, and where did a human verify?" renders a disclosure of the nearly-useless kind.

The engagement-texture point from ETHICS (ownership is not binary; the manifest records how output was *engaged with*) slots in here too — session records already contain the iterations, arguments and edit-deltas that distinguish active collaboration from passive acceptance. Recorded as disclosure, honestly; never surfaced as a score, for the treadmill reasons above.

## What this changes, and what it doesn't

No new pillar; the four stand. Stylometry stays frozen. The institutional reforms stay Wright's. What changes is sharpness of purpose — in his register: AI is coming; the point of these tools is to make sure it is a tool and not an easy chair.

Adopted into the roadmap in this commit: the negative-inference probe and the questions-not-scores constraint (pillar 4), directional drift toward the machine attractor (pillar 1), and the disclosure-granularity schema requirements (pillar 2).

Amendments accepted (Simon, 25 August 2026) and landed in the core docs this pass:

- **CLAUDE.md, hard non-goals** — added *Not an output multiplier*: the writing tools improve artefacts qualitatively; the reading tools absorb volume; neither exists to raise throughput, and a use that increases output quota is a failure mode.
- **VISION, pillar 1** — anti-laundering stated explicitly: voice fidelity preserves the diagnostic information generic polish destroys, and drift *toward* the machine register is the failure mode that matters.
- **VISION, pillar 4** — the two design commitments stated: negative inference rather than value rubrics; questions and attention-routing rather than transferable scores.
- **ETHICS, "What Amanuensimus refuses"** — fifth refusal added: the framework will not render its measurements as certification.

## Provenance

Drafted with Simon Bettison in a Claude Code session (Anthropic, 25 August 2026), working from Wright's essay and Simon's reading notes on it. The essay quotations are verbatim from the published article; the negative-inference approach is Simon's sketch, developed one step here; the mapping onto the four pillars and the proposed amendments are the session's collaborative product, and Simon answers for what stands. A living document — amend it, don't preserve it.
