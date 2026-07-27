---
layout: page
title: Spatial-TDA <br> <em>A Python Package for Geospatial Topological Data Analysis</em>
img: assets/img/projects/project_spatial_tda/logo.png
permalink: /spatial-tda/
importance: 4
category: Projects
description: "Open-Source Python Package <br> PyPI, conda-forge, GeoPandas, Gudhi, Persistent Homology"
related_publications: false
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Open-Source Python Package · MIT License"
    title="Spatial-TDA"
    subtitle="A Python package for extracting topological information from spatial data — adjacency detection, simplicial complex construction, and persistent homology, built on GeoPandas, Gudhi, and Matplotlib."
    meta="!Open-Source,PyPI & conda-forge,Python"
    tech="GeoPandas,Gudhi,Matplotlib,Persistent Homology,Simplicial Complexes"
%}

<div class="apple-overview">
  <p>
    <strong>Additional Resources:</strong>
    <a href="https://hashansl.github.io/spatial-tda/" target="_blank">Documentation</a> ·
    <a href="https://github.com/hashansl/spatial-tda" target="_blank">Git Repository</a> ·
    <a href="https://pypi.org/project/spatial-tda" target="_blank">PyPI</a> ·
    <a href="https://anaconda.org/conda-forge/spatial-tda" target="_blank">conda-forge</a>
  </p>
</div>

<div class="apple-overview">
  <p>
    Every research project I've done on geospatial disease risk — from the BYM-T Bayesian spatial model to the opioid overdose risk classifier — needed the same underlying machinery: turn a map of regions into a network based on adjacency, build a simplicial complex from that network, and compute persistent homology to extract topological summaries. I kept rewriting that pipeline from scratch for each project, so I packaged it into a reusable, general-purpose library instead.
  </p>
  <p>
    <strong>Spatial-TDA</strong> extracts topological information from spatial data with minimal code. It handles threshold-based filtering, builds adjacency relationships between regions using Queen contiguity, constructs adjacency simplicial complexes for both filtering-up and filtering-down directions, and computes persistence diagrams and topological summaries — all while preserving the geometric properties and CRS of the original geospatial data. It's built for epidemiology, environmental studies, urban planning, and regional connectivity analysis, and it's published on both PyPI and conda-forge.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Installation"
      title="Get started in one line"
  %}

```bash
pip install spatial-tda
```

</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Key Features"
      title="What the package does"
      lead="The AdjacencySimplex class and compute_persistence function cover the full pipeline from raw geospatial data to topological summaries."
  %}

  <div class="apple-grid">
    <article class="apple-card">
      <span class="apple-icon">01</span>
      <h3>Geospatial Filtering</h3>
      <p>Threshold-based filtering lets users focus on specific data ranges, while the framework maintains each region's geometric properties and coordinate reference system throughout.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">02</span>
      <h3>Adjacency &amp; Simplicial Complexes</h3>
      <p>Adjacency is computed with Queen contiguity — regions are neighbors if they share at least one vertex — then used to build adjacency simplicial complexes for both filtering-up and filtering-down analysis.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">03</span>
      <h3>Persistent Homology</h3>
      <p>Builds a Simplex Tree with Gudhi, assigns filtration values from the chosen variable, and computes dimension-zero summaries: Total Lifespan, Average Lifespan, Total Mid-Lifespan, and Average Mid-Lifespan.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">04</span>
      <h3>Efficient by Design</h3>
      <p>Adjacency computations are optimized for large datasets, integrate directly with Pandas, GeoPandas, and Gudhi, and support dynamic selection of any numerical attribute for filtering and sorting.</p>
    </article>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Built With"
      title="Tools & Stack"
  %}

  <div class="apple-tag-grid">
    <span class="apple-tag">Python</span>
    <span class="apple-tag">GeoPandas</span>
    <span class="apple-tag">Gudhi</span>
    <span class="apple-tag">Matplotlib</span>
    <span class="apple-tag">Pandas</span>
    <span class="apple-tag">Queen Contiguity</span>
    <span class="apple-tag">PyPI</span>
    <span class="apple-tag">conda-forge</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Applications"
      title="Where this is used"
  %}

  <div class="apple-tag-grid">
    <span class="apple-tag">Epidemiology</span>
    <span class="apple-tag">Environmental Studies</span>
    <span class="apple-tag">Urban Planning</span>
    <span class="apple-tag">Regional Connectivity Analysis</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Demo"
      title="Adjacency simplex construction"
      lead="Filtering down on the poverty (EP_POV) variable — the simplicial complex grows as the filtration threshold sweeps through the data."
  %}

  <div class="apple-gallery">
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_spatial_tda/adj_simplex_EP_POV_down.gif" thumb="assets/img/projects/project_spatial_tda/adj_simplex_EP_POV_down.gif" loading="lazy" category="spatial-tda demo" %}
      <figcaption class="apple-shot-caption">Adjacency Simplicial Complex — Filtering Down on Poverty (EP_POV)</figcaption>
    </figure>
  </div>
</section>
