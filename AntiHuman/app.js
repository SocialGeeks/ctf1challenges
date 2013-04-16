var express = require('express');
var ctrl = require('./route');

var app = express();

app.configure(function () {
	app.set('view engine', 'jade');
	app.use(express.bodyParser());
	app.use(express.cookieParser());
	app.use(express.cookieSession({ secret:'6uREsuPAraPheprecrazEpasa5HaFu6u'}));
	app.use(express.favicon(__dirname + '/public/img/favicon.ico'));
	app.use('/pub',express.static(__dirname + '/public'));
});

app.all ('/:control?/:action?/:id?',
	function (req,res,next) {
		if(req.params.control == 'pub') next('route');
		else next();
	}, function (req,res,next) {
		if(!req.params.control) req.params.control = 'home';
		if(!req.params.action) req.params.action = 'index';
		next();
	}, function (req,res) {
		var c = req.params.control;
		var a = req.params.action;
		var m = req.method;
		if(!ctrl[c] || !ctrl[c][a] || !ctrl[c][a][m]) res.send(404);
		else ctrl[c][a][m](req,res);
	});

app.listen(3000);

