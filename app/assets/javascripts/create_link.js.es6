var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $newLinkTitle = $("#link-title");
  $newLinkUrl  = $("#link-url");

  $("#new-link").on('submit', createLink);
  displayLinks();
})

function displayLinks() {
  $.get("/api/v1/links")
   .then( renderLinks )
}

function createLink (event){
  event.preventDefault();

  var link = getLinkData();

  $.post("/api/v1/links", link)
   .then( renderLink )
   .fail( displayFailure )
 }

function getLinkData() {
 return {
   title: $newLinkTitle.val(),
   url: $newLinkUrl.val()
 }
}
function renderLinks(links) {
  $("#link-table-body").slice(0).empty()
  links.forEach(function(link){
    renderLink(link);
  })
}

function renderLink(link){
  $("#link-table-body").prepend( linkHTML(link) )
  clearLink();
}

function linkHTML(link) {
    var buttonText;
    var readStatusClass;

    if (link.read == true) {
      buttonText = "Mark as Unread"
      readStatusClass = 'status-link-read'
    } else {
      buttonText = "Mark as Read"
      readStatusClass = 'status-link-unread'
    }

    return `<tr class='link ${readStatusClass}' data-id='${link.id}' id="link-${link.id}">
              <td class='link-title' id='${link.id}' contenteditable='true'>${ link.title }</td>
              <td class='link-url' id='${link.id}' contenteditable='true'>${ link.url }</td>
              <td class=''>${link.read}</td>
              <td class="status">${link.hotread_status}</td>
              <td><button class="mark-read">${ buttonText }</button></td>
            </tr>`
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayFailure(failureData){
  alert("FAILED attempt to create new Link: " + failureData.responseText);
}
