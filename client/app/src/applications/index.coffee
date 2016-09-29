app = require('angular').module 'hollaback'

require './show'
require './create'
require './edit'

app.controller 'ApplicationsCtrl', require './applications_controller'
