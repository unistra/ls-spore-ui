controllers = angular.module 'spore-ui.controllers', []

controllers.controller 'methodsCtrl', ['$scope' 'constants' 'ngProgress' 'mytools' ($scope, constants, ngProgress, mytools) ->
    $scope.sporeClient = void
    $scope.forms = {}
    $scope.hideResults = true
    $scope.hideSearch = true
    $scope.current-client-title = "Select a client"
    $scope.spore-is-ready = false
    $scope.errors = {}

    ngProgress.color("green")
    ngProgress.height('5px')

    @Submit = (name) ->
        try
            check-params = true
            params = mytools.valid-and-clean-and-encode $scope.forms[name]
        catch e
            window.console.error e
            check-params = false
        finally
            if $scope.spore-is-ready and check-params
                ngProgress.start();

                $scope.sporeClient.methods[name] params, (response) ->
                    $scope.hideSearch = true
                    $scope.hideResults = false
                    $scope.methctrl.results = if response.length? then response else [response]
                    ngProgress.complete()
                    angular.element('#'+name+'-form>fieldset>.form-group').removeClass('has-error')
                    $scope.errors[name] = void
                , 
                (response) ->
                    angular.element('#'+name+'-form>fieldset>.form-group').addClass('has-error')
                    ngProgress.complete()
                    $scope.errors[name] = response
            else
                window.console.error "Client spore non initialisé ou mauvais paramètres"
                angular.element('#'+name+'-form>fieldset>.form-group').addClass('has-error')
                $scope.errors[name] = "Spore client not initialized or wrong parameters"

    @Menu = (name) ->
        $scope.hideResults=true
        $scope.hideSearch=false
        for k, v of $scope.forms
            if k == name
            then $scope[k] = true
            else $scope[k] = false

    @Return = ->
        $scope.hideResults=true
        $scope.hideSearch=false

    @Client = (name) ->
        $scope.spore-is-ready = false
        $scope.hideResults=true
        $scope.hideSearch=true
        $scope.showAddToken=true
        $scope.showRemoveToken=false

        client = new Spore constants.description-files[name], (->
            if client.isReady is true
                $scope.$apply ->
                    $scope.sporeClient = client
                    $scope.forms = mytools.generate-form $scope.sporeClient.description.methods
                    $scope.spore-is-ready = true
                    $scope.current-client-title = client.description.name

        ), -> window.console.error 'An error occured with spore client creation'


    @AddToken = (token) ->
        if $scope.spore-is-ready
            auth = {key_name:"Authorization", key_value:"Token "+token}
            $scope.sporeClient.enable SporeMiddlewareAuthApiKey, auth
            $scope.showAddToken=false
            $scope.showRemoveToken=true

    @RemoveToken = ->
        if $scope.spore-is-ready
            for m in $scope.sporeClient.middlewares
                if m.params.key_name == "Authorization"
                    $scope.sporeClient.middlewares.pop(m)
            $scope.showAddToken=true
            $scope.showRemoveToken=false

]