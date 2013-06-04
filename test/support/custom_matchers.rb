require 'minitest/autorun'

module MiniTest::Assertions

  def assert_has_title(body, title)
    assert body.include?("<title>#{title}</title>"), "Expected html body to include title '#{title}'"
  end

  def assert_has_h1(body, heading)
    assert body.include?("<h1>#{heading}</h1>"), "Expected html body to include heading '#{heading}'"
  end

  def assert_has_h2(body, heading)
    assert body.include?("<h2>#{heading}</h2>"), "Expected html body to include heading '#{heading}'"
  end

  def assert_has_h3(body, heading)
    assert body.include?("<h3>#{heading}</h3>"), "Expected html body to include heading '#{heading}'"
  end

  def assert_has_link(body, link)
    assert Regexp.new("<a.*>#{link}</a>").match(body), "Expected html body to have link containing #{link}"
  end

  def assert_has_image(body, image)
    assert Regexp.new("<img src=('|\").*#{image}.*\\1.*>").match(body), "Expected html body to have image #{image}"
  end

end

String.infect_an_assertion :assert_has_title, :must_have_title, :do_not_flip
String.infect_an_assertion :assert_has_h1, :must_have_h1, :do_not_flip
String.infect_an_assertion :assert_has_h2, :must_have_h2, :do_not_flip
String.infect_an_assertion :assert_has_h3, :must_have_h3, :do_not_flip
String.infect_an_assertion :assert_has_image, :must_have_image, :do_not_flip
String.infect_an_assertion :assert_has_link, :must_have_link, :do_not_flip
