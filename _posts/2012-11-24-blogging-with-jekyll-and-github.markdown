---
layout: post
title: "Blogging for hackers with Jekyll and github" 
---

# Blogging for hackers with Jekyll and github

## Create your github page

Create repository named in this format username.github.com. In few minutes you will get mail that your page is up and accessible throught
url username.github.com.

## Install and configure Jekyll

`gem install jekyll`

### Create basic jekyll directory structure

``` html

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

```

### Create layout for blog `_layouts/default.html`

**_layouts/default.html**

```html
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>{{ "{{ page.title "}} }}</title>
  </head>
  <body>
    {{ "{{ content "}} }}
  </body>
</html>
```

### Create layout for post

**_layouts/post.html**

~~~html
<section class="content">
  <h1>
    <a href=" {{ "{{ page.url "}} }} "> {{ "{{ page.title "}} }}</a>
  </h1>

  <section class="date">
    {{ "{{ page.date | date: "%B %e, %Y" "}} }}
  </section>

  {{ "{{ content "}} }}

</section>
~~~

### Create index.html

Blog homepage, let's add post listing

**index.html**

~~~html
<section class="content">
  <ul>
    {{ "{% for post in site.posts "}} %}
    <li>
      <span>{{ "{{ post.date | date: "%B %e, %Y" "}} }}</span> <a href="{{ "{{ post.url "}} }}">{{ "{{ post.title "}} }}</a>
    </li>
    {{" {% endfor "}} %}
  </ul>
</section>
~~~


## Write your first post

Create new post and save it to _post directory. The format of these files is important, as named as YEAR-MONTH-DAY-title.MARKUP

`~/mribica.github.com$ jekyll --server`

will generate your blog.


## Add syntax hl

gem 'rdiscount',
gem 'pygments.rb',
gem 'rubypants'




