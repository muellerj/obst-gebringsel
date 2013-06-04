require_relative 'static_renderer'

module ViewHelpers
  def link_to(text, href, options = {})
    optionstr = options.map {|k,v| "#{k}=\"#{v}\""}.join(" ")
    "<a href='#{href}' #{optionstr}>#{text}</a>"
  end

  def image_tag(src)
    "<img src=\"#{image_path(src)}\" />"
  end

  def render_static(path, layout="application")
    StaticRenderer.new(path, layout, self).to_html
  end
end

