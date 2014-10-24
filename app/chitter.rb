require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'helpers/application.rb'

require_relative 'models/peep.rb'
require_relative 'models/user.rb'

require_relative 'controllers/application.rb'
require_relative 'controllers/lostpassword.rb'
require_relative 'controllers/peeps.rb'
require_relative 'controllers/sessions.rb'
require_relative 'controllers/users.rb'

enable :sessions

set :session_secret, 'ultra secret session'

set :partial_template_engine, :erb

set :public_folder, Proc.new { File.join(root, '..', 'public') }

use Rack::Flash