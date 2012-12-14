---
layout: post
title: "Gitshoot, Fun with git post-commit hook and webcam" 
---

For quite some time now, I have this idea of creating collection of Gitshots. Basically, idea is to create git hook that will capture image 
from webcam on every git commit. And here it is, Gitshot.

## Capture image from command line

For this purpose I used streamer `streamer -c /dev/video0 -b 16 -o filename.jpeg`

## Git Hooks, post-commit

> Git has a way to fire off custom scripts when certain important actions occur. The hooks are all stored in the hooks subdirectory of the Git directory. 
> In most projects, that’s .git/hooks. For our task we will use `post-commit` hook.


`your-repository/.git/hooks/post-commit`

{% highlight ruby linenos%}

#!/usr/bin/env ruby

puts "[Taking picture, Cheese!]"

# Get some info about current commit
repository_name = `basename "$PWD"`.chop
commit_hash, commit_date = `git log -1 --pretty="%H%n%ci"`.split(/\r?\n/)

# Take picture and save it to ~/Pictures/gitshoots/REPOSITORYNAME-TIMESTAMP-COMMITHASH.jpeg

exec "streamer -c /dev/video0 -b 16 -o ~/Pictures/gitshoots/#{repository_name}_#{commit_date.gsub!(' ', '_')}_#{commit_hash}.jpeg"

exit 1
{% endhighlight %}

And finaly make this script executable `repository$ sudo chmod +x .git/hooks/pre-commit`
