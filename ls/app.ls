app = angular.module 'spore-ui', ['spore-ui.services' 'spore-ui.directives'
'spore-ui.controllers' 'ui.bootstrap' 'ngAnimate' 'ngProgress']

app.constant 'constants', {
    description-files: config.description-files
}

app.run ['$rootScope' 'constants' ($rootScope, constants) ->
    $rootScope.description-files = constants.description-files
]