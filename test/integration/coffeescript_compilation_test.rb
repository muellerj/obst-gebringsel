require_relative '../support/base_helper'
require_relative '../support/integration_helper'

describe 'Coffeescript compilation' do

  before do
    jspath = "public/assets/application*.js"
    if Dir.glob(jspath).empty?
      if /mswin|mingw/ =~ RUBY_PLATFORM
        system "bundle exec rake assets:precompile"
      else
        system "bundle exec rake assets:precompile > /dev/null 2>&1"
      end
    end
    @javascript_file = Dir.glob(jspath).first
  end

  it 'must be present' do
    @javascript_file.wont_be_nil
  end

  it 'must have some of the correct content' do
    File.read(@javascript_file).must_include "/*\n Application Javascript File"
  end

end
