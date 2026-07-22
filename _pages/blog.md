---
layout: default
permalink: /blog/
title: Blog
nav: false
nav_order: 3
pagination:
  enabled: true
  collection: posts
  permalink: /page/:num/
  per_page: 9
  sort_field: date
  sort_reverse: true
  trail:
    before: 1
    after: 3
---

{% assign blog_name_size = site.blog_name | size %}
{% assign blog_description_size = site.blog_description | size %}

{% if blog_name_size > 0 or blog_description_size > 0 %}
<section class="apple-hero apple-blog-hero">
  <span class="apple-eyebrow">Writing</span>
  <h1 class="apple-title">{{ site.blog_name }}</h1>
  {% if blog_description_size > 0 %}
  <p class="apple-subtitle">{{ site.blog_description }}</p>
  {% endif %}
</section>
{% endif %}

{% comment %}
  Only show tag/category chips that actually have ≥1 post; the jekyll-archives
  plugin doesn't generate archive pages for empty tags, so unlinked chips 404.
{% endcomment %}
{% assign visible_tags = "" | split: "" %}
{% for tag in site.display_tags %}
  {% assign posts_for_tag = site.tags[tag] %}
  {% if posts_for_tag and posts_for_tag.size > 0 %}
    {% assign visible_tags = visible_tags | push: tag %}
  {% endif %}
{% endfor %}

{% assign visible_categories = "" | split: "" %}
{% for category in site.display_categories %}
  {% assign posts_for_cat = site.categories[category] %}
  {% if posts_for_cat and posts_for_cat.size > 0 %}
    {% assign visible_categories = visible_categories | push: category %}
  {% endif %}
{% endfor %}

{% if visible_tags.size > 0 or visible_categories.size > 0 %}
<div class="blog-filter-row">
  {% for tag in visible_tags %}
    <a href="{{ tag | slugify | prepend: '/blog/tag/' | append: '/' | relative_url }}" class="apple-chip">
      <i class="fa-solid fa-hashtag fa-xs"></i>&thinsp;{{ tag }}
    </a>
  {% endfor %}
  {% for category in visible_categories %}
    <a href="{{ category | slugify | prepend: '/blog/category/' | append: '/' | relative_url }}" class="apple-chip apple-chip--category">
      <i class="fa-solid fa-tag fa-xs"></i>&thinsp;{{ category }}
    </a>
  {% endfor %}
</div>
{% endif %}

{% assign featured_posts = site.posts | where: "featured", "true" %}
{% if featured_posts.size > 0 %}
<div class="apple-section blog-section">
  {% include apple/section_head.liquid eyebrow="Pinned" title="Featured Posts" %}
  <div class="blog-post-grid">
    {% for post in featured_posts %}
    {% assign read_time = post.content | number_of_words | divided_by: 180 | plus: 1 %}
    {% if post.redirect and post.redirect contains '://' %}
      {% assign card_href = post.redirect %}
      {% assign card_target = "_blank" %}
    {% else %}
      {% assign card_href = post.url | relative_url %}
      {% assign card_target = "_self" %}
    {% endif %}
    <a href="{{ card_href }}" target="{{ card_target }}" rel="{% if card_target == '_blank' %}noopener noreferrer{% endif %}" class="blog-card-link">
      <div class="blog-card {% if post.thumbnail %}blog-card--thumb{% endif %}">
        {% if post.thumbnail %}
        <div class="blog-card-img-wrap">
          <img src="{{ post.thumbnail | relative_url }}" alt="{{ post.title }}" class="blog-card-img">
        </div>
        {% endif %}
        <div class="blog-card-body">
          <span class="blog-card-pin"><i class="fa-solid fa-thumbtack fa-xs"></i> Featured</span>
          {% if post.external_source %}
          <span class="blog-card-cat"><i class="fa-solid fa-up-right-from-square fa-xs"></i>&thinsp;{{ post.external_source }}</span>
          {% elsif post.categories.size > 0 %}
          <span class="blog-card-cat">{{ post.categories | first }}</span>
          {% endif %}
          <h3 class="blog-card-title">{{ post.title }}</h3>
          {% if post.description %}
          <p class="blog-card-desc">{{ post.description }}</p>
          {% endif %}
          <div class="blog-card-meta">
            <span>{{ read_time }} min read</span>
            <span class="blog-meta-dot">&middot;</span>
            <span>{{ post.date | date: '%b %d, %Y' }}</span>
          </div>
          {% if post.tags.size > 0 %}
          <div class="blog-card-tags">
            {% for tag in post.tags limit: 3 %}
            <span class="apple-chip apple-chip--sm">#{{ tag }}</span>
            {% endfor %}
          </div>
          {% endif %}
        </div>
      </div>
    </a>
    {% endfor %}
  </div>
</div>
{% endif %}

<div class="apple-section blog-section">
  {% if featured_posts.size > 0 %}
    {% include apple/section_head.liquid eyebrow="All Posts" title="Latest Writing" %}
  {% endif %}

  {% if page.pagination.enabled %}
    {% assign postlist = paginator.posts %}
  {% else %}
    {% assign postlist = site.posts %}
  {% endif %}

  {% if postlist.size > 0 %}
  <div class="blog-post-grid">
    {% for post in postlist %}
    {% assign read_time = post.content | number_of_words | divided_by: 180 | plus: 1 %}
    {% if post.redirect and post.redirect contains '://' %}
      {% assign card_href = post.redirect %}
      {% assign card_target = "_blank" %}
    {% else %}
      {% assign card_href = post.url | relative_url %}
      {% assign card_target = "_self" %}
    {% endif %}
    <a href="{{ card_href }}" target="{{ card_target }}" rel="{% if card_target == '_blank' %}noopener noreferrer{% endif %}" class="blog-card-link">
      <div class="blog-card {% if post.thumbnail %}blog-card--thumb{% endif %}">
        {% if post.thumbnail %}
        <div class="blog-card-img-wrap">
          <img src="{{ post.thumbnail | relative_url }}" alt="{{ post.title }}" class="blog-card-img">
        </div>
        {% endif %}
        <div class="blog-card-body">
          {% if post.external_source %}
          <span class="blog-card-cat"><i class="fa-solid fa-up-right-from-square fa-xs"></i>&thinsp;{{ post.external_source }}</span>
          {% elsif post.categories.size > 0 %}
          <span class="blog-card-cat">{{ post.categories | first }}</span>
          {% endif %}
          <h3 class="blog-card-title">{{ post.title }}</h3>
          {% if post.description %}
          <p class="blog-card-desc">{{ post.description }}</p>
          {% endif %}
          <div class="blog-card-meta">
            <span>{{ read_time }} min read</span>
            <span class="blog-meta-dot">&middot;</span>
            <span>{{ post.date | date: '%b %d, %Y' }}</span>
          </div>
          {% if post.tags.size > 0 %}
          <div class="blog-card-tags">
            {% for tag in post.tags limit: 3 %}
            <span class="apple-chip apple-chip--sm">#{{ tag }}</span>
            {% endfor %}
          </div>
          {% endif %}
        </div>
      </div>
    </a>
    {% endfor %}
  </div>
  {% else %}
  <p class="blog-empty">No posts yet — check back soon.</p>
  {% endif %}
</div>

{% if page.pagination.enabled %}
{% include pagination.liquid %}
{% endif %}
