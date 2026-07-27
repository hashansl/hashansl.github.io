---
layout: page
title: Automatic Bird Sound Identification <br> <em>Deep Learning &amp; Transfer Learning on 397 Species</em>
img: assets/img/projects/project_msc_final_peradeniya/project-card.png
permalink: /bird-sound-classification/
importance: 6
category: Projects
description: "MSc Independent Project (2021) <br> University of Peradeniya, Sri Lanka <br> ResNet Transfer Learning, Mel-Spectrograms"
related_publications: false
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="MSc in Data Science · Postgraduate Institute of Science, University of Peradeniya, Sri Lanka · 2021"
    title="Automatic Bird Sound Identification Using Machine Learning"
    subtitle="Classifying 397 bird species from 62,874 field recordings by transforming raw audio into Mel-spectrograms and fine-tuning pretrained ResNet models."
    meta="!MSc Independent Project,University of Peradeniya,Sri Lanka"
    tech="PyTorch,ResNet,Transfer Learning,Librosa,Mel-Spectrograms"
%}

<div class="apple-overview">
  <p>
    <strong>Additional Resources:</strong>
    <a href="/assets/pdf/project_msc_final_peradeniya/Independent%20project%20-%20PGIS_M_DTS_20_09.pdf" target="_blank">Project Report (PDF)</a> ·
    <a href="https://xeno-canto.org/" target="_blank">Dataset (Xeno-canto)</a>
  </p>
</div>

<div class="apple-overview">
  <p>
    Identifying bird species from their calls matters for conservation — many species are endangered, and protecting them starts with knowing which species is present and where. But audio is a much harder classification problem than images: recordings are noisy, calls overlap with background species, and traditional machine learning approaches don't hold up well against that noise. Deep learning has changed that, though it typically demands more labeled data and compute than a single independent project can gather from scratch.
  </p>
  <p>
    This project sidesteps that data bottleneck with transfer learning. Using 62,874 recordings across 397 bird species from Xeno-canto, a citizen-science bird sound archive, I converted each clip into a Mel-spectrogram and fine-tuned ImageNet-pretrained ResNet models to classify species from that image representation — rather than training a network from scratch on a comparatively small bioacoustic dataset. The best model, ResNet18, reached an average precision of 0.62 across all 397 species.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Methodology"
      title="From field recordings to a species classifier"
      lead="Four stages take raw, variable-length field recordings to a fine-tuned image classifier."
  %}

  <div class="apple-grid">
    <article class="apple-card">
      <span class="apple-icon">01</span>
      <h3>Dataset &amp; Long-Tail Imbalance</h3>
      <p>62,874 recordings across 397 species, capped at 500 recordings per species — still a steep long-tail distribution. Recordings span the globe, are variable length, and are only weakly labeled: a clip's target species doesn't necessarily vocalize throughout.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">02</span>
      <h3>Audio → Mel-Spectrogram</h3>
      <p>Every recording is resampled and converted to a Mel-spectrogram with Librosa. Window length and chunk duration were tested directly against each other before settling on 7-second segments, padded or randomly sampled to a fixed size, and saved as precomputed arrays.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">03</span>
      <h3>Transfer Learning with ResNet</h3>
      <p>ImageNet-pretrained ResNet18, ResNet101, ResNet152, and resnext50_32x4d each had their final layer swapped for a 397-way classifier head, then fine-tuned with Adam (learning rate 0.005, categorical cross-entropy) for 20 epochs — roughly 5–6 hours per model.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">04</span>
      <h3>Evaluation</h3>
      <p>Training and validation precision and F1-score were tracked across all four architectures to compare how well each generalized to species it hadn't overfit to, rather than relying on raw accuracy alone in a heavily imbalanced, 397-class setting.</p>
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
    <span class="apple-tag">ResNet18 / 101 / 152</span>
    <span class="apple-tag">resnext50_32x4d</span>
    <span class="apple-tag">Librosa</span>
    <span class="apple-tag">Mel-Spectrograms</span>
    <span class="apple-tag">Transfer Learning</span>
    <span class="apple-tag">Adam Optimizer</span>
    <span class="apple-tag">Xeno-canto</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Results"
      title="What actually moved the needle"
      lead="Comparing four architectures under identical training conditions isolated what mattered — and what didn't."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Model Comparison"
        challenge_title="Which pretrained architecture generalizes best to 397 overlapping, noisy bird calls?"
        challenge_body="Four ImageNet-pretrained backbones — ResNet18, ResNet101, ResNet152, and resnext50_32x4d — were fine-tuned identically: same Mel-spectrogram input, same 20-epoch schedule, same learning rate, to isolate the effect of architecture alone."
        solution_body="The smallest model won. ResNet18 reached an average precision of 0.62, ahead of resnext50_32x4d at 0.57. More capacity didn't help here — deeper networks weren't the bottleneck; the audio representation and the long-tail, weakly-labeled dataset were."
    %}
    {% include apple/cs_card.liquid
        label="Class Imbalance & Weak Labels"
        challenge_title="Can species with only a handful of recordings be classified at all?"
        challenge_body="Training data follows a steep long-tail distribution capped at 500 recordings for the most common species, and individual clips are only weakly labeled — the target species doesn't necessarily vocalize during every extracted chunk."
        solution_body="Segments were extracted at a 7-second sweet spot, balancing memory against how much of a call gets captured, with padding for short clips and random-start sampling for long ones. The project's own conclusion flags better handling of this weak labeling as the most promising lever left to pull."
    %}
  </div>
</section>

<div class="apple-overview">
  <p>
    The on-device side of this project — using the trained model to build a low-power TinyML bird call identification device on a microcontroller — was scoped but ultimately set aside due to time constraints. It remains the most concrete next step: on-sensor inference would cut both the power cost and the privacy concerns of streaming raw audio to the cloud for classification.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Gallery"
      title="Figures"
  %}

  <div class="apple-gallery">
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_msc_final_peradeniya/training_samples_per_species.jpg" thumb="assets/img/projects/project_msc_final_peradeniya/training_samples_per_species.jpg" loading="eager" category="bird sound figures" %}
      <figcaption class="apple-shot-caption">Number of Training Samples per Species — a Long-Tail Distribution</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_msc_final_peradeniya/recording_geo_distribution.jpg" thumb="assets/img/projects/project_msc_final_peradeniya/recording_geo_distribution.jpg" loading="lazy" category="bird sound figures" %}
      <figcaption class="apple-shot-caption">Recording Locations by Species Across the Xeno-canto Dataset</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_msc_final_peradeniya/audio_waveform_bird_call.jpg" thumb="assets/img/projects/project_msc_final_peradeniya/audio_waveform_bird_call.jpg" loading="lazy" category="bird sound figures" %}
      <figcaption class="apple-shot-caption">Raw Audio Waveform of a Bird Call</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_msc_final_peradeniya/spectrogram_raw_signal.jpg" thumb="assets/img/projects/project_msc_final_peradeniya/spectrogram_raw_signal.jpg" loading="lazy" category="bird sound figures" %}
      <figcaption class="apple-shot-caption">Spectrogram Representation of the Raw Signal</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_msc_final_peradeniya/melspectrogram_resolution_comparison.jpg" thumb="assets/img/projects/project_msc_final_peradeniya/melspectrogram_resolution_comparison.jpg" loading="lazy" category="bird sound figures" %}
      <figcaption class="apple-shot-caption">15s, 10s, and 5s Mel-Spectrograms at 64×256 Resolution</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/project_msc_final_peradeniya/training_validation_f1_precision.jpg" thumb="assets/img/projects/project_msc_final_peradeniya/training_validation_f1_precision.jpg" loading="lazy" category="bird sound figures" %}
      <figcaption class="apple-shot-caption">Training/Validation F1-Score &amp; Precision — ResNet18, ResNet101, ResNet152, resnext50_32x4d</figcaption>
    </figure>
  </div>
</section>
