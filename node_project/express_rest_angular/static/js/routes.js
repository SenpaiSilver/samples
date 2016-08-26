(function() {
	'use strict';
	angular.module('app.routes', [
		'ngRoute'
	])
	.config(['$routeProvider',
		'$locationProvider',
		function($routeProvider, $locationProvider) {
			$routeProvider.caseInsensitiveMatci = true;
			$routeProvider
			.when('/', {
				//controller: 'menuController'
			})
			.otherwise({
				redirectTo: '/'
			});
			//$locationProvider.html5Mode(true);
		}]);
})();