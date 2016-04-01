click_on_name_to_view_messages

jQuery(document).ready(function(){
  var clients = document.getElementsByClassName("client");
  var thread_display = document.getElementById("thread");
  var client_display = document.getElementById("current_client");
  var client_id = ""

  for (i =0; i < clients.length; i++){
    var client = clients[i];

    client.addEventListener("click", function(event){
      var client_id = event.target.dataset.clientId;
      event.target.style.backgroundColor = "gray";
      event.target.style.color = "white";
      
      var touches_request = new XMLHttpRequest();
      var client_request = new XMLHttpRequest();
      touches_request.open("GET", "message/" + client_id);
      client_request.open("GET", "clients/profile/" + client_id);

      touches_request.addEventListener("load", function(request_object){

        thread_display.innerHTML = request_object.target.response;
        thread_display.style.display = "block";

      });

      client_request.addEventListener("load", function(request_object){
        client_display.innerHTML = request_object.target.response;
        client_display.style.display = "block";
      });


      touches_request.send();
      client_request.send();
    });
  };
});
