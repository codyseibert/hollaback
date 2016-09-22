app = require('angular').module 'hollaback'

require './show'
require './create'

app.controller 'ApplicationsCtrl', require './applications_controller'
