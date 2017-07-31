//importar a biblioteca do express
var express = require("express");


//criar a aplicação do express
var app = express();


//definimos o local da pasta publica
app.use(express.static(__dirname + '/public'));  


//vamos start o servidor
var listener = app.listen(3000,function() {
	console.log("Server Started at " + listener.address().port);
})