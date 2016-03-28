window.onload = function(){
  var client = document.getElementsByClassName("client");
  var center = document.getElementById("center");
  alert("this works now");
  // loop through clients
  //   for each
  //       addEventListener like below:
              // var client_id = this element (this client)'s value for the "data-client-id" attribute

          client.addEventListener("click", function(){
            var touches_request = new XMLHttpRequest();

            touches_request.open("GET", "/touch/current_thread/" + client_id);

            touches_request.addEventListener("load", function(request_object){
              center.innerHTML = request_object.target.response;
            });

            touches_request.send();
          })
};