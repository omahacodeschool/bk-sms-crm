jQuery(document).ready(function(){
  var clients = document.getElementsByClassName("client");
  var thread_display = document.getElementById("thread");
  var client_display = document.getElementById("current_client");
  var submit_button = document.getElementById("send_message_button")
  var client_id = ""

  for (i =0; i < clients.length; i++){
    var client = clients[i];

    client.addEventListener("click", function(event){
      client_id = event.target.dataset.clientId;

      // Make each ^ (client_id) available to SUBMIT BUTTON EL.

      var touches_request = new XMLHttpRequest();
      var client_request = new XMLHttpRequest();
      touches_request.open("GET", "message/" + client_id);
      client_request.open("GET", "clients/profile/" + client_id);

      touches_request.addEventListener("load", function(request_object){

        
        thread_display.innerHTML = request_object.target.response;
        thread_display.style.display = "block";


        // This is the SUBMIT Button EL.
        // It needs access to client_id, 
        // and sends out an XHR to
        // "send_message/" + client_id.
        // The controller SAVES msg, SENDS msg, and redirects to
        // "message/" + client_id
        // The response ( event.target.response) gets put into the innerHTML
        // and is rendered on the page. 

        var current_client = document.getElementById("current_client");
          debugger;
        var submit_button = document.getElementById("send_message_button")
        submit_button.addEventListener("click", function(){
          alert("ALERTED")
          debugger;

                  });


      }); //End of SUBMIT BUTTON EVENT LISTENER?

      client_request.addEventListener("load", function(request_object){
        client_display.innerHTML = request_object.target.response;
        client_display.style.display = "block";

      }); //End of CLIENT REQUEST EVENT LISTENER?


      touches_request.send();
      client_request.send();

    }); //End of Client Event listener
  }; //End of LOOP?

////////////////////////////////////////////////////


  

    
  

      // var touches_request = new XMLHttpRequest();
      // var client_request = new XMLHttpRequest();
      // touches_request.open("GET", "message/" + client_id);
      // client_request.open("GET", "clients/profile/" + client_id);

      // touches_request.addEventListener("load", function(request_object){

        
      //   thread_display.innerHTML = request_object.target.response;
      //   thread_display.style.display = "block";

      // });

      // client_request.addEventListener("load", function(request_object){
      //   client_display.innerHTML = request_object.target.response;
      //   client_display.style.display = "block";
      // });


      // touches_request.send();
      // client_request.send();

}); // End of document load function.







////////////////DO NOT EDIT BELOW/////////////////////////////////////

/*

jQuery(document).ready(function(){
  var clients = document.getElementsByClassName("client");
  var thread_display = document.getElementById("thread");
  var client_display = document.getElementById("current_client");
  var client_id = ""

  for (i =0; i < clients.length; i++){
    var client = clients[i];

    client.addEventListener("click", function(event){
      var client_id = event.target.dataset.clientId;
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

*/
