# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

run Sinatra::Application


require 'bullet'

Bullet.enable = true
Bullet.alert = true
Bullet.bullet_logger = true
Bullet.console = true

use Bullet::Rack
