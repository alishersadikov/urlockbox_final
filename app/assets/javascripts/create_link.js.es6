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
  $("#link-table-body").append( linkHTML(link) )
  clearLink();
}

function linkHTML(link) {

    return `<tr class='link' data-id='${link.id}' id="link-${link.id}">
              <td class='link-title'>${ link.title }</td>
              <td class='link-url'>${ link.url }</td>
              <td class="link_read">${ link.read }</td>
              <td><button class="mark-read">Mark as Read</button></td>
              <td><button class='edit-link' data=>Edit</button></td>
              <td><button class='delete-link'>Delete</button></td>
            </tr>`
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayFailure(failureData){
  alert("FAILED attempt to create new Link: " + failureData.responseText);
}
