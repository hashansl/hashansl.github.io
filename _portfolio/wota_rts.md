---
layout: page
title: War of the Ages <br> <em>Elemental Fantasy Real-Time Strategy (RTS)</em>
description: "Senior Unreal Engine Developer (Nov 2025 – Present) <br> Red Gaming"
img: assets/img/portfolio/wota/wota-card.png
permalink: /war-of-the-ages/
importance: 1
category: Work Experience - Game Dev
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Senior Unreal Engine Developer · Nov 2025 – Present"
    title="War of the Ages"
    subtitle="An elemental-fantasy real-time strategy (RTS) game built in Unreal Engine 5.7 hundreds of units, powered by the Gameplay Ability System(GAS)."
    meta="!Senior Unreal Engine Developer,Red Gaming"
    tech="Unreal Engine 5.7,C++,Gameplay Ability System,Mass Entity (ECS),Enhanced Input,CommonUI,Steam Online Subsystem"
%}

<div class="apple-overview">
  <p>
    War of the Ages is an elemental-fantasy RTS currently in development at Red Gaming. Armies of units battle across capture points, turrets, and a multi-tier resource economy — all running server-authoritatively over Steam multiplayer.
  </p>
  <p>
    My work centres on gameplay systems built on Unreal's <strong>Gameplay Ability System (GAS)</strong> at RTS scale: custom C++ abilities, an attribute-driven combat and economy model, and a hybrid GAS + Mass Entity architecture that keeps abilities performant with hundreds of concurrent units.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="What I Build"
      title="Key contributions"
      lead="The systems that make units fight, gather resources, and respond to your commands built to stay smooth even with big armies on screen."
  %}

  <div class="apple-grid">

    <article class="apple-card">
      <span class="apple-icon">⚔️</span>
      <h3>Unit Abilities</h3>
      <p>I give every unit its own set of abilities and stats, so hundreds of them can act independently at the same time. Click a unit and it responds right where you point — spawning a squad, firing a turret, or upgrading itself.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🛡️</span>
      <h3>Combat &amp; Health</h3>
      <p>I built the system that handles taking damage and healing — shields soak up hits before health, damage numbers pop up on screen, and units react as their health drops and fall when it runs out. Hundreds of different attacks and effects run through this one system.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">💰</span>
      <h3>Resources &amp; Economy</h3>
      <p>I built the economy that tracks your resources and workers. Spending is fair and forgiving: you only pay when an order actually goes through, and cancelling gives your resources straight back.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">⚙️</span>
      <h3>Smart, Large-Scale Armies</h3>
      <p>Units decide on their own when to attack, chase, cast, build, or gather. I use a technique that lets huge groups think and move together without slowing the game down — the key to keeping big battles smooth.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🌐</span>
      <h3>Multiplayer &amp; Upgrades</h3>
      <p>I make sure online matches stay fair and in sync for everyone, with players connecting through Steam. I also built the upgrade system, where researching a new tech unlocks fresh abilities for your whole team.</p>
    </article>

  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Behind the Scenes"
      title="Challenges &amp; solutions"
      lead="Making an actor-centric ability framework scale to real-time strategy (RTS) army sizes."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Scale"
        challenge_title="GAS is actor-centric — and RTS armies are huge."
        challenge_body="The Gameplay Ability System is designed around individual actors, with per-actor components, replication, and effect bookkeeping. Naively running it across hundreds of simultaneous units melts frame time and bandwidth."
        solution_body="A hybrid architecture: GAS owns attributes, abilities, and effects, while Mass Entity (ECS) handles per-frame AI states, movement, avoidance, and AoE effect application in batched processors — so each system does what it's best at."
    %}
    {% include apple/cs_card.liquid
        label="Command Feel"
        challenge_title="Players issue orders faster than abilities resolve."
        challenge_body="RTS players queue build and cast commands in rapid bursts. Without care, resources get double-charged, orders are silently dropped, or cancelled abilities leak their costs."
        solution_body="A replicated per-unit ability queue with deferred costs and automatic refunds on cancel — queued orders pay exactly once, cancelling returns resources, and a server-side fallback drains any stuck queue."
    %}
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Gallery"
      title="Image gallery"
      lead="Work-in-progress captures from an active development build."
  %}

  <div class="apple-gallery">
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/wota/wota_1_fhd.png" thumb="/assets/img/portfolio/wota/wota_1_n.png" loading="eager" category="Image Gallery" caption="Main menu" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/wota/wota_2_fhd.png" thumb="/assets/img/portfolio/wota/wota_2_n.png" loading="lazy" category="Image Gallery" caption="In-game — unit selection &amp; base" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/wota/wota_4_fhd.png" thumb="/assets/img/portfolio/wota/wota_4_n.png" loading="lazy" category="Image Gallery" caption="In-game — worker units on the move" %}
    </figure>
    <figure class="apple-shot">
      {% include image_fancybox.liquid full="/assets/img/portfolio/wota/wota_3_fhd.png" thumb="/assets/img/portfolio/wota/wota_3_n.png" loading="lazy" category="Image Gallery" caption="In-game — HQ building" %}
    </figure>
  </div>
  <p class="apple-media-credit">Work-in-progress captures. War of the Ages is in active development.</p>
</section>
