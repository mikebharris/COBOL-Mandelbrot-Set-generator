// Dependencies
var Cobol = require("cobol");
var http = require('http');

const PORT=8080;

Cobol("mandelbrot.cbl", {
    free: true,
}, function (err, data) {
    function handleRequest(request, response){
        response.end(data);
    }
    var server = http.createServer(handleRequest);
    server.listen(PORT);

    console.log(err || data);
});
