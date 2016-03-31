jQuery(document).ready(function(){
  var parent = document.getElementById("right");
  // parent.addEventListener("click", function(event){
  var dropdown_select = document.getElementById("dropdown_select");

    dropdown_select.addEventListener("click", function(event){
      var selected_client = event.target.options[event.selectedIndex];
      var presentation_area = document.getElementById("current_client");
      var client_id = selected_client.value;


      var request = new XMLHttpRequest();
      var request_path = "/clients/profile/"  + client_id;

      request.open("GET", request_path);

        request.addEventListener("load", function(request_object){
          presentation_area.innerHTML = request_object;
        });

      request.send();

      event.preventDefault();
       
      });
    // });

  });

