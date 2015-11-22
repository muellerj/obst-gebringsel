class App
  # Use utf-8 wherever possible
  set :default_encoding, 'utf-8'

  assets do
    serve "/js",     from: "assets/javascripts"
    serve "/css",    from: "assets/stylesheets"
    serve "/images", from: "assets/images"
    serve "/fonts",  from: "assets/fonts"

    js :application, [
      "/js/application.js",
      "/js/jquery.fancybox.min.js",
      "/js/jquery.min.js",
      "/js/typekit.min.js"
    ]

    css :application, [
      "/css/fancybox.css",
      "/css/pure-min.css",
      "/css/marketing.css"
    ]

    js_compression  :jsmin
    css_compression :simple
  end
end
