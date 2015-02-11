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

        scope.accordion-id = 0

        generateDom = (v) ->
            r = ""
            if typeof v == "object"
                r+='<dl>'
                for key, value of v
                    if typeof value == "object" and value != null
                        scope.accordion-id++
                        accordion-collapse-id = scope.$index + "-" + scope.accordion-id
                        r += "
                            <div class=\"panel-group\" id=\"accordion#{accordion-collapse-id}\">
                                <div class=\"panel panel-default\">
                                    <div class=\"panel-heading\">
                                        <h4 class=\"panel-title\">
                                            <a data-toggle=\"collapse\" data-parent=\"\#accordion#{accordion-collapse-id}\"
                                             href=\"\#collapse#{accordion-collapse-id}\" class=\"collapsed\"><i class=\"glyphicon glyphicon-eye-open\"></i> #{key}</a>
                                        </h4>
                                    </div>
                                    <div id=\"collapse#{accordion-collapse-id}\" class=\"panel-collapse collapse\">
                                        <div class=\"panel-body\">
                                            <dd>#{generateDom value}</dd>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        "
                    else
                        r += "<dt>#{key}</dt><dd>#{generateDom value}</dd>"
                       
                r+='</dl>'

            else
                return r += v

        results = generateDom angular.copy(scope.result)

        element.html(results)

    {restrict: "E", link: link }
