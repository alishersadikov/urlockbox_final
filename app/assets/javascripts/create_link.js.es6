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
    if (link.read == true) {
      buttonText = "Mark as Unread"
    } else {
      buttonText = "Mark as Read"
    }

    return `<tr class='link' data-id='${link.id}' id="link-${link.id}">
              <td class='link-title' id='${link.id}' contenteditable='true'>${ link.title }</td>
              <td class='link-url' id='${link.id}' contenteditable='true'>${ link.url }</td>
              <td class="link_read">${ link.read }</td>
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
