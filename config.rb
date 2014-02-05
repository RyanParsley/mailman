activate :directory_indexes
require 'premailer'
require 'mandrill'
require 'sinatra'
require 'thin'
require 'sinatra/reloader'
require 'bundler/setup'

activate :deploy do |deploy|
  deploy.method = :git
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end
page "/index.html", :layout => false
# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

module PreMailer
  class << self
    def registered(app)
      require "premailer"
      app.after_build do |builder|
        prefix = build_dir + File::SEPARATOR
        Dir.chdir(build_dir) do
          Dir.glob('**/*.html') do |file|
            premailer = Premailer.new(file, :warn_level => Premailer::Warnings::SAFE, :adapter => :nokogiri, :preserve_styles => true, :remove_comments => true, :remove_ids => false)
            fileout = File.open(file, "w")
            fileout.puts premailer.to_inline_css
            fileout.close
            premailer.warnings.each do |w|
              builder.say_status :premailer, "#{w[:message]} (#{w[:level]}) may not render properly in #{w[:clients]}"
            end
            builder.say_status :premailer, prefix+file
          end
        end
      end
    end
    alias :included :registered
  end
end

::Middleman::Extensions.register(:inline_premailer, PreMailer)

activate :inline_premailer

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css
  
  # Minify Javascript on build
  # activate :minify_javascript
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
  set :http_path, "http://ryanparsley.github.io/mailman/images/"
end
