---
layout: page
permalink: /publications/
title: Publications
description: "Papers and manuscripts, listed in reverse chronological order. For the writing and code behind each one, visit the corresponding project page."
nav: true
nav_order: 2
---

<!-- _pages/publications.md -->

<!-- Bibsearch Feature -->

{% include bib_search.liquid %}

<div class="publications">

{% bibliography --query @*[own_publication=true]* %}

</div>
