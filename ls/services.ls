services = angular.module 'spore-ui.services', []
services.service 'mytools', ->

    @valid-and-clean-and-encode = (s) ->

        #copy-params = JSON.parse(JSON.stringify(s))
        cleaned-params = {}

        # Check required params
        for k, v of s.required_params
            if (not) v? or v == ""
            then throw "missing required params"

        # Parse payload to JSON
        if s.payload.payload? and s.payload.payload!=""
        then cleaned-params.payload = JSON.parse s.payload.payload

        # Remove empty required params and encodeURI them
        for key of s.required_params
            if s.required_params[key] !=''
            then cleaned-params[key] = encodeURIComponent s.required_params[key]

        # Remove empty optional params and encodeURI them
        for key of s.optional_params
            if s.optional_params[key]!=''
            then cleaned-params[key] = encodeURIComponent s.optional_params[key]

        cleaned-params

    @generate-form = (methods) ->
        forms = {}
        for k,v of methods
            forms[k] = {
                required_params: {}
                optional_params: {}
                payload: {}
            }
            if v.required_params?
                for rp in v.required_params
                    forms[k].required_params[rp] = ""
            if v.optional_params?
                for op in v.optional_params
                    forms[k].optional_params[op] = ""
            if v.required_payload? and  v.required_payload
                forms[k].payload.payload = ""
        forms

    void

