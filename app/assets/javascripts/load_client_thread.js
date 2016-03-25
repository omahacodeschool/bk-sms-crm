window.onload = function(){
  var client = document.getElementById("mike");
  var center = document.getElementById("center");

  client.addEventListener("click", function(e){
    center.innerHTML = "Foo";
  })
};