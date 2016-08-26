(function() {
	'use strict';
	angular
	.module('app', [
		'app.menu'
	])
	.config(['$compileProvider', function ($compileProvider) {
		$compileProvider.debugInfoEnabled(true);
		//$compileProvider.debugInfoEnabled(false); //Production
	}])
	.run(function($rootScope) {
		console.log("hello");
		$rootScope.msg = "meh";
	});
})();