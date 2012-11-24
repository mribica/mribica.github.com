#custom filters, from Octopress
require './_plugins/backtick_code_block'
require './_plugins/post_filters'
require 'rubypants'

module OctopressFilters
  include BacktickCodeBlock
  include TemplateWrapper
  def pre_filter(input)
    input = render_code_block(input)
    input.gsub /(<figure.+?>.+?<\/figure>)/m do
      safe_wrap($1)
    end
  end
  def post_filter(input)
    input = unwrap(input)
    RubyPants.new(input).to_html
  end
end

module Jekyll
  class ContentFilters < PostFilter
    include OctopressFilters
    def pre_render(post)
      if post.ext.match('html|textile|markdown|md|haml|slim|xml')
        post.content = pre_filter(post.content)
      end
    end
    def post_render(post)
      if post.ext.match('html|textile|markdown|md|haml|slim|xml')
        post.content = post_filter(post.content)
      end
    end
  end
end


