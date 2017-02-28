$(document).ready(function(){
  $("#title-filter-input").on("keyup", function(){
    var input = document.getElementById("title-filter-input"),
        filter = input.value.toUpperCase(),
        table = document.getElementById("link-table"),
        tr = table.getElementsByTagName("tr");

    for (var i = 0; i < tr.length; i++) {
      var td = tr[i].getElementsByTagName("td")[0];
      if (td) {
        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  })

  $("#url-filter-input").on("keyup", function(){
    var input = document.getElementById("url-filter-input"),
        filter = input.value.toUpperCase(),
        table = document.getElementById("link-table"),
        tr = table.getElementsByTagName("tr");

    for (var i = 0; i < tr.length; i++) {
      var td = tr[i].getElementsByTagName("td")[1];
      if (td) {
        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  })

})
