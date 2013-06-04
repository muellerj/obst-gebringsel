###
 Application Javascript File
 (leave this block for tests)
###

//= require jquery.min
//= require jquery.fancybox.min
//= require typekit.min

jQuery ->
  # $("a:has(img)").fancybox()
  $("a.fancybox").fancybox()
  Typekit.load()