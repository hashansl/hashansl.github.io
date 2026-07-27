---
layout: page
title: A Geospatial Study of Opioid Overdose Risk <br> <em>Topological Data Analysis + Deep Learning</em>
img: assets/img/projects/research_tda_deeplearning/US_OD.png
permalink: /opioid-risk-tda/
importance: 1
category: Research
description: "Published Research (IJPDS 2024) <br> Topological Data Analysis, Persistence Images, SE-ResNet, PyTorch"
related_publications: true
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Oak Ridge National Laboratory & University of Tennessee · IPDLN 2024"
    title="A Geospatial Study of Opioid Overdose Risk in Diverse Regions"
    subtitle="Turning county-level socioeconomic data into topological shape descriptors, then classifying high-risk opioid overdose counties with a channel-attention deep learning model."
    meta="!Research,ORNL & UTK,United States"
    tech="Topological Data Analysis,Persistence Images,SE-ResNet,PyTorch,Adjacency Complexes"
%}

<div class="apple-overview">
  <p>
    <strong>Authors:</strong> Hashan Fernando, <a href="https://www.ornl.gov/staff-profile/adam-t-spannaus" target="_blank">Adam Spannaus</a>, Anuj J. Kapadia
  </p>
  <p>
    <strong>Additional Resources:</strong>
    <a href="https://ijpds.org/article/view/2700" target="_blank">Paper</a> ·
    <a href="https://github.com/hashansl/opioid-risk-conf-2024" target="_blank">Git Repository</a> ·
    <a href="/assets/ppt/research_tda_deeplearning/poster%201%20-%20Hashan_AS.pptx" target="_blank">Poster</a>
  </p>
</div>

<div class="apple-overview">
  <p>
    Predicting which counties are most at risk of opioid overdose usually means feeding socioeconomic factors — poverty, unemployment, disability — straight into a model as numbers. That approach throws away something important: <em>where</em> vulnerability is concentrated within a county matters as much as how much of it there is. Two counties can share the same average poverty rate while looking completely different on the ground — one with poverty clustered in a single hotspot, the other spread evenly across every census tract.
  </p>
  <p>
    This project uses Topological Data Analysis (TDA) {% cite feng2021persistent %} to capture exactly that shape information, then feeds it into a deep learning classifier. Each Social Vulnerability Index (SVI) variable for a county — poverty, unemployment, disability, and others — is converted into a "persistence image" that encodes how its high-risk census tracts cluster and connect geographically. Stacking these persistence images across variables gives each county a multi-channel topological fingerprint, which an SE-ResNet then learns to classify as high or low overdose risk. This work was published at the International Population Data Linkage Conference 2024 {% cite fernando2024geospatial %}.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Pipeline"
      title="From census tracts to a risk classification"
      lead="Four stages turn raw, subregional socioeconomic data into a single risk prediction per county."
  %}

  <div class="apple-grid">
    <article class="apple-card">
      <span class="apple-icon">01</span>
      <h3>Adjacency Complex</h3>
      <p>Census tracts within a county become nodes of a network, connected whenever they share a geographic border. Thresholding each SVI variable over this network builds a distinct topological structure per variable.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">02</span>
      <h3>Persistence Diagrams</h3>
      <p>Tracking the network as the threshold sweeps through the SVI variable's value range reveals which clusters of high-vulnerability tracts are real structure versus noise, recorded as birth/death pairs in a persistence diagram.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">03</span>
      <h3>Persistence Images</h3>
      <p>Persistence diagrams are multisets, not fixed-size vectors, so they can't feed a neural network directly. Each diagram is mapped onto a fixed birth-persistence grid and Gaussian-smoothed into a 2D image a CNN can consume.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">04</span>
      <h3>Multi-Channel Classification</h3>
      <p>Every county's per-variable persistence images are stacked into one multi-channel input. An SE-ResNet adaptively weighs each channel to classify the county as high- or low-overdose risk.</p>
    </article>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Model & Tools"
      title="Built with"
  %}

  <div class="apple-tag-grid">
    <span class="apple-tag">Topological Data Analysis</span>
    <span class="apple-tag">Persistent Homology</span>
    <span class="apple-tag">Adjacency Complexes</span>
    <span class="apple-tag">Persistence Images</span>
    <span class="apple-tag">SE-ResNet</span>
    <span class="apple-tag">PyTorch</span>
    <span class="apple-tag">CDC/ATSDR SVI Data</span>
    <span class="apple-tag">Geospatial Analysis</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Results"
      title="Three risk-strata models"
      lead="Separate classifiers were trained to flag counties in the top 5%, top 10%, and top 20% of overdose risk nationally."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Top 5% Threshold"
        challenge_title="Can the model flag the most extreme overdose-risk counties correctly?"
        challenge_body="Labeling the top 5% of counties nationally as high-risk creates a highly imbalanced classification problem."
        solution_body="90% test accuracy. The high-overdose class reached a 0.95 true positive rate with only a 0.18 false positive rate — the model is sharpest at the extremes."
    %}
    {% include apple/cs_card.liquid
        label="Top 10% Threshold"
        challenge_title="What happens as the risk boundary gets less extreme?"
        challenge_body="Widening the high-risk label to the top 10% of counties pulls more borderline cases into the classification."
        solution_body="75% test accuracy, with the low-overdose class holding a strong 0.93 true positive rate. The high-overdose class becomes harder to separate (TPR drops to 0.57) as the boundary loosens."
    %}
    {% include apple/cs_card.liquid
        label="Top 20% Threshold"
        challenge_title="Does the model still add value at a broader, noisier risk boundary?"
        challenge_body="At the top 20% threshold, nearly a fifth of all counties are labeled high-risk, and the class boundary is far less distinct."
        solution_body="65.74% test accuracy. Performance degrades as expected with a noisier label, but the low-overdose class still holds a 0.92 true positive rate — the model consistently identifies genuinely low-risk counties."
    %}
  </div>
</section>

<div class="apple-overview">
  <p>
    Planned next steps: adding a temporal component to forecast <em>future</em> high-risk counties rather than only classifying current ones, extracting a richer set of features from each persistence diagram, and exploring graph neural networks as an alternative to the image-based CNN approach.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Gallery"
      title="Figures"
  %}

  <div class="apple-gallery">
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_tda_deeplearning/US_OD.png" thumb="assets/img/projects/research_tda_deeplearning/US_OD.png" loading="eager" category="tda figures" %}
      <figcaption class="apple-shot-caption">Counties with High Opioid Overdose Rates Across the US</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_tda_deeplearning/single_2.jpg" thumb="assets/img/projects/research_tda_deeplearning/single_2.jpg" loading="lazy" category="tda figures" %}
      <figcaption class="apple-shot-caption">Adjacency Complex — Census Tracts Connected by Shared Borders</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_tda_deeplearning/Simplicial%20complex.drawio.png" thumb="assets/img/projects/research_tda_deeplearning/Simplicial%20complex.drawio.png" loading="lazy" category="tda figures" %}
      <figcaption class="apple-shot-caption">Simplicial Complexes Approximate the Shape of Data</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_tda_deeplearning/Data%20process.drawio.png" thumb="assets/img/projects/research_tda_deeplearning/Data%20process.drawio.png" loading="lazy" category="tda figures" %}
      <figcaption class="apple-shot-caption">Pipeline — Variable to Filtration to Persistence Diagram to Persistence Image</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_tda_deeplearning/Transformation.drawio.png" thumb="assets/img/projects/research_tda_deeplearning/Transformation.drawio.png" loading="lazy" category="tda figures" %}
      <figcaption class="apple-shot-caption">Transforming a Persistence Diagram into a Persistence Image</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_tda_deeplearning/EP_POV_36081_peristence_image.png" thumb="assets/img/projects/research_tda_deeplearning/EP_POV_36081_peristence_image.png" loading="lazy" category="tda figures" %}
      <figcaption class="apple-shot-caption">Poverty Persistence Image — Queens County, NY</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_tda_deeplearning/EP_UNEMP_36081_peristence_image.png" thumb="assets/img/projects/research_tda_deeplearning/EP_UNEMP_36081_peristence_image.png" loading="lazy" category="tda figures" %}
      <figcaption class="apple-shot-caption">Unemployment Persistence Image — Queens County, NY</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_tda_deeplearning/EP_DISABL_36081_peristence_image.png" thumb="assets/img/projects/research_tda_deeplearning/EP_DISABL_36081_peristence_image.png" loading="lazy" category="tda figures" %}
      <figcaption class="apple-shot-caption">Disability Persistence Image — Queens County, NY</figcaption>
    </figure>
  </div>
</section>
