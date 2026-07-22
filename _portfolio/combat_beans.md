---
layout: page
title: Combat Beans - Total Mayhem <br> <em>Third-Person Shooter Multiplayer</em>
description: Senior Unreal Engine Gameplay Programmer (July 2021– Sep 2023) <br> Peanut Brain Studios, Japan (Remote)
img: assets/img/portfolio/combatbeans_logo.png
permalink: /combat-beans/
importance: 3
category: Work Experience - Game Dev
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Senior Gameplay Programmer · July 2021 – Sep 2023"
    title="Combat Beans: Total Mayhem"
    subtitle="A chaotic third-person shooter combining Fall Guys party-game energy with intense combat mechanics — available on Steam."
    meta="!Senior Gameplay Programmer,Peanut Brain Studios,Japan (Remote)"
    tech="Unreal Engine 4 & 5,C++,Azure PlayFab SDK,Multiplayer Framework"
%}

<div class="apple-overview">
  <p>
    Combat Beans: Total Mayhem is a fun and chaotic third-person shooter that combines "Fall Guys" party game elements with intense combat mechanics. The game is available on Steam and features dynamic multiplayer gameplay. <a href="https://www.peanutbrainstudios.com/" target="_blank">Official Website</a> · <a href="https://store.steampowered.com/app/1717080/Combat_Beans_Total_Mayhem/" target="_blank">Steam Page</a>
  </p>
  <p>
    I led the team to design and implement advanced gameplay mechanics using the Unreal Engine Gameplay framework, architected the combat system and player inventory, and enabled dynamically scalable servers and matchmaking through Microsoft Azure PlayFab.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="What I Built"
      title="Key contributions"
      lead="Multiplayer infrastructure, combat systems, animation, and player progression — shipped on Steam."
  %}

  <div class="apple-grid">

    <article class="apple-card">
      <span class="apple-icon">🌐</span>
      <h3>Server &amp; Matchmaking</h3>
      <p>Developed a dedicated server using Unreal Engine's multiplayer framework and GitHub source build. Integrated Azure PlayFab SDKs in C++ to support dynamic server scaling and matchmaking.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🎮</span>
      <h3>Gameplay Mechanics</h3>
      <p>Created custom game modes and states to define and control gameplay rules and transitions. Implemented precise player input logic in the PlayerController for responsive, satisfying controls.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🖥️</span>
      <h3>HUD &amp; UI Design</h3>
      <p>Built dynamic HUD elements such as health bars, equipped weapons, and timers to keep players informed and engaged during fast-paced gameplay sessions.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🏃</span>
      <h3>Animation &amp; Characters</h3>
      <p>Used animation blueprints, montages, and blend spaces for fluid character mechanics. Created a modular weapon system supporting 10+ weapons with distinct animation sets.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🏆</span>
      <h3>Progression &amp; Achievements</h3>
      <p>Implemented XP progression and cosmetic unlocks to increase player retention. Published on Steam and integrated Steam achievements via component-based systems for reusability.</p>
    </article>

  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Behind the Scenes"
      title="Challenges &amp; solutions"
      lead="Performance and feel — the twin priorities for a competitive multiplayer title."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Scalability"
        challenge_title="Balancing server performance with player count."
        challenge_body="Dynamic matchmaking with scalable dedicated servers requires careful attention to bandwidth, state replication, and latency tolerances."
        solution_body="Used Unreal's best practices for optimised multiplayer performance alongside Azure PlayFab's dynamic scaling to keep server costs proportional to player load."
    %}
    {% include apple/cs_card.liquid
        label="Feel"
        challenge_title="Smooth animation transitions and responsive controls."
        challenge_body="Party games demand immediately satisfying controls; any delay or animation jank breaks the fun loop."
        solution_body="Leveraged UE animation tools — blend spaces, montages, and layered animations — and conducted extensive testing to refine feel and control across all input devices."
    %}
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Videos"
      title="Exclusive sneak peek"
  %}

  <div class="apple-video-grid">
    <div>{% include play_youtube.liquid id="RS1mnk3h4eY" category="Exclusive Sneak Peek" caption="Teaser Trailer" %}</div>
    <div>{% include play_youtube.liquid id="8P7oaDc8Sr0" category="Exclusive Sneak Peek" caption="Gameplay 1" %}</div>
    <div>{% include play_youtube.liquid id="4KzXNyztX1A" category="Exclusive Sneak Peek" caption="Gameplay 2" %}</div>
    <div>{% include play_youtube.liquid id="wlkGtNo2SXw" category="Exclusive Sneak Peek" caption="Launch Trailer" %}</div>
    <div>{% include play_youtube.liquid id="89cXrO1xiy8" category="Exclusive Sneak Peek" caption="AI Bot Battle Mode" %}</div>
    <div>{% include play_youtube.liquid id="mtEtu33Wstc" category="Exclusive Sneak Peek" caption="Play Against Bots" %}</div>
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Gallery"
      title="Image gallery"
  %}

  <div class="apple-gallery">
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/combatbeans/combatbeans_1_fhd.png" thumb="/assets/img/portfolio/combatbeans/combatbeans_1_n.png" loading="eager" category="Image Gallery" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/combatbeans/combatbeans_2_fhd.png" thumb="/assets/img/portfolio/combatbeans/combatbeans_2_n.png" loading="lazy" category="Image Gallery" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/combatbeans/combatbeans_6_fhd.png" thumb="/assets/img/portfolio/combatbeans/combatbeans_6_n.png" loading="lazy" category="Image Gallery" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/combatbeans/combatbeans_5_fhd.png" thumb="/assets/img/portfolio/combatbeans/combatbeans_5_n.png" loading="lazy" category="Image Gallery" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/combatbeans/combatbeans_3_fhd.png" thumb="/assets/img/portfolio/combatbeans/combatbeans_3_n.png" loading="lazy" category="Image Gallery" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/combatbeans/combatbeans_4_fhd.png" thumb="/assets/img/portfolio/combatbeans/combatbeans_4_n.png" loading="lazy" category="Image Gallery" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/combatbeans/combatbeans_7_fhd.png" thumb="/assets/img/portfolio/combatbeans/combatbeans_7_n.png" loading="lazy" category="Image Gallery" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/combatbeans/combatbeans_11_fhd.png" thumb="/assets/img/portfolio/combatbeans/combatbeans_11_n.png" loading="lazy" category="Image Gallery" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/combatbeans/combatbeans_9_fhd.png" thumb="/assets/img/portfolio/combatbeans/combatbeans_9_n.png" loading="lazy" category="Image Gallery" %}
    </figure>
  </div>
  <p class="apple-media-credit">Image &amp; Video courtesy of Peanut Brain Studios.</p>
</section>
