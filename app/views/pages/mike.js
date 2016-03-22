var answer = document.getElementById('answer');
var message = document.getElementById('left');

var messageLoad = new XMLHttpRequest();
    messageLoad.open("get", "http://localhost:3000/touch");
    messageLoad.addEventListener("load", function(event){
    message.innerHTML = messageLoad.responseText;
    });

    // for (var i = 0, length = message.length; i < length; i++) {

    // }