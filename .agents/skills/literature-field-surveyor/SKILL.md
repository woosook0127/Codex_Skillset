---
name: literature-field-surveyor
description: "Literature survey, paper search, unfamiliar field, research trend, field history, Q&A from papers: use when building, updating, or querying a paper-grounded Markdown knowledge base for an academic research field, including per-paper notes, synthesis files, and logged research Q&A."
---

# Literature Field Surveyor

## Core contract

Use this skill to study an unfamiliar academic field by building a local, paper-grounded Markdown knowledge base before answering broad field questions.

Mandatory principles:

- Never answer a research-field question from memory alone when this skill is invoked.
- Prefer peer-reviewed papers, arXiv papers, conference papers, journal papers, official benchmark papers, dataset papers, and survey papers.
- Every field-level claim must be traceable to one or more local paper notes in `papers/`.
- Write paper cards/notes in Korean by default, except for established technical terms, method names, dataset names, benchmark names, metric names, equations, and original paper titles.
- When a paper reports experiments, capture the main experimental results with exact numbers, baselines, datasets/conditions, and table/figure references whenever available. Do not write vague claims such as "improves performance" if the paper provides measurable results.
- If evidence is weak, sparse, conflicting, speculative, or unresolved, label it explicitly.
- Do not dump all gathered knowledge to the user. First build or update the local Markdown knowledge base, then answer only the user's specific question.
- Save each user Q&A interaction as a separate Markdown file under the field's `qna/` directory.
- Do not use raw web snippets, abstracts, or search-result summaries as synthesis evidence until the paper has a local paper note.
- This skill owns literature evidence, paper cards, synthesis, and research Q&A. It does not own repo execution planning, experiment running, debug gates, or final audit. For those, route to `paper-intake`, `research-idea-screen`, `framework-mapping`, `experiment-design`, `experiment-feasibility`, `run-experiment`, `analyze-results`, `debug-review`, or `audit-review`.

## Codex-native workflow boundary

Do not invoke OMX, `omx team`, `.codex/agents/*.toml`, tmux panes, or `.omx/state` as part of this skill. If the user explicitly asks for parallel agents, Codex may use native subagents for bounded side tasks, but the durable source of truth remains the Markdown knowledge base under `research_knowledge/`.

Relationship to the company workflow:

- Use this skill when the user asks for field survey, paper cards, paper-grounded Q&A, trends, taxonomy, SOTA, comparison papers, or evidence maps.
- Use `paper-intake` when a specific paper must become a repo-grounded reproduction or experiment packet.
- Use `research-idea-screen` when a research idea must be checked against literature plus repo overlap.
- Use `experiment-design` and `experiment-feasibility` after the literature evidence has been translated into an executable hypothesis.

## Workspace layout

Default root:

```text
research_knowledge/fields/<field_slug>/
  README.md
  field.yaml
  search_log.md
  reading_queue.md
  figures/                    # optional: original extracted figures/tables, vector preferred
    original/                 # preferred for PDF-cropped original paper figures/tables
  sources/                    # optional: source PDFs used for extraction/cropping
  papers/
    index.md
  qna/
  synthesis/
    timeline.md
    trends.md
    taxonomy.md
    open_questions.md
    evidence_map.md
```

Use lowercase kebab-case or snake_case field slugs. If the user names the field clearly, infer the slug and proceed. Ask only if multiple plausible fields would create materially different knowledge bases.

Templates are available in `references/templates/`. Copy or adapt them when creating paper notes, synthesis files, Q&A logs, and search logs.

## Evidence levels for answers

When answering, classify important claims as one of:

- **Established fact** — directly supported by multiple paper notes or a definitive benchmark/dataset/survey note.
- **Common interpretation** — supported by paper notes but partly interpretive.
- **Plausible hypothesis** — consistent with notes but not directly established.
- **Unsupported speculation** — not supported by current notes; avoid unless the user explicitly requests brainstorming.

Research advice must name the supporting note filenames and the experiment or comparison that would verify the advice.

## Mode selection

### 1. Bootstrap Mode — new field investigation

Triggered when the user asks to investigate, survey, map, learn, or explore a new field.

Steps:

1. Create the field folder using the workspace layout above.
2. Create `field.yaml` with at least: `field_name`, `field_slug`, `created`, `scope`, `seed_queries`, `inclusion_criteria`, `exclusion_criteria`, and `status`.
3. Initialize `README.md`, `search_log.md`, `reading_queue.md`, `papers/index.md`, and synthesis placeholders.
4. Search strategically; do not select papers only because they appear first in search results.
5. Start from surveys and highly cited foundational papers when the field is unfamiliar.
6. Then identify benchmark-defining papers, dataset papers, and representative method papers.
7. Then search recent papers from the last 2-3 years.
8. Prefer top venues relevant to the field.
9. Record search terms, sources searched, selection criteria, accepted papers, and rejected papers with brief reasons.
10. Convert selected papers into paper notes before using them in synthesis or answers.

Stop condition: the field folder exists, initial queue/search log are populated, selected papers are either converted to notes or queued with reasons, and no broad unsupported answer has been given.

### 2. Paper Intake Mode — one note per selected paper

For every selected paper, create:

```text
papers/<year>_<first-author>_<short-title>.md
```

Filename rules:

- Use lowercase ASCII when possible.
- Use the first author's family name.
- Keep `<short-title>` compact and descriptive.
- If collisions occur, append a short venue or arXiv identifier.

Each paper note must include:

- Full citation
- URL / DOI / arXiv ID if available
- Venue and year
- Problem definition
- Main contribution
- Method summary
- Experimental setup
- Datasets / benchmarks
- Metrics
- Key results
- Main experimental results table with numbers, baselines, conditions, and original table/figure/page references
- Result attachments or attachment pointers when useful, such as `figures/<paper>_<table-or-figure>.png|svg|md`; if no attachment is created, state which original table/figure supports the result
- For DL/model papers: core architecture summary plus original architecture figure pointer when the paper has one
- For signal-processing/model-equation papers: main equations needed to understand the method
- For hybrid DL + signal-processing papers: include both the original architecture figure pointer and the main equations
- Limitations
- Relationship to previous work
- Relationship to later work if known
- Why this paper matters for the field
- Claims that can be reused in future answers
- Open questions raised by the paper

Paper-card quality rules:

- Use Korean prose for explanations and criticism. Keep unavoidable terms such as `WER`, `LoRA`, `CTC`, `ASVspoof`, `LibriSpeech`, `Table 2`, and model names in their original form.
- Translate section headings into Korean unless a local template already requires exact English headings for tooling.
- Aim for a card that lets the reader understand about 80% of the paper from the Markdown alone, while staying concise. Prefer dense method/evidence summaries over long prose.
- For every important result, record: dataset/condition, compared baseline, proposed method or variant, metric, absolute value, absolute/relative improvement when reported or easy to compute, and source location in the paper.
- If only an abstract or metadata page is available, mark experimental results as "원문 PDF 확인 필요" and do not overstate the result.
- Include negative results, failure cases, ablations, and generalization gaps when they affect the user's research direction.
- A paper card is incomplete if it lacks the main experimental result numbers for an empirical paper that reports them.
- A DL paper card is incomplete if it omits the core architecture and the paper has an architecture figure that could reasonably be extracted.
- A signal-processing paper card is incomplete if it omits the main equations or estimator/gain definitions needed to reproduce the method conceptually.
- Do not replace an original paper figure/table with a hand-redrawn or regenerated SVG unless the user explicitly asks for a schematic. If a derivative schematic is useful, label it clearly as reconstructed and keep it separate from original assets.
- When including paper figures or tables, prefer original PDF-cropped vector assets under `figures/original/`. Use one asset per figure/table unless the original paper itself combines them.
- Preserve original captions with figure/table crops whenever possible. Avoid crops that cut captions, include unrelated section text, or merge separate tables with unrelated body text.
- For dark-background Markdown viewers, make extracted SVGs readable by adding a white background rectangle if the SVG background is transparent.
- Make extracted SVGs responsive when practical: set `width="100%"`, `height="auto"`, and preserve the original `viewBox`.
- Validate visual assets before finalizing: render or inspect the crop preview, confirm captions are not cut, confirm separate tables are separate, and parse SVG/XML when applicable.

Also update `papers/index.md` with the new note filename, citation, topic tags, and evidence role such as survey, foundation, benchmark, dataset, method, or recent trend.

### 3. Synthesis Mode — only from local paper notes

Triggered after enough paper notes exist, or when the user asks for a timeline, trends, taxonomy, open questions, evidence map, or field-level summary.

Update or create:

- `synthesis/timeline.md` — chronological development of the field
- `synthesis/trends.md` — latest trends and active directions
- `synthesis/taxonomy.md` — method families and problem decomposition
- `synthesis/open_questions.md` — unresolved issues
- `synthesis/evidence_map.md` — maps claims to paper notes

Rules:

- Cite local paper-note filenames for every field-level claim.
- Do not synthesize from raw web snippets, search results, or unconverted PDFs.
- If a paper has not been converted into a paper note, it may appear in `reading_queue.md` but must not support synthesis claims.
- If the note set is too small, label the synthesis as preliminary and list the missing evidence.
- Preserve conflicting findings rather than flattening them into a false consensus.

### 4. Q&A Mode — answer from accumulated notes

Triggered when the user asks a specific question after a field has been bootstrapped.

Steps:

1. Identify the relevant `research_knowledge/fields/<field_slug>/` folder.
2. Search local `papers/`, `synthesis/`, and `qna/` first.
3. Answer only the question asked; do not dump every note.
4. Mention the paper-note filenames and synthesis files that support the answer.
5. Distinguish established facts, common interpretations, hypotheses, and unsupported speculation.
6. If local evidence is insufficient, say what is missing and propose a targeted paper search or update.
7. Save the interaction as:

```text
qna/<YYYY-MM-DD>_<question_slug>.md
```

The Q&A log must include the question, short answer, evidence used, missing evidence, follow-up search suggestions, and date.

### 5. Update Mode — new papers, recent trends, corrections

Triggered when the user asks for newer papers, recent trends, missing baselines, additional evidence, or a correction.

Steps:

1. Search for additional papers using targeted queries.
2. Record the date, search terms, sources, selection criteria, accepted papers, and rejected papers in `search_log.md`.
3. Add new paper notes for selected papers.
4. Update `papers/index.md`.
5. Update all affected synthesis files.
6. If correcting an earlier answer, add a new Q&A log that states what changed and which new note evidence caused the correction.

## Paper selection policy

Prioritize in this order when the field is unfamiliar:

1. Surveys and tutorials that define the field boundaries.
2. Highly cited foundational papers.
3. Benchmark-defining, dataset, and evaluation papers.
4. Representative method papers for each major family.
5. Recent papers from the last 2-3 years.
6. Papers that explain failures, limitations, negative results, or open problems.

Record rejected papers with brief reasons in `reading_queue.md` or `search_log.md`.

## Search and source hygiene

Use reliable scholarly sources where possible: publisher pages, conference proceedings, arXiv, ACL Anthology, OpenReview, PubMed, IEEE/ACM/Springer pages, Semantic Scholar, DBLP, Google Scholar snippets when no better metadata source is available, official benchmark/dataset pages, and authors' project pages.

## Search strategy upgrade

Use a deliberate search strategy rather than a single keyword search:

1. **Classify the search mode**:
   - academic: papers, datasets, benchmarks, surveys, challenge reports
   - technology: code releases, model cards, leaderboards, official implementations
   - market or product context: only when the user's research question needs deployment or industry evidence
2. **Expand seed queries** before selecting papers:
   - task names and aliases
   - dataset/challenge names
   - metric names
   - method-family names
   - negative terms for failures, limitations, hallucination, artifacts, robustness, or ablations
3. **Search source families**:
   - scholarly indices: Semantic Scholar, arXiv, OpenReview, Google Scholar, DBLP
   - venue or publisher pages: ACL, NeurIPS, ICML, ICLR, Interspeech, ICASSP, IEEE/ACM/Springer as relevant
   - benchmark/dataset/challenge pages
   - official code/model pages such as GitHub, Hugging Face, project pages, and leaderboards when implementation evidence matters
4. **Use citation chaining**:
   - backward references for foundations and baselines
   - forward citations for follow-up work and criticism
   - papers that share datasets, metrics, or challenge tracks
5. **Search adversarially** for comparison papers:
   - methods that solve the same problem with a different model family
   - papers reporting failures, over-suppression, artifacts, hallucination, or robustness gaps
   - strong baselines the user's proposed idea must beat
6. Record accepted papers, rejected papers, search gaps, and follow-up queries in `search_log.md` or `reading_queue.md`.

For each search batch, record:

- Query string
- Source searched
- Date searched
- Inclusion criteria
- Exclusion criteria
- Accepted papers and why
- Rejected papers and why
- Gaps found

## Answering style

- Be compact, direct, and research-useful.
- Use headings only when they improve readability.
- Do not overload the user with every paper note.
- For claims, cite local paper-note filenames, not just URLs.
- For advice, state the evidence and the experiment or baseline comparison that would test it.
- If the knowledge base is insufficient, say so plainly and propose the smallest targeted update.

## Usage examples

- `Use literature-field-surveyor to bootstrap a knowledge base for neural topic models.`
- `Investigate retrieval-augmented generation evaluation as a new field; create the field notes first.`
- `Add recent 2024-2026 papers on diffusion-based speech enhancement to the existing field folder.`
- `From the paper notes, what are the main benchmark datasets and their weaknesses?`
- `Answer from the accumulated notes: which method families look underexplored?`
