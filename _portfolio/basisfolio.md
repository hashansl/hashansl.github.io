---
layout: page
title: Basisfolio <br> <em>AI Market Intelligence Platform</em>
img: assets/img/portfolio/basisfolio/basisfolio-card.png
permalink: /basisfolio/
importance: 1
category: Work Experience - AI Engineer
description: "AI Engineer (Nov 2025 - Present) <br> Next.js 16, React 19, Prisma 7, PostgreSQL, LangGraph, Codex CLI"
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Client Project - Jan 2026 - Present"
    title="Basisfolio"
    subtitle="A full-stack AI workspace for stock market investors, combining live market data, portfolio accounting, report research, AI suggestions, an AI advisor, central bank updates, dividends, news, risk monitoring, and company intelligence in one authenticated product."
    meta="!Full-Stack AI Engineer,Basisfolio,Web Platform"
    tech="Next.js 16,React 19,PostgreSQL,Prisma 7,NextAuth,LangGraph,Trigger.dev,Codex CLI,Gemini API,Anthropic API"
%}

<div class="apple-overview">
  <p>
    <span class="lead-emphasis">Basisfolio</span> is a private investment workspace for retail investors who manage a stock market portfolio. The product has moved beyond a simple holdings tracker into a full daily decision system: monitor the market, understand portfolio exposure, review companies, track dividends, read central bank updates, follow material news, and ask an AI advisor questions against the user's own portfolio context.
  </p>
  <p>
    I designed and built the application end to end. That includes market and central bank data ingestion, the portfolio and realized P&amp;L engine, company profile pages, AI verdict generation, Codex-powered PDF research, report analysis with cited financial metrics, a conversational advisor with memory, watchlist and notification workflows, news and dividend sync jobs, settings, usage tracking, and the responsive dashboard UI.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Product Scope"
      title="From tracker to investor operating system"
      lead="The latest version is organized around the actual investor workflow: market scan, portfolio review, company research, AI support, and follow-up monitoring."
  %}

  <div class="apple-grid">
    <article class="apple-card">
      <span class="apple-icon">01</span>
      <h3>Daily Market Command Center</h3>
      <p>The dashboard blends local market status with benchmark indices, world market indices, top gainers, top losers, most-active counters, and notification badges so the user can start from a single morning market view.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">02</span>
      <h3>Portfolio Accounting Layer</h3>
      <p>Holdings are not just stored as symbols and quantities. The app calculates break-even sell price, live market value, unrealized gain, today's gain, sector weights, realized P&amp;L, transaction charges, and concentration risk from the same portfolio data model.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">03</span>
      <h3>Research and Report Intelligence</h3>
      <p>The research area supports longer PDF analysis jobs, while the report analyzer extracts structured financial metrics, thesis, risk, valuation bands, business overview, segment data, and exportable report views from annual or quarterly PDFs.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">04</span>
      <h3>AI Assistance Across the App</h3>
      <p>AI is integrated into trade suggestions, report analysis, news summarization, and the advisor chat. The advisor can use portfolio context, report outputs, watchlist data, conversation history, model selection, and stored memories rather than answering in isolation.</p>
    </article>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="What I Built"
      title="Feature Highlights"
      lead="The current app has seventeen authenticated screens covering market monitoring, portfolio operations, research, news, risk, settings, and AI workflows."
  %}

  <div class="apple-grid">
    <article class="apple-card">
      <span class="apple-icon">01</span>
      <h3>Market Dashboard &amp; Portfolio Analytics</h3>
      <p>Live benchmark index tracking, world market snapshots, top gainers and losers, most-active counters, portfolio market value, unrealized P&amp;L, today's gain, break-even sell price, sortable holdings, bulk CSV import, and dedicated diversification screens.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">02</span>
      <h3>AI Suggestions &amp; Technical Analysis</h3>
      <p>Composite BUY/HOLD/SELL technical signals from RSI, SMA, MACD, ATR, and volume Z-score, paired with cached AI swing and long-term verdicts. Verdicts include confidence, reasoning bullets, invalidation conditions, generation history, and a rerun path.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">03</span>
      <h3>AI Advisor Chat</h3>
      <p>A persistent chat workspace for asking questions about exposure, report findings, market outlook, and individual holdings. The advisor includes model selection, session history, portfolio context, conversation summarization, and durable memory extraction.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">04</span>
      <h3>Reports &amp; Research Automation</h3>
      <p>Two analysis paths: an in-app financial report analyzer with cited metrics and a Codex CLI based research workflow for longer PDF jobs. Results are persisted as searchable report cards with thesis, conviction, score, sector, markdown output, and PDF export options.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">05</span>
      <h3>News, Dividends, Central Bank &amp; Notifications</h3>
      <p>Aggregates market announcements and financial news, links headlines to portfolio and watchlist symbols, tracks dividend events, surfaces central bank feeds, and raises notification badges for portfolio or watchlist events that deserve attention.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">06</span>
      <h3>Companies, Risk, Watchlist &amp; Wiki</h3>
      <p>Company directory and detail pages combine profile data, quotes, charts, dividends, news, filings, and report outputs. The app also includes realized P&amp;L, risk analysis, categorized watchlists, settings, AI usage tracking, and an internal wiki.</p>
    </article>
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
    <span class="apple-tag">Tailwind CSS v4</span>
    <span class="apple-tag">shadcn/ui + base-ui</span>
    <span class="apple-tag">NextAuth v5</span>
    <span class="apple-tag">Prisma 7 + adapter-pg</span>
    <span class="apple-tag">Neon PostgreSQL</span>
    <span class="apple-tag">Recharts</span>
    <span class="apple-tag">LangGraph</span>
    <span class="apple-tag">Trigger.dev</span>
    <span class="apple-tag">Codex CLI local analysis</span>
    <span class="apple-tag">Anthropic SDK</span>
    <span class="apple-tag">Google Gemini API</span>
    <span class="apple-tag">Vercel Blob</span>
    <span class="apple-tag">p-queue rate limiting</span>
    <span class="apple-tag">RSS parsing</span>
    <span class="apple-tag">string-similarity-js</span>
    <span class="apple-tag">node-cron</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Behind the Scenes"
      title="Challenges &amp; solutions"
      lead="Technical problems specific to live market data, serverless execution, AI workflows, and a fast-moving product surface."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Edge Runtime"
        challenge_title="NextAuth v5 middleware failed when Node-only Prisma and bcrypt code reached the Edge runtime."
        challenge_body="The auth guard needed to run at the routing layer, but Prisma, pg, and bcryptjs cannot be imported into Edge middleware."
        solution_body="Split authentication into an edge-safe auth.config.ts for middleware and a full Node auth.ts for credentials validation, password hashing, Google account linking, and database-backed session context."
    %}
    {% include apple/cs_card.liquid
        label="Market API Limits"
        challenge_title="Portfolio enrichment and quote lookups could overload undocumented market data endpoints."
        challenge_body="Fetching live prices, analysis data, announcements, and quote metadata in parallel caused 429s and stale responses."
        solution_body="Centralized market data calls behind a p-queue singleton with low concurrency, minimum intervals, and market-hours-aware TTL caching shared across server-side requests."
    %}
    {% include apple/cs_card.liquid
        label="AI Report Workflows"
        challenge_title="Large annual reports did not fit neatly into short serverless request/response cycles."
        challenge_body="Long PDFs can exceed payload, duration, and model-context limits, especially when the output needs cited financial metrics and full research commentary."
        solution_body="Built two paths: direct in-app analysis for normal reports, and a Trigger.dev/Codex CLI research queue for heavier asynchronous analysis. Results are persisted and rehydrated into the UI."
    %}
    {% include apple/cs_card.liquid
        label="Advisor Memory"
        challenge_title="A useful portfolio advisor needs context without sending unlimited chat history every turn."
        challenge_body="Conversation history, holdings, risk metrics, reports, and durable user preferences all compete for model context."
        solution_body="Added conversation summarization, durable memory extraction, and a portfolio-context builder so each answer receives relevant holdings, watchlist, reports, and prior intent without replaying the entire account history."
    %}
    {% include apple/cs_card.liquid
        label="Async Research"
        challenge_title="Research PDFs can take minutes to analyse and should not block the interactive UI."
        challenge_body="A synchronous request would be fragile for long PDF processing, especially when the analysis runs through a local Codex CLI workflow and later needs to appear in the user's research library."
        solution_body="Added a research queue backed by Trigger.dev metadata and persisted ResearchReport records, with status tracking for pending, running, complete, and failed jobs."
    %}
    {% include apple/cs_card.liquid
        label="Market Matching"
        challenge_title="News headlines and company announcements rarely use clean ticker symbols."
        challenge_body="Market articles often mention company names, abbreviated names, or PDF announcement titles rather than exchange tickers."
        solution_body="Built a symbol-linking layer that compares tickers and company names, stores confidence scores, and powers portfolio/watchlist filters, notification badges, and company detail pages."
    %}
  </div>
</section>

<section class="apple-section" id="walkthrough">
  {% include apple/section_head.liquid
      eyebrow="Product Walkthrough"
      title="See Basisfolio in action"
      lead="A short walkthrough of the AI-powered market dashboard, portfolio analytics, and AI advisor working together in the live app."
  %}

  <div class="apple-video-frame">
    {% include video.liquid
        path="assets/video/basisfolio-product-film.mp4"
        class="apple-video"
        poster="/assets/img/portfolio/basisfolio/basisfolio-dashboard.png"
        controls=true
        muted=true
        loop=true
        title="Basisfolio AI-powered financial full-stack agent demo"
    %}
  </div>

  <div class="apple-video-actions">
    <button type="button"
            class="apple-share-btn"
            data-share-url="{{ '/assets/video/basisfolio-product-film.mp4' | absolute_url }}"
            data-share-title="Basisfolio — AI Market Intelligence Platform demo"
            aria-label="Share this video as a link">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
        <circle cx="18" cy="5" r="3"></circle>
        <circle cx="6" cy="12" r="3"></circle>
        <circle cx="18" cy="19" r="3"></circle>
        <line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line>
        <line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line>
      </svg>
      <span class="apple-share-label">Share video</span>
    </button>
  </div>
</section>

<script>
  (function () {
    document.querySelectorAll('.apple-share-btn').forEach(function (btn) {
      btn.addEventListener('click', function () {
        var url = btn.getAttribute('data-share-url');
        var title = btn.getAttribute('data-share-title') || document.title;
        var label = btn.querySelector('.apple-share-label');
        var original = label ? label.textContent : '';

        function flash(msg) {
          if (!label) return;
          label.textContent = msg;
          setTimeout(function () { label.textContent = original; }, 2000);
        }

        if (navigator.share) {
          navigator.share({ title: title, text: title, url: url }).catch(function (err) {
            if (err && err.name === 'AbortError') return;
            copyLink();
          });
          return;
        }
        copyLink();

        function copyLink() {
          if (navigator.clipboard && navigator.clipboard.writeText) {
            navigator.clipboard.writeText(url).then(function () {
              flash('Link copied');
            }).catch(function () {
              window.prompt('Copy this link:', url);
            });
          } else {
            window.prompt('Copy this link:', url);
          }
        }
      });
    });
  })();
</script>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Gallery"
      title="Screen Captures"
  %}

  <div class="apple-gallery">
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-card.png" thumb="assets/img/portfolio/basisfolio/basisfolio-card.png" loading="eager" category="screen captures" %}
      <figcaption class="apple-shot-caption">Basisfolio — Overview</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-dashboard.png" thumb="assets/img/portfolio/basisfolio/basisfolio-dashboard.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Dashboard and Market Overview</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-portfolio.png" thumb="assets/img/portfolio/basisfolio/basisfolio-portfolio.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Portfolio Holdings</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-diversification.png" thumb="assets/img/portfolio/basisfolio/basisfolio-diversification.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Diversification</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-companies.png" thumb="assets/img/portfolio/basisfolio/basisfolio-companies.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Companies Directory</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-company-profile.png" thumb="assets/img/portfolio/basisfolio/basisfolio-company-profile.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Company Profile</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-realized-pnl.png" thumb="assets/img/portfolio/basisfolio/basisfolio-realized-pnl.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Realized P&amp;L</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-analysis.png" thumb="assets/img/portfolio/basisfolio/basisfolio-analysis.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Technical Analysis</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-ai-suggestions.png" thumb="assets/img/portfolio/basisfolio/basisfolio-ai-suggestions.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">AI Suggestions</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-ai-advisor.png" thumb="assets/img/portfolio/basisfolio/basisfolio-ai-advisor.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">AI Advisor</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-research.png" thumb="assets/img/portfolio/basisfolio/basisfolio-research.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Research Workflow</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-report.png" thumb="assets/img/portfolio/basisfolio/basisfolio-report.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Generated Research Report</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-reports.png" thumb="assets/img/portfolio/basisfolio/basisfolio-reports.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Report Analyzer</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-dividends.png" thumb="assets/img/portfolio/basisfolio/basisfolio-dividends.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Dividends Calendar</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-news.png" thumb="assets/img/portfolio/basisfolio/basisfolio-news.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">News Intelligence</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-cbsl.png" thumb="assets/img/portfolio/basisfolio/basisfolio-cbsl.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Central Bank Updates</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-risk.png" thumb="assets/img/portfolio/basisfolio/basisfolio-risk.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Risk Analysis</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-watchlist.png" thumb="assets/img/portfolio/basisfolio/basisfolio-watchlist.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Watchlist</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-wiki.png" thumb="assets/img/portfolio/basisfolio/basisfolio-wiki.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Wiki</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/basisfolio/basisfolio-settings.png" thumb="assets/img/portfolio/basisfolio/basisfolio-settings.png" loading="lazy" category="screen captures" %}
      <figcaption class="apple-shot-caption">Settings and AI Usage</figcaption>
    </figure>
  </div>
</section>
