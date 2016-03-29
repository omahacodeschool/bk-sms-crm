window.onload = function(){
  var clients = document.getElementsByClassName("client");
  var center = document.getElementById("center");
  var sendMessage = document.getElementById("sendMessage");

  for (i =0; i < clients.length; i++){
    var client = clients[i];

    client.addEventListener("click", function(event){
      var client_id = event.target.dataset.clientId;
      var touches_request = new XMLHttpRequest();
      var client_request = new XMLHttpRequest();
      touches_request.open("GET", "message/" + client_id);
      client_request.open("GET", "clients/profile/" + client_id);

      touches_request.addEventListener("load", function(request_object){
        center.innerHTML = request_object.target.response;
        center.style.display = "block";
      });

      client_request.addEventListener("load", function(request_object){
        right.innerHTML = request_object.target.response;
        right.style.display = "block";
      });

      touches_request.send();
      client_request.send();
    });
  };
};