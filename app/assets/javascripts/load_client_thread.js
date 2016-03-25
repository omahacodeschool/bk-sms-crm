window.onload = function(){
  var client = document.getElementById("mike");
  var center = document.getElementById("center");

  client.addEventListener("click", function(e){
    var touches_request = new XMLHttpRequest();

    touches_request.open("GET", "/touch/current_thread/1");

    touches_request.addEventListener("load", function(request_object){
      alert(request_object.target.response);
    });

    touches_request.send();
  })
};