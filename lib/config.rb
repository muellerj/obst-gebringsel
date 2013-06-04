class App
  # Use utf-8 wherever possible
  set :default_encoding, 'utf-8'

  # Use erb templates for markdown rendering
  set :markdown, layout_engine: :erb

  # Define assets to be precompiled
  set :assets_precompile, %w(
    application.js
    application.css
    *.jpg
    *.png
    *.gif
  )

end
