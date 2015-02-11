directives = angular.module 'spore-ui.directives', []
directives.directive "formMethod" ->
    { restrict: "E", templateUrl: "form-method.html" }

directives.directive "pageSearch", ->
    { restrict: "E", templateUrl: "page-search.html" }

directives.directive "pageResults", ->
    { restrict: "E", templateUrl: "page-results.html" }

directives.directive "listResults", ->
    { restrict: "E", templateUrl: "list-results.html" }


directives.directive "showJson", ->

    link = (scope,element,attrs) ->

        generateDom = (v) ->
            r = ""
            if typeof v == "object"
                console.log v
                r+='<dl>'
                for key,value of v
                    r += "<dt>" + key + "</dt>"
                    r += "<dd>"
                    r += generateDom value
                    r += "</dd>"
                r+='</dl>'
            else
                return r += v

        results = "<dt>" + scope.k + "</dt>"
        results += "<dd>" + generateDom(scope.v) + "</dd>"

        element.html(results)

    {restrict: "E", link: link }
