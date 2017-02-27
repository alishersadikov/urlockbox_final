var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#link-table-body').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    })
      .done( displayLinks );
  })
})
