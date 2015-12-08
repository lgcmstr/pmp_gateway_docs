###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/faqs.html", layout: :faqs

# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
helpers do
  def sentence_to_css_anchor(sentence)
    sentence.downcase.gsub(/[^0-9a-z ]/i, '').gsub(' ','-')[0..25]
  end

  def link_to_active(name, path, options={})
    if options[:active_path]
      active = options[:active_path] == current_path
      link_to name, path, class: (active ? 'active' : '')
    end
  end

  def link_to_current_version(name, path, options={})
    current_version = current_path.split('/').first if current_path.start_with?('v')
    target_path =
      if current_version
        "/#{current_version}#{path unless path == '/index.html'}"
      else
        path
      end
    active = path.end_with?(current_path.split('/').last)
    link_to name, target_path, options, class: (active ? 'active' : '')
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Activate the syntax highlighter
activate :syntax

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
