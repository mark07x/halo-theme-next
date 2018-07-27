{% extends '_layout.swig' %}
<#include "layout/_layout.ftl">
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}
<@html title='${options.blog_title?default("NexT | Archives")}'>
<#--TODO{% block page_class %}{% endblock %}-->
  page-archive
</@html>

<@main>
{#####################}
  {### ARCHIVE BLOCK ###}
  {#####################}
  <div class="post-block archive">
      <div id="posts" class="posts-collapse">
          <span class="archive-move-on"></span>
          <span class="archive-page-counter">
        {% set cheers %}
        {% set posts_length = site.posts.length %}
        {% if posts_length > 210 %} {% set cheers = 'excellent' %}
          {% elif posts_length > 130 %} {% set cheers = 'great' %}
          {% elif posts_length > 80 %} {% set cheers = 'good' %}
          {% elif posts_length > 50 %} {% set cheers = 'nice' %}
          {% elif posts_length > 30 %} {% set cheers = 'ok' %}
        {% else %}
          {% set cheers = 'um' %}
        {% endif %}
        {{ __('cheers.' + cheers) }}! {{ _p("counter.archive_posts", site.posts.length) }} {{ __('keep_on') }}
      </span>

          {% for post in page.posts %}

          {# Show year #}
          {% set year %}
          {% set post.year = date(post.date, 'YYYY') %}

          {% if post.year !== year %}
          {% set year = post.year %}
          <div class="collection-title">
              <{% if theme.seo %}h2
              {% else %}h1
              {% endif %} class="archive-year" id="archive-year-{{ year }}">{{ year }}</{% if theme.seo %}h2{% else %}h1{% endif %}>
            </div>
      {% endif %}
      {# endshow #}

      {{ post_template.render(post) }}

      {% endfor %}

  </div>
  </div>
  {#########################}
  {### END ARCHIVE BLOCK ###}
  {#########################}
    <#include "layout/_partials/pagination.ftl">
</@main>

<@sidebar>
    {% block sidebar %}
    {{ sidebar_template.render(false) }}
  {% endblock %}
</@sidebar>

<@footer>

</@footer>

<@button>

</@button>
