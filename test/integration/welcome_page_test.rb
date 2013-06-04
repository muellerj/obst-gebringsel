require_relative '../support/base_helper'
require_relative '../support/integration_helper'

describe 'The Welcome Page' do

  before do
    get "/"
  end

  it 'must be present' do
    last_response.must_be :ok?
  end

  it 'must show the right title' do
    last_response.body.must_have_title 'Obst-Gebringsel'
  end

  # it 'must show the welcome image' do
  #   last_response.body.must_have_image 'welcome'
  # end

  # it 'must show the misc information' do
  #   last_response.body.tap do |body|
  #     body.must_include "Das Institut für Rehabilitation im Münchner Süden"
  #     body.must_include "Petra Lindner - Christa Faust-Müller"
  #     body.must_include "Knöpflerstr. 5"
  #     body.must_include "81476 München"
  #     body.must_include "Tel: 089/756664"
  #     body.must_include "Unsere Praxis ist Mitglied im Deutschen Verband für Physiotherapie (ZVK) e.V."
  #   end
  # end

end
