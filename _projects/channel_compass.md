---
layout: page
title: Channel Compass <br> <em>Multi-Agent YouTube Strategist</em>
img: assets/img/portfolio/channelcompass/channel-compass-card.png
permalink: /channel-compass/
importance: 3
category: Work Experience - AI Engineer
description: "AI Engineer (Mar 2026) <br> Claude Code, Vercel AI Gateway, MCP, Next.js"
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="AI content strategist for YouTube"
    title="Channel Compass"
    subtitle="An AI content strategist for YouTube creators that orchestrates specialist subagents to audit titles, thumbnails, metadata, engagement signals, and a synthesized SEO scorecard while streaming progress to the browser in real time."
    meta="!AI Engineer"
    tech="Claude Code,Claude Skills, Vercel AI Gateway, MCP, Vercel AI Gateway, Next.js, React"
%}

<div class="apple-overview">
  <p>
    <span class="lead-emphasis">Channel Compass</span> is a multi-agent YouTube SEO analysis platform built to show how agentic workflows can be made deterministic, observable, and product-ready. A creator enters a channel, starts an analysis run, and receives a structured report covering packaging, metadata, engagement, and prioritized improvements.
  </p>
  <p>
    I built the full Vercel-native stack: the Next.js frontend, typed API routes, durable workflow orchestration, Claude subagent definitions, dual-model routing through Vercel AI Gateway, and a standalone Model Context Protocol server wrapping the YouTube Data API.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="What I Built"
      title="Feature Highlights"
      lead="A complete analysis workflow from channel discovery to live progress updates and a five-section strategic report."
  %}

  <div class="apple-grid">

    <article class="apple-card">
      <span class="apple-icon">AI</span>
      <h3>Multi-Agent SEO Analysis</h3>
      <p>Five specialist subagents divide the audit into title SEO, thumbnail analysis, metadata optimization, engagement signals, and final scorecard synthesis. The first four run in parallel, so the workflow gets specialist depth without serial latency.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">LLM</span>
      <h3>Dual-Model Routing</h3>
      <p>Agents declare whether they need synthesis or extraction. The runner resolves those roles through <strong>Vercel AI Gateway</strong>, using <strong>Claude Opus 4.7</strong> for strategy-heavy reasoning and <strong>Gemini 2.5 Flash</strong> for lower-cost extraction tasks, with model swaps controlled by environment variables.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">WF</span>
      <h3>Durable Workflow Orchestration</h3>
      <p><strong>Vercel Workflow</strong> coordinates the run as deterministic TypeScript steps: fetch channel data, dispatch four specialists with <code>Promise.all</code>, synthesize the scorecard, then emit a finished event. The LLMs do the analysis, but the application owns the orchestration logic.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">SSE</span>
      <h3>Live Progress Stream</h3>
      <p>Each workflow step emits a typed event that is forwarded through a Next.js Server-Sent Events route. The report UI shows step status, preview snippets, and completion state while a 60-90 second run is still in progress.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">MCP</span>
      <h3>YouTube MCP Server</h3>
      <p>The YouTube Data API is encapsulated behind a standalone <strong>Model Context Protocol</strong> server with tools for channel resolution, recent video lists, bulk stats, comments, and channel search. Inputs are validated with <strong>Zod</strong>, keeping API access cleanly separated from agent prompts.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">SKL</span>
      <h3>Claude Code Skills</h3>
      <p>Implemented four standalone <strong>Claude Code Skills</strong> that can be used inside or outside the app: <strong>YouTube data fetching</strong>, <strong>comment mining</strong>, <strong>thumbnail feature extraction</strong>, and <strong>report rendering</strong>. Each skill has a focused instruction file and reusable workflow so the analysis logic can be packaged as developer-facing automation, not only as hidden application code.</p>
    </article>

  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Architecture"
      title="How it flows"
      lead="A typed event pipeline from browser request to durable workflow, specialist agents, tool calls, and final report rendering."
  %}

  <div class="apple-overview">
    <p>
      <strong>Browser SSE stream</strong> &rarr; <strong>Next.js App Router API routes</strong> &rarr; <strong>Vercel Workflow</strong> &rarr; <strong>Claude subagents</strong> &rarr; <strong>Vercel AI Gateway</strong> &rarr; <strong>YouTube MCP server</strong> &rarr; <strong>YouTube Data API v3</strong>
    </p>
    <p>
      The central design choice is that workflow dispatch stays deterministic. Channel Compass does not ask a planner model which agent to run next; the TypeScript workflow defines the phases, the allowed tools, the event types, and the final report contract.
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
    <span class="apple-tag">TypeScript 5.6 strict</span>
    <span class="apple-tag">Tailwind CSS 3</span>
    <span class="apple-tag">Vercel Fluid Compute</span>
    <span class="apple-tag">Vercel Workflow WDK 4.2</span>
    <span class="apple-tag">Vercel AI SDK 6</span>
    <span class="apple-tag">Vercel AI Gateway</span>
    <span class="apple-tag">Claude Opus 4.7</span>
    <span class="apple-tag">Gemini 2.5 Flash</span>
    <span class="apple-tag">Model Context Protocol</span>
    <span class="apple-tag">YouTube Data API v3</span>
    <span class="apple-tag">googleapis</span>
    <span class="apple-tag">Zod 4</span>
    <span class="apple-tag">pnpm workspaces 9.15</span>
    <span class="apple-tag">Node 22+</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Behind the Scenes"
      title="Challenges &amp; solutions"
      lead="Engineering decisions that keep the workflow reliable, observable, and practical to demo."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Orchestration"
        challenge_title="An LLM planner would make the analysis flow harder to test and debug."
        challenge_body="The product needs a predictable report shape every time: four specialist audits followed by one synthesis pass. Letting a model choose the workflow could skip steps, change ordering, or create inconsistent output contracts."
        solution_body="Kept orchestration in deterministic TypeScript using Vercel Workflow. Agents are stateless one-shot specialists with fixed prompts and scoped tool access, while the workflow owns dispatch, parallelism, event emission, and final result shape."
    %}
    {% include apple/cs_card.liquid
        label="Latency"
        challenge_title="Running every specialist sequentially would make the user wait for five full LLM turns."
        challenge_body="Title, thumbnail, metadata, and engagement analysis do not depend on each other, so serial execution would waste time while making the live report feel stalled."
        solution_body="Grouped the first four specialists into a parallel <code>Promise.all</code> phase, then passed their completed outputs into the SEO scorecard agent for the only sequential synthesis step."
    %}
    {% include apple/cs_card.liquid
        label="Live UI"
        challenge_title="A long-running analysis needs visibility while work is still happening."
        challenge_body="The workflow can take 60-90 seconds. A blank loading page would make it unclear whether agents were running, stuck, or finished."
        solution_body="Created typed <code>WorkflowEvent</code> messages and streamed them through a Next.js SSE route. The UI consumes those events in <code>ReportLive.tsx</code> to show per-step status and preview snippets."
    %}
    {% include apple/cs_card.liquid
        label="Model Strategy"
        challenge_title="Using the most expensive model for every task is unnecessary."
        challenge_body="Some steps need strategic synthesis and nuanced recommendations, while others mainly extract metrics or summarize structured fields from YouTube data."
        solution_body="Added model roles: synthesis agents route to Claude Opus 4.7 through AI Gateway, while extraction-heavy agents route to Gemini 2.5 Flash. Environment variables keep model selection swappable without changing agent code."
    %}
    {% include apple/cs_card.liquid
        label="Tool Boundary"
        challenge_title="Direct YouTube API calls inside agent logic would blur prompts, credentials, and data access."
        challenge_body="The agents need channel and video data, but tying that directly into each agent would make testing harder and duplicate API handling."
        solution_body="Wrapped YouTube access in a standalone MCP server with Zod-validated tools. The same tool boundary can be reused by the app, agents, or external MCP clients."
    %}
    {% include apple/cs_card.liquid
        label="Demo Reliability"
        challenge_title="Portfolio demos should not depend on live API quota or LLM credentials."
        challenge_body="YouTube quota, AI Gateway keys, and model availability can all fail independently, which is risky for UI development and portfolio review."
        solution_body="Implemented <code>DEMO_MODE</code> so the app can exercise the full frontend and report flow using hardcoded specialist outputs, while bypassing external API calls entirely."
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
          full="/assets/img/portfolio/channelcompass/channel-compass-card.png"
          thumb="assets/img/portfolio/channelcompass/channel-compass-card.png"
          loading="eager"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Channel Compass - Overview</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/channelcompass/channel-compass-report-overview.png"
          thumb="assets/img/portfolio/channelcompass/channel-compass-report-overview.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Live SEO Report</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/channelcompass/channel-compass-scorecard.png"
          thumb="assets/img/portfolio/channelcompass/channel-compass-scorecard.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">SEO Scorecard</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/channelcompass/channel-compass-title-seo.png"
          thumb="assets/img/portfolio/channelcompass/channel-compass-title-seo.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Title SEO Audit</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/channelcompass/channel-compass-thumbnail.png"
          thumb="assets/img/portfolio/channelcompass/channel-compass-thumbnail.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Thumbnail Analysis</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/channelcompass/channel-compass-metadata.png"
          thumb="assets/img/portfolio/channelcompass/channel-compass-metadata.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Metadata Audit</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/channelcompass/channel-compass-engagement.png"
          thumb="assets/img/portfolio/channelcompass/channel-compass-engagement.png"
          loading="lazy"
          category="screen captures"
      %}
      <figcaption class="apple-shot-caption">Engagement Signals</figcaption>
    </figure>

  </div>
</section>
