require_relative 'config/environment'

use Rack::MethodOverride
use UserController
use BusinessController
use RestaurantController
run ApplicationController
