---
layout: page
title: Cortex <br> <em>Agentic RAG Chat with Persistent Memory</em>
img: assets/img/portfolio/cortexrag/cortex-card.png
permalink: /cortex-rag-agent/
importance: 6
category: Work Experience - AI Engineer
description: "AI Engineer (Jul 2026) <br> LangChain, LangGraph, MCP, FastAPI, React"
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Agentic RAG · Document intelligence"
    title="Cortex"
    subtitle="A document-grounded RAG agent chatbot with a dashboard: upload PDFs, DOCX, TXT, or Markdown, ask questions, and get streaming answers with numbered citations back to the exact source passage. Conversations persist across sessions through two layers of memory, and the agent orchestrates retrieval alongside external tools loaded over the Model Context Protocol (MCP)."
    meta="!AI Engineer,Agentic RAG,Persistent Memory,MCP"
    tech="LangChain,LangGraph,FastAPI,React 18,TypeScript,Vite,Chroma / pgvector,SQLite / Postgres,SSE,Gemini · GPT · Claude"
%}

<div class="apple-overview">
  <p>
    <span class="lead-emphasis">Cortex</span> is built around <em>agentic</em> RAG: instead of retrieving on every message, a LangChain <code>create_agent</code> loop decides when a question needs the documents and calls a <code>retrieve_documents</code> tool itself. The tool returns numbered, source-tagged passages that the model must cite inline — "Revenue grew 10% [1][3]" — and carries the raw chunks as an artifact that the API turns into citation cards, so every claim in the answer links back to a file, page, and snippet.
  </p>
  <p>
    The platform demo shown here is loaded with <strong>Amazon's financial documents</strong> — the 2024 10-K financial statements and the Q2/Q3 2025 earnings releases — and answers quarter-over-quarter comparison questions with exact figures, resolving follow-ups like <em>"How does that compare to Q2 2025?"</em> from conversation memory.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="What I Built"
      title="Feature Highlights"
      lead="A full agentic RAG stack — retrieval tooling, two-layer persistent memory, MCP tool orchestration, streaming UX, runtime model switching, and an LLM-as-judge eval harness."
  %}

  <div class="apple-grid">

    <article class="apple-card">
      <span class="apple-icon">RAG</span>
      <h3>Agentic Retrieval with Citations</h3>
      <p>Implemented retrieval as a <code>content_and_artifact</code> tool: the <em>content</em> string (numbered, source-tagged passages) is what the model reads and cites, while the <em>artifact</em> (raw chunks with metadata) rides on the ToolMessage so the API builds citation cards — file, page, snippet — without re-running the search. The agent decides when to retrieve versus answer from context.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🧠</span>
      <h3>Two-Layer Persistent Memory</h3>
      <p>Wired a LangGraph <strong>checkpointer</strong> (per-<code>thread_id</code> conversation state in SQLite or Postgres) and a <strong>store</strong> (long-term, cross-thread memory) into the agent. Conversations survive server restarts, threads replay from the checkpointer, and follow-up questions resolve against prior turns.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">MCP</span>
      <h3>MCP Tool Orchestration</h3>
      <p>Integrated <code>langchain-mcp-adapters</code> so the agent gains every tool exposed by any configured MCP server — a single <code>MCP_SERVERS</code> JSON env var supports both <strong>stdio</strong> and <strong>HTTP</strong> transports. Web search, filesystem access, or internal APIs plug in without touching agent code.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">⚡</span>
      <h3>Streaming Chat over SSE</h3>
      <p>Built a multi-mode streaming pipeline: one <code>astream</code> pass emits <strong>token deltas</strong>, <strong>reasoning traces</strong> (collapsible "Thinking" view), live <strong>tool-activity status</strong> ("Searching documents"), and a final <strong>citations</strong> event. The React dashboard renders all of it in real time via server-sent events.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🔄</span>
      <h3>Runtime Model Switcher</h3>
      <p>Exposed <code>GET/POST /models</code> with a provider-colored badge in the header: click to switch the chat model at runtime — the backend rebuilds the agent in place against the <strong>same checkpointer and store</strong>, so thread history carries across the swap. Providers without an API key are shown disabled; embeddings stay pinned to protect the vector index.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">📄</span>
      <h3>Multi-Format Ingestion</h3>
      <p>Supported <strong>PDF</strong> (per-page metadata for citations), <strong>DOCX</strong>, <strong>TXT/Markdown</strong>, with an Unstructured fallback for anything else. Chunks (~1,000 chars, 200 overlap) are stamped with <code>doc_id</code>, <code>source</code>, <code>page</code>, and <code>chunk_id</code> — the citation payload surfaced back to the user.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">⚙️</span>
      <h3>Config-Switch Storage &amp; Models</h3>
      <p>Made both storage and models pure configuration: <code>STORE_BACKEND=local</code> runs Chroma + SQLite, <code>postgres</code> moves vectors to <strong>pgvector</strong> and memory to Postgres — no code changes. <code>CHAT_MODEL</code> / <code>EMBED_MODEL</code> are LangChain <code>provider:model</code> strings, so OpenAI, Anthropic, and Google models mix freely.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">EVAL</span>
      <h3>LLM-as-Judge Eval Harness</h3>
      <p>Implemented LangChain's RAG evaluation methodology with four judge metrics — <strong>correctness</strong>, <strong>relevance</strong>, <strong>groundedness</strong>, and <strong>retrieval relevance</strong> — runnable against fixtures or the live index, streamed example-by-example into a developer-only dashboard and written to versioned JSON/Markdown reports. Optional LangSmith upload.</p>
    </article>

  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Architecture"
      title="How it flows"
      lead="A single tool-calling agent orchestrates retrieval and MCP tools, compiled with a checkpointer and store so every request carries multi-turn context."
  %}

  <div class="apple-overview">
    <p>
      <strong>User message</strong> &rarr; <strong>FastAPI /chat</strong> (SSE) &rarr; <strong>LangGraph agent</strong> (checkpointer restores the thread) &rarr; model decides to call <strong>retrieve_documents</strong> &rarr; <strong>similarity search</strong> over Chroma / pgvector &rarr; numbered passages returned as tool content, raw chunks as artifact &rarr; model streams the answer with inline <code>[n]</code> citations &rarr; API emits <strong>token / reasoning / tool-status events</strong>, then a final <strong>citations</strong> event built from the artifact &rarr; checkpointer persists the turn.
    </p>
    <p>
      The retrieval tool's dual payload is the key design: the model only ever sees clean numbered passages it can cite, while the structured chunk metadata travels out-of-band to the UI. No second retrieval pass, no citation parsing from generated text — the source cards are guaranteed to match what the model actually read.
    </p>
    <p>
      Because the agent is compiled against abstract persistence interfaces, the whole app moves from laptop (Chroma + SQLite + in-memory store) to production (pgvector + Postgres checkpointer + Postgres store) by flipping one environment variable. Vector collections are namespaced per embedding model to prevent dimension clashes when <code>EMBED_MODEL</code> changes.
    </p>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Tech Stack"
      title="Built with"
  %}

  <div class="apple-tag-grid">
    <span class="apple-tag">LangChain create_agent</span>
    <span class="apple-tag">LangGraph checkpointer + store</span>
    <span class="apple-tag">langchain-mcp-adapters</span>
    <span class="apple-tag">FastAPI + sse-starlette</span>
    <span class="apple-tag">Chroma / pgvector</span>
    <span class="apple-tag">SQLite / Postgres</span>
    <span class="apple-tag">React 18 + Vite</span>
    <span class="apple-tag">TypeScript</span>
    <span class="apple-tag">react-markdown</span>
    <span class="apple-tag">Gemini / GPT / Claude via provider:model</span>
    <span class="apple-tag">PyPDF · Docx2txt · Unstructured</span>
    <span class="apple-tag">pydantic-settings</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Behind the Scenes"
      title="Challenges &amp; solutions"
      lead="The engineering decisions that keep citations trustworthy, memory durable, and the stack portable."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Citations"
        challenge_title="Citations parsed out of generated text are unreliable."
        challenge_body="If the UI has to re-run the search or regex the model's prose to figure out what was cited, the source cards can drift from what the model actually read — the fastest way to lose user trust in a grounded assistant."
        solution_body="Used LangChain's <code>content_and_artifact</code> tool response format: the model receives numbered passages as tool content, and the identical raw chunks travel on the ToolMessage as an artifact. The API converts that artifact into citation cards after streaming, so cards and passages can never disagree. Artifacts round-trip through the checkpointer as plain dicts, so a rehydration step restores them into typed Documents on replay."
    %}
    {% include apple/cs_card.liquid
        label="Memory"
        challenge_title="Conversations must survive restarts — and model switches."
        challenge_body="Chat state living in process memory dies with the server, and rebuilding the agent for a model switch would normally orphan every open conversation."
        solution_body="Compiled the agent with a LangGraph checkpointer (SQLite locally, Postgres in production) opened once in the FastAPI lifespan via an <code>AsyncExitStack</code>. The runtime model switcher rebuilds the agent against the <em>same</em> checkpointer and store handles under an <code>asyncio</code> lock, so switching from Gemini to Claude mid-conversation keeps the full thread history."
    %}
    {% include apple/cs_card.liquid
        label="Streaming"
        challenge_title="Three providers, three different reasoning formats, one stream."
        challenge_body="Anthropic thinking, OpenAI reasoning, and Gemini thought traces all arrive in different payload shapes, and tokens, tool boundaries, and citations each need their own UI treatment."
        solution_body="Leaned on LangChain's normalized content blocks — one <code>split_blocks</code> helper separates text from reasoning identically across providers — and ran <code>astream</code> in combined <code>messages</code> + <code>updates</code> mode: token deltas stream live while completed messages mark tool start/end and carry the retrieval artifact. The SSE protocol stays provider-agnostic: <code>reasoning</code>, <code>token</code>, <code>tool_start</code>, <code>tool_end</code>, <code>citations</code>, <code>done</code>."
    %}
    {% include apple/cs_card.liquid
        label="Portability"
        challenge_title="A laptop demo and a production deployment shouldn't be two codebases."
        challenge_body="Vector stores, checkpointers, and long-term stores each have different local and production implementations, and hardcoding any of them makes the stack rigid."
        solution_body="Isolated persistence behind two factory modules driven by a single <code>STORE_BACKEND</code> flag: <code>local</code> wires Chroma + AsyncSqliteSaver + InMemoryStore, <code>postgres</code> wires pgvector + AsyncPostgresSaver + AsyncPostgresStore. Chroma collections are namespaced per embedding model (different models produce different vector dimensions), so changing <code>EMBED_MODEL</code> can never corrupt an existing index."
    %}
    {% include apple/cs_card.liquid
        label="Dev-Only Surfaces"
        challenge_title="An eval dashboard is a developer tool — it must not exist in production."
        challenge_body="Evaluation endpoints expose internals (judge model, datasets, reports) and burn model quota; shipping them to end users would be both a cost and a surface-area problem."
        solution_body="Gated the <code>/eval/*</code> API behind a <code>DEV_MODE</code> flag that returns <strong>404 — not 403 —</strong> so the endpoints are invisible rather than tantalizing, and excluded the eval page from production bundles via <code>import.meta.env.DEV</code>. Runs are serialized with a lock, stream example-by-example over SSE, and back off automatically on free-tier rate limits."
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
          full="/assets/img/portfolio/cortexrag/cortex-card.png"
          thumb="assets/img/portfolio/cortexrag/cortex-card.png"
          loading="eager"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Cortex — Overview</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/cortexrag/cortex-chat.png"
          thumb="assets/img/portfolio/cortexrag/cortex-chat.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Multi-turn grounded chat over Amazon's earnings releases — the follow-up resolves from thread memory, with citation cards for every passage</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/cortexrag/cortex-chat-tenk.png"
          thumb="assets/img/portfolio/cortexrag/cortex-chat-tenk.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">10-K analysis thread — full-year 2024 figures answered strictly from the filing with inline [n] citations</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/cortexrag/cortex-documents.png"
          thumb="assets/img/portfolio/cortexrag/cortex-documents.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Documents manager — Amazon financial PDFs indexed into 160 chunks with per-file status</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/cortexrag/cortex-models.png"
          thumb="assets/img/portfolio/cortexrag/cortex-models.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Runtime model switcher — GPT, Claude, and Gemini options with per-provider availability; embeddings pinned read-only</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/cortexrag/cortex-evals.png"
          thumb="assets/img/portfolio/cortexrag/cortex-evals.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">LLM-as-judge evaluation report — 10 live-store examples graded on correctness, groundedness, relevance, and retrieval, with per-example judge comments</figcaption>
    </figure>

  </div>
</section>
