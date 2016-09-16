app = require('angular').module 'hollaback'

app.service 'FeatureService', require './feature_service'
app.service 'TokenService', require './token_service'
app.service 'SecurityService', require './security_service'
app.service 'UserService', require './user_service'
app.service 'ApplicationService', require './application_service'
