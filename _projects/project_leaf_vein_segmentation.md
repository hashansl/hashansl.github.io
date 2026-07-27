---
layout: page
title: Unsupervised Leaf Vein Segmentation <br> <em>W-Net for Plant Phenotyping</em>
img: assets/img/projects/project_leaf_vein_segmentation/project-card.png
permalink: /leaf-vein-segmentation/
importance: 5
category: Projects
description: "Course Project (COSC 525, UTK) <br> W-Net, Unsupervised Segmentation, PyTorch"
related_publications: false
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Bredesen Center for Interdisciplinary Research · University of Tennessee, Knoxville"
    title="Unsupervised Image Segmentation for Plant Phenotyping"
    subtitle="Training a W-Net to segment leaf veins from over 14,000 leaf scans, without a single hand-labeled pixel."
    meta="!Deep Learning,University of Tennessee,United States"
    tech="PyTorch,W-Net,U-Net,Soft N-Cut Loss,Unsupervised Learning"
%}

<div class="apple-overview">
  <p>
    <strong>Authors:</strong> <strong>Hashan Fernando</strong>, Peter Kruse
  </p>
  <p>
    <strong>Additional Resources:</strong>
    <a href="/assets/pdf/project_leaf_vein_segmentation/Unsupervised_Image_Segmentation_for_Plant_Phenotyping.pdf" target="_blank">Paper (PDF)</a> ·
    <a href="https://github.com/hashansl/leaf-vein-segmentation-wnet" target="_blank">Git Repository</a>
  </p>
</div>

<div class="apple-overview">
  <p>
    Plant phenotyping — measuring and characterizing a plant's expressed traits — is a bottleneck in genetic and breeding research precisely because it's so manual. Leaf vein segmentation is a good example: understanding how veins respond to drought or other treatments requires isolating vein pixels from the rest of the leaf, but the deep learning models that do this well are almost all supervised, and hand-labeling veins at the pixel level across thousands of high-resolution leaf scans is exactly the kind of tedious, expensive process phenotyping is trying to escape.
  </p>
  <p>
    This project trains a <strong>W-Net</strong> — an unsupervised segmentation architecture that pairs two U-Nets in an encoder-decoder loop — to segment leaf veins with no labeled training data at all. The encoder produces a pixel-wise segmentation map directly from an RGB leaf image; the decoder reconstructs the original image from that map. Training balances two loss functions: soft normalized cut loss, which pushes the encoder toward coherent segment boundaries, and reconstruction loss, which keeps those segments faithful to the original image. We trained and evaluated it on over 14,000 scanned leaf images from a UC Davis plantation, with preliminary testing on an open Ficus Religiosa ("Pimpal") leaf dataset, and compared results against a state-of-the-art supervised vein-segmentation baseline.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Methodology"
      title="From leaf scan to segmentation map"
      lead="Four stages take a full-resolution leaf scan to a learned vein segmentation, with no labels involved in training."
  %}

  <div class="apple-grid">
    <article class="apple-card">
      <span class="apple-icon">01</span>
      <h3>Tiling &amp; Filtering</h3>
      <p>Leaf scans (3510×2550 px) are too large to fit in memory, so each is split into 224×224 tiles. Tiles that are more than 10% white background pixels are dropped, keeping the model focused on actual leaf structure.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">02</span>
      <h3>W-Net Architecture</h3>
      <p>Two symmetric U-Nets — nine convolutional blocks each, with skip connections between matching contractive and expansive layers — form an encoder (U<sub>enc</sub>) that segments and a decoder (U<sub>dec</sub>) that reconstructs from that segmentation.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">03</span>
      <h3>Dual-Loss Training</h3>
      <p>Each batch is optimized in two steps: soft normalized cut loss shapes the encoder's segmentation quality, then reconstruction loss (comparing U<sub>dec</sub>'s output to the original tile) is minimized across the full network — no ground-truth labels required either time.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">04</span>
      <h3>Postprocessing &amp; Evaluation</h3>
      <p>Predicted tiles are reassembled by their saved grid index into a full-leaf segmentation map, then compared pixel-wise against eight manually labeled test leaves and against a supervised segmentation baseline.</p>
    </article>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Built With"
      title="Tools & Stack"
  %}

  <div class="apple-tag-grid">
    <span class="apple-tag">PyTorch</span>
    <span class="apple-tag">W-Net</span>
    <span class="apple-tag">U-Net</span>
    <span class="apple-tag">Soft N-Cut Loss</span>
    <span class="apple-tag">Stochastic Gradient Descent</span>
    <span class="apple-tag">Few-Shot Learning</span>
    <span class="apple-tag">ORNL DGX Cluster</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Results"
      title="What the model actually learned"
      lead="Tested first on an open leaf dataset, then on 14,000 UC Davis scans, with an eye toward where an unsupervised approach breaks down."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Squeeze Parameter (k)"
        challenge_title="How many segmentation classes best separate veins from leaf body?"
        challenge_body="The squeeze parameter k controls how many classes the encoder's output layer predicts. We compared k=2 (vein vs. non-vein) against k=64 on identical leaf tiles."
        solution_body="k=2 produced the clearest, most interpretable vein segmentations. k=64 could still pick out major veins, but the leaf body and finer veins came out noisy, so every later experiment used k=2."
    %}
    {% include apple/cs_card.liquid
        label="Full-Leaf Generalization"
        challenge_title="Does a model trained on 224×224 tiles hold together when reassembled into a full leaf?"
        challenge_body="Individual tiles trained well in isolation, but a full leaf image requires hundreds of independently-classified tiles to agree with each other at their shared borders."
        solution_body="The reassembled maps clearly capture major veins and the leaf-body boundary, but tile-to-tile vein continuity breaks down, blank background tiles pick up spurious borders, and discolored or unhealthy leaf regions get segmented as if they were veins — the model was learning texture contrast in general, not veins specifically."
    %}
  </div>
</section>

<div class="apple-overview">
  <p>
    We were genuinely impressed that W-Net could learn coherent vein structure with zero labeled pixels — but it isn't yet a replacement for supervised, state-of-the-art vein segmentation. The clearest next steps: incorporating principal curvature analysis to enforce vein continuity, switching to a loss function better suited to tiled high-resolution inputs, and testing whether adjusting <em>k</em> further could help the model separate damaged or discolored leaf regions from true veins instead of confusing the two.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Gallery"
      title="Figures"
  %}

  <div class="apple-gallery">
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_leaf_vein_segmentation/wnet_architecture.jpg" thumb="assets/img/projects/project_leaf_vein_segmentation/wnet_architecture.jpg" loading="eager" category="leaf vein figures" %}
      <figcaption class="apple-shot-caption">W-Net Architecture — Two U-Nets in an Encoder-Decoder Loop</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_leaf_vein_segmentation/segmentation_tile_k2.jpg" thumb="assets/img/projects/project_leaf_vein_segmentation/segmentation_tile_k2.jpg" loading="lazy" category="leaf vein figures" %}
      <figcaption class="apple-shot-caption">Segmentation Map vs. Actual Tile (k=2)</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_leaf_vein_segmentation/segmentation_tile_k64.jpg" thumb="assets/img/projects/project_leaf_vein_segmentation/segmentation_tile_k64.jpg" loading="lazy" category="leaf vein figures" %}
      <figcaption class="apple-shot-caption">Segmentation Map vs. Actual Tile (k=64)</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_leaf_vein_segmentation/full_leaf_segmentation_pimpal.jpg" thumb="assets/img/projects/project_leaf_vein_segmentation/full_leaf_segmentation_pimpal.jpg" loading="lazy" category="leaf vein figures" %}
      <figcaption class="apple-shot-caption">Unsupervised Segmentation of a Full Pimpal Leaf</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_leaf_vein_segmentation/ucdavis_tile_segmentation.jpg" thumb="assets/img/projects/project_leaf_vein_segmentation/ucdavis_tile_segmentation.jpg" loading="lazy" category="leaf vein figures" %}
      <figcaption class="apple-shot-caption">UC Davis Leaf — Single Tile Segmentation</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_leaf_vein_segmentation/ucdavis_full_leaf_segmentation.jpg" thumb="assets/img/projects/project_leaf_vein_segmentation/ucdavis_full_leaf_segmentation.jpg" loading="lazy" category="leaf vein figures" %}
      <figcaption class="apple-shot-caption">UC Davis — Full Leaf Segmentation</figcaption>
    </figure>
  </div>
</section>
