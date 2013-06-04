require_relative '../support/base_helper'
require_relative '../../lib/static_renderer'

describe StaticRenderer do

  let(:context) { MiniTest::Mock.new }

  it "must pass if there is no matching markdown file" do
    context.expect :pass, []
    Dir.stub :glob, [] do
      StaticRenderer.new("some/path", "application", context).to_html
    end
    context.verify.must_equal true
  end

  it "must throw an error if there is more than one file matching the path" do
    Dir.stub :glob, ["file_1", "file_2"] do
      proc {
        StaticRenderer.new("some/path", "application", context).to_html
      }.must_raise RuntimeError
    end
  end

  it "must correctly identify the rendering engines to use" do
    Dir.stub :glob, ["file.foo.bar.baz"] do
      StaticRenderer.new("some/path", false, context).renderers.must_equal %w(baz bar foo)
    end
    Dir.stub :glob, ["file.foo"] do
      StaticRenderer.new("some/path", false, context).renderers.must_equal %w(foo)
    end
    Dir.stub :glob, ["file"] do
      StaticRenderer.new("some/path", false, context).renderers.must_be :empty?
    end
  end

  it "must render simple ERB-files" do
    context.expect :send, "rendered-erb", ["erb", "raw-erb"]
    Dir.stub :glob, ["file.erb"] do
      File.stub :read, "raw-erb" do
        StaticRenderer.new("some/path.erb", false, context).to_html.must_equal "rendered-erb"
      end
    end
    context.verify.must_equal true
  end

  it "must render Markdown-files with layout" do
    context.expect :send, "rendered-markdown", ["markdown", "raw-markdown"]
    context.expect :erb, "layouted-markdown", ["raw-markdown"]
    Dir.stub :glob, ["file.markdown"] do
      File.stub :read, "raw-markdown" do
        StaticRenderer.new("some/path.markdown", "layout.erb", context).to_html.must_equal "layouted-markdown"
      end
    end
    #context.verify.must_equal true
  end

end
