(function() {
	'use strict';
	angular
	.module('app.menu', [])
	.controller('menuController', function ($scope) {
		$scope.menuElements = [
			{id: 0, game: "CLANNAD"},
			{id: 1, game: "Steins;Gate"}
		];
	});
})();