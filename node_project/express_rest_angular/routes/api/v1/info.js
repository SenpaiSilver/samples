var express = require('express');
var router = express.Router();
var pack = require('../../../package.json');

router.get('/info', function (req, res) {
	res.json({_v: pack.version});
});

module.exports = {router: router};