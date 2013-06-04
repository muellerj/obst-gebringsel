class StaticRenderer
  attr_reader :filepath, :layoutpath, :context

  def initialize(filepath, layoutpath, context)
    case Dir.glob("views/#{filepath}.*").size
    when 0..1
      @filepath = Dir.glob("views/#{filepath}.*").first || false
      @layoutpath = layoutpath
      @context = context
    else
      raise "Path #{filepath} is ambivalent!"
    end
  end

  def to_html
    if filepath
      if layoutpath
        context.erb(layout) { content }
      else
        content
      end
    else
      context.pass
    end
  end

  def renderers
    if filepath
      File.basename(filepath).split(".")[1..-1].reverse
    else
      Array.new
    end
  end

  def content
    renderers.inject(File.read(filepath)) do |markup, renderer|
      markup = context.send(renderer, markup)
    end
  end

  def layout
    layoutpath ? File.read("views/layout/#{layoutpath}.erb") : false
  end
end