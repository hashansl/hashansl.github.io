---
layout: page
title: Agency Copilot <br> <em>AI Copilot for Marketing Agencies</em>
img: assets/img/portfolio/agencycopilot/agency-copilot-card.png
permalink: /agency-copilot/
importance: 4
category: Work Experience - AI Engineer
description: "AI Engineer (Jun 2026) <br> Codex CLI, Next.js 16, Supabase, Clerk"
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="AI copilot for performance agencies"
    title="Agency Copilot"
    subtitle="A full-stack AI platform for performance marketing agencies that turns multi-platform paid-media data from CSV uploads or platform APIs into deterministic KPI analysis, editable client-ready narratives, white-labeled PDFs, and account QA audits."
    meta="!AI Engineer,Agency Reporting,Performance Marketing"
    tech="Next.js 16,React 19,TypeScript,Supabase,Clerk,Codex CLI,Tiptap,React-PDF,PapaParse,Vitest"
%}

<div class="apple-overview">
  <p>
    <span class="lead-emphasis">Agency Copilot</span> is a web application built for small-to-mid performance marketing agencies that still spend hours translating ad-platform data into weekly client reports. It supports CSV uploads for MVP/onboarding workflows and API-based imports for connected ad accounts across multiple paid-media platforms, including Meta Ads, Google Ads, and other campaign channels, then carries the reporting workflow through analysis, AI narrative generation, in-browser editing, PDF export, and archived report review.
  </p>
  <p>
    I built the MVP around one core accuracy rule: all numbers are computed deterministically in TypeScript before reaching the LLM. The LLM receives structured facts and writes the client-facing explanation, but it never performs arithmetic or invents campaign metrics from raw CSV rows.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="What I Built"
      title="Feature Highlights"
      lead="An end-to-end agency workflow for converting raw paid-media exports into polished reports and account health checks."
  %}

  <div class="apple-grid">

    <article class="apple-card">
      <span class="apple-icon">DATA</span>
      <h3>CSV &amp; API Data Import</h3>
      <p>Implemented browser-side CSV ingestion with <strong>PapaParse</strong> plus an import architecture for connected paid-media APIs. Meta Ads and Google Ads are supported as primary sources, while the normalized data model is designed to extend to other campaign platforms through the same ingestion path.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">TS</span>
      <h3>Deterministic Analysis Engine</h3>
      <p>Built a TypeScript analysis pipeline that computes current and prior KPI snapshots, period-over-period deltas, spend-weighted top and bottom campaign movers, and anomaly flags for spend shifts, CPA drift, ROAS drift, and CTR drops.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">LLM</span>
      <h3>AI Narrative Generation</h3>
      <p>Structured prompts pass only pre-computed <code>AnalysisFacts</code> into <strong>Codex CLI</strong>, then stream the generated client narrative back into the report view. Tone can be regenerated as professional, friendly, or executive without re-uploading the CSV.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">TXT</span>
      <h3>Editable Report Workspace</h3>
      <p>Report drafts render inside a <strong>Tiptap</strong> rich-text editor with auto-save, metric cards, ROAS comparison charts, anomaly flags, and campaign mover context so an account manager can review, edit, and finalize the message in one screen.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">PDF</span>
      <h3>White-Labeled PDF Export</h3>
      <p>Added server-side PDF generation with <strong>@react-pdf/renderer</strong>, carrying the report narrative, client name, reporting period, and computed KPI cards into a shareable client deliverable.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">QA</span>
      <h3>Account QA Auditor</h3>
      <p>Built a second module that runs deterministic account-health checks across hygiene, efficiency, data quality, and pacing, then produces a 0-100 score, severity counts, prioritized findings, and an optional LLM-written summary.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">DB</span>
      <h3>Workspace Data Model</h3>
      <p>Designed Supabase tables and typed access functions for workspaces, workspace users, clients, voice profiles, reports, and audits. Every protected request resolves workspace context through Clerk before reading or writing data.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">UX</span>
      <h3>Agency Operating Surface</h3>
      <p>Implemented the authenticated app shell with dashboard, import, reports, QA auditor, clients, and settings pages, giving agencies a repeatable operating workflow rather than a single one-off generation form.</p>
    </article>

  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Architecture"
      title="How it flows"
      lead="A controlled path from CSV or API ad data to deterministic facts, generated narrative, editable draft, and exported deliverable."
  %}

  <div class="apple-overview">
    <p>
      <strong>CSV upload or Ads API import</strong> &rarr; <strong>schema detection</strong> &rarr; <strong>normalized rows</strong> &rarr; <strong>TypeScript analysis engine</strong> &rarr; <strong>AnalysisFacts JSON</strong> &rarr; <strong>Codex CLI narrative prompt</strong> &rarr; <strong>Tiptap editor</strong> &rarr; <strong>React-PDF export</strong>
    </p>
    <p>
      The key boundary is the handoff into the LLM. The application computes facts first, stores them with the report, and only then asks the model to explain performance in a client-friendly voice. This keeps generated language useful without making the model responsible for financial math.
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
    <span class="apple-tag">shadcn/ui</span>
    <span class="apple-tag">Supabase Postgres</span>
    <span class="apple-tag">Clerk Auth</span>
    <span class="apple-tag">Codex CLI</span>
    <span class="apple-tag">PapaParse</span>
    <span class="apple-tag">Tiptap</span>
    <span class="apple-tag">@react-pdf/renderer</span>
    <span class="apple-tag">Recharts</span>
    <span class="apple-tag">Zod</span>
    <span class="apple-tag">Vitest</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Behind the Scenes"
      title="Challenges &amp; solutions"
      lead="Engineering decisions that keep the product useful for real agency reporting workflows."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Accuracy"
        challenge_title="A client report cannot let an LLM calculate or hallucinate paid-media numbers."
        challenge_body="The product promise depends on trust. If the AI changes spend, ROAS, CPA, or CTR while writing the report, the account manager still has to manually verify every sentence."
        solution_body="Kept all arithmetic in TypeScript. CSV rows are normalized, metrics and deltas are computed deterministically, and the prompt receives a compact <code>AnalysisFacts</code> object. The model narrates facts; it does not calculate them."
    %}
    {% include apple/cs_card.liquid
        label="Data Variance"
        challenge_title="CSV exports and platform APIs expose ad metrics with different shapes and conventions."
        challenge_body="The product needs to accept both manual CSV uploads and connected-account API imports without making the user map columns or reconcile platform-specific metric names by hand."
        solution_body="Built schema detection and normalization helpers that identify platform-specific fields, convert rows into a shared <code>NormalisedRow</code> type, infer the reporting period, and surface row/campaign counts before analysis starts."
    %}
    {% include apple/cs_card.liquid
        label="Narrative UX"
        challenge_title="A generated report is rarely final on the first pass."
        challenge_body="Account managers need to adjust phrasing, soften client-sensitive language, and regenerate tone without losing the computed analysis context."
        solution_body="Used Tiptap for an in-browser editor with auto-save, tone selection, regeneration, metric cards, and anomaly context on the same page, so the generated draft becomes an editable workspace instead of a disposable text blob."
    %}
    {% include apple/cs_card.liquid
        label="Second Module"
        challenge_title="The same imported data should support more than a weekly narrative report."
        challenge_body="Agencies also need operational QA: budget pacing, tracking gaps, inefficient spend, and hygiene checks that are actionable before the next client call."
        solution_body="Added a QA auditor pipeline with deterministic checks and category scores. It reuses the shared import and normalization layer, then stores a structured audit report with severity-ranked findings and optional AI summary generation."
    %}
    {% include apple/cs_card.liquid
        label="Multi-Tenancy"
        challenge_title="Reports, clients, settings, and audits must stay scoped to the signed-in agency workspace."
        challenge_body="A reporting platform handles client performance data, so every API route needs a consistent workspace boundary instead of trusting IDs from the browser."
        solution_body="Resolved workspace identity server-side through Clerk on protected requests, then routed reads and writes through typed Supabase helpers. The import payload includes a placeholder workspace ID, but the server uses authenticated workspace context."
    %}
    {% include apple/cs_card.liquid
        label="Testing"
        challenge_title="CSV parsing and audit scoring are easy to regress as more checks are added."
        challenge_body="Small formula changes can silently alter report metrics, anomaly thresholds, or account-health scores."
        solution_body="Covered the analysis and audit modules with focused <strong>Vitest</strong> tests for metrics, deltas, movers, overview aggregation, hygiene, efficiency, data quality, pacing, and final scoring behavior."
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
          full="/assets/img/portfolio/agencycopilot/agency-copilot-card.png"
          thumb="assets/img/portfolio/agencycopilot/agency-copilot-card.png"
          loading="eager"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Agency Copilot - Overview</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/agencycopilot/agency-copilot-import.png"
          thumb="assets/img/portfolio/agencycopilot/agency-copilot-import.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">CSV Import Flow</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/agencycopilot/agency-copilot-report.png"
          thumb="assets/img/portfolio/agencycopilot/agency-copilot-report.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Editable Performance Report</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/agencycopilot/agency-copilot-audit.png"
          thumb="assets/img/portfolio/agencycopilot/agency-copilot-audit.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">QA Audit Results</figcaption>
    </figure>

  </div>
</section>
