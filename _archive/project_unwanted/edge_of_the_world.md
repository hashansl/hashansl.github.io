---
layout: page
title: The Edge Of The World <br> <em>Open-World Action RPG</em>
img: assets/img/portfolio/edgeoftheworld/edgeoftheworld_card.png
permalink: /edge-of-the-world/
importance: 6
category: Work Experience - Game Dev
description: "Unreal Engine Gameplay Programmer (May 2021 – Dec 2021) <br> Ksavage Media, USA (Remote)"
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Gameplay Programmer · May 2021 – Dec 2021"
    title="The Edge of the World"
    subtitle="An open-world action RPG set in a richly detailed fantasy universe — dynamic combat, intelligent AI, and a living, breathing world."
    meta="!Gameplay Programmer,Ksavage Media,USA (Remote)"
    tech="Unreal Engine 4 & 5,C++,Gameplay Framework,AI Framework"
%}

<div class="apple-overview">
  <p>
    The Edge of The World is an open-world action RPG set in a richly detailed fantasy universe. Players explore vast landscapes, engage in combat, and complete quests to uncover the mysteries of the edge of the world. The project focuses on creating an immersive gameplay experience with dynamic combat and intelligent AI.
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="What I Built"
      title="Key contributions"
      lead="Combat, enemy intelligence, and cross-discipline collaboration in an open-world environment."
  %}

  <div class="apple-grid">

    <article class="apple-card">
      <span class="apple-icon">⚔️</span>
      <h3>Player Combat System</h3>
      <p>Implemented a comprehensive player combat system, including weapon motion-based hit detection for realistic and responsive combat. Developed various attack types and combos, providing players with a range of combat options.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🤖</span>
      <h3>Enemy AI</h3>
      <p>Designed and implemented advanced enemy AI using Unreal Engine's behaviour tree, environment query system (EQS), and AI perception system. Created diverse enemy behaviours and tactics, enhancing the challenge and engagement of combat encounters.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🤝</span>
      <h3>Team Collaboration</h3>
      <p>Collaborated closely with designers, artists, and other programmers to align gameplay mechanics with the overall vision of the game. Participated in regular team meetings to discuss progress, share feedback, and address challenges.</p>
    </article>

  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Behind the Scenes"
      title="Challenges &amp; solutions"
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Combat"
        challenge_title="Creating a dynamic and responsive combat system."
        challenge_body="Open-world RPG combat must feel weighty and accurate, with hit detection that reads as fair across diverse weapon types."
        solution_body="Implemented weapon motion-based hit detection and refined combat mechanics through iterative testing and player feedback."
    %}
    {% include apple/cs_card.liquid
        label="AI"
        challenge_title="Developing intelligent and varied enemy AI."
        challenge_body="A single set of enemy behaviours quickly becomes predictable; the game needed AI that adapts to player tactics and context."
        solution_body="Utilised Unreal Engine's advanced AI tools to create diverse enemy behaviours — blending behaviour trees, EQS, and perception systems for contextual responses."
    %}
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Videos"
      title="Exclusive sneak peek"
  %}

  <div class="apple-video-grid cols-2">
    <div>{% include play_youtube.liquid id="2V2SXm6WWiM" category="Exclusive Sneak Peek" caption="Gameplay Preview" %}</div>
  </div>
</section>
