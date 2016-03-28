window.onload = function(){
  var clients = document.getElementsByClassName('client');
  var center = document.getElementById("center");

  // loop through clients            
  for (i =0; i < clients.length; i++){

    // for each DOM element (represented by 'client')...
    var client = clients[i];
    
    // this client's value for the "data-client-id" attribute
    var client_id = client.dataset.client;

    // When a client is clicked, load its info
    clients.addEventListener("click", function(){
      var touches_request = new XMLHttpRequest();
      touches_request.open("GET", "message/" + client_id);
      touches_request.addEventListener("load", function(request_object){
        center.innerHTML = request_object.target.response;
      });

      touches_request.send();
    });
  }
};