
var app = angular.module('myApp', ["ngRoute"]);
app.config(function($routeProvider){
	$routeProvider
	.when('/EnqReg', {
		templateUrl : 'Views/EnqReg.html',
		controller: 'textController'
	})
	
});
app.controller('textController', function($scope) {
	// create a message to display in our view
	$scope.message = 'Everyone come and see how good I look!';
});

/*app.controller('TextController',['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
	$routeProvider.when('/EnqReg', {	
        templateUrl: '#/EnqReg.html',
        controller: 'TextController'
    });
}])*/
/*myApp.config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {

    $routeProvider.when('/home', {
        templateUrl: 'partials/home.html',
        controller: 'HomeCtrl'
    });
    
}])*/
/*app.controller('TextController', function($scope) {
    $scope.firstName = "John";
    $scope.lastName = "Doe";
});*/


