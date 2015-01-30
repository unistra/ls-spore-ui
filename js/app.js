// Generated by LiveScript 1.3.1
(function(){
  var app;
  app = angular.module('spore-ui', ['spore-ui.services', 'spore-ui.directives', 'spore-ui.controllers', 'ui.bootstrap', 'ngAnimate', 'ngProgress']);
  app.constant('constants', {
    descriptionFiles: config.descriptionFiles
  });
  app.run([
    '$rootScope', 'constants', function($rootScope, constants){
      return $rootScope.descriptionFiles = constants.descriptionFiles;
    }
  ]);
}).call(this);