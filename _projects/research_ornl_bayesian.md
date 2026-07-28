---
layout: page
title: Unmeasured Spatial Risk in Disease Modeling <br> <em>A Topological Data Analysis Approach</em>
description: Oak Ridge National Laboratory & University of Tennessee, USA <br> Topological Data Analysis, Bayesian Hirachical Modeling, NUTS, PyMC
img: assets/img/projects/research_ornl_bayesian/research-card.png
permalink: /ornl-research-1/
importance: 1
category: Research
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="PhD Dissertation Research · Associated with Oak Ridge National Laboratory & University of Tennessee · USA"
    title="Unmeasured Spatial Risk in Disease Modeling"
    subtitle="A Topological Data Analysis Approach."
    meta="!Research,ORNL & UTK,United States"
    tech="Topological Data Analysis, Bayesian Hirachical Modeling, NUTS, PyMC"
%}

<div class="apple-overview">
  <p>
    <strong>Supervisor:</strong> <a href="https://www.ornl.gov/staff-profile/adam-t-spannaus" target="_blank">Dr. Adam Spannaus</a> (Research Scientist; Oak Ridge National Laboratory, USA)
  </p>
  <p>
    <strong>Additional Resources:</strong>
    <em>Paper (manuscript in preparation)</em> ·
    <a href="https://github.com/hashansl/spatial-risk-tda" target="_blank">Git Repository</a> ·
    <a href="/assets/pdf/research_ornl_bayesian/meeting.pdf" target="_blank">Presentation</a> ·
    <a href="/assets/pdf/research_ornl_bayesian/poster_ACM_Hashan.pdf" target="_blank">Poster</a> 
  </p>
</div>

<div class="apple-overview">
  <p>
    Bayesian spatial models are widely used in disease mapping to estimate area-level overdose risk from socioeconomic covariates such as poverty and unemployment. These models work well at small spatial units, where they stabilize risk estimates in data-sparse areas by smoothing toward local neighborhood averages. But at the regional level, large spatial units like counties, where risk can shift sharply between neighbors, that same smoothing becomes a drawback: standard models impose a uniform level of smoothness across the whole region, masking sharp transitions in risk and producing overly uncertain estimates.
  </p>
  <p>
    My research addresses this by introducing topological data analysis (TDA) into the disease-mapping pipeline. Using persistent homology, I extract topological summaries, statistics describing the shape of the data, such as how prominent and long-lived a cluster of high-poverty census tracts is, from finer-grained, subregional covariate data. I then integrate these summaries as a third component of the spatial random effect in a Bayesian hierarchical model (which I call BYM-T), alongside the usual structured (neighbor-dependent) and unstructured (localized noise) components. This gives the model region-specific structural information it previously had no way to access.
  </p>
  <p>
    I validated the approach on synthetic data and on real opioid-overdose mortality and social vulnerability data from West Virginia and Tennessee, using Bayesian inference via PyMC. <strong>The topology-integrated model matches the predictive accuracy of the standard approach while substantially reducing uncertainty in regional risk estimates</strong> and correctly identifying sharp risk transitions between neighboring counties that the standard model smooths away.
  </p>
</div>
