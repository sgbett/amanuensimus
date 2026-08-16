# Creative Direction — the Amanuensimus site

## Context

Amanuensimus has three stabilised documents (CLAUDE.md, VISION.md, ETHICS.md) and a registered domain, but no creative direction for what the domain should present.

This brief captures the direction arrived at collaboratively, so a build can proceed and later work has a fixed point to argue with.

It is deliberately not a full spec. Positioning is left open enough to grow in whatever direction the project takes; only the load-bearing decisions are locked.

The infrastructure pattern (static site, S3 + CloudFront) is borrowed wholesale from `/opt/claude/sgbett-com`. **Nothing else is.** That project's brand, vibe and purpose do not carry over — the two are entirely separate works, and any shared rigour is convergent good taste, not lineage.

## The bet: the site demonstrates its own thesis

Amanuensimus argues that AI-collaborative work, done with provenance and disclosure, is legitimate and honest.

The most persuasive site does not *describe* that claim — it *is a worked example of it*. The page carries its own provenance and renders its own disclosure, in the §1.2 shape the project treats as canonical, visibly on the page.

This turns the site from a claim into evidence — which is the VISION move (evidence-first, not thesis-first) and the ETHICS posture (a standing invitation to argue). No competing manifesto can honestly do this.

It also makes the site the first artefact to eat the framework's own dog food: the first worked example of the disclosure-integrity pillar, and a live spec test for the provenance renderer when that exists.

This self-demonstration is the spine. Everything else hangs on it.

## The metaphor: the margin — two columns, always

The name fuses the *amanuensis* (the scribe, who worked in the margin) with the *animus* (the inner interlocutor). The layout that unifies both, and the whole thesis, is **the margin**.

**Two columns. Always.** The work, and the work behind the work. This is constitutional, not decorative — every page is two columns, even where the second is sparse.

One column carries the work. The other carries the work behind the work: the provenance, the second voice, the disclosure, the annotations. The collaboration is made visible *as structure* — the design argues the point before a word is read.

The deeper move is the tension between two divides:

- The line on the screen is a **hard, legible divide** — two columns, a rule between them, a clear boundary.
- The real division — what was Simon, what was the model — is **illegible and unknowable, even to us**. By the end, neither author nor model can say where one hand stopped and the other began.

The site sets the legible divide against the illegible one. We both walk either side of the line; we merge; the boundary on the page is exact and the boundary in the making is a fiction.

That contrast *is* the extended-mind thesis (Clark and Chalmers, per ETHICS) turned into an exhibit. The artistic exhibit stands alongside whatever technology and whatever academic literature the project may or may not produce — all of it mood-led, none of it obligatory. The work is serious; there is room to have fun with it.

### Rejected metaphors

- **Palimpsest** — connotes erasure, the opposite of disclosure. The project is anti-erasure (abandoned versions are archived, not deleted). Reject.
- **Manuscript / fair-copy skeuomorphism** — pastiche risk. Reject.
- **Ledger** — `sgbett-com` owns it; using it would rhyme two brands that must stay separate. Reject.

## Positioning: a manifesto that self-demonstrates

The site is a framework in Phase 0, not a product — so not a marketing page with calls to action.

The shape: **a manifesto page that (i) states the thesis with conviction, (ii) carries its own live disclosure in the margin, (iii) will link out to the deeper docs (VISION, ETHICS) and the proof case (the crypto paper's §1.2) once those are published as pages — deferred for now rather than shipped as broken links, and (iv) has one dated-entry mechanism so it *can* grow without committing to a full blog.**

This gives conviction now and extensibility later, and it avoids cloning the `sgbett-com` append-only ledger. Positioning stays deliberately loose: manifesto, gateway and living-document are all reachable from here as the mood takes it.

## Copy direction

The gatekeeping observation from ETHICS is the sharpest opening. Candidate hero lines, to react to and refine:

- *"The question was never 'did a human type this?' It was 'did anyone think it through?'"*
- *"We did this. I answer for it."* — the refined authorship framing, as a standalone credo.
- *"Honest collaboration between human authors and AI — made tractable, and disclosed."*

Then, briefly: the four pillars; the responsibility stance; the self-disclosure in the margin; the doors to the docs and the proof case.

On brand, and disarming: a note that the project is early and meant to be argued with. Honesty about stage is itself the argument.

Voice is literary, confident, British, one thought per line — matching VISION and ETHICS, not softened for the web.

## Visual language

**Minimally styled, not unstyled.** The two-column law forecloses a truly unstyled page — two *distinct* contents side by side require CSS. So the aesthetic is *structural minimalism*: only the load-bearing declarations (layout, font stacks, whitespace), one deliberate mark, and nothing else. The choices left unmade (final display face, exact tones) stay free to emerge later. The substrate is honest about being a substrate — there is no neutral default, so the little that is chosen is chosen on purpose.

Warm, editorial, humanist — a bookish register. This is about prose and voice, so the type must carry character from the first load, before any final face is chosen.

- **Body serif — Georgia now.** Georgia is web-safe across platforms and, unlike Times New Roman, was drawn for the screen: it reads as *character*, not as document-default. A final display face (a Signifier-like philosophical serif is the reference point) is deferred, not decided.
  `font-family: Georgia, "Times New Roman", Times, serif;`
- **Monospace for the second voice and provenance only** — kept out of the reading voice, a quiet nod to the machine hand. Pinned to a robust system stack (`ui-monospace` first, so it resolves correctly on Apple and Windows; named faces as the net; generic `monospace` as the floor):
  `font-family: ui-monospace, SFMono-Regular, "SF Mono", Menlo, Consolas, "Liberation Mono", "DejaVu Sans Mono", monospace;`
- **Greyscale, two-tone by weight of ink — hue withheld, not forbidden.** Full ink for the human voice; a graphite grey for the second voice; the distinction carried by *lightness*, not colour — the model's hand is the lighter hand. No hue *yet*: colour is *withheld* and enters only by a recorded constitutional amendment (see the pigment arc under Roadmap) — rubrication with the colour not-yet-added, the page the rubricator has not reached. Exact tones TBD; the monochrome ink/graphite system is locked for now.
- **The wordmark is a two-hands artefact.** Set lowercase as a large `h1`: `amanuensi` in ink with the `mus` graft — the tail of *animus* — in the second-hand tone. The name discloses its own construction. (It also parses as a Latin superlative, *-imus*: most scribe-like.)
- **The credo straddles the rule.** "We did this. I answer for it." is set as one line hinged on the rule — "We did this." heading the work, "I answer for it." heading the account — serif and ink on both sides (the author's voice, never the apparatus mono). The rule is the pivot where shared making yields to sole answering; on mobile it rotates with the divide.
- **Whitespace does all the structuring — with one exception: the central rule.** No hairlines, no markers, no chrome. The single mark that earns its place is the line dividing the two columns, because that line *is* the thesis (the hard, legible divide set against the illegible one). A gutter of whitespace would not read as *hard*; the concept requires an actual rule.
- **Peer columns, not a thin sidenote rail.** The two columns sit nearer to equal, divided by the rule — this serves the "both walk either side of it" image, and it is what the mobile behaviour below assumes.
- **Type is the design; the only figure is apparatus.** No hero imagery. The one mark is the **paraph** — a pilcrow split between two hands (inner stem ink, bowl and outer stem graphite), used as favicon and social card, mono-safe so it holds before any pigment. Apparatus, not decoration. The page reads as a considered document, not a landing page.

## Responsive behaviour: the divide rotates

A hard side-by-side two-column of readable prose fails on a phone — body text needs roughly 45–75 characters per line, and two such columns will not fit in ~360 CSS px.

"Two columns, always" is a *conceptual* law, not "side-by-side at every width." So the divide is invariant; only its axis is responsive:

- **Desktop:** the rule is vertical; the columns sit left and right.
- **Narrow / mobile:** the same hard rule rotates to horizontal; the work sits above, the work-behind-it below, divided by the identical line.

Co-presence and the hard line survive at every width; nothing is crushed. (This is the shape of `sgbett-com`'s diagram rule — "which axis carries the divide may vary, provided it is declared" — arrived at independently, for a different reason.)

## Scope and stance

Honest about stage: this is a Phase-0 artefact. It should not overclaim a product.

The site may grow into technology demonstrations, or academic pointers, or neither. That optionality is deliberate and should be visible rather than hidden.

## Roadmap (v2 — deferred, from the design-session exploration)

Explored and reconciled, not yet built. Each is deliberately held back from v1:

- **The pigment arc (rubrication).** Colour is withheld, not absent, and arrives by amendment when weight-of-ink alone cannot separate hands: *minium* (red) for the model's hand — beginning with the graft — and *azurite* (blue) for the reader's, once reader-side tooling exists. Historically grounded (the rubricator worked last, in red); semantic, never decorative; never on the rule (the rule is not a hand). Each expansion is a recorded constitutional amendment with a stated objection.
- **The voicing gauge.** The site declares how voiced its prose is (0 = unvoiced model output → 3 = indiscernible from the author) as a manifest field. The design advances *with* the voice, on an anonymous→particular axis, never plain→polished. The interactive dial is a study device; production renders at the declared level only, advancing only when the voice-fidelity pillar can actually move it.
- **Design as amendment, not version.** The visual system enrols in the project's own anti-erasure mechanism: one token at a time, by trigger not schedule, with declared sympathies; the living statement renders at current tokens while dated artefacts freeze at issue, so reading down the archive is reading the evolution.

Locked regardless: two columns, the rule (1px, full ink), the graft in the second hand's tone.

## Open threads

The visual system is otherwise locked (see above). Deliberately still unresolved, to decide when the mood or the build requires it:

1. **Final display serif** — Georgia is the working body face; a Signifier-like face is the reference point for a later, deliberate choice.
2. **Exact greyscale tones** — the two-tone ink/graphite *system* is locked; the specific values are not.
3. **Which column is which** — working default is work left, work-behind-it right (LTR-conventional); open to a more deliberate choice.
4. **The growth mechanism** — how the single dated-entry affordance works without becoming a blog engine.
5. **Provenance rendering** — hand-authored for now vs. generated by the (not-yet-built) provenance pillar; the site should be the renderer's first target when it exists.
6. **Legal / usage boilerplate** — kept out of the per-artefact disclosure. When the site grows standing pages, usage-terms review, output licensing and similar move to a standing disclaimer, rather than cluttering each artefact's provenance with paper-submission scaffolding.

## Provenance

Produced with Simon Bettison across Claude Code sessions (Claude Opus 4.8, Anthropic, 15–16 August 2026), incorporating a separate claude.ai design exploration reconciled here.

The framework, the direction and the decisions are Simon's; the prose, the structuring and much of the option-generation are the model's, iteratively directed and reviewed. Several load-bearing moves emerged in the exchange itself and cannot be cleanly assigned to one hand — the "minimally styled, not unstyled" reframe, the greyscale two-tone by weight of ink, the rotate-the-divide behaviour. That they resist attribution is the point: here, as on the site this brief describes, the legible divide is a fiction over an illegible one, and attribution follows responsibility, not authorship of individual sentences.

Simon takes responsibility for the direction recorded here. In keeping with the framework this brief serves, it is meant to be argued with and revised.
