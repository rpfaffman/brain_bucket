var app = angular.module('brainBucket', []);

app.run(function($rootScope) {
  $rootScope.test = "test string for app";
});

app.controller('ThoughtsController', function($scope, $http) {
  $scope.testSomething = "thought test string";
  $http({
    method: 'GET',
    url: '/thoughts'
  }).success(function(data, status, headers, config) {
    $scope.thoughts = data;
  }).error(function(data, status, headers, config) {
    alert('There was an error');
  });
});


app.directive('collection', function() {
  return {
    restrict: 'EA',
    replace: true,
    templateUrl:  '/views/collection.html',
    scope: { collection: '=' }
  }
});

app.directive('thought', function($compile) {
  return {
    restrict: 'EA',
    require: ['^ngModel'],
    replace: true,
    scope: { ngModel: '=' },
    templateUrl: '/views/thought.html',
    link: function(scope, element, attrs) {
      var collectionStr = '<collection collection="ngModel.children"></collection>';
      var children = scope.ngModel.children;
      if (children && children.length > 0) {
        $compile(collectionStr)(scope, function(cloned, scope) {
          element.append(cloned);
        });
      }
    }
  }
});
