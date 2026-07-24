---
layout: page
title: RAG Support Assistant <br> <em>Grounded AI Customer Support</em>
img: assets/img/portfolio/ragsupport/rag-support-card.png
permalink: /rag-support-assistant/
importance: 5
category: Work Experience - AI Engineer
description: "AI Engineer (Jun 2026) <br> RAG, pgvector, Vercel AI SDK, Next.js 16"
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="AI-powered customer support · RAG"
    title="RAG Support Assistant"
    subtitle="A production-ready Retrieval-Augmented Generation platform that answers customer questions strictly from a company's own knowledge base — docs, FAQs, PDFs, and crawled web pages — with a clickable source citation on every claim and a hard refusal when the answer isn't in the knowledge base."
    meta="!AI Engineer,RAG,Customer Support,Anti-Hallucination"
    tech="Next.js 16,React 19,TypeScript,Vercel AI SDK v6,Postgres + pgvector,Drizzle ORM,Auth.js,Codex CLI,transformers.js,Zod"
%}

<div class="apple-overview">
  <p>
    <span class="lead-emphasis">RAG Support Assistant</span> is a full-stack AI support platform built around one core rule: the assistant may only answer from retrieved knowledge-base content, and every statement it makes must cite the source chunks it drew from. If retrieval returns nothing relevant, the model never sees the question — it returns a fixed refusal message instead of guessing.
  </p>
  <p>
    The platform covers the complete operator workflow: upload PDFs, DOCX files, or plain text; crawl a help-center or docs site by URL; watch documents move from <strong>pending → processing → ready</strong> in real time; then hand the chatbot to end users who get streaming, citation-backed answers from that exact corpus.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="What I Built"
      title="Feature Highlights"
      lead="End-to-end RAG infrastructure, from document ingestion to streaming answers with source citations, admin tooling, and cost observability."
  %}

  <div class="apple-grid">

    <article class="apple-card">
      <span class="apple-icon">RAG</span>
      <h3>Grounded Chat with Citations</h3>
      <p>Implemented a full streaming chat pipeline using <strong>Vercel AI SDK v6</strong> <code>streamText</code>. Every assistant message carries inline <code>[n]</code> citation chips that link back to the source document, heading, page, and a 280-character excerpt — persisted as JSONB alongside the message.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🛡</span>
      <h3>Anti-Hallucination Refusal Gate</h3>
      <p>Built a hallucination guard into the retrieval step: if cosine similarity search returns no chunks above the threshold, the API route short-circuits and returns the fixed refusal message before the prompt is ever sent to the model. The LLM cannot invent an answer for uncovered questions.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🔄</span>
      <h3>Multi-Turn Query Rewriting</h3>
      <p>Implemented a standalone query rewriter (<code>rewrite.ts</code>) that condenses follow-up questions using the last six conversation turns into a self-contained search query before retrieval. Follow-ups like "what about pricing for that?" resolve correctly against the vector index.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">📄</span>
      <h3>Multi-Format Document Ingestion</h3>
      <p>Supported <strong>PDF</strong> (unpdf), <strong>DOCX</strong> (mammoth), <strong>TXT/Markdown</strong>, and same-domain website crawls (cheerio, configurable depth + page limits). All formats funnel into a shared chunking and embedding pipeline regardless of source type.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">VEC</span>
      <h3>Heading-Aware Chunking + pgvector HNSW</h3>
      <p>Built a heading-aware chunker (~800 tokens, ~150-token overlap) that preserves document structure in chunk metadata. Embeddings are stored in a <strong>pgvector</strong> <code>vector(1536)</code> column with an <strong>HNSW index using cosine ops</strong> for fast approximate nearest-neighbor retrieval at query time.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">⚙️</span>
      <h3>Provider-Agnostic AI Layer</h3>
      <p>Designed a single <code>provider.ts</code> seam driven by one environment variable: <code>AI_PROVIDER=openai|anthropic|codex</code>. Swapping providers changes chat model, judge model, and embedding strategy with zero application code changes. The <strong>Codex CLI</strong> path uses local <strong>transformers.js</strong> embeddings so the full stack runs without any API key.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">ADM</span>
      <h3>Admin Knowledge-Base Manager</h3>
      <p>Built a protected admin panel (<code>/admin/documents</code>) where operators upload files or submit a URL to crawl. Ingestion runs via Next.js <code>after()</code> so uploads return immediately; the client polls for status. Documents display live <strong>pending → processing → ready/failed</strong> state with chunk counts.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">💰</span>
      <h3>Token &amp; Cost Tracking</h3>
      <p>Recorded every chat and rewrite event as a <code>usageEvents</code> row with input tokens, output tokens, and cost in <strong>integer micro-USD</strong> (no float drift). Exposed a user dashboard (<code>/usage</code>) with token totals and monthly breakdown, and an admin dashboard (<code>/admin/usage</code>) with per-client breakdowns sorted by cost.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">EVAL</span>
      <h3>LLM-as-Judge Eval Harness</h3>
      <p>Implemented an evaluation suite (<code>npm run eval</code>) against a golden dataset: recall@k, MRR, faithfulness (answer grounded in retrieved chunks), correctness (LLM-as-judge vs. reference answer), citation validity, and refusal behavior. Outputs a pass/fail summary with per-metric scores for CI integration.</p>
    </article>

  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Architecture"
      title="How it flows"
      lead="A strict retrieval-first pipeline: every answer is built from retrieved chunks, never from model memory."
  %}

  <div class="apple-overview">
    <p>
      <strong>User question</strong> &rarr; <strong>query rewriter</strong> (standalone query from history) &rarr; <strong>embed query</strong> (OpenAI or local transformers.js) &rarr; <strong>pgvector cosine top-k</strong> (similarity threshold gate) &rarr; <strong>hallucination guard</strong> (empty result &rArr; fixed refusal, pipeline stops here) &rarr; <strong>grounded prompt</strong> (chunks + strict citing rules) &rarr; <strong>streamText</strong> (temp 0.2) &rarr; <strong>persist message + sources</strong> &rarr; <strong>record usage event</strong>
    </p>
    <p>
      The hallucination guard is the key boundary: it sits between retrieval and generation, not inside the prompt. By never forwarding an unanswered question to the model, the system avoids the entire class of prompt-level "say you don't know" instructions that LLMs can be talked out of. The model only ever sees questions that the knowledge base can actually answer.
    </p>
    <p>
      Document ingestion runs the same embedding pipeline in reverse: extract text &rarr; heading-aware chunking &rarr; batch embed (64 chunks per request) &rarr; <code>INSERT ... ON CONFLICT</code> into the <code>chunks</code> table &rarr; mark document <code>ready</code>. Ingestion runs in <code>after()</code> (outside the HTTP response) so uploads are non-blocking.
    </p>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Tech Stack"
      title="Built with"
  %}

  <div class="apple-tag-grid">
    <span class="apple-tag">Next.js 16 App Router</span>
    <span class="apple-tag">React 19</span>
    <span class="apple-tag">TypeScript 5</span>
    <span class="apple-tag">Tailwind CSS 4</span>
    <span class="apple-tag">shadcn/ui + Radix</span>
    <span class="apple-tag">Vercel AI SDK v6</span>
    <span class="apple-tag">Postgres + pgvector</span>
    <span class="apple-tag">Drizzle ORM</span>
    <span class="apple-tag">Auth.js (NextAuth v5)</span>
    <span class="apple-tag">OpenAI / Anthropic / Codex CLI</span>
    <span class="apple-tag">transformers.js (local embeddings)</span>
    <span class="apple-tag">unpdf · mammoth · cheerio</span>
    <span class="apple-tag">Zod</span>
    <span class="apple-tag">react-markdown + remark-gfm</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Behind the Scenes"
      title="Challenges &amp; solutions"
      lead="Engineering decisions that keep the answers trustworthy and the system operator-friendly."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Grounding"
        challenge_title="A support assistant that hallucinates is worse than no assistant at all."
        challenge_body="Prompting the model to 'only use the provided context' is fragile — sufficiently capable models can be instructed out of it, and a single hallucinated answer destroys user trust in the whole product."
        solution_body="Moved the grounding check out of the prompt and into the retrieval step. If cosine similarity search returns no chunks above the threshold, the API route returns the fixed refusal immediately without ever building a prompt. The model only receives questions the knowledge base can answer."
    %}
    {% include apple/cs_card.liquid
        label="Multi-Turn Context"
        challenge_title="Follow-up questions reference context the vector index doesn't understand."
        challenge_body="A question like 'what about enterprise pricing?' has no semantic match in the knowledge base without knowing the prior turn asked about Acme Cloud plans. Embedding the raw follow-up produces a near-zero similarity score and triggers the refusal gate incorrectly."
        solution_body="Added a query rewriting step before retrieval: the last six turns are summarised into a self-contained search query using the model at temperature 0. The rewriter runs separately, records its own usage event, and falls back to the raw question on failure — so a rewriter timeout never blocks the user."
    %}
    {% include apple/cs_card.liquid
        label="Background Ingestion"
        challenge_title="PDF parsing, chunking, and batch embedding can take tens of seconds per document."
        challenge_body="Running ingestion synchronously in the upload request means the HTTP response hangs, mobile connections time out, and large uploads (a 400-chunk PDF) fail entirely."
        solution_body="Used Next.js <code>after()</code> to run ingestion outside the HTTP response lifecycle. The upload API sets the document to <code>processing</code> and returns immediately; the client polls <code>GET /api/documents</code> every few seconds until the status reaches <code>ready</code> or <code>failed</code>. Operators see live progress without blocking."
    %}
    {% include apple/cs_card.liquid
        label="Provider Portability"
        challenge_title="Tying the application to a single AI provider makes local development expensive and fragile."
        challenge_body="Requiring a paid OpenAI key just to run locally, and hardcoding the model name throughout the codebase, means any provider change or API outage requires edits across multiple files."
        solution_body="Built a single <code>provider.ts</code> module that reads <code>AI_PROVIDER</code> and exports the chat model, judge model, and embedding function for that provider. Adding Anthropic or local Codex support means adding one <code>case</code>. The Codex path uses local transformers.js embeddings so the full stack — chat, ingestion, eval — runs with no API key at all."
    %}
    {% include apple/cs_card.liquid
        label="Cost Observability"
        challenge_title="Token costs accumulate invisibly and float arithmetic produces billing drift."
        challenge_body="Running RAG pipelines involves multiple model calls per turn (rewrite + chat + judge). Without per-event recording at the correct granularity, operators have no way to track which users or workflows are driving costs."
        solution_body="Recorded every model call as a <code>usageEvents</code> row with model name, input tokens, output tokens, and cost in <strong>integer micro-USD</strong> (1 USD = 1,000,000 units). Integer math eliminates float accumulation errors. A per-model pricing table maps token counts to cost; unknown models record tokens at $0 rather than failing. Separate user and admin dashboards surface this data without raw DB access."
    %}
    {% include apple/cs_card.liquid
        label="Auth Depth"
        challenge_title="A knowledge-base manager needs strict admin gating at every layer, not just the UI."
        challenge_body="Relying solely on frontend redirects for admin protection means a direct API call to <code>/api/documents/upload</code> bypasses the role check entirely."
        solution_body="Implemented defense in depth: Auth.js middleware redirects non-admins at the route level; each protected API route calls <code>requireAdmin()</code> which validates the session role server-side and returns 403 otherwise; the admin login page re-checks the session role client-side and signs out non-admins with an error. Three independent gates must all be bypassed simultaneously."
    %}
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Gallery"
      title="Screen captures"
  %}

  <div class="apple-gallery">

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/ragsupport/rag-support-card.png"
          thumb="assets/img/portfolio/ragsupport/rag-support-card.png"
          loading="eager"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">RAG Support Assistant — Overview</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/ragsupport/rag-support-landing.png"
          thumb="assets/img/portfolio/ragsupport/rag-support-landing.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Landing page — value proposition and feature overview</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/ragsupport/rag-support-chat.png"
          thumb="assets/img/portfolio/ragsupport/rag-support-chat.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Grounded chat answer with inline citation chips</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/ragsupport/rag-support-admin-documents.png"
          thumb="assets/img/portfolio/ragsupport/rag-support-admin-documents.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Admin knowledge-base manager — 4 documents ready, 516 chunks indexed</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/ragsupport/rag-support-usage.png"
          thumb="assets/img/portfolio/ragsupport/rag-support-usage.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">User usage dashboard — token counts and monthly cost breakdown</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/ragsupport/rag-support-admin-usage.png"
          thumb="assets/img/portfolio/ragsupport/rag-support-admin-usage.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Admin usage — total tokens, active users, per-client breakdown</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/ragsupport/rag-support-login.png"
          thumb="assets/img/portfolio/ragsupport/rag-support-login.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Login — email/password auth with a dev one-click bypass in development mode</figcaption>
    </figure>

  </div>
</section>
