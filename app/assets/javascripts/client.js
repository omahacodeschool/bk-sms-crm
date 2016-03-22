window.onload = function(){

  var clientInfo = document.getElementById("client_info");
  var clientName = document.getElementById("client_name");
  var clientNumber = document.getElementById("client_number");
  var clientNotes = document.getElementById("client_notes");
  var clientActiveForm = document.getElementById("client_active_form");
  var clientActive = document.getElementById("active");
  var clientInactive = document.getElementById("inactive");
  var submit_button = document.getElementById("submit");
  // var current_message = document.getElementById("current_message")

  begin_button.addEventListener("click", function(){
    clientInfo.style.display = "block";
    var requestClientName = new XMLHttpRequest();
    var requestClientNumber = new XMLHttpRequest();
    var requestClientNotes = new XMLHttpRequest();
    // var requestClientActiveForm = new XMLHttpRequest();

    requestClientName.open("GET", "http://localhost:3000/client/#{id}/name");
    requestClientNumber.open("GET", "http://localhost:3000/client/#{id}/number");
    requestClientNotes.open("GET", "http://localhost:3000/client/#{id}/notes");
    // requestClientActiveForm.open("GET", "http://localhost:3000/client/#{id}/active");

    requestClientName.addEventListener("load", function(event){
      var the_request = event.target;
      clientName.innerHTML = the_request.responseText;

    });

    requestClientNumber.addEventListener("load", function(event){
      var the_request = event.target;
      clientNumber.innerHTML = the_request.responseText;

    });

    requestClientNotes.addEventListener("load", function(event){
      var the_request = event.target;
      clientNotes.innerHTML = the_request.responseText;

    });

    // requestClientActiveForm.addEventListener("load", function(event){
    //   var the_request = event.target;
    //   clientActive.innerHTML = the_request.responseText;

    // });

    requestClientName.send();
    requestClientNumber.send();
    requestClientNotes.send();
    // requestClientActiveForm.send();
  });


  // THIS WILL BE THE SUBMIT ACTION FOR THE ACTIVE/INACTIVE FORM
  // submit_button.addEventListener("click", function(){
  //   var response = document.getElementById("answer").value;
  //   var submit = new XMLHttpRequest();
  //   submit.open("GET", "http://localhost:3000/client/"+ id+ "/" + response);

  //   submit.addEventListener("load", function(event){
  //     var the_answer = event.target;
  //   });

  //   submit.send();
  // });
  


};

