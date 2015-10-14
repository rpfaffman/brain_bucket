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

app.factory('RecursionHelper', ['$compile', function($compile){
  return {
    /**
     * Manually compiles the element, fixing the recursion loop.
     * @param element
     * @param [link] A post-link function, or an object with function(s) registered via pre and post properties.
     * @returns An object containing the linking functions.
     */
    compile: function(element, link){
      // Normalize the link parameter
      if(angular.isFunction(link)){
        link = { post: link };
      }

      // Break the recursion loop by removing the contents
      var contents = element.contents().remove();
      var compiledContents;
      return {
        pre: (link && link.pre) ? link.pre : null,
        /**
         * Compiles and re-adds the contents
         */
        post: function(scope, element){
          // Compile the contents
          if(!compiledContents){
            compiledContents = $compile(contents);
          }
          // Re-add the compiled contents to the element
          compiledContents(scope, function(clone){
            element.append(clone);
          });

          // Call the post-linking function, if any
          if(link && link.post){
            link.post.apply(null, arguments);
          }
        }
      };
    }
  };
}]);

app.directive('thought', function(RecursionHelper) {
  return {
    restrict: 'EA',
    require: ['^ngModel'],
    replace: true,
    scope: { ngModel: '=' },
    templateUrl: '/views/thought.html',
    compile: function(element) {
      // Use the compile function from the RecursionHelper,
      // And return the linking function(s) which it returns
      return RecursionHelper.compile(element);
    }
  }
});
