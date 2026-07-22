---
layout: page
title: Sigma Phi Laboratory <br> <em>Serious Game</em>
img: assets/img/portfolio/sigmaphi/sigmaphi_card.png
permalink: /sigma-phi-laboratory/
importance: 5
category: Work Experience - Game Dev
description: "Unreal Engine Gameplay Programmer (Mar 2023 – Aug 2023) <br> Sigma Phi Labs, China (Remote)"
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Unreal Engine Gameplay Programmer · Mar 2023 – Aug 2023"
    title="Sigma Phi Laboratory"
    subtitle="A scientifically accurate serious game built for PC — integrating complex simulation systems to deliver an educational and interactive experience."
    meta="!Gameplay Programmer,Sigma Phi Labs,China (Remote)"
    tech="Unreal Engine 4 & 5,C++,Gameplay Framework,License Spring SDK,Azure PlayFab"
%}

<div class="apple-overview">
  <p>
    Sigma Phi Laboratory is a serious game developed for PC. The project involved creating a scientifically accurate and engaging simulation that integrates various complex systems to provide an educational and interactive experience for players. The game is designed to support scientific research and education, making complex concepts accessible through immersive gameplay. <a href="https://www.sigmaphilabs.com/" target="_blank">Official Website</a>
  </p>
</div>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="What I Built"
      title="Key contributions"
      lead="Secure licensing, cloud data management, interactive simulations, and polished UI."
  %}

  <div class="apple-grid">

    <article class="apple-card">
      <span class="apple-icon">🔑</span>
      <h3>Licensing System Integration</h3>
      <p>Developed a C++ plugin using the License Spring SDK to handle user licensing, ensuring secure access control and compliance with licensing agreements. Implemented robust user authentication and license verification to protect the software from unauthorised use.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">☁️</span>
      <h3>Player Data Management</h3>
      <p>Implemented a comprehensive player data saving and loading system using Microsoft Azure PlayFab, ensuring secure storage and retrieval of player data, including progress, achievements, and custom settings.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🎮</span>
      <h3>Gameplay Mechanics Development</h3>
      <p>Contributed to the development of core gameplay mechanics that support the educational objectives of the game. Created interactive simulations and experiments allowing players to engage with scientific concepts hands-on.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🖥️</span>
      <h3>User Interface</h3>
      <p>Designed and implemented user-friendly interfaces for managing licenses and player data. Developed intuitive UI elements that guide players through complex simulations and experiments.</p>
    </article>

    <article class="apple-card">
      <span class="apple-icon">🔧</span>
      <h3>Optimisation &amp; Debugging</h3>
      <p>Conducted extensive testing and debugging to ensure smooth performance and a seamless user experience throughout all simulation scenarios.</p>
    </article>

  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Behind the Scenes"
      title="Challenges &amp; solutions"
      lead="Secure licensing and reliable cloud data in a scientific simulation product."
  %}

  <div class="apple-cs">
    {% include apple/cs_card.liquid
        label="Licensing"
        challenge_title="Integrating a secure and efficient licensing system."
        challenge_body="The product required robust protection against unauthorised use while keeping the authentication flow transparent to the end user."
        solution_body="Developed a C++ plugin using the License Spring SDK and implemented thorough user authentication and license verification processes."
    %}
    {% include apple/cs_card.liquid
        label="Data"
        challenge_title="Managing and securing player data in a cloud environment."
        challenge_body="Player progress, achievements, and settings needed to be reliably persisted and accessible across sessions and devices."
        solution_body="Utilised Microsoft Azure PlayFab for secure data storage and retrieval, ensuring players' progress and settings are reliably saved and loaded."
    %}
  </div>
</section>

<section class="apple-section">
  {% include apple/section_head.liquid
      eyebrow="Videos"
      title="Exclusive sneak peek"
  %}

  <div class="apple-video-grid cols-2">
    <div>{% include play_youtube.liquid id="WhmJnGn1LDo" category="Exclusive Sneak Peek" caption="Exclusive Sneak Peek" %}</div>
  </div>
</section>
