var express = require('express');
var path = require('path');
var fs = require('fs');
var bodyParser = require('body-parser');
var passport = require('passport');

var app = express();
var port = process.env.PORT || 8080;
var router = express.Router();
var api = {};

function registerRoutes(rpath, route) {
	rpath = rpath.replace(/^\//, '').replace(/\/$/, '');
	route = route.replace(/^\//, '').replace(/\/$/, '');
	
	fs.readdirSync(path.join(__dirname, rpath)).forEach(function(e, i, a) {
		if (e.substr(e.lastIndexOf('.') + 1) === "js"
				&& e.length > 2
				&& fs.lstatSync(rpath + '/' + e).isFile()) {
			api[e] = require("./" + rpath + "/" + e);
			if (api[e].router) {
				console.log("Loading: " + e);
				app.use('/' + route, api[e].router);
			}
		}
	});
}

app.use(passport.initialize());
app.use(passport.session());

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.use(express.static('./static'));
app.use('/angular', express.static('./node_modules/angular'));
app.use('/angular-cookies', express.static('./node_modules/angular-cookies'));
app.use('/angular-route', express.static('./node_modules/angular-route'));
app.use('/angular-sanitize', express.static('./node_modules/angular-sanitize'));
app.use('/angular-resource', express.static('./node_modules/angular-resource'));

app.set('view engine', 'jade');
app.set('views', './views');
app.set('json spaces', 2);

app.use('/', router);

registerRoutes("/routes/api/v1", "/api");
registerRoutes("/routes/auth", "/auth");

server = app.listen(port);
console.log("Alive on port " + port);

module.exports = server;
