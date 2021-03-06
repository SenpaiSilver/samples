var request = require('supertest');

describe('loading express', function() {
	var server;
	
	beforeEach(function() {
		server = require('./server');
	});
	afterEach(function() {
		server.close();
	});
	it('responds to /', function(done) {
		request(server).get('/').expect(200, done);
	});
	it('responds to /api/info', function(done) {
		request(server).get('/api/info').expect(200, done);
	});
	it('404 everything else', function(done) {
		request(server).get('/foo/bar').expect(404, done);
	});
});