# URLockBox

## Setup
To setup the application locally, first clone it down. 
Then change into the directory and run the following on your terminal: 
```
bundle install
rake db:create
rake db:migrate
```
To create the database in the test environment, run: 

`
rake db:test:prepare
`

To be able to run the JavaScript tests, run : 
`npm install phantomjs -g`

One thing to keep in mind about phantomjs is that id doesn't recognize es6. So if you write es6 you will need to make your file extenstion `.js.es6`. 

Section 1 - Sign Up, Sign In, and Sign Out

Nota Bene:

You should aim to complete user auth in the simplest way possible. Using Rails' "built-in" gem Bcrypt is the most straightforward and recommended way to implement this functionality.
Set goals and manage your work so that you keep in mind what you need to do and how long you have to do it.
As an unauthenticated user, when I visit the root of the application, /, I should be redirected to a page which prompts me to "Log In or Sign Up".

Sign Up

As an unauthenticated user, if I click "Sign Up", I should be taken to a user form where I can enter an email address, a password, and a password confirmation.

I cannot sign up with an email address that has already been used.
Password and confirmation must match.
If criteria is not met the user should be given a message to reflect the reason they could not sign up.
Upon submitting this information, I should be logged in via a session cookie and redirected to the "Links Index" page.

Sign In

As an registered user when I attempt to sign in, I receive a flash message reflect a successful, or unsuccessful log in attempt.

Sign Out

As an authenticated user viewing the index page, I should see a link to "Sign Out" and not see a link to "Sign In". This should redirect me back to the page that prompts me to "Log In or Sign Up".

Section 2 - Submitting and Viewing Links

As an authenticated user viewing the main page (links#index), I should see a simple form to submit a link.

When viewing, editing, or creating a link, it should include:

A valid URL for the link

A title for the link

Additionally, all links have a read status that is either true or false. This status will default to false, and not be included in the create or edit form.

Submitting an invalid link should result in an error message being displayed that indicated why the user was not able to add the link.

Hint: You can use Ruby's built in URI.parse method to determine if a link is a valid or not. This StackOverflow post has more information. Alternatively, you could use a gem like this one.

Once a link has been submitted, loading the index page should display all of my links only.

Section 3 - Editing Links

As an authenticated user who has added links to my URLockbox, when I view the links index:

Each link has an "Edit" button that either takes me to a page to edit the link or allows me to edit the link in place on the page.

I can edit the title and/or the url of the link.

I cannot change the url to an invalid url. Show the same error message as above.

Section 4 - Implementing a Service

Build a second application, Hot Reads, that fulfills the following requirements.

When a link is marked as read, the link's url is sent to Hot Reads, which creates a record of the "read". As mentioned in section 5, this is done without a refresh.

As an unauthenticated user, I can visit the Hot Reads main index page and see a list of the top-10 most-read URLs (not titles or URL/title combos) across all users. Only reads from the last 24 hours should count towards the ranking.

When I load the links index in the main application:

If a link is in Hot Read's current top-10, mark it as "hot"
If a link is currently number one in the top-10, mark it as "top link"
This can be done via AJAX after the initial page load if you wish

Note Bene:

In URLockbox you may use an HTTP request in a service to communicate between applications, but it would be even better to add a message queue or pub/sub channel between URLockbox and Hot Reads. No interaction with Hot Reads should appear in URLockbox controllers, but you already know to push logic down the stack.

Section 5 - Client-Side

Notes Bene:

As we said before you do have complete autonomy on decisions like the tools you use so if you rather set up selenium for testing, you can.

If you choose to do React you will need to rewrite the functionality that has been written using jQuery.

Check the starter repo Readme for info on Poltergeist for integration testing

Making AJAX requests between two different hosts/apps/domains will cause a CORS error. If you're unfamiliar with this, check out this documentation. How to implement this is up to you. You can find many rails resources to solve this error.

As an authenticated user, I can do the following in the URLockbox index without reloading the page:

Create a new link, and see it in added to the top of the list. The JS is already written for this functionality. Just wire everything up correctly to get this to work.
Mark a link as read or unread
Next to each unread link I should see an option to "Mark as Read".
Clicking this should visibly change the read status to true, and the change should persist.
Next to each read link I should see an option to "Mark as Unread".
Clicking this should change the read status to false, and the change should persist.
Read links should be stylistically differentiated from unread links. You could gray them out or use a strike through or anything you think appropriately informs the user that their link is read or unread.
Click a button or link to filter the list by "read" and "unread" status
Filter the list of links by a search term as I type into a search box. Filter by both title and url with each key press.
