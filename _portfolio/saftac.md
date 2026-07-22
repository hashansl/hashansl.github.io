---
layout: page
title: SAF-TAC <br> <em>VR/PC Military Defence Simulation</em>
img: assets/img/portfolio/saftac/saftac_logo.png
permalink: /saf-tac/
importance: 4
category: Work Experience - Game Dev
description: "Senior Software Engineer (April 2018 – Sep 2023) <br> SimCentric, Sri Lanka"
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Senior Software Engineer · April 2018 – Sep 2023"
    title="SAF-TAC"
    subtitle="A VR/Desktop multiplayer application for military simulation and training, featuring Exercise Control, Scenario Authoring, and After-Action Review."
    meta="!Senior Software Engineer,SimCentric,Sri Lanka"
    tech="Unreal Engine 4 & 5,C++,Multiplayer Framework,AI Framework"
%}

<div class="apple-overview">
  <p>
    SAF-TAC is a VR/Desktop multiplayer application designed specifically for military simulation and training with essential simulation functions such as Exercise Control, Scenario Authoring and After-Action Review. <a href="https://www.simct.com/" target="_blank">Official Website</a>
  </p>
  <p>
    Contributed to creating complex systems and enhancing gameplay experiences using the Unreal Engine gameplay framework and Agile methodologies in a highly dynamic, talented team of programmers, game designers, QA engineers and artists. Developed multiplayer mechanics and optimised network performance, including server-side logic and AI systems.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="What I Built"
      title="Key contributions"
      lead="Complex simulation systems spanning AI, VR, multiplayer, and environment control."
  %}

  <div class="apple-grid">

    <article class="apple-card">
      <span class="apple-icon">🤖</span>
      <h3>Advanced AI Systems</h3>
      <p>Implemented AI systems using Unreal Engine's AI controller, behaviour tree, AI perception system, blackboard, navigation system, and EQS. Created a crowd simulation AI with randomised movement and responsive behaviour to external events like detonations. Developed a waypoint-based AI system for player commands: move, flee, attack, and defend.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🥽</span>
      <h3>Full-Body VR Avatar System</h3>
      <p>Developed a C++ plugin for a full-body VR avatar system using inverse kinematics (IK) and animation-driven 3-point tracking. Achieved accurate motion representation using the control rig in Unreal Engine.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🌐</span>
      <h3>Multiplayer Features</h3>
      <p>Ensured server-authoritative game logic for secure and consistent gameplay experiences across all connected clients in demanding training scenarios.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🌦️</span>
      <h3>Weather Control System</h3>
      <p>Developed a customisable weather control system — rain, snow, wind, cloud density, fog, and time of day. Created an intuitive UI with UMG Motion Designer for player interaction with the weather system.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🔧</span>
      <h3>Debugging &amp; Optimisation</h3>
      <p>Debugged and optimised game mechanics using Unreal Engine's blueprint debugger, Visual Studio, and Unreal Insights to maintain performance across complex simulation scenarios.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🤝</span>
      <h3>Team Collaboration</h3>
      <p>Provided technical guidance to the development team and reviewed code written by team members, ensuring quality and adherence to coding standards across a senior-level team.</p>
    </article>

  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Behind the Scenes"
      title="Challenges &amp; solutions"
      lead="Realistic simulation and reliable networking in a demanding military training context."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="AI Behaviour"
        challenge_title="Implementing realistic and responsive AI behaviour in complex training scenarios."
        challenge_body="Military simulation demands AI that reacts authentically to dynamic events, player commands, and environmental changes simultaneously."
        solution_body="Leveraged Unreal Engine's advanced AI tools — behaviour trees, perception systems, and EQS — to achieve lifelike AI responses in combined-arms scenarios."
    %}
    {% include apple/cs_card.liquid
        label="Multiplayer"
        challenge_title="Ensuring a seamless multiplayer experience with secure and consistent gameplay."
        challenge_body="Training simulations require authoritative, lag-tolerant state synchronisation across many concurrent clients."
        solution_body="Utilised Unreal Engine's network framework with data replication and RPCs for synchronised gameplay, maintaining a server-authoritative model throughout."
    %}
  </div>
</section>

<div class="apple-section">
  <div class="apple-media-section">
    <div class="apple-gallery">
      <figure class="apple-shot">
        {% include image_fancybox.liquid
            full="/assets/img/portfolio/saftac/saftac_1_fhd.png"
            thumb="assets/img/portfolio/saftac/saftac_1_n.png"
            loading="eager"
            category="screen captures"
        %}
      </figure>
      <figure class="apple-shot">
        {% include image_fancybox.liquid
            full="/assets/img/portfolio/saftac/saftac_2_fhd.png"
            thumb="assets/img/portfolio/saftac/saftac_2_n.png"
            loading="eager"
            category="screen captures"
        %}
      </figure>
      <figure class="apple-shot">
        {% include image_fancybox.liquid
            full="/assets/img/portfolio/saftac/saftac_3_fhd.png"
            thumb="assets/img/portfolio/saftac/saftac_3_n.png"
            loading="eager"
            category="screen captures"
            caption="Image courtesy of SimCentric."
        %}
        <figcaption class="apple-shot-caption">Image courtesy of SimCentric.</figcaption>
      </figure>
    </div>
  </div>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Videos"
      title="Exclusive sneak peek"
  %}

  <div class="apple-video-grid">
    <div>{% include play_youtube.liquid id="u9vzjb-_KxM" category="Exclusive Sneak Peek" caption="BBC Click Feature SimCentric's SAF-TAC" %}</div>
    <div>{% include play_youtube.liquid id="LX9ELWi9jR4" category="Exclusive Sneak Peek" caption="VR Defence Training" %}</div>
    <div>{% include play_youtube.liquid id="bov6rpz4oiA" category="Exclusive Sneak Peek" caption="NATO, UK Fight Club and Royal Marines Use Case" %}</div>
    <div>{% include play_youtube.liquid id="S8nUood9LD4" category="Exclusive Sneak Peek" caption="VR Military Training" %}</div>
    <div>{% include play_youtube.liquid id="GAwLb1ATMeU" category="Exclusive Sneak Peek" caption="Royal Marines on Forces TV" %}</div>
    <div>{% include play_youtube.liquid id="aa4bHLpDYcA" category="Exclusive Sneak Peek" caption="Army Reserve Use Case" %}</div>
    <div>{% include play_youtube.liquid id="ASK6kZaaDnw" category="Exclusive Sneak Peek" caption="Fire & Movement Realism Demo" %}</div>
    <div>{% include play_youtube.liquid id="agqPQpagPd8" category="Exclusive Sneak Peek" caption="Free Roam & Haptic Integration" %}</div>
    <div>{% include play_youtube.liquid id="St2Jf8UorEs" category="Exclusive Sneak Peek" caption="WIP Demo" %}</div>
  </div>
  <p class="apple-media-credit">Video courtesy of SimCentric.</p>
</section>
