(function () {
  "use strict";
  angular.module("app").controller("concertCtrl", ['$scope', '$http',function($scope, $http) {

  $scope.setup = function() {
    $http.get('/api/v1/concerts.json').then(function(response) {
      $scope.concerts = response.data;
    });
  }

  $scope.addConcert = function(artist, genre, schedule, city, state) {
    var concert = {artist: artist, genre: genre, concert_date: schedule, city: city, state: state}
    $http.post('api/v1/concerts.json', concert).then(function(response) {
      $scope.concerts.push(response.data);
      $scope.artist = ""; 
      $scope.genre = "";
      $scope.schedule = "";
      $scope.city = "";
      $scope.state = "";
    }, function(error) {
      $scope.errors = error.data.errors;
    });
  }

  $scope.deleteConcert = function(concert) {
    $http.delete('api/v1/concerts/' + concert.id + '.json').then(function(response) {

      var index = $scope.concerts.indexOf(concert);
      $scope.concerts.splice(index, 1);
    });
  }

  $scope.toggleOrder = function(attribute) {
    if(attribute != $scope.orderAttribute) {
      $scope.descending = false;
    } 
      else {
      $scope.descending = !$scope.descending;
    }
    $scope.orderAttribute = attribute;

  }
  

  window.$scope = $scope;
  }]);
})(); 






