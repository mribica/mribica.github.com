---
layout: post
title: "Gitshot, fun with git post-commit hook and webcam" 
author: "mribica"
---

For quite some time now, I have had this idea about collection of "gitshots". Basically idea is to create 
git hook that will capture image from webcam on every git commit. And here it is, Gitshot.

## Capture image from command line

For this purpose you can use:

- streamer (Ubuntu) `streamer -c /dev/video0 -b 16 -o filename.jpeg`
- imagesnap (OS X) `imagesnap filename.jpg`

## Git Hooks, post-commit

> Git has a way to fire off custom scripts when certain important actions occur. The hooks are all stored in the hooks subdirectory of the Git directory. 
> In most projects, that’s .git/hooks. For our task we will use `post-commit` hook.


`repository/.git/hooks/post-commit`

### Ubuntu version [(github gist)](https://gist.github.com/4297617)

{% highlight ruby%}

#!/usr/bin/env ruby
puts "[Cheese!]"

# Get some info about current commit
repository_name = `basename "$PWD"`.chop
commit_hash, commit_date = `git log -1 --pretty="%H%n%ci"`.split(/\r?\n/)

# Capture image and save it to ~/Pictures/gitshots/REPOSITORYNAME-TIMESTAMP-COMMITHASH.jpeg
exec "streamer -c /dev/video0 -b 16 -o ~/Pictures/gitshots/#{repository_name}_#{commit_date.gsub!(' ', '_')}_#{commit_hash}.jpeg"
exit 1

{% endhighlight %}

### OS X Version [(github gist)](https://gist.github.com/4297623)

{% highlight ruby%}

#!/usr/bin/env ruby
puts "[Cheese!]"

# Get some info about current commit
repository_name = `basename "$PWD"`.chop
commit_hash, commit_date = `git log -1 --pretty="%H%n%ci"`.split(/\r?\n/)

# Capture image and save it to ~/Pictures/gitshots/REPOSITORYNAME-TIMESTAMP-COMMITHASH.jpeg
exec "imagesnap ~/Pictures/gitshots/#{repository_name}_#{commit_date.gsub!(' ', '_')}_#{commit_hash}.jpeg"
exit 1

{% endhighlight %}

And finally make this script executable `repository$ sudo chmod +x .git/hooks/pre-commit`


