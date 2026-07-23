# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Register MIME types for favicon ERB templates
Rails.application.config.assets.configure do |env|
  env.register_mime_type("application/manifest+json",
    extensions: [".webmanifest", ".webmanifest.erb"])
  env.register_preprocessor("application/manifest+json", Sprockets::ERBProcessor)

  env.register_mime_type("application/xml", extensions: [".xml", ".xml.erb"])
  env.register_preprocessor("application/xml", Sprockets::ERBProcessor)
end
