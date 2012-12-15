---
layout: post
title: "Blogging for hackers with Jekyll and github" 
author: "mribica"
---

## 1. Create github page

Create github repository with name in format `USERNAME.github.com`. In few minutes you will get email 
that your github page is up and available at username.github.com.

## 2. Install and configure Jekyll

> [Jekyll](https://github.com/mojombo/jekyll) is a simple, blog aware, static site generator. It takes a template directory 
> (representing the raw form of a website), runs it through Textile or Markdown and Liquid converters, 
> and spits out a complete, static website suitable for serving with Apache or your favorite web server. 

{% highlight html %}
$ gem install jekyll
{% endhighlight %}

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

{% highlight html%}
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>{{ "{{ page.title"}} }}</title>
  </head>
  <body>
    {{ "{{ content"}} }}
  </body>
</html>

{% endhighlight %}

### Create layout for post `_layouts/post.html`

{% highlight html %}

<h1> <a href="{{ "{{ page.url"}} }}" class="postTitle">{{ "{{ page.title"}} }}</a> </h1>
{{ "{{ page.date | date: '%B %e, %Y'"}} }}
{{ "{{ content"}} }}

{% endhighlight %}

### Create `index.html`

Blog homepage with posts list

{% highlight html %}
<ul>
  {{ "{% for post in site.posts"}} %}
  <li>
    <span>{{ "{{ post.date | date: '%B %e, %Y'"}} }}</span> <a href="{{ "{{ post.url "}} }}">{{ "{{ post.title"}} }}</a>
  </li>
  {{" {% endfor"}} %}
</ul>
{% endhighlight %}

## 3. Write your first post

Create new post and save it to _posts with filename in format `YEAR-MONTH-DAY-title.MARKUP`

eg. `2012-11-24-my-first-post.markdown`

{% highlight markdown %}
---
layout: post
title: "Blogging for hackers with Jekyll and github" 
---

# This my first post

Content for the first post

{% endhighlight %}

## 4. Run and deploy

{% highlight bash %}
USERNAME.github.com$ jekyll --server
{% endhighlight %}

will generate your blog and start Webrick server. 
Now you can check your blog at `localhost:4000`. If everything is ok push it to your `USERNAME.github.com` repository and 
your blog is deployed.
