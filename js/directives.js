// Generated by LiveScript 1.3.1
(function(){
  var directives;
  directives = angular.module('spore-ui.directives', []);
  directives.directive("formMethod", function(){
    return {
      restrict: "E",
      templateUrl: "form-method.html"
    };
  });
  directives.directive("pageSearch", function(){
    return {
      restrict: "E",
      templateUrl: "page-search.html"
    };
  });
  directives.directive("pageResults", function(){
    return {
      restrict: "E",
      templateUrl: "page-results.html"
    };
  });
  directives.directive("listResults", function(){
    return {
      restrict: "E",
      templateUrl: "list-results.html"
    };
  });
  directives.directive("showJson", function(){
    var link;
    link = function(scope, element, attrs){
      var generateDom, results;
      scope.accordionId = 0;
      generateDom = function(v){
        var r, key, value, accordionCollapseId;
        r = "";
        if (typeof v === "object") {
          r += '<dl>';
          for (key in v) {
            value = v[key];
            if (typeof value === "object" && value !== null) {
              scope.accordionId++;
              accordionCollapseId = scope.$index + "-" + scope.accordionId;
              r += "<div class=\"panel-group\" id=\"accordion" + accordionCollapseId + "\"><div class=\"panel panel-default\"><div class=\"panel-heading\"><h4 class=\"panel-title\"><a data-toggle=\"collapse\" data-parent=\"#accordion" + accordionCollapseId + "\"href=\"#collapse" + accordionCollapseId + "\" class=\"collapsed\">" + key + "</a></h4></div><div id=\"collapse" + accordionCollapseId + "\" class=\"panel-collapse collapse\"><div class=\"panel-body\"><dt>" + key + "</dt><dd>" + generateDom(value) + "</dd></div></div></div></div>";
            } else {
              r += "<dt>" + key + "</dt><dd>" + generateDom(value) + "</dd>";
            }
          }
          return r += '</dl>';
        } else {
          return r += v;
        }
      };
      results = generateDom(scope.result);
      return element.html(results);
    };
    return {
      restrict: "E",
      link: link
    };
  });
}).call(this);
