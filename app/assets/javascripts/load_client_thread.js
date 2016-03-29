window.onload = function(){
  var clients = document.getElementsByClassName("client");
  var center = document.getElementById("center");
  var sendMessage = document.getElementById("sendMessage");



  

              
          for (i =0; i < clients.length; i++){
            var client = clients[i]};
            
            var client_id = client.dataset.clientId;
          client.addEventListener("click", function(){
            var touches_request = new XMLHttpRequest();
            touches_request.open("GET", "message/" + client_id);
            touches_request.addEventListener("load", function(request_object){
            center.innerHTML = request_object.target.response;
            quiz.style.display = "block";
             });

      touches_request.send();
    });
  
};