---
layout: page
title: A Comparative Study of DQN and PPO Algorithms in a 2D Fighting Game Using Unity ML-Agents
description: Master's Dissertation - Associated with University of The West of England, UK
img: assets/img/portfolio/mscdissertation/msc_dis_card.png
permalink: /msc-dissertation/
importance: 1
category: Research
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Master's Dissertation · University of the West of England, UK"
    title="DQN vs PPO in a 2D Fighting Game"
    subtitle="A comparative performance analysis of Deep Q-Network and Proximal Policy Optimisation reinforcement algorithms in a Unity ML-Agents fighting game environment."
    meta="!Research,UWE,United Kingdom"
    tech="Unity,Unity ML-Agents,IBM SPSS,Deep Reinforcement Learning"
%}

<div class="apple-overview">
  <p>
    <strong>Supervisor:</strong> <a href="https://people.uwe.ac.uk/Person/BethanyMackey" target="_blank">Mackey, B. A</a> (Senior Lecturer of Creative Technology, School of Computing &amp; Creative Technologies, UWE, UK)
  </p>
  <p>
    <strong>Additional Resources:</strong>
    <a href="/assets/pdf/msc_research_1/DissertationProposal_MSc_Wijesundara.pdf" target="_blank">Proposal</a> ·
    <a href="https://gitlab.com/lmwijesundara/fighter2dml" target="_blank">Git Repository</a> ·
    <a href="/assets/pdf/msc_research_1/lahiru_dissertation_presentation.pptx" target="_blank">Final Viva Presentation</a> ·
    <a href="https://uweacuk-my.sharepoint.com/:u:/g/personal/wijesundara2_wijesundara_live_uwe_ac_uk/EcXvFA-2hKFJudd0hFOZQhgBd5gvUrxKlIvrMvdGbkJWaw?e=jsNtAm" target="_blank">Prototype</a>
  </p>
</div>

<div class="apple-section">
  <div class="apple-two-col">
    <div class="apple-two-col-media">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/mscdissertation/2DMLFighter.gif"
          thumb="/assets/img/portfolio/mscdissertation/2DMLFighter.gif"
          loading="eager"
          category="research"
          caption="Prototype — Train agent fight"
      %}
      {% include play_youtube.liquid id="6S2gGLJNX_w" category="research" caption="Video Presentation" %}
    </div>
    <div class="apple-two-col-body">
      <p>
        My master's dissertation focused on a comparative performance analysis of Deep Q-Network (DQN) and Proximal Policy Optimisation (PPO) deep reinforcement algorithms within a challenging 2D fighting game environment developed using Unity and Unity ML-Agents.
      </p>
      <p>
        According to the literature review, both algorithms had been widely used to train 2D fighting game agents, yet a thorough analysis of their training performance (learning efficiency) and the performance of trained agents (win rates) had not been thoroughly explored. This research fills that gap.
      </p>
      <p>
        Game mechanics included lateral movement, slash attacks with cooldown, and a health system where agents aim to reduce their opponent's health to zero. Agents were designed to make real-time decisions based on observations of position, distance, and health state. Hyperparameter tuning was conducted using a grid search, varying learning rate and neuron counts.
      </p>
      <p>
        The Shapiro-Wilk test shows data is not normally distributed (p &lt; 0.001), so the Mann-Whitney U test was used. Results indicated a significant performance difference (p = 0.016), with <strong>DQN outperforming PPO</strong> in mean cumulative rewards (~15.0 vs 12.0). In 1,000 head-to-head matches, DQN won 71.5% compared to PPO's 28.5%.
      </p>
    </div>
  </div>
</div>
