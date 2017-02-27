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
  var link;
  if (type=='link-url') {
    link = {url: newContent};
  }
  else if (type=='link-title') {
    link = {title: newContent};
  }
  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: link
  })
    .done( displayLinks )
    .fail( displayFailure )
}

function displayFailure(failureData){
  alert("FAILED attempt to create new Link: " + failureData.responseText);
}
