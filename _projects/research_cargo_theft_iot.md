---
layout: page
title: Tampering & Sound-Based IoT Framework <br> <em>Real-Time Steel Cargo Theft Detection</em>
img: assets/img/projects/research_cargo_theft_iot/research-card.png
permalink: /cargo-theft-iot/
importance: 2
category: Research
description: "Research (AHEAD ICE Grant) <br> IoT, Embedded Systems, Deep Learning, Audio Classification"
related_publications: false
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="University of Peradeniya, Sri Lanka · AHEAD ICE Grant"
    title="Tampering and Sound-Based IoT Framework for Real-Time Steel Cargo Theft Detection"
    subtitle="A real-time theft detecting device combining a smart tamper-sensing seal with an audio-recognition CNN, designed for Thermo-Mechanically Treated (TMT) steel bar cargo."
    meta="!Research,University of Peradeniya,Sri Lanka"
    tech="ESP8266,Raspberry Pi,MQTT,Convolutional Neural Networks,Transfer Learning,Google Cloud IoT Core"
%}

<div class="apple-overview">
  <p>
    <strong>Authors:</strong> <strong>Hashan D. Fernando</strong>, Lahiru J. Ekanayake, Prabath Gunathilake, Roshan D. Yapa, Amalka J. Pinidiyaarachchi, Ruwan D. Nawarathna (corresponding author)
  </p>
  <p>
    <strong>Additional Resources:</strong>
    <a href="/assets/pdf/research_cargo_theft_iot/Hashan_ICE_PAPER.docx.pdf" target="_blank">Paper (PDF)</a> ·
    <a href="https://github.com/hashansl/react-iot-application" target="_blank">Dashboard Repository</a>
  </p>
</div>

<div class="apple-overview">
  <p>
    Cargo theft costs the global economy billions of dollars a year, and steel cargo is a frequent target: TMT steel bars are dense, valuable, and shipped in huge volumes by sea, rail, and truck. Most existing anti-theft devices only watch the cargo door, and none of them listen to what's happening <em>inside</em> the container. Meanwhile, real-time detection is hard to get right — GPS/GSM trackers suffer from poor signal at sea, and adding more sensors usually means adding more power draw on a device that has to run unattended for months.
  </p>
  <p>
    This project designs, builds, and evaluates a real-time theft-detecting device with two complementary detection modules. A <strong>smart seal</strong> forms a conductive mesh wrapped around the top layer of a steel bar stack — break the mesh, and an ESP8266 microcontroller immediately flags the tampering over MQTT. In parallel, an <strong>audio detection module</strong> built on a Raspberry Pi continuously listens to the cargo hold, converts sound into Mel-spectrograms and MFCCs, and classifies it with a convolutional neural network to catch theft attempts that never touch a sensor. Both modules report to a cloud backend (Google Cloud IoT Core, Firebase, and BigQuery) that pushes real-time alerts and GPS location to a live dashboard.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="System Architecture"
      title="Two detection modules, one alert pipeline"
      lead="Each module can independently trigger an alert; both report through the same low-power communication and cloud layer."
  %}

  <div class="apple-grid">
    <article class="apple-card">
      <span class="apple-icon">01</span>
      <h3>Smart Seal (Module 1)</h3>
      <p>A conductive mesh wraps around the top layer of the steel bar stack. ESP8266 reads the mesh continuously in deep-sleep mode, pushing a status signal to MQTT every 15–60 seconds — and immediately on any break in the circuit.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">02</span>
      <h3>Audio Detection (Module 2)</h3>
      <p>A Raspberry Pi and microphone continuously sample cargo-hold audio. Chunks above a silence threshold are converted to Mel-spectrograms and classified in real time by a CNN trained to distinguish theft-related sounds from ambient noise.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">03</span>
      <h3>Low-Power Communication</h3>
      <p>Both modules connect to a centralized Wi-Fi hub over MQTT rather than relying on individual GSM links, which are unreliable at sea. Deep-sleep scheduling and a LiPo-battery-plus-LDO-regulator design keep the seal running unattended for the length of a shipping voyage.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">04</span>
      <h3>Cloud &amp; Dashboard</h3>
      <p>Google Cloud IoT Core ingests device telemetry over MQTT, Firebase Cloud Functions process it and update real-time state, and BigQuery stores the raw history. Owners see live device status, tamper alerts, and GPS location on a map-based dashboard.</p>
    </article>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Built With"
      title="Tools & Stack"
  %}

  <div class="apple-tag-grid">
    <span class="apple-tag">ESP8266</span>
    <span class="apple-tag">Raspberry Pi</span>
    <span class="apple-tag">MQTT</span>
    <span class="apple-tag">TensorFlow / CNN</span>
    <span class="apple-tag">Transfer Learning</span>
    <span class="apple-tag">MFCC / Mel-Spectrograms</span>
    <span class="apple-tag">Google Cloud IoT Core</span>
    <span class="apple-tag">Firebase &amp; BigQuery</span>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Results"
      title="From model comparison to a working prototype"
      lead="Both the audio classifier and the physical hardware were evaluated end to end."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Audio Classification"
        challenge_title="Which model architecture best separates theft-related sounds from ambient noise?"
        challenge_body="A dataset combining a custom steel-bar-dragging recording set with UrbanSound8K and YorNoise classes (10,452 spectrograms across 11 classes) was used to train a basic CNN and five transfer-learning architectures pretrained on ImageNet."
        solution_body="The basic CNN reached 76.23% accuracy. Transfer learning improved on that substantially — DenseNet201 was the strongest model at 93.75% accuracy, ahead of MobileNetV2 (91.00%), MobileNet (88.84%), VGG16 (86.54%), VGG19 (82.65%), and ResNet50 (59.76%)."
    %}
    {% include apple/cs_card.liquid
        label="Hardware Validation"
        challenge_title="Does the physical device actually detect tampering and report it in real time?"
        challenge_body="A working smart-seal prototype PCB (ESP8266-12F) was built and tested against multiple simultaneous tampering attempts across multiple sensor nodes, powered from a range of sources including LiPo batteries and solar panels."
        solution_body="The smart seals pushed status data over MQTT without delay, and tampering attempts triggered immediate, correctly attributed alerts — visible in real time on the dashboard with device ID, GPS coordinates, and a red-flagged tamper status."
    %}
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Gallery"
      title="Figures"
  %}

  <div class="apple-gallery">
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_cargo_theft_iot/tmt_steel_bars.jpg" thumb="assets/img/projects/research_cargo_theft_iot/tmt_steel_bars.jpg" loading="eager" category="cargo theft figures" %}
      <figcaption class="apple-shot-caption">Thermo-Mechanically Treated (TMT) Steel Bars</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_cargo_theft_iot/smart_seal_wrapping_concept.jpg" thumb="assets/img/projects/research_cargo_theft_iot/smart_seal_wrapping_concept.jpg" loading="lazy" category="cargo theft figures" %}
      <figcaption class="apple-shot-caption">Smart Seal Wrapping Around a Steel Bar Stack</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_cargo_theft_iot/smart_seal_prototype_pcb.jpg" thumb="assets/img/projects/research_cargo_theft_iot/smart_seal_prototype_pcb.jpg" loading="lazy" category="cargo theft figures" %}
      <figcaption class="apple-shot-caption">Smart Seal Prototype PCB (ESP8266-12F)</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_cargo_theft_iot/audio_signal_to_melspectrogram.jpg" thumb="assets/img/projects/research_cargo_theft_iot/audio_signal_to_melspectrogram.jpg" loading="lazy" category="cargo theft figures" %}
      <figcaption class="apple-shot-caption">Raw Audio Signal Transformed into a Mel-Spectrogram</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_cargo_theft_iot/melspectrograms_sound_classes.jpg" thumb="assets/img/projects/research_cargo_theft_iot/melspectrograms_sound_classes.jpg" loading="lazy" category="cargo theft figures" %}
      <figcaption class="apple-shot-caption">Mel-Spectrograms Across the Audio Dataset's Sound Classes</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_cargo_theft_iot/training_validation_curves.jpg" thumb="assets/img/projects/research_cargo_theft_iot/training_validation_curves.jpg" loading="lazy" category="cargo theft figures" %}
      <figcaption class="apple-shot-caption">Training/Validation Accuracy &amp; Loss Across All Six CNN Architectures</figcaption>
    </figure>

    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/projects/research_cargo_theft_iot/realtime_dashboard.jpg" thumb="assets/img/projects/research_cargo_theft_iot/realtime_dashboard.jpg" loading="lazy" category="cargo theft figures" %}
      <figcaption class="apple-shot-caption">Real-Time Dashboard — Device Status, Tamper Alerts &amp; GPS Location</figcaption>
    </figure>
  </div>
</section>
