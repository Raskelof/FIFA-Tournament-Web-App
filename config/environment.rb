# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
FIFA::Application.initialize!

# Whats the name of your tournament app?
FIFA::Application.config.app_name = 'My FIFA Tournament'

# The image url to front page header
FIFA::Application.config.front_page_header_img_src = '/ui/custom/header.gif'


