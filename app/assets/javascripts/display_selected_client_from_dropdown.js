jQuery(document).ready(function(){
  var parent = document.getElementById("right");
  var thread_display = document.getElementById("thread");
  var client_id = ""

  parent.addEventListener("click", function(event){

    if (event.target.matches("#dropdown_submit")){
      var selectedId = document.getElementById("dropdown_select");

        var presentation_area = document.getElementById("current_client");
        var client_id = selectedId.options[selectedId.selectedIndex].value;

        var touches_request = new XMLHttpRequest();
        var client_request = new XMLHttpRequest();

        var client_request_path = "/clients/profile/"  + client_id;

        touches_request.open("GET", "message/" + client_id);
        client_request.open("GET", client_request_path);

        client_request.addEventListener("load", function(request_object){
          presentation_area.innerHTML = request_object.target.response;
        });

        touches_request.addEventListener("load", function(request_object){
          thread_display.innerHTML = request_object.target.response;
          thread_display.style.display = "block";
        });

        client_request.send();
        touches_request.send();

        event.preventDefault();
       
      };
    });

});


