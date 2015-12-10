# Application Javascript File

#= require jquery.min.js
#= require jquery.fancybox.min.js

# Leave this block for test
application_javascript_file = -> "application_javascript_file"

jQuery ->
  $("a.fancybox").fancybox()
