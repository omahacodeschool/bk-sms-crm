jQuery(document).ready(function(){
  var parent = document.getElementById("right");

  parent.addEventListener("click", function(event){

    // if (event.target.matches(".dropdown_submit")){
    if (event.target.matches(".dropdown")){
      console.log("match")
        // var selectedId = document.getElementById("dropdown_select");
        var selectedOption = event.target.options[select.selectedIndex];
        console.log(selectedOption)

        var presentation_area = document.getElementById("current_client");
        var client_id = selectedOption.value;

        console.log(client_id)

        var request = new XMLHttpRequest();
        var request_path = "/clients/profile/"  + client_id;

        request.open("GET", request_path);

          request.addEventListener("load", function(request_object){
            presentation_area.innerHTML = request_object.target.response;
          });

        request.send();

        event.preventDefault();
       
      };
    });

  });

