---
layout: page
title: Identifying Spatiotemporal Patterns in Opioid Vulnerability <br> <em>A Spatial Kalman Filter Approach</em>
description: Oak Ridge National Laboratory & University of Tennessee, USA <br> Kalman Filtering, Spatiotemporal Modeling, Geospatial Analysis
img: assets/img/projects/research_ornl_kalman/research-card.png
permalink: /ornl-research-2/
importance: 1
category: Research
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Research · Published in BMC Public Health · Associated with Oak Ridge National Laboratory & University of Tennessee, TN, USA"
    title="Identifying Spatiotemporal Patterns in Opioid Vulnerability"
    subtitle="Investigating the links between disability, prescription opioids, and opioid-related mortality using a novel spatial Kalman filter."
    meta="!Research,ORNL & UTK,United States"
    tech="Kalman Filtering,Spatiotemporal Modeling,Geospatial Analysis,Python"
%}

<div class="apple-overview">
  <p>
    <strong>Authors:</strong> Andrew Deas (lead author), <a href="https://www.ornl.gov/staff-profile/adam-t-spannaus" target="_blank">Adam Spannaus</a>, <strong>Hashan Fernando</strong>, Heidi A. Hanson, Anuj J. Kapadia, Jodie Trafton, Vasileios Maroulas
  </p>
  <p>
    <strong>Additional Resources:</strong>
    <a href="https://doi.org/10.1186/s12889-025-23044-0" target="_blank">Paper</a> ·
    <a href="https://github.com/A-Deas/Hotspots" target="_blank">Git Repository</a>
  </p>
</div>

<div class="apple-overview">
  <p>
    The opioid crisis is a complex, evolving public health problem. National prescription rates have fallen sharply since 2011, yet overdose deaths have kept climbing — likely driven by the rise of illicit opioids — and certain subpopulations, such as disabled individuals, are known to face elevated risk. Understanding this at a national scale, county by county, across multiple related outcomes and years, calls for a model that can capture both sharp regional differences and how they shift over time.
  </p>
  <p>
    This project augments the classical Kalman filter with a spatial component. Geographic proximity is built directly into the filter's process covariance matrix using an exponential decay function based on the distance between county population centers, rather than simple adjacency, letting the model capture both broad regional structure and abrupt jumps between neighboring counties. We applied this spatial Kalman filter separately to three national, county-level datasets spanning 2014–2020 — opioid-related mortality, opioid prescription dispensing, and disability rank rates — generating year-by-year heat maps and identifying "hotspot" counties (the top 5% nationally) for each factor.
  </p>
  <p>
    The spatial Kalman filter achieved strong predictive accuracy across all three factors and consistently outperformed a standard, non-spatial Kalman filter. From 2014–2018, mortality, dispensing, and disability vulnerability profiles all consistently pointed to Appalachia as the nation's most vulnerable region. <strong>Starting in 2019, though, the dispensing-rate hotspots dissolved into a dispersed, chaotic pattern even as mortality kept rising</strong> — suggesting the region's opioid crisis shifted from being prescription-driven to being sustained largely by illicit drugs — while the persistent overlap between disability and mortality hotspots throughout the study period suggests the disabled subpopulation may face disproportionate opioid-related mortality risk.
  </p>
</div>
