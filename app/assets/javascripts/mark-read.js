var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#link-table-body').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    var readStatus;


    if (this.textContent == "Mark as Read") {
      readStatus = true
    } else {
      readStatus = false
    }

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: readStatus}
    })
      .done( displayLinks() );
  })
})
