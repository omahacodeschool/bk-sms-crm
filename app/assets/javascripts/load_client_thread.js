window.onload = function(){
  var clients = document.getElementsByClassName("client");
  var center = document.getElementById("center");

  

  
  // loop through clients
  //   for each
  //       addEventListener like below:
              // var client_id = this element (this client)'s value for the "data-client-id" attribute
              
          for (i =0; i < clients.length; i++){
            var client = clients[i]};
            var client_id = client.dataset.clientId;
          client.addEventListener("click", function(){
            var touches_request = new XMLHttpRequest();
            touches_request.open("GET", "message/" + client_id);
            touches_request.addEventListener("load", function(request_object){
            center.innerHTML = request_object.target.response;
             });

            touches_request.send();
          })
};
// beth added
//   @clients.each do |client|
//         client.addEventListener("load", function(){
//           var client_id = getElementByAttribute("data-client-id").value;
//         })
  //         client.addEventListener("click", function(){
  //           var touches_request = new XMLHttpRequest();

            