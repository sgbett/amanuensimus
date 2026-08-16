# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## What this is

Amanuensimus is Simon Bettison's framework for AI-collaborative authorship and reading. Not a product; not a service; a set of principles, tools, and workflow instrumentation that make honest collaboration between human authors and AI models tractable at scale.

See VISION.md for mission and architecture. See ETHICS.md for the philosophical position and the disclosure practice the project encodes — those commitments are not appended ethics, they are the substance the technical work serves. This file is operational.

## The name

Portmanteau of *amanuensis* (a scribe or literary assistant, historically) + *animus* (Jung's inner interlocutor of the psyche). Deliberately literary. The AI collaborator is not just a scribe transcribing pre-existing thought — it is an interior-exterior partner in the cognitive act, an animus-figure whose contribution is neither purely other nor purely self.

Zero Google hits at the time of naming. .com/.org/.net registered 2026-07-16.

## Hard non-goals

- **Not a tool for undisclosed AI use.** Every workflow the project supports produces provenance the author can (and should) disclose. The tooling makes disclosure the path of least resistance.
- **Not standalone style transfer.** The stylometry repo tried this and hit the model-fingerprint floor. Amanuensimus uses measurement to *guide* other generation techniques (retrieval-augmented few-shot, constrained decoding, edit-delta learning), not to shell out to `claude -p` with a "rewrite as Simon" prompt.
- **Not a substitute for reader engagement.** Reader-side tooling is a first-class concern precisely so that AI-assisted reading remains defensible, not so it can replace slow engagement where slow engagement is warranted.
- **Not neutral about honesty.** The framework encodes a specific ethical position (see ETHICS.md). It does not aim to serve users who want to hide AI collaboration.
- **Not voice-cloning-as-a-service.** Voice profiles are built from an author's own corpus with their explicit participation. The framework will not, by default, build a voice profile of a third party from scraped writing.

## Architecture

Amanuensimus is a framework and toolkit, not a service. It has three intended forms:

1. **Library** — Python (and possibly Ruby) modules other projects import: retrieval, drift measurement, provenance manifest, session-hygiene runner
2. **CLI** — for interactive use during a writing or reading session
3. **MCP server** — so Claude Code and other agent frontends can call it as tools

Relationship with other projects:

- `/opt/claude/stylometry` — historical artefact; measurement math (three-axis, Burrows-Δ, Anna-Wegmann embeddings, register pattern) lifted from here
- `/opt/claude/support-responder` — downstream domain-specific consumer of the voice-fidelity capability
- `/opt/claude/hand-rolled-secp256k1-lit-review` — archetype / proof case; the paper is the demonstration this framework generalises. Section 1.2 of `review-final.md` is the canonical disclosure exemplar.

## Directory layout

Kept intentionally sparse while scope solidifies. The site (`www/`) and its deployment (`infra/`) exist; the Python package is still target.

```
amanuensimus/
├── CLAUDE.md              # this file
├── VISION.md              # mission, four pillars, boundaries, roadmap
├── ETHICS.md              # philosophical position, disclosure practice
├── docs/                  # research notes, disclosure templates, worked examples
├── www/                   # amanuensimus.com — the static manifesto site
├── infra/                 # deployment: deploy script, CloudFront + redirect config
├── amanuensimus/          # Python package (name may evolve) — not yet built
│   ├── voice/             # voice-fidelity: retrieval, profile, drift
│   ├── provenance/        # manifest, disclosure generation
│   ├── bias/              # evidence-first workflow, session hygiene
│   ├── reading/           # reader-side integrity tooling
│   └── mcp/               # MCP server
├── venv/                  # gitignored
└── requirements.txt
```

## Decisions locked (2026-07-16)

1. **Name: Amanuensimus.** Portmanteau, Jungian, zero-collision. Domains registered.
2. **Four pillars, not three.** Voice fidelity + disclosure integrity + bias mitigation + reader-side integrity. Reading is not a sibling project.
3. **Framework, not product.** Success is measured in whether serious writers (starting with Simon) can honestly collaborate with AI on serious work, not in units shipped.
4. **British English throughout** — matches Simon's other projects and personal register.
5. **Documentation-first cadence** — no code until VISION.md and ETHICS.md stabilise. Pattern proven on support-responder.
6. **Measurement math lifted from stylometry, not reimplemented.** Anything the stylometry repo does well is imported wholesale.
7. **Disclosure exemplar is section 1.2 of the crypto paper.** Any generated disclosure targets that standard by default, adapted per venue.

## Conventions

- **British English** in docs, code identifiers where reasonable, generated prose
- **One line per paragraph** in markdown (no fixed-column wrap)
- **Provenance from line one** — every artefact the toolkit produces carries a machine-readable manifest
- **Ghostwriter analogy** (not word processor) when framing the project externally

## Ethics

Not a separate concern; the primary contribution. See ETHICS.md. Short version: attribution by responsibility, disclosure as non-negotiable practice, reader-side integrity as the missing half of the compact.
