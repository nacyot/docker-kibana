define(['settings'],
       function (Settings) {
           "use strict";
           return new Settings({
             elasticsearch: "http://ES_API_HOST:ES_API_PORT",
             default_route : '/dashboard/file/default.json',
             kibana_index: "kibana-int",
             panel_names: [
               'histogram',
               'map',
               'goal',
               'table',
               'filtering',
               'timepicker',
               'text',
               'hits',
               'column',
               'trends',
               'bettermap',
               'query',
               'terms',
               'stats',
               'sparklines'
             ]
           });
       });
