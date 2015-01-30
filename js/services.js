// Generated by LiveScript 1.3.1
(function(){
  var services;
  services = angular.module('spore-ui.services', []);
  services.service('mytools', function(){
    this.validAndCleanAndEncode = function(s){
      var cleanedParams, k, ref$, v, key;
      cleanedParams = {};
      for (k in ref$ = s.required_params) {
        v = ref$[k];
        if (not$(v != null) || v === "") {
          throw "missing required params";
        }
      }
      if (s.payload.payload != null && s.payload.payload !== "") {
        cleanedParams.payload = JSON.parse(s.payload.payload);
      }
      for (key in s.required_params) {
        if (s.required_params[key] !== '') {
          cleanedParams[key] = encodeURIComponent(s.required_params[key]);
        }
      }
      for (key in s.optional_params) {
        if (s.optional_params[key] !== '') {
          cleanedParams[key] = encodeURIComponent(s.optional_params[key]);
        }
      }
      return cleanedParams;
    };
    this.generateForm = function(methods){
      var forms, k, v, i$, ref$, len$, rp, op;
      forms = {};
      for (k in methods) {
        v = methods[k];
        forms[k] = {
          required_params: {},
          optional_params: {},
          payload: {}
        };
        if (v.required_params != null) {
          for (i$ = 0, len$ = (ref$ = v.required_params).length; i$ < len$; ++i$) {
            rp = ref$[i$];
            forms[k].required_params[rp] = "";
          }
        }
        if (v.optional_params != null) {
          for (i$ = 0, len$ = (ref$ = v.optional_params).length; i$ < len$; ++i$) {
            op = ref$[i$];
            forms[k].optional_params[op] = "";
          }
        }
        if (v.required_payload != null && v.required_payload) {
          forms[k].payload.payload = "";
        }
      }
      return forms;
    };
  });
  function not$(x){ return !x; }
}).call(this);
