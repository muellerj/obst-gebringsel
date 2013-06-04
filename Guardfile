notification :off

guard :shell do

  watch(/^test\/(.+\.rb)$/) do |file|
    system "clear"
    puts "Running test: #{file[1]}"
    system "bundle exec rake test TEST=#{file[0]}"
  end

  watch(/^lib\/(.+)\.rb$/) do |file|
    testfile = "test/unit/#{file[1]}_test.rb"
    system "clear"
    if File.exists?(testfile)
      puts "Running unit test for #{file[1]}"
      system "bundle exec rake test TEST=#{testfile}"
    else
      puts "No unit test for #{file[1]}. Consider creating one?"
    end
  end

  watch(/^(views|public|assets)\/.*$/) do
    system "clear"
    puts "Running all tests"
    system "bundle exec rake test"
  end

  watch(/^\w+\.(rb|ru)$/) do
    system "clear"
    puts "Running all tests"
    system "bundle exec rake test"
  end

end