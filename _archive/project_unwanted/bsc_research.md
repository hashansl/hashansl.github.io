---
layout: page
title: A Depth-First Search-Based Approach To Improving The Molecular Pathway Search
description: Final Year Bachelor's Thesis  Associated with University of Perdeniya, Sri Lanka
img: assets/img/portfolio/bscresearch/bsc_research_card.png
permalink: /bsc-thesis/
importance: 3
category: Research
cv_pdf: example_pdf.pdf
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

{% include apple/hero.liquid
    eyebrow="Final Year Bachelor's Thesis · University of Peradeniya, Sri Lanka"
    title="Molecular Pathway Search via DFS"
    subtitle="A Java-based parallel computing pipeline that reduced molecular pathway search time by up to nine days using an enhanced Depth-First Search algorithm."
    meta="!Research,University of Peradeniya,Sri Lanka"
    tech="Java,Java Threads,Parallel Computing,Bioinformatics Databases"
%}

<div class="apple-overview">
  <p>
    <strong>Supervisors:</strong>
    <a href="https://sci.pdn.ac.lk/scs/staff/Ruwanthini-Siyambalapitiya" target="_blank">Dr. R. Siyambalapitiya</a>,
    <a href="https://www.linkedin.com/in/prabhath-gunathilake-50870218/" target="_blank">Mr. P. Gunathilake</a>
    (Faculty of Science, University of Peradeniya, Sri Lanka)
  </p>
  <p>
    <strong>Additional Resources:</strong>
    <a href="/assets/pdf/bsc_research/PGIS_Research Congress_Abstract_Wijesundara.pdf" target="_blank">Publication</a> ·
    <a href="/assets/pdf/bsc_research/Thesis_BSc_Wijesundara.pdf" target="_blank">Thesis</a>
  </p>
</div>

<div class="apple-section">
  <div class="apple-two-col">
    <div class="apple-two-col-media">
      {% include image_fancybox.liquid
          full="/assets/img/portfolio/bscresearch/bsc_research_1_n.png"
          thumb="/assets/img/portfolio/bscresearch/bsc_research_1_n.png"
          loading="eager"
          category="research"
      %}
    </div>
    <div class="apple-two-col-body">
      <p>
        I conducted my final-year bachelor's research on enhancing molecular pathway search efficiency using a Depth-First Search (DFS) algorithm. Molecular pathways represent networks of molecules within cells, where analysing interactions is crucial for understanding health-related processes.
      </p>
      <p>
        Due to extensive data complexity, traditional pathway analyses typically take 21–28 days. To address this, I developed a three-stage Java-based pipeline. Initially, XML data files were processed into a structured virtual graph, with nodes representing molecules and edges illustrating reactions. Next, an enhanced DFS algorithm was implemented, incorporating custom input parameters — start node, end node, and nodes to include and exclude — to find all connected pathways efficiently. A novel termination condition was introduced, limiting node visits to prevent infinite loops in large graphs exceeding 500 nodes. Two parallel computing methods were integrated in the final stage, significantly reducing search times.
      </p>
      <p>
        Testing on a cluster computing system demonstrated a reduction in execution time of up to nine days. <strong>This research was successfully published at the PGIS Research Congress 2018, University of Peradeniya.</strong>
      </p>
    </div>
  </div>
</div>
