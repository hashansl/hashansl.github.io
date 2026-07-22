# Blog Writing Workflow

This document covers the full authoring flow for posts on this al-folio Jekyll site.

---

## Daily Flow

```
1. Scaffold a draft
   pwsh _scripts/new-post.ps1 -Title "Your Post Title" -Tags "ai game-dev" -Category "tutorials"

2. Write
   Open _drafts/<slug>.md in VS Code and write the post.
   Drop images into assets/img/blog/<slug>/ (created automatically).

3. Preview locally
   docker compose up
   Open http://localhost:3000/blog/

4. Publish when ready
   pwsh _scripts/publish-draft.ps1 -Slug "<slug>"

5. Commit and push
   git add _posts/<date>-<slug>.md assets/img/blog/<slug>/
   git commit -m "blog: <short description>"
   git push
   GitHub Pages will deploy automatically.
```

---

## Scripts

### `_scripts/new-post.ps1`

Scaffolds a new post from `_drafts/_template.md`.

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| `-Title` | yes | — | Post title (will be slugified) |
| `-Tags` | no | `""` | Space-separated tags e.g. `"ai python"` |
| `-Category` | no | `tutorials` | Post category |
| `-NoDraft` | no | off | Write directly to `_posts/` instead of `_drafts/` |

Creates:
- `_drafts/<slug>.md` (or `_posts/<date>-<slug>.md` with `-NoDraft`)
- `assets/img/blog/<slug>/` image folder

### `_scripts/publish-draft.ps1`

Moves a finished draft into `_posts/` with today's date and updates the `date:` frontmatter field.

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| `-Slug` | yes | — | Filename slug (without `.md`) |
| `-Date` | no | today | Publish date in `yyyy-MM-dd` format |

Prints the post URL after publishing.

---

## Frontmatter Reference

These are all the frontmatter fields the blog layout reads:

```yaml
---
layout: post               # always "post"
title: Your Post Title
date: 2026-05-19 00:00:00 +0530
description: One-line summary displayed in post listings (~140 chars)
tags: tag1 tag2            # space-separated, lowercase, hyphenated
categories: tutorials      # single category
thumbnail: assets/img/blog/<slug>/cover.jpg  # shown in post list; ~1200x630 recommended
featured: false            # true = pinned card at top of /blog/
giscus_comments: false     # flip to true after Giscus is configured
related_posts: true        # show related posts at the bottom
toc:
  beginning: true          # render table of contents at the start
  sidebar: left            # alternative: sidebar TOC (use instead of beginning)
redirect: /some/url        # redirect this post URL elsewhere (optional)
external_source: medium.com  # label for cross-posted content (optional)
images:
  compare: true            # enable image comparison slider
  slider: true             # enable image slider (Swiper)
---
```

Tags and categories in `display_tags` / `display_categories` in `_config.yml` are shown as quick-filter links on the `/blog/` index page. Add new tags/categories there to surface them.

---

## Image Conventions

- Store images under `assets/img/blog/<slug>/` (the scaffolder creates this for you).
- Use the Jekyll figure include for consistent styling:

```liquid
{% include figure.liquid loading="eager" path="assets/img/blog/<slug>/image.png" class="img-fluid rounded z-depth-1" caption="Optional caption" %}
```

- Cover/thumbnail: aim for ~1200×630 px, save as `cover.jpg`.
- For side-by-side images use the `col` grid:

```liquid
<div class="row">
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/blog/<slug>/a.png" class="img-fluid rounded z-depth-1" %}
  </div>
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/blog/<slug>/b.png" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
```

---

## Feature Cheatsheet

The `_samples/` folder contains reference posts for every al-folio feature. They are excluded from the build but available to copy from.

| Feature | Reference file |
|---------|---------------|
| Math (KaTeX) | `_samples/2015-10-20-math.md` |
| Code blocks + syntax highlight | `_samples/2015-07-15-code.md` |
| Code diff view | `_samples/2024-01-27-code-diff.md` |
| Images (basic) | `_samples/2015-05-15-images.md` |
| Images (advanced: slider, compare) | `_samples/2024-01-27-advanced-images.md` |
| Tables | `_samples/2023-03-21-tables.md` |
| Table of contents | `_samples/2023-03-20-table-of-contents.md` |
| Sidebar TOC | `_samples/2023-04-25-sidebar-table-of-contents.md` |
| Custom blockquotes | `_samples/2023-05-12-custom-blockquotes.md` |
| Diagrams (Mermaid) | `_samples/2021-07-04-diagrams.md` |
| Charts (Chart.js) | `_samples/2024-01-26-chartjs.md` |
| Charts (ECharts) | `_samples/2024-01-26-echarts.md` |
| Charts (Plotly) | `_samples/2025-03-26-plotly.md` |
| Charts (Vega-Lite) | `_samples/2024-01-27-vega-lite.md` |
| GeoJSON map | `_samples/2024-01-26-geojson-map.md` |
| Photo gallery | `_samples/2024-12-04-photo-gallery.md` |
| Video embed | `_samples/2023-04-24-videos.md` |
| Audio embed | `_samples/2023-04-25-audios.md` |
| Tabs | `_samples/2024-05-01-tabs.md` |
| Pseudocode | `_samples/2024-04-15-pseudocode.md` |
| Typograms | `_samples/2024-04-29-typograms.md` |
| TikZ diagrams | `_samples/2023-12-12-tikzjax.md` |
| Jupyter notebook | `_samples/2023-07-04-jupyter-notebook.md` |
| Bibliography / citations | `_samples/2023-07-12-post-bibliography.md` |
| Distill-style post | `_samples/2018-12-22-distill.md` |

---

## Pre-publish Checklist

Before running `publish-draft.ps1`:

- [ ] Title is under ~60 characters
- [ ] `description:` is filled in (~140 chars, no placeholder text)
- [ ] `tags:` are lowercase and hyphenated; add new display tags to `_config.yml` if needed
- [ ] `categories:` matches one of the `display_categories` in `_config.yml` (or add it there)
- [ ] `thumbnail:` image exists and is ~1200×630 px
- [ ] All images referenced in the body exist under `assets/img/blog/<slug>/`
- [ ] No `TODO` or placeholder text left in the body
- [ ] Code blocks have language identifiers
- [ ] Internal links use `{{ '/path/' | relative_url }}`
- [ ] Run a local Docker preview and read through the rendered post

---

## Enabling Giscus Comments

Giscus lets readers comment via GitHub Discussions.

1. Go to [giscus.app](https://giscus.app/) and follow the setup steps for your repo.
2. Copy the `repo_id`, `category`, and `category_id` values it gives you.
3. Fill them in `_config.yml`:

```yaml
giscus:
  repo: lahiruwijesundara/lahiruwijesundara.github.io
  repo_id: <your_repo_id>
  category: Comments
  category_id: <your_category_id>
  mapping: title
  strict: 1
  reactions_enabled: 1
  input_position: bottom
  theme: preferred_color_scheme
  emit_metadata: 0
  lang: en
```

4. In `_drafts/_template.md` change `giscus_comments: false` to `giscus_comments: true` so all future posts have it on by default.

---

## Adding a New Tag or Category to the Blog Index

Tags/categories only appear as filter links on `/blog/` if they are listed in `_config.yml`:

```yaml
display_tags: ["ai", "game-dev", "unity", "unreal", "python", "devops"]
display_categories: ["tutorials", "retrospectives", "research-notes"]
```

Add entries here as your content grows. Tags/categories used in posts but not listed here still work — they just won't appear as quick-filter links.
