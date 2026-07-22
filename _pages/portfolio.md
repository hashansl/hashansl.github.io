---
layout: page
title: Portfolio
permalink: /portfolio/
description:
_styles: >
  .post-header { display: none; }
  .post > article { margin-top: 0; padding-top: 0; }
  .post { margin-top: 0; padding-top: 0; }
  .toc-sidebar-layout.mt-5 { margin-top: 1rem !important; }
  .projects h2.category:first-of-type,
  .projects h3.category:first-of-type { margin-top: 0; }
  .projects h2.category, .projects h3.category { color: var(--apple-text-sub); font-size: 0.8125rem; font-weight: 600; letter-spacing: 0.06em; text-transform: uppercase; border-bottom: 1px solid var(--apple-border); padding-top: 0.25rem; }
nav: false
nav_order: 3
display_categories: [Work Experience, Research, Publications, Game Jams, Projects, Education, Certificates, Technical Skills, Interests]
horizontal: false
toc:
  sidebar: left

---

<!-- pages/portfolio.md -->
<div class="projects">
  {% if site.enable_project_categories and page.display_categories %}
    <!-- Display categorized projects -->
    {% for category in page.display_categories %}
      <a id="{{ category }}" href=".#{{ category }}">
        <h2 class="category">{{ category }} </h2>
      </a>
      {% assign categorized_projects = site.portfolio | where: "category", category %}
      {% assign sorted_projects = categorized_projects | sort: "importance" %}
      <!-- Certificates -->
      {% if category == "Certificates" %}
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
      <!-- Publications -->
      {% elsif category == "Publications" %}
        <article> 
          <div class="cv">
            {% for data in site.data.resume %}
              {% if data[0] == 'publications' %}
                <div class="card mt-3 p-3">
                  {% include resume/publications.liquid %}
                </div>
              {% endif %}
            {% endfor %}
          </div>
        </article>
      <!-- Education -->
      {% elsif category == "Education" %}
        <article> 
          <div class="cv">
            {% for data in site.data.resume %}
              {% if data[0] == 'education' %}
                <div class="card mt-3 p-3">
                  {% include resume/education.liquid %}
                </div>
              {% endif %}
            {% endfor %}
          </div>
        </article>
      <!-- References -->
      {% elsif category == "References" %}
        <article> 
          <div class="cv">
            {% for data in site.data.resume %}
              {% if data[0] == 'references' %}
                <div class="card mt-3 p-3">
                  {% include resume/references.liquid %}
                </div>
              {% endif %}
            {% endfor %}
          </div>
        </article>
      <!-- Technical Skills -->
      {% elsif category == "Technical Skills" %}
        <article> 
          <div class="cv">
            {% for data in site.data.resume %}
              {% if data[0] == 'skills' %}
                <div class="card mt-3 p-3">
                  {% include resume/skills.liquid %}
                </div>
              {% endif %}
            {% endfor %}
          </div>
        </article>
      <!-- Technical Skills -->
      {% elsif category == "Interests" %}
        <article> 
          <div class="cv">
            {% for data in site.data.resume %}
              {% if data[0] == 'interests' %}
                <div class="card mt-3 p-3">
                  {% include resume/interests.liquid %}
                </div>
              {% endif %}
            {% endfor %}
          </div>
        </article>
      <!-- Work Experience with AI Engineer and Game Dev sub-sections -->
      {% elsif category == "Work Experience" %}
        {% assign ai_projects = site.portfolio | where: "category", "Work Experience - AI Engineer" | sort: "importance" %}
        {% assign gamedev_projects = site.portfolio | where: "category", "Work Experience - Game Dev" | sort: "importance" %}
        <h3 id="ai-engineer" class="category">AI Engineer</h3>
        <div class="row row-cols-2 row-cols-md-5">
          {% for project in ai_projects %}
            {% include projects.liquid %}
          {% endfor %}
        </div>
        <h3 id="gameplay-engineer" class="category">Gameplay Engineer</h3>
        <div class="row row-cols-2 row-cols-md-5">
          {% for project in gamedev_projects %}
            {% include projects.liquid %}
          {% endfor %}
        </div>
      {% else %}
        <!-- Generate cards for each portfolio (_portfolio folder) -->
        {% if page.horizontal %}
        <div class="container" >
          <div class="row row-cols-1 row-cols-md-2">
          {% for project in sorted_projects %}
            {% include projects_horizontal.liquid %}
          {% endfor %}
          </div>
        </div>
        {% else %}
        <div class="row row-cols-2 row-cols-md-5">
          {% for project in sorted_projects %}
            {% include projects.liquid %}
          {% endfor %}
        </div>
        {% endif %}
      {% endif %}
    {% endfor %}
  {% else %}
    <!-- Display projects without categories -->
    {% assign sorted_projects = site.projects | sort: "importance" %}
    <!-- Generate cards for each project -->
    {% if page.horizontal %}
      <div class="container">
        <div class="row row-cols-1 row-cols-md-2">
        {% for project in sorted_projects %}
          {% include projects_horizontal.liquid %}
        {% endfor %}
        </div>
      </div>
      {% else %}
      <div class="row row-cols-2 row-cols-md-5">
        {% for project in sorted_projects %}
          {% include projects.liquid %}
        {% endfor %}
      </div>
    {% endif %}
  {% endif %}
</div>

<script>
  window.addEventListener("load", function () {
    var navbar = document.getElementById("navbar");
    var target = document.getElementById("Work Experience");

    function navHeight() {
      return navbar ? navbar.offsetHeight : 56;
    }

    function getMinScroll() {
      if (!target) return 0;
      return target.getBoundingClientRect().top + window.pageYOffset - navHeight();
    }

    // Initial scroll to Work Experience if no hash in URL
    if (!window.location.hash) {
      setTimeout(function () {
        window.scrollTo({ top: getMinScroll(), behavior: "instant" });
        window.dispatchEvent(new Event("scroll"));
      }, 150);
    }

    // Prevent scrolling above Work Experience section
    window.addEventListener("scroll", function () {
      if (window.pageYOffset < getMinScroll()) {
        window.scrollTo({ top: getMinScroll(), behavior: "instant" });
      }
    }, { passive: false });

    // Sync TOC active state with the h2/h3 heading that is visually at the top
    // (IntersectionObserver watches the actual heading elements, not the anchor wrappers,
    //  avoiding the margin-top offset mismatch that scrollspy suffers from)
    if ("IntersectionObserver" in window && typeof $ !== "undefined") {
      var tocLinks = {};
      $("#toc-sidebar a[href]").each(function () {
        var id = decodeURIComponent($(this).attr("href").replace(/^.*#/, ""));
        tocLinks[id] = $(this);
      });

      var observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
          if (!entry.isIntersecting) return;
          var anchor = entry.target.closest("a[id]");
          var id = anchor ? anchor.id : entry.target.id;
          if (!id || !tocLinks[id]) return;
          $("#toc-sidebar .nav-link.active").removeClass("active");
          tocLinks[id].addClass("active");
        });
      }, {
        rootMargin: "-" + navHeight() + "px 0px -60% 0px"
      });

      document.querySelectorAll(".projects h2.category, .projects h3.category").forEach(function (h) {
        observer.observe(h);
      });
    }
  });
</script>
