app = angular.module("TwitterMood", ["ngResource"])

app.factory "Tweet", ["$resource", ($resource) ->
  $resource("/tweets/:id", {id: "@id"})
]

app.controller 'TwitterCtrl', ["$scope", "Tweet", ($scope, Tweet) ->
  $scope.getMood = ->
    $scope.mood = 'loading'
    Tweet.get({ id : $scope.handle }, (data) ->
      $scope.mood = data.mood
    )
]