---
layout: page
title: Certifications
category: Certifications
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
---

<article>
  <div class="cv">
    {% for data in site.data.resume %}
      {% if data[0] == 'certificates' %}
        <div class="card mt-3 p-3">
          {% include resume/certificates.liquid %}
        </div>
      {% endif %}
    {% endfor %}
  </div>
</article>
