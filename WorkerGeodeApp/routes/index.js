var express = require('express');
var router = express.Router();
var url= require('url');
var request = require('request');
var http = require("http");

let geode= process.env.GEODE_SERVICE;
let region= process.env.REGION;
//curl -i http://server-lb.proddataservicesgeode.l4lb.thisdcos.directory/gemfire-api/v1
//curl -H "Content-Type: application/json" -X POST -d '{"foo":"bar"}' http://server-lb.proddataservicesgeode.l4lb.thisdcos.directory/gemfire-api/v1/foo?key=16
//SELECT entry.key, entry.value FROM /TXs.entries entry


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: "Geode Worker", appdef: ""
    });
});


function putTo(json, type, id) {
  try {
    console.log("putTo: "+geode+" "+region+" "+id);
    let options= { 
                url: geode+"/gemfire-api/v1/"+region+"?key="+id,
                headers: {
                  'Content-Type': 'application/json'
                },
                body:JSON.stringify(json)
    };
    console.log("url: "+options.url);
    request.post(
      options, function(err, response, body) {
      if(err== null) {
        console.log(body);
      }
      else {
        console.log(err);
      }
    });
  }
  catch(ex) {
    console.log(ex);    
  }
};


router.post('/data', function(req, res, next) {
  console.log(req.body);
  let json= JSON.parse(req.body);
  let t= json.event_timestamp;
  let ms= new Date(t.toString().trim()).getTime();
  json.event_timestamp= ms;
  console.log("ms: "+ms);
  console.log("json: "+JSON.stringify(json));
  let id= json.id;
  console.log("before to put: "+id);
  putTo(json, "external", id);
  res.statusCode= 200;
  res.end();
});

module.exports = router;
