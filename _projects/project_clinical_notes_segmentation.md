---
layout: page
title: Segmenting and Classifying Clinical Notes <br> <em>NLP + Topological Data Analysis on MIMIC-III</em>
img: assets/img/projects/project_clinical_notes_segmentation/embedding_1.png
permalink: /clinical-notes-segmentation/
importance: 3
category: Projects
description: "Data Engineering Course Project (UTK) <br> BioClinicalBERT, Doc2Vec, TF-IDF, Mapper (TDA), Hierarchical Clustering"
related_publications: false
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Data Engineering (COSC 526) · University of Tennessee, Knoxville"
    title="Segmenting and Classifying Clinical Notes"
    subtitle="Turning 2.3 million unstructured MIMIC-III note segments into a labeled dataset, then classifying and clustering them with document embeddings and Topological Data Analysis."
    meta="!Data Engineering,University of Tennessee,United States"
    tech="BioClinicalBERT,Doc2Vec,TF-IDF,Mapper (TDA),Hierarchical Clustering,MIMIC-III"
%}

<div class="apple-overview">
  <p>
    <strong>Course:</strong> COSC 526 – Data Engineering, University of Tennessee, Knoxville
  </p>
  <p>
    <strong>Additional Resources:</strong>
    <a href="/assets/pdf/project_clinical_notes_segmentation/Research-Poster-Hashan.pdf" target="_blank">Poster (PDF)</a> ·
    <a href="https://github.com/hashansl/cosc-526-data-engineering-project" target="_blank">Git Repository</a> ·
    <a href="https://physionet.org/content/mimiciii/1.4/" target="_blank">Dataset (MIMIC-III)</a>
  </p>
</div>

<div class="apple-overview">
  <p>
    Electronic Health Records contain large amounts of clinical notes, but their unstructured, inconsistent formatting makes it hard for clinicians to find and interpret important information — especially when a single record is filled in by multiple people across different departments. Supervised approaches can classify note segments, but they depend on manual annotation, which is expensive to produce at scale.
  </p>
  <p>
    This project tackles that problem using the publicly available MIMIC-III dataset, focusing on its "Nursing/other" note category — 822,497 unique notes. Using regex-based NLP techniques, I segmented that raw text into a structured dataset of <strong>2.3 million labeled segments across 2,121 unique segment titles</strong>. From there, I extracted two complementary embeddings — sparse TF-IDF + SVD features to train a supervised segment-title classifier, and dense Doc2Vec embeddings to unsupervised-cluster the label space itself, using both Hierarchical Agglomerative Clustering and the Topological Data Analysis (TDA) Mapper algorithm.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Pipeline"
      title="From raw notes to organized labels"
      lead="Four stages take unstructured nursing notes to a classified, clustered segment-label space."
  %}

  <div class="apple-grid">
    <article class="apple-card">
      <span class="apple-icon">01</span>
      <h3>Regex-Based Segmentation</h3>
      <p>Subsections are located by special-character patterns, then cleaned: stripping stray whitespace, dates, and unwanted headings, and normalizing all numbers to a static token so numeric variation doesn't fragment otherwise-identical segments.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">02</span>
      <h3>Dual Embeddings</h3>
      <p>Each segment is represented two ways: TF-IDF reduced with SVD into sparse vectors for supervised classification, and Doc2Vec dense embeddings for unsupervised clustering of the label space.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">03</span>
      <h3>Segment Classification</h3>
      <p>A neural classifier trained on the TF-IDF + SVD features predicts a segment's title from its body text, evaluated with F1 scores across all 2,121 segment types.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">04</span>
      <h3>Label-Space Clustering</h3>
      <p>Segment titles are grouped by average embedding similarity using Hierarchical Agglomerative Clustering (k=72, chosen via silhouette score) and the TDA Mapper algorithm, which builds a network directly from the embedding space.</p>
    </article>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Model & Tools"
      title="Built with"
  %}

  <div class="apple-tag-grid">
    <span class="apple-tag">BioClinicalBERT</span>
    <span class="apple-tag">Doc2Vec</span>
    <span class="apple-tag">TF-IDF + SVD</span>
    <span class="apple-tag">Hierarchical Agglomerative Clustering</span>
    <span class="apple-tag">Mapper (Kepler Mapper / TDA)</span>
    <span class="apple-tag">UMAP / t-SNE</span>
    <span class="apple-tag">scikit-learn</span>
    <span class="apple-tag">MIMIC-III</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Results"
      title="What the classifier and the clustering found"
      lead="Two separate questions: how well can a model predict a segment's title, and does the label space itself have usable structure?"
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Class Imbalance"
        challenge_title="Does classification accuracy hold up across all 2,121 segment titles?"
        challenge_body="Segment types vary enormously in frequency — a handful like 'resp' and 'neuro' occur well over 100,000 times each, while most of the 2,121 titles are comparatively rare."
        solution_body="High-frequency segment types reached higher and more stable F1 scores; rare, low-example segment types scored lower and far more variably. Most segment types had low F1 overall — data imbalance, not the embedding or model choice, is the dominant bottleneck."
    %}
    {% include apple/cs_card.liquid
        label="Label Structure"
        challenge_title="Can unsupervised methods reveal genuine structure in 2,121 raw segment titles?"
        challenge_body="Many of the raw titles are near-duplicates or inconsistent abbreviations of the same underlying concept, with no existing hierarchy to merge them."
        solution_body="Both the Mapper graph and hierarchical clustering (k=72, chosen by silhouette score) surfaced tightly connected clusters of co-occurring, semantically related titles, with rare or highly specific labels showing up as peripheral or isolated nodes — a usable path toward merging redundant labels."
    %}
  </div>
</section>

<div class="apple-overview">
  <p>
    The clearest takeaway is that data imbalance, not model capacity, limits classification quality on rare segment types — motivating label merging, better clustering, or data augmentation as the next steps to make note-segment classification reliable across the full label space, not just the common ones.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Gallery"
      title="Figures"
  %}

  <div class="apple-gallery">
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_clinical_notes_segmentation/top_25_segment_classes_1.png" thumb="assets/img/projects/project_clinical_notes_segmentation/top_25_segment_classes_1.png" loading="eager" category="clinical notes figures" %}
      <figcaption class="apple-shot-caption">Top 25 Segment Titles by Frequency</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_clinical_notes_segmentation/embedding_1.png" thumb="assets/img/projects/project_clinical_notes_segmentation/embedding_1.png" loading="lazy" category="clinical notes figures" %}
      <figcaption class="apple-shot-caption">t-SNE of Averaged Segment-Type Embeddings</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_clinical_notes_segmentation/newplot.png" thumb="assets/img/projects/project_clinical_notes_segmentation/newplot.png" loading="lazy" category="clinical notes figures" %}
      <figcaption class="apple-shot-caption">Mapper (TDA) Graph of Segment Label Embeddings</figcaption>
    </figure>
  </div>
</section>
