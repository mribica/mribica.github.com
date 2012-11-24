---
layout: post
title: "Blogging for hackers with Jekyll and github" 
---

## Create github page

Create github repository with name in this format **username.github.com**. In few minutes you will get mail that your github page is up and 
available at username.github.com.

## Install and configure Jekyll

`gem install jekyll`

### Create basic jekyll directory structure

{% highlight html %}

|-- _config.yml
|-- _includes
/-- _plugins
|-- _layouts
|   |-- default.html
|   `-- post.html
|-- _posts
|   `-- 2012-11-24-my-first-post.markdown
|-- _site
`-- index.html

{% endhighlight %}

### Create layout for your blog `_layouts/default.html`

{% highlight html linenos %}
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>{{ "{{ page.title "}} }}</title>
  </head>
  <body>
    {{ "{{ content "}} }}
  </body>
</html>

{% endhighlight %}

### Create layout for post `_layouts/post.html`

{% highlight html linenos %}

<section class="content">
  <h1>
    <a href=" {{ "{{ page.url "}} }} "> {{ "{{ page.title "}} }}</a>
  </h1>

  <section class="date">
    {{ "{{ page.date | date: "%B %e, %Y" "}} }}
  </section>

  {{ "{{ content "}} }}

</section>

{% endhighlight %}

### Create `index.html`

Blog homepage with post listing

{% highlight html linenos %}
<section class="content">
  <ul>
    {{ "{% for post in site.posts "}} %}
    <li>
      <span>{{ "{{ post.date | date: "%B %e, %Y" "}} }}</span> <a href="{{ "{{ post.url "}} }}">{{ "{{ post.title "}} }}</a>
    </li>
    {{" {% endfor "}} %}
  </ul>
</section>
{% endhighlight %}

## Write your first post

Create new post and save it to _posts directory. The format of these file is important, as named as YEAR-MONTH-DAY-title.MARKUP

`~/mribica.github.com$ jekyll --server` will generate your blog. Now you can simply deploy it to github with gitpush.





