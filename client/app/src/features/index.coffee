app = require('angular').module 'hollaback'

require './create'
require './show'

app.controller 'FeaturesCtrl', require './features_controller'
