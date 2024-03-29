jQuery(document).ready(function(){
  var parent = document.getElementById("right");

  parent.addEventListener("click", function(event){

    if (event.target.matches(".show_edit_form")){
      var link = event.target;
      var presentation_area = document.getElementById("current_client");

      var client_id = link.dataset.clientId;
      var request = new XMLHttpRequest();
      var request_path = "/clients/" + client_id + "/edit";

      request.open("GET", request_path);

      request.addEventListener("load", function(request_object){
        // alert(request_object.target.response);
        presentation_area.innerHTML = request_object.target.response;
      });

      request.send();

      event.preventDefault();
    }
  });
});