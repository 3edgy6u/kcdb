(function(){
    var app = angular.module("kcdb", ['ngRoute']);

    app.controller('shipController', ["$scope", "$routeParams", "$http", function($scope, $routeParams, $http) {
        $scope.main = true;
        if ($routeParams.name !== undefined) {
            $scope.main = false;
            $http.get('api/ship.php?ship='+$routeParams.name).success(function(data) {
                $scope.data = data;
            });
        };
        if ($scope.main) {
            $http.get('api/ships.php').success(function(data) {
                $scope.data = data;
            })
        }
    }]);

    app.controller('recipeController', ["$scope", "$routeParams", "$http", function($scope, $routeParams, $http) {
        $scope.main = true;
        if ($routeParams.name !== undefined) {
            var p = $routeParams.name.split('-');
            if (p.length >= 4 && p.length <= 5) { 
                $scope.main = false;
                $http.get('api/recipe.php?fuel='+p[0]+'&ammo='+p[1]+'&steel='+p[2]+'&bauxite='+p[3]+'&devmats='+((p.length==5)?p[4]:'1'))
                .success(function(data) {
                    $scope.data = data;
                });
            }
        };
        if ($scope.main) {
            $http.get('api/recipes.php').success(function(data) {
                $scope.data = data;
            })
        }
    }]);

    app.config(["$routeProvider", function($routeProvider){
        $routeProvider.when('/', {
            templateUrl: 'template/home.html'
        })

        .when('/ship', {
            templateUrl: 'template/ship.html',
            controller: 'shipController'
        })

        .when('/ship/:name', {
            templateUrl: 'template/ship.html',
            controller: 'shipController'
        })

        .when('/recipe', {
            templateUrl: 'template/recipe.html',
            controller: 'recipeController'
        })

        .when('/recipe/:name', {
            templateUrl: 'template/recipe.html',
            controller: 'recipeController'
        });
    }]);
})();