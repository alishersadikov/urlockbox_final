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
