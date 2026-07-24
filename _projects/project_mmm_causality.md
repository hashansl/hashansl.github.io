---
layout: page
title: Marketing Mix Modeling<br> <em>A Study of Confounding and Experimental Calibration</em>
img: assets/img/projects/marketingmixmodeling/mmm-card.png
permalink: /mmm-causality/
importance: 2
category: Projects
description: "Independent Research · July 2026 <br> Bayesian MMM, Causal Inference, PyMC-Marketing, Synthetic Data"
related_publications: true
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---


{% include apple/hero.liquid
    eyebrow="University of Tennessee Project · Summer 2026"
    title="Can We Trust Marketing ROI?"
    subtitle="A synthetic-data study testing whether observational Marketing Mix Modeling can recover true causal ROI — and what it takes to make it trustworthy when it can't."
    meta="!Independent Research,Causal Inference,Bayesian Modeling"
    tech="PyMC-Marketing,Bayesian MMM (NUTS),Python,Causal DAGs,Geo-Lift Test Calibration,Meta Robyn Dataset"
%}

<div class="apple-overview">
  <p>
    <strong>Supervisor:</strong> <a href="https://haslam.utk.edu/people/profile/russell-zaretzki/" target="_blank">Dr. Russell Zaretzki</a> (Heath Faculty Fellow, Business Analytics & Statistics; Haslam College of Business, UTK, USA)
  </p>
  <p>
    <strong>Additional Resources:</strong>
    <a href="https://github.com/hashansl/marketing-mix-modeling-causal-inference/blob/3eac97d1436e300f7839f367649204cf3a00b5d3/documents/Can%20We%20Trust%20Marketing%20ROI%3F.pdf" target="_blank">Document</a> ·
    <a href="https://github.com/hashansl/marketing-mix-modeling-causal-inference" target="_blank">Git Repository</a>
  </p>
</div>

<div class="apple-overview">
  <p>
    <span class="lead-emphasis">Marketing Mix Modeling (MMM)</span> is widely used to allocate media budgets, but it relies on observational data — leaving it vulnerable to confounding from organic demand, ad-targeting mechanisms, and macroeconomic trends. Measuring the true return on ad spend is a notoriously hard problem {% cite lewis2015unfavorable %}: randomized lift tests isolate the causal effect cleanly but are too expensive and slow to run continuously {% cite gordon2019comparison %}, while MMM evaluates all channels at once from historical data but faces well-documented identification challenges of its own {% cite chan2017challenges %}. This project asks a direct question: can an observational MMM be trusted to recover causal ROI, and if not, what does it actually take to make it trustworthy?
  </p>
  <p>
    I don't propose new estimation methodology here. The Bayesian MMM builds on classic market-response modeling {% cite hanssens2001market %} and Bayesian media-mix formulations with adstock and saturation effects {% cite jin2017bayesian %}; the backdoor-adjustment framework follows standard causal-DAG theory {% cite neuberg2003causality %} {% cite hernan2020causal %}; and the calibration-via-prior technique follows Zhang et al.'s approach to combining MMM with experimental lift tests {% cite zhang2024media %}. The contribution is empirical: using synthetic data with known ground truth, I show concretely when these established methods succeed, when they fail, and what it takes to correct them — then validate the same failure pattern on a real, public dataset.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Research Questions"
      title="Three questions, one synthetic dataset"
      lead="Because the ground-truth ROI is known by construction in synthetic data, estimation accuracy and bias can be measured directly rather than assumed."
  %}

  <div class="apple-grid">
    <article class="apple-card">
      <span class="apple-icon">01</span>
      <h3>Recovery</h3>
      <p>When the truth is known, do the model's posteriors actually cover the true ROI?</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">02</span>
      <h3>Confounding</h3>
      <p>How much does omitting a demand confounder bias ROI — and does adjusting for it fix the bias?</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">03</span>
      <h3>Calibration</h3>
      <p>Can an experimental lift estimate, injected as a prior, correct an MMM that observational data alone gets wrong?</p>
    </article>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Methodology"
      title="A four-stage experimental design"
      lead="Every stage keeps the same Bayesian model — priors, adstock, saturation, seasonality, and sampler settings — so differences in results come from the data and controls, not from changing the model."
  %}

  <div class="apple-grid">
    <article class="apple-card">
      <span class="apple-icon">01</span>
      <h3>Parameter Recovery</h3>
      <p>Fit a naive OLS, an oracle OLS with known transforms, and a full Bayesian MMM on clean synthetic data where spend is assigned independently of demand — the best-case scenario for any observational method.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">02</span>
      <h3>Confounding &amp; Backdoor Adjustment</h3>
      <p>Introduce a latent demand confounder that drives both spend and revenue. Fit the same model with the confounder uncontrolled (backdoor open) and controlled (backdoor closed), then compare.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">03</span>
      <h3>Experimental Calibration</h3>
      <p>Simulate a randomized geo-lift test {% cite sun2017geo %} on one channel and inject its ROI estimate as an informative prior, following Zhang et al.'s calibration approach {% cite zhang2024media %} — while leaving the demand confounder unmeasured and the backdoor open.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">04</span>
      <h3>Real-World Validation</h3>
      <p>Refit the Bayesian MMM on Meta's public Robyn dataset (208 weeks, five channels), with and without a competitor-sales control, to check whether the synthetic failure pattern replicates on real data.</p>
    </article>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Model &amp; Tools"
      title="Built with"
  %}

  <div class="apple-tag-grid">
    <span class="apple-tag">PyMC-Marketing v0.19.3</span>
    <span class="apple-tag">Bayesian NUTS Sampler</span>
    <span class="apple-tag">Geometric Adstock</span>
    <span class="apple-tag">Hill Saturation</span>
    <span class="apple-tag">Fourier Seasonality</span>
    <span class="apple-tag">DAG-Based Backdoor Adjustment</span>
    <span class="apple-tag">Geo-Lift Test Simulation</span>
    <span class="apple-tag">Synthetic Data Generation</span>
    <span class="apple-tag">Meta Robyn Dataset</span>
    <span class="apple-tag">Python</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Key Results"
      title="What each stage found"
      lead="Four stages, from the best-case scenario to a real, uncontrolled dataset."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Stage 1 — Recovery"
        challenge_title="Can a Bayesian MMM recover true ROI with no confounding at all?"
        challenge_body="Media spend was assigned independently of demand, so the backdoor path doesn't exist — the most favorable setting possible for an observational method."
        solution_body="Yes. Every channel's true ROI fell inside the model's 95% credible interval, with 94.2% of weeks inside the 90% predictive interval (predictive R² = 0.91). But low-spend channels like Email and Display carried very wide intervals: accurate coverage, low precision."
    %}
    {% include apple/cs_card.liquid
        label="Stage 2 — Confounding"
        challenge_title="How much does an unmeasured demand confounder distort ROI, and does adjustment fix it?"
        challenge_body="A latent demand signal was wired into both spend and revenue, opening a backdoor path. The model was fit with and without a control for it."
        solution_body="Search's ROI was overestimated by +2.74 with the backdoor open, dropping to +0.97 once adjusted — adjustment worked well here. Email was worse (+7.99 → +5.72) despite the weakest demand link; its bias was mostly pre-existing model weakness, not confounding, so adjustment alone couldn't fix it."
    %}
    {% include apple/cs_card.liquid
        label="Stage 3 — Calibration"
        challenge_title="Without an observable confounder to adjust for, can one experiment still correct the model?"
        challenge_body="A simulated geo-lift test on Search (ROI = 3.9 ± 0.4) was injected as an informative prior, with the demand confounder left unmeasured and the backdoor open the entire time."
        solution_body="Search's median ROI shrank from 6.57 (naive) to 4.35 (calibrated), with the credible interval tightening to [3.37, 5.36]. The fix was channel-specific though — Email, left uncalibrated, stayed inflated at 11.66."
    %}
    {% include apple/cs_card.liquid
        label="Stage 4 — Real-World Validation"
        challenge_title="Does the same confounding pattern show up outside synthetic data?"
        challenge_body="The Bayesian MMM was refit on Meta's public Robyn dataset (208 weeks, five channels), once with a competitor-sales control and once without it."
        solution_body="Dropping the confounder inflated Search ROI by +73.3% and Facebook by +32.6%, while upper-funnel channels like TV and Print moved the opposite direction — the exact signature seen in the synthetic experiment, confirmed without ever knowing the real ground truth."
    %}
  </div>
</section>

<div class="apple-overview">
  <p>
    Navigating real-world deployment requires a unified approach: combining observational MMM with randomized lift testing to get causally robust ROI estimates. Neither approach alone is enough — observational data is scalable but confounded, and experiments are unbiased but too expensive to run for every channel.
  </p>
</div>

<!-- <section class="apple-section" id="walkthrough">
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
</script> -->

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Gallery"
      title="Figures-Results"
  %}

  <div class="apple-gallery">
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/marketingmixmodeling/mmm_confounding_demand_search.png" thumb="assets/img/projects/marketingmixmodeling/mmm_confounding_demand_search.png" loading="eager" category="mmm figures" %}
      <figcaption class="apple-shot-caption">Confounding Mechanism — Search Spend vs. Hidden Demand (z)</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="assets/img/projects/marketingmixmodeling/mmm_revenue_clean_vs_confounded.png" thumb="assets/img/projects/marketingmixmodeling/mmm_revenue_clean_vs_confounded.png" loading="lazy" category="mmm figures" %}
      <figcaption class="apple-shot-caption">Clean vs. Confounded Revenue — Effect of the Hidden Demand Signal</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/marketingmixmodeling/mmm-calibration_search.png" thumb="assets/img/projects/marketingmixmodeling/mmm-calibration_search.png" loading="lazy" category="mmm figures" %}
      <figcaption class="apple-shot-caption">Calibration Search — Closing the Backdoor with Experimental Lift Tests</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/marketingmixmodeling/mmm-robyn_omitted_confounder.png" thumb="assets/img/projects/marketingmixmodeling/mmm-robyn_omitted_confounder.png" loading="lazy" category="mmm figures" %}
      <figcaption class="apple-shot-caption">Omitted Confounder Bias in Robyn — With vs. Without Competitor Spend</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/marketingmixmodeling/mmm-confounding_bias.png" thumb="assets/img/projects/marketingmixmodeling/mmm-confounding_bias.png" loading="lazy" category="mmm figures" %}
      <figcaption class="apple-shot-caption">Confounding Bias — True vs. Naive vs. Adjusted ROI by Channel</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/marketingmixmodeling/mmm-robyn_roi_table.png" thumb="assets/img/projects/marketingmixmodeling/mmm-robyn_roi_table.png" loading="lazy" category="mmm figures" %}
      <figcaption class="apple-shot-caption">Robyn ROI by Channel (Posterior Median + 95% CI)</figcaption>
    </figure>

  </div>
</section>
