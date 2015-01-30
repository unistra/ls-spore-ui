directives = angular.module 'spore-ui.directives', []
directives.directive "formMethod" ->
    { restrict: "E", templateUrl: "form-method.html" }

directives.directive "pageSearch", ->
    { restrict: "E", templateUrl: "page-search.html" }

directives.directive "pageResults", ->
    { restrict: "E", templateUrl: "page-results.html" }

directives.directive "listResults", ->
    { restrict: "E", templateUrl: "list-results.html" }
