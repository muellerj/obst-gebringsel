require_relative '../support/base_helper'
require_relative '../support/integration_helper'

describe 'SASS compilation' do

  before do
    sspath = "public/assets/application*.css"
    if Dir.glob(sspath).empty?
      if /mswin|mingw/ =~ RUBY_PLATFORM
        system "bundle exec rake assets:precompile"
      else
        system "bundle exec rake assets:precompile > /dev/null 2>&1"
      end
    end
    @stylesheet_file = Dir.glob(sspath).first
  end

  it 'must be present' do
    @stylesheet_file.wont_be_nil
  end

  it 'must have some of the correct content' do
    File.read(@stylesheet_file).must_include "/*\n Application Stylesheet File"
  end

end
