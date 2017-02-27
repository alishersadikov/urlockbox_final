$(document).ready(function(){
  $('tbody').on('blur', '.link-url', function(){
    var linkId = this.id;
    var newContent = this.textContent;
    var type = this.className;
    editLink(linkId, newContent, type);
  });

  $('tbody').on('blur', '.link-title', function(){
    var linkId = this.id;
    var newContent = this.textContent;
    var type = this.className;
    editLink(linkId, newContent, type);
  });

})

function editLink(linkId, newContent, type){

}
