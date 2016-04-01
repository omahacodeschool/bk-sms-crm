jQuery(document).ready(function(){
  var parent = document.getElementById("right");
  var client_id = ""

  parent.addEventListener("click", function(event){

    if (event.target.matches("#client_notes")){;
      var link = event.target
      var presentation_area = document.getElementById("client_notes");
      var client_id = link.dataset.clientId;
      // var selectedId = document.getElementById("client_notes");
      // var client_id = selectedId.options[selectedId.selectedIndex].value;

      var request = new XMLHttpRequest();
      var request_path = "/clients/"  + client_id + "/notes";

        request.open("GET", request_path);

        request.addEventListener("load", function(request_object){
          presentation_area.innerHTML = request_object.target.response;
        });

        request.send();

        event.preventDefault();
       
      };
    });

});